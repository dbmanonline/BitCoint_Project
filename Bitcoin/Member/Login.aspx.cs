using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;

public partial class Member_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(!String.IsNullOrEmpty(BitcoinSession.LoginMemberEmailID))
            {
                UserBLL uBLL = new UserBLL();
                var _user = uBLL.GetByEmailID(BitcoinSession.LoginMemberEmailID);
                if(_user != null)
                {
                    Response.Redirect("~/Member/");
                }
            }
        }
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        ltrMsg.Text = "";

        UserBLL uBLL = new UserBLL();
        bool login = uBLL.Login(txtEmail.Text, MD5Password.MD5Hash(txtPassword.Text));
        if(login)
        {
            var _user = uBLL.GetByEmailID(txtEmail.Text);
            BitcoinSession.LoginMemberId = _user.UserID;
            BitcoinSession.LoginMemberEmailID = _user.EmailID;
            Response.Redirect("~/Member/");
        }
        else
        {
            ltrMsg.Text += @"<div class='alert alert-danger noborder text-center weight-400 nomargin noradius'>
                                Invalid Email or Password!
                            </div>";
        }
    }
}