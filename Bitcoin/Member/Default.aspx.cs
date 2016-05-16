using System;
using System.Collections.Generic;
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

    // Current default of amount bitcoin is 0.5
    private const float AmountBitcoin = (float)0.5;
    // UserId is temporary value that will be changed by session of user 
    private const int UserId = 4;
    private const int StatusPending = 0;
    private const int StatusReceived = 1;

    #endregion

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtBitcoinAmount.Text = AmountBitcoin.ToString();
            LoadAllUserPH();
            //GetGhToInsertIntoOrderDetail();
            //LoadGHofUser();
        }
    }

    protected void btnSaveBid_Click(object sender, EventArgs e)
    {
        AddNewBid();
        DisplayMessage.ShowAlertModal("ShowAlertSuccess()", Page);
        LoadAllUserPH();
    }

    protected void rptBid_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var lblAmount = e.Item.FindControl("lblAmount") as Label;
        //var lblRemainingAmount = e.Item.FindControl("lblRemainingAmount") as Label;
        var lblStatus = e.Item.FindControl("lblStatus") as Label;
        var spanStatus = e.Item.FindControl("spanStatus") as HtmlControl;

        //lblRemainingAmount.Text = Convert.ToDouble(Convert.ToDouble(lblAmount.Text) - ((Convert.ToDouble(lblAmount.Text) * Convert.ToDouble(lblRemainingAmount.Text)) / 100)).ToString();

        if (lblStatus.Text == StatusPending.ToString())
        {
            lblStatus.Text = "PENDING";
            spanStatus.Attributes.Add("class", "label label-danger");
        }
        if (lblStatus.Text == StatusReceived.ToString())
        {
            lblStatus.Text = "RECEIVED";
            spanStatus.Attributes.Add("class", "label label-success");
        }
    }

    protected void lbBidBitcoin_Click(object sender, EventArgs e)
    {
        DisplayMessage.ShowAlertModal("ShowBid()", Page);
    }

    protected void lbtnShowOrderDetail_Click(object sender, EventArgs e)
    {
        DisplayMessage.ShowAlertModal("ShowOrderDetail()", Page);
    }

    #endregion

    #region Methods

    private void AddNewBid()
    {
        if (CheckPhReceived() == false)
        {
            _order.OrderCode = RandomValue.RandomNumberToString();
            while (_orderBll.CheckBidCodeIsExists(_order.OrderCode) == true)
            {
                _order.OrderCode = RandomValue.RandomNumberToString();
            }
            _order.UserID = UserId;
            _order.Amount = AmountBitcoin;
            _order.Status = 0;
            _order.CreateDate = DateTime.Now.Date;
            _order.Type = "PH";
            _orderBll.InsertOrder(_order);
        }
        else
        {
            DisplayMessage.ShowAlertModal("ShowAlertError()", Page);
        }
    }

    private void LoadAllUserPH()
    {
        rptBid.DataSource = _orderBll.GetAllUserPH(UserId);
        rptBid.DataBind();
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

    private void LoadGHofUser()
    {
        rptAsk.DataSource = _orderDetailBll.GetAllGHforUser(UserId);
        rptAsk.DataBind();
    }

    private void GetGhToInsertIntoOrderDetail()
    {
        var gh = _orderBll.GetEarlyGH();
        var currentUserAmount = _orderBll.GetLatestUserPH(UserId);
        _orderDetail.OrderDetailCode = RandomValue.RandomNumberToString();
        _orderDetail.OrderCode = gh.OrderCode;
        _orderDetail.SenderId = UserId;
        _orderDetail.ReceiverId = gh.UserID;
        _orderDetail.Amount = ( currentUserAmount.Amount * 20 ) / 100;
        _orderDetailBll.InsertOrderDetail(_orderDetail);
    }

    #endregion
}
