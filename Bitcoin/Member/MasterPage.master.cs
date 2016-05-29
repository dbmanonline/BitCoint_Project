using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.DTO;
using Bitcoin.Data.BLL;

public partial class Member_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(String.IsNullOrEmpty(BitcoinSession.LoginMemberEmailID))
            {
                Response.Redirect("~/Member/Login.aspx");
            }

            UserBLL _usBLL = new UserBLL();
            var _us = _usBLL.GetByUserID(BitcoinSession.LoginMemberId);
            if(_us != null)
            {
                ltrUserFullName.Text = _us.FullName;
            }
        }
    }

    protected void lbtnLogOutTop_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("~/Member/Login.aspx");
    }
}
