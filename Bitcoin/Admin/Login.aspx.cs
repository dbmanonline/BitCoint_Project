using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;

public partial class Admin_Login : System.Web.UI.Page
{
    private AdminUserBLL _adminUserBll = new AdminUserBLL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(BitcoinSession.AdminUser.ToString()))
            {
                var _adminUser = _adminUserBll.GetAdminUserById(BitcoinSession.AdminUser);
                if (_adminUser != null)
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (_adminUserBll.CheckAdminUserLogin(txtUserName.Text, MD5Password.MD5Hash(txtPassword.Text)))
        {
            var userAdmin = _adminUserBll.GetAdminUserByUsername(txtUserName.Text);
            BitcoinSession.AdminUser = userAdmin.Id;
            Response.Redirect("Default.aspx");
        }
        else
        {
            DisplayMessage.ShowMessage("You can not login !", Page);
        }
    }
}