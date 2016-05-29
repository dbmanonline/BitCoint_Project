using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.DTO;
using Bitcoin.Data.BLL;

public partial class Member_MyBonus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            CommissionBLL _cBLL = new CommissionBLL();
            var _cList = _cBLL.GetByReceivedUserId(BitcoinSession.LoginMemberId);
            
            rptMyBonus.DataSource = _cList;
            rptMyBonus.DataBind();
        }
    }

    protected void rptMyBonus_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Literal ltrSenderId = e.Item.FindControl("ltrSenderId") as Literal;
        UserBLL _usBLL = new UserBLL();
        var _us = _usBLL.GetByUserID(Convert.ToInt32(ltrSenderId.Text));

        ltrSenderId.Text = "Referal Income by " + _us.EmailID;
    }
}