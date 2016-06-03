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

    private OrderBLL _orderBll = new OrderBLL();
    private Order _order = new Order();
    private OrderDetailBLL _orderDetailBll = new OrderDetailBLL();
    private OrderDetail _orderDetail = new OrderDetail();
    private BankBLL _bankBll = new BankBLL();

    #endregion

    #region Methods

    // List of stauses
    private enum Status
    {
        Pending = 0,
        Processed = 1,
        Done = 2
    };

    // Current default of amount bitcoin is 0.5
    private const decimal AmountBitcoin = (decimal)0.5;
     
    // Insert a order
    // with types of order is GH or PH
    private void AddNewOrder(string typeAction)
    {
        _order.OrderCode = RandomValue.RandomNumberToString();

        // check order code if it already exists 
        while (_orderBll.CheckBidCodeIsExists(_order.OrderCode) == true)
        {
            _order.OrderCode = RandomValue.RandomNumberToString();
        }
        _order.UserID = UserId;
        _order.Status = 0;
        _order.CreateDate = DateTime.Now;

        if (typeAction == "Bid")
        {
            var latestUserPH = _orderBll.GetLatestUserPh(UserId);
            _order.LastOrderCode = latestUserPH == null ? _order.OrderCode : latestUserPH.OrderCode;
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

    // Display all user's orders
    private void LoadAllUserOrders()
    {
        rptOrder.DataSource = _orderBll.GetAllUserOrder(UserId);
        rptOrder.DataBind();
    }

    // Get all user's order details
    private void LoadAllUserOrderDetail()
    {
        rptOrderDetail.DataSource = _orderDetailBll.GetAllUserOrderDetails(UserId);
        rptOrderDetail.DataBind();
    }

    // This is a temporary datetime for testing purpose
    private DateTime dateTimeNow = Convert.ToDateTime("6/7/2016");

    // Get oldest PH and GH with purpose insert into OrderDetail
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
            decimal sumAmountOfOrderDetail = _orderDetailBll.SumAmountOrderDetailByGhOrderCode(getHelp.OrderCode);
            bool checkOrderDetailExists = _orderDetailBll.CheckOrderDetailExists(orderProvideHelp.OrderCode,
                getHelp.OrderCode, UserId);

            if (
                orderDetailByGhCode == null ||
                (orderDetailByGhCode != null
                && sumAmountOfOrderDetail < getHelp.Amount
                && !checkOrderDetailExists))
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
                    break;
                }
                else if (orderProvideHelp.RemainingAmount <= getHelp.RemainingAmount
                    && (dateTimeNow - orderProvideHelp.CreateDate).TotalDays >= 7 && latestUserOrderDetail.Status == (int)Status.Done)
                {
                    _orderDetail.Amount = Convert.ToDecimal((orderProvideHelp.Amount * 80) / 100);
                    _orderDetailBll.InsertOrderDetail(_orderDetail);
                    break;
                }

            }
        }
    }

    // Display list bitcoin addresses of user
    private void LoadAllUserBanks()
    {
        ddlBitcoinAddress.DataSource = _bankBll.GetAllUserBanks(UserId);
        ddlBitcoinAddress.DataTextField = "BitcoinAddress";
        ddlBitcoinAddress.DataValueField = "BitcoinAddress";
        ddlBitcoinAddress.DataBind();
    }

    // Compute commission after confirmed PH
    private void SetCommission(int LevelID, float AmountReceived, int CTypeIndex)
    {
        UserBLL _userBLL = new UserBLL();

        //Lấy ID người cho
        int FromUserId = LevelID;//ID người cho
        var _FromUser = _userBLL.GetByUserID(FromUserId);

        if (_FromUser == null)
            return;

        //Lấy ID người nhận tiền hoa hồng gioi thieu truc tiep
        int ToUserId = 0;
        var _ToUser = _userBLL.GetByEmailID(_FromUser.SponsorID);
        if (_ToUser == null)
            return;
        ToUserId = _ToUser.UserID;

        float CommissionPrice = (AmountReceived * Convert.ToInt32(_ToUser.Level.Rate)) / 100;

        Commission _c = new Commission();
        _c.FromUserId = FromUserId;
        _c.ToUserId = ToUserId;
        _c.CommissionPrice = CommissionPrice;
        _c.CommissionDate = DateTime.Now;
        _c.CommissionType = CTypeIndex;//Nhận tiền hoa hồng giới thiệu tu cap duoi

        CommissionBLL _cBLL = new CommissionBLL();
        _cBLL.Insert(_c);

        SetCommission(_ToUser.UserID, CommissionPrice, CTypeIndex + 1);
    }
    
    #endregion

    #region Events

    // UserId is temporary value that will be changed by session of user
    private int UserId = -1; 

    protected void Page_Load(object sender, EventArgs e)
    {
        UserId = BitcoinSession.LoginMemberId;

        if (!IsPostBack)
        {
            LoadAllUserOrders();
            GetGhAndPhInsertToOrderDetail();
            LoadAllUserOrderDetail();
        }
    }

    protected void btnSaveBid_Click(object sender, EventArgs e)
    {
        var latestUserPH = _orderBll.GetLatestUserPh(UserId);

        if (latestUserPH == null || latestUserPH.RemainingAmount == 0)
        {
            AddNewOrder("Bid");
            lblMessageContent.Text = "You have been sent a Provide Help (PH) request successfully !";
            DisplayMessage.ShowAlertModal("ShowAlertSuccess()", Page);
            LoadAllUserOrders();
            LoadAllUserOrderDetail();
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

        int valueOfStatus = Convert.ToInt16(lblStatus.Text);

        // hiển thị span background màu đỏ với những Order nào đang Pending
        if ((int)Status.Pending == valueOfStatus)
        {
            lblStatus.Text = "PENDING";
            spanStatus.Attributes.Add("class", "label label-danger");
        }
        // hiển thị span background màu xanh lá cây với những Order nào đã Process
        if ((int)Status.Processed == valueOfStatus)
        {
            lblStatus.Text = "Request Processed";
            spanStatus.Attributes.Add("class", "label label-success");
        }
        // hiển thị span background màu xanh lá cây với những Order nào đã Done
        if (valueOfStatus == (int)Status.Done)
        {
            lblStatus.Text = "Done";
            spanStatus.Attributes.Add("class", "label label-success");
        }
        // hiển thị background màu trắng với những Order Details là lệnh ...
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

            UserBLL _uBLL = new UserBLL();
            var _userReceiver = _uBLL.GetByUserID(orderDetail.ReceiverId);

            lblName2.Text = _userReceiver.FullName;
            btnConfirm.Visible = false;
        }
        if (orderDetail.ReceiverId == UserId)
        {
            lblName2.Text = "You";
            lblName1.Text = orderDetail.User.FullName;
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
            txtBitcoinAddress.Text = order.BitcoinAddress;
            imgPhotoConfirmation.ImageUrl = "/Member/Upload/PhConfirm/" + orderDetail.Confirmation;
            aViewPhotoConfirmation.HRef = "/Member/Upload/PhConfirm/" + orderDetail.Confirmation;

            // fuPhotoConfirmation will invisible if order's status equal 2
            if (orderDetail.Status == 2)
                fuPhotoConfirmation.Visible = false;

            //Get info user
            //Nguoi nhan
            string htmlUserReceiver = @"<tr>
                                <td>Recepient</td>
                                <td>
                                    {0}
                                </td>
                            </tr>
                            <tr>
                                <td>Country</td>
                                <td>{1}</td>
                            </tr>
                            <tr>
                                <td>Mobile No</td>
                                <td>{2}</td>
                            </tr>";
            UserBLL _uBLL = new UserBLL();
            var _uReceiver = _uBLL.GetByUserID(orderDetail.ReceiverId);
            htmlUserReceiver = String.Format(htmlUserReceiver, _uReceiver.FullName, _uReceiver.Country, _uReceiver.MobileNo);
            ltrUserReceiverInfo.Text = htmlUserReceiver;

            //Nguoi gui

            string htmlUserSender = @"<tr>
                                            <td>Sender</td>
                                            <td>
                                                {0}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Country</td>
                                            <td>{1}</td>
                                        </tr>
                                        <tr>
                                            <td>Mobile No</td>
                                            <td>{2}</td>
                                        </tr>";

            _uBLL = new UserBLL();
            var _uSender = _uBLL.GetByUserID(orderDetail.SenderId);
            htmlUserSender = String.Format(htmlUserSender, _uSender.FullName, _uSender.Country, _uSender.MobileNo);
            ltrUserSenderInfo.Text = htmlUserSender;

            // hide button confirm if OrderDetail's status equal 2 (StatusDone)
            if (orderDetail.Status == (int)Status.Done)
            {
                btnConfirm.Visible = false;
            }
        }
    }

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

    protected void lbtnAskBitcoin_Click(object sender, EventArgs e)
    {
        DisplayMessage.ShowAlertModal("ShowAsk()", Page);
        LoadAllUserBanks();
    }

    protected void btnWithdrawRequest_Click(object sender, EventArgs e)
    {
        var latestUserPH = _orderBll.GetLatestUserPh(UserId);
        if (latestUserPH == null)
        {
            DisplayMessage.ShowMessage("ban chua co lenh PH nao het", Page);
            return;
        }

        var lastOrderCode = _orderBll.GetByOrderCode(latestUserPH.LastOrderCode);
 
        if (latestUserPH.Status == 0 && lastOrderCode.Status == 2)
        {
            DisplayMessage.ShowMessage("lenh ph 20% moi dang cho dc nhan", Page);
        }
        else if (latestUserPH.Status == 1 && lastOrderCode.Status == 2)
        {
            AddNewOrder("Ask");
            lblMessageContent.Text = "Your GH request have been sent successfully.";
            DisplayMessage.ShowAlertModal("ShowAlertSuccess()", Page);
            LoadAllUserOrders();
        }
        else
        {
            DisplayMessage.ShowMessage("ban chua the rut vui long doc ky huong dan", Page);
        }
        
    }

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

        if (phOrder.RemainingAmount != 0)
        {
            phOrder.Status = 1;
        }
        else
        {
            phOrder.Status = 2;
        }
        _orderBll.UpdateOrder(phOrder);

        /// tinh commission
        /// 
        SetCommission(orderDetail.SenderId, float.Parse(orderDetail.Amount.ToString()), 1);

        lblMessageContent.Text = "You have been confirmed successfully.";
        DisplayMessage.ShowAlertModal("ShowAlertSuccess()", Page);
        LoadAllUserOrders();
        LoadAllUserOrderDetail();
    }

    #endregion

}
