using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;
using Bitcoin.Data.DTO;

public partial class Member_ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if(!CheckOldPass())
        {
            ltrMsg.Text = String.Format("<div class='alert alert-warning margin-bottom-30'><strong>Warning!</strong> {0}</div>", "Old Password Incorrectly.");
            return;
        }

        User _us = new Bitcoin.Data.DTO.User();
        _us.Password = MD5Password.MD5Hash(txtNewPass.Text);
        _us.UserID = BitcoinSession.LoginMemberId;

        UserBLL _usBLL = new UserBLL();
        _usBLL.UpdatePassword(_us);
        Response.Redirect(Request.RawUrl);
    }
    private bool CheckOldPass()
    {
        UserBLL _usBLL = new UserBLL();
        var _us = _usBLL.GetByUserID(BitcoinSession.LoginMemberId);
        if (_us == null)
            return false;

        if (_us.Password != MD5Password.MD5Hash(txtOldPass.Text))
        {
            return false;
        }
        return true;
    }
}