﻿using System;
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
            GetGhToInsertIntoOrderDetail();
            LoadGHofUser();
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
        var lblStatus = e.Item.FindControl("lblStatus") as Label;
        var spanStatus = e.Item.FindControl("spanStatus") as HtmlControl;

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

    protected void rptOrderDetail_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var iconStatus = e.Item.FindControl("iconStatus") as HtmlControl;
        var hfStatus = e.Item.FindControl("hfStatus") as HiddenField;

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
    }

    protected void rptOrderDetail_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        var lblOrderDetailCode = e.Item.FindControl("lblOrderDetailCode") as Label;
        if (e.CommandName == "ShowDetail")
        {
            var orderDetail = _orderDetailBll.GetOrderDetailByOrderDetailCode(lblOrderDetailCode.Text);
            if (orderDetail == null) throw new ArgumentNullException("orderDetail");

            var order = _orderBll.GetByOrderCode(orderDetail.GHOrderCode);
            if (order == null) throw new ArgumentNullException("order");

            hfOrderDetailCode.Value = orderDetail.OrderDetailCode;
            lblReceiverName.Text = orderDetail.ReceiverId.ToString();
            lblSenderName.Text = orderDetail.SenderId.ToString();
            txtBitcoinAddress.Text = order.BitcoinAddress;
        }
    }

    protected void btnCompletePayment_Click(object sender, EventArgs e)
    {
        var orderDetail = _orderDetailBll.GetOrderDetailByOrderDetailCode(hfOrderDetailCode.Value);
        if (orderDetail == null) throw new ArgumentNullException("orderDetail");

        orderDetail.OrderDetailCode = hfOrderDetailCode.Value;
        orderDetail.Confirmation = fuPhoto.FileName;
        orderDetail.Status = 1;
        _orderDetailBll.UpdateOrderDetail(orderDetail);

        LoadAllUserPH();
        LoadGHofUser();
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
        rptOrderDetail.DataSource = _orderDetailBll.GetAllGHforUser(UserId);
        rptOrderDetail.DataBind();
    }

    private void GetGhToInsertIntoOrderDetail()
    {
        

        var gh = _orderBll.GetEarlyGH();
        var latestUserPH = _orderBll.GetLatestUserPH(UserId);
        _orderDetail.OrderDetailCode = RandomValue.RandomNumberToString();
        _orderDetail.PHOrderCode = latestUserPH.OrderCode;
        _orderDetail.GHOrderCode = gh.OrderCode;
        _orderDetail.SenderId = UserId;
        _orderDetail.ReceiverId = gh.UserID;
        _orderDetail.Status = 0;
        _orderDetail.CreateDate = Convert.ToDateTime(DateTime.Now.ToLongDateString());
        if (_orderDetailBll.CheckOrderCodeExistsInOrderDetail(latestUserPH.OrderCode) == false)
        {
            _orderDetail.Amount = (latestUserPH.Amount * 20) / 100;
        }
        //else if (_orderDetailBll.CheckOrderCodeExistsInOrderDetail(latestUserPH.OrderCode) == true)
        //{
        //    _orderDetail.Amount = (latestUserPH.Amount * 80) / 100;
        //}
        _orderDetailBll.InsertOrderDetail(_orderDetail);
    }

    #endregion


}
