using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;
using Bitcoin.Data.DTO;

public partial class Member_Default : System.Web.UI.Page
{
    #region Fields

    private readonly OrderBLL _orderBll = new OrderBLL();
    private readonly Order _order = new Order();
    private readonly OrderDetailBLL _orderDetailBll = new OrderDetailBLL();
    private readonly OrderDetail _orderDetail = new OrderDetail();
    private readonly BankBLL _bankBll = new BankBLL();

    // Current default of amount bitcoin is 0.5
    private const decimal AmountBitcoin = (decimal)0.5;
    // UserId is temporary value that will be changed by session of user 
    private const int UserId = 2;
    private const int StatusPending = 0;
    private const int StatusRequestProcessed = 1;
    private const int StatusDone = 2;
    private const decimal GrowthWallet = (decimal)0.2;
    private const decimal CommissionWallet = (decimal)0.1;
    private DateTime dateTimeNow = Convert.ToDateTime("6/5/2016");

    #endregion

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtBitcoinAmount.Text = AmountBitcoin.ToString();
            LoadAllUserOrders();
            GetGhAndPhInsertToOrderDetail();
            LoadAllUserOrderDetail();
        }
    }

    // Hiển thị form lập lệnh PH
    protected void btnSaveBid_Click(object sender, EventArgs e)
    {
        if (CheckPhReceived() == false)
        {
            AddNewOrder("Bid");
            DisplayMessage.ShowAlertModal("ShowAlertSuccess()", Page);
            LoadAllUserOrders();
        }
        else
        {
            DisplayMessage.ShowAlertModal("ShowAlertError()", Page);
        }
    }

    protected void rptOrder_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var lblAmount = e.Item.FindControl("lblAmount") as Label;
        var lblStatus = e.Item.FindControl("lblStatus") as Label;
        var spanStatus = e.Item.FindControl("spanStatus") as HtmlControl;
        var lblOrderType = e.Item.FindControl("lblOrderType") as Label;
        var orderPanelBody = e.Item.FindControl("orderPanelBody") as HtmlControl;
        var lblOrderTitile = e.Item.FindControl("lblOrderTitle") as Label;
        var lblRemainingAmount = e.Item.FindControl("lblRemainingAmount") as Label;

        if (lblStatus.Text == StatusPending.ToString())
        {
            lblStatus.Text = "PENDING";
            spanStatus.Attributes.Add("class", "label label-danger");
        }
        if (lblStatus.Text == StatusRequestProcessed.ToString())
        {
            lblStatus.Text = "Request Processed";
            spanStatus.Attributes.Add("class", "label label-success");
        }

        if (lblOrderType.Text == "GH")
        {
            lblOrderTitile.Text = "GET HELP";
            orderPanelBody.Attributes.Add("style", "background-color: #E66454; color: white");
        }
        if (lblOrderType.Text == "PH")
        {
            lblOrderTitile.Text = "PROVIDE HELP";
        }

        if (lblRemainingAmount.Text == "0")
        {
            lblStatus.Text = "Done";
            spanStatus.Attributes.Add("class", "label label-success");
        }
    }

    protected void lbBidBitcoin_Click(object sender, EventArgs e)
    {
        lblMessageContent.Text = "Your Bid have been saved successfully.";
        DisplayMessage.ShowAlertModal("ShowBid()", Page);
    }

    protected void lbtnShowOrderDetail_Click(object sender, EventArgs e)
    {
        DisplayMessage.ShowAlertModal("ShowOrderDetail()", Page);
    }

    protected void rptOrderDetail_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var iconStatus = e.Item.FindControl("iconStatus") as HtmlControl;
        var hfStatus = e.Item.FindControl("hfStatus") as HiddenField;
        var lblOrderDetailCode = e.Item.FindControl("lblOrderDetailCode") as Label;
        var lblName1 = e.Item.FindControl("lblName1") as Label;
        var lblName2 = e.Item.FindControl("lblName2") as Label;
        var orderDetailPanelBody = e.Item.FindControl("orderDetailPanelBody") as HtmlControl;

        if (Convert.ToByte(hfStatus.Value) == 0)
        {
            iconStatus.Attributes.Add("class", "fa fa-play-circle fa-2x");
        }
        if (Convert.ToByte(hfStatus.Value) == 1)
        {
            iconStatus.Attributes.Add("class", "fa fa-check-circle fa-2x");
            iconStatus.Attributes.Add("style", "color:orange");
        }
        if (Convert.ToByte(hfStatus.Value) == 2)
        {
            iconStatus.Attributes.Add("class", "fa fa-check-circle fa-2x");
            iconStatus.Attributes.Add("style", "color:green");
        }

        var orderDetail = _orderDetailBll.GetOrderDetailByOrderDetailCode(lblOrderDetailCode.Text);

        if (orderDetail.SenderId == UserId)
        {
            lblName1.Text = "You";
            lblName2.Text = orderDetail.ReceiverId.ToString();
            btnConfirm.Visible = false;
        }
        if (orderDetail.ReceiverId == UserId)
        {
            lblName2.Text = "You";
            lblName1.Text = orderDetail.SenderId.ToString();
            divUploadPhoto.Visible = false;
            btnCompletePayment.Visible = false;
            orderDetailPanelBody.Attributes.Add("style", "background-color: #E66454; color: white");
        }
    }

    protected void rptOrderDetail_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        var lblOrderDetailCode = e.Item.FindControl("lblOrderDetailCode") as Label;
        if (e.CommandName == "ShowDetail")
        {
            var orderDetail = _orderDetailBll.GetOrderDetailByOrderDetailCode(lblOrderDetailCode.Text);
            if (orderDetail == null) return;

            var order = _orderBll.GetByOrderCode(orderDetail.GHOrderCode);
            if (order == null) return;

            hfOrderDetailCode.Value = orderDetail.OrderDetailCode;
            lblReceiverName.Text = orderDetail.ReceiverId.ToString();
            lblSenderName.Text = orderDetail.SenderId.ToString();
            txtBitcoinAddress.Text = order.BitcoinAddress;
            imgPhotoConfirmation.ImageUrl = "/Member/Upload/PhConfirm/" + orderDetail.Confirmation;
            aViewPhotoConfirmation.HRef = "/Member/Upload/PhConfirm/" + orderDetail.Confirmation;

            // hide button confirm if OrderDetail's status equal 2 (StatusDone)
            if (orderDetail.Status == StatusDone)
            {
                btnConfirm.Visible = false;
            }
        }
    }

    // upload hình đính kèm với thông tin chuyển tiền
    protected void btnCompletePayment_Click(object sender, EventArgs e)
    {
        var orderDetail = _orderDetailBll.GetOrderDetailByOrderDetailCode(hfOrderDetailCode.Value);
        if (orderDetail == null) return;

        orderDetail.OrderDetailCode = hfOrderDetailCode.Value;
        orderDetail.Status = 1;
        if (!fuPhotoConfirmation.HasFiles)
        {
            DisplayMessage.ShowMessage("Please select a photo to confirm before complete this payment !", Page);
        }
        else
        {
            var fileName = DateTime.Now.ToString("yyyyMMddHHmmssfff") + fuPhotoConfirmation.FileName;
            fuPhotoConfirmation.SaveAs(Path.Combine(Server.MapPath("~/Member/Upload/PhConfirm"), fileName));
            orderDetail.Confirmation = fileName;
            _orderDetailBll.UpdateOrderDetail(orderDetail);

            lblMessageContent.Text = "You have been completed successfully.";
            DisplayMessage.ShowAlertModal("ShowAlertSuccess()", Page);
        }

        LoadAllUserOrders();
        LoadAllUserOrderDetail();
    }

    // Hiển thị màn hình rút tiền
    protected void lbtnAskBitcoin_Click(object sender, EventArgs e)
    {
        if (CheckPhReceived() == false)
        {
            DisplayMessage.ShowAlertModal("ShowAsk()", Page);
            LoadAllUserBanks();
        }
        else
        {
            DisplayMessage.ShowAlertModal("ShowAlertError()", Page);
        }
    }

    // Rút tiền lãi và hoa hồng
    protected void btnWithdrawRequest_Click(object sender, EventArgs e)
    {
        //var orderProvideHelp = _orderBll.GetOldestOrderProvideHelp(UserId);
        var latestUserPH = _orderBll.GetLatestUserPH(UserId);
        // để rút tiền phải hoàn tất 100% PH đợt trước và lập tiếp lệnh PH mới bằng hoặc lớn hơn số tiền PH đợt trước
        if (latestUserPH.RemainingAmount == 0)
        {
            AddNewOrder("Ask");
            lblMessageContent.Text = "Your GH request have been sent successfully !";
            DisplayMessage.ShowAlertModal("ShowAlertSuccess()", Page);
            LoadAllUserOrders();
        }
        else
        {
            DisplayMessage.ShowMessage("You must complete 100% your request PH and create a new PH equal or greater latest PH", Page);
        }
    }

    // Xác nhận đã chuyển tiền chưa
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        var orderDetail = _orderDetailBll.GetOrderDetailByOrderDetailCode(hfOrderDetailCode.Value);
        if (orderDetail == null) return;

        orderDetail.OrderDetailCode = orderDetail.OrderDetailCode;
        orderDetail.Status = 2;
        _orderDetailBll.UpdateOrderDetail(orderDetail);

        var ghOrder = _orderBll.GetByOrderCode(orderDetail.GHOrderCode);

        ghOrder.OrderCode = ghOrder.OrderCode;

        ghOrder.RemainingAmount = ghOrder.RemainingAmount - orderDetail.Amount;
        ghOrder.Status = 1;
        _orderBll.UpdateOrder(ghOrder);

        var phOrder = _orderBll.GetByOrderCode(orderDetail.PHOrderCode);

        phOrder.OrderCode = phOrder.OrderCode;
        phOrder.RemainingAmount = phOrder.RemainingAmount - orderDetail.Amount;
        phOrder.Status = 1;
        _orderBll.UpdateOrder(phOrder);

        /// tinh commission
        lblMessageContent.Text = "You have been confirmed successfully.";
        DisplayMessage.ShowAlertModal("ShowAlertSuccess()", Page);
        LoadAllUserOrders();
        LoadAllUserOrderDetail();
    }

    #endregion

    #region Methods

    /// <summary>
    /// Insert a order
    /// </summary>
    /// <param name="typeAction">Type of order is GH or PH</param>
    private void AddNewOrder(string typeAction)
    {
        _order.OrderCode = RandomValue.RandomNumberToString();
        while (_orderBll.CheckBidCodeIsExists(_order.OrderCode) == true)
        {
            _order.OrderCode = RandomValue.RandomNumberToString();
        }
        _order.UserID = UserId;
        _order.Status = 0;
        _order.CreateDate = DateTime.Now.Date;
        if (typeAction == "Bid")
        {
            _order.Amount = AmountBitcoin;
            _order.Type = "PH";
        }
        else if (typeAction == "Ask")
        {
            _order.Type = "GH";
            _order.BitcoinAddress = ddlBitcoinAddress.SelectedValue;
            _order.Amount = decimal.Parse(lblTotalWithdrawAmount.Text);
        }
        _order.RemainingAmount = (decimal)_order.Amount;
        _orderBll.InsertOrder(_order);
    }

    /// <summary>
    /// Display all user orders
    /// </summary>
    private void LoadAllUserOrders()
    {
        rptOrder.DataSource = _orderBll.GetAllUserPH(UserId);
        rptOrder.DataBind();
    }

    private bool CheckPhReceived()
    {
        var ph = _orderBll.GetLatestUserPH(UserId);
        if (ph != null)
        {
            if (ph.Status == StatusPending) return true;
            return false;
        }
        else
        {
            return false;
        }
    }

    private void LoadAllUserOrderDetail()
    {
        rptOrderDetail.DataSource = _orderDetailBll.GetAllUserOrderDetails(UserId);
        rptOrderDetail.DataBind();
    }

    /// <summary>
    /// Get oldest PH and GH with purpose insert into OrderDetail
    /// </summary>
    private void GetGhAndPhInsertToOrderDetail()
    {
        // lay danh sach gh
        var getHelps = _orderBll.GetAllOrderGH();

        // lay ph moi nhat cua user
        var orderProvideHelp = _orderBll.GetOldestOrderProvideHelp(UserId);
        if (orderProvideHelp == null) return;

        // lay order detail moi nhat cua user
        var latestUserOrderDetail = _orderDetailBll.GetOrderDetailByPhOrderCode(orderProvideHelp.OrderCode);

        foreach (var getHelp in getHelps)
        {
            var orderDetailByGhCode = _orderDetailBll.GetOrderDetailByGHOrderCode(getHelp.OrderCode);

            if (
                orderDetailByGhCode == null ||
                (orderDetailByGhCode != null
                && Convert.ToDecimal(_orderDetailBll.SumAmountOrderDetailByGhOrderCode(getHelp.OrderCode)) < Convert.ToDecimal(getHelp.Amount)
                && !_orderDetailBll.CheckOrderDetailExists(orderProvideHelp.OrderCode, getHelp.OrderCode, UserId)))
            {
                _orderDetail.OrderDetailCode = RandomValue.RandomNumberToString();
                _orderDetail.PHOrderCode = orderProvideHelp.OrderCode;
                _orderDetail.GHOrderCode = getHelp.OrderCode;
                _orderDetail.SenderId = UserId;
                _orderDetail.ReceiverId = getHelp.UserID;
                _orderDetail.Status = 0;
                _orderDetail.CreateDate = Convert.ToDateTime(DateTime.Now.ToLongDateString());

                if (latestUserOrderDetail == null)
                {
                    _orderDetail.Amount = Convert.ToDecimal((orderProvideHelp.Amount * 20) / 100);
                    _orderDetailBll.InsertOrderDetail(_orderDetail);
                }
                else if (orderProvideHelp.RemainingAmount <= getHelp.RemainingAmount
                    && (DateTime.Now - orderProvideHelp.CreateDate).TotalDays >= 7 && latestUserOrderDetail.Status == StatusDone)
                {
                    _orderDetail.Amount = Convert.ToDecimal((orderProvideHelp.Amount * 80) / 100);
                    _orderDetailBll.InsertOrderDetail(_orderDetail);
                }
                break;
            }
        }
    }

    /// <summary>
    /// Display list bitcoin addresses of user
    /// </summary>
    private
    void LoadAllUserBanks()
    {
        ddlBitcoinAddress.DataSource = _bankBll.GetAllUserBanks(UserId);
        ddlBitcoinAddress.DataTextField = "BitcoinAddress";
        ddlBitcoinAddress.DataValueField = "BitcoinAddress";
        ddlBitcoinAddress.DataBind();
    }

    #endregion
}
