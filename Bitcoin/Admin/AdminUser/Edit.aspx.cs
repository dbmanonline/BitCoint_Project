using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;

public partial class Admin_AdminUser_Edit : System.Web.UI.Page
{
    private AdminUserBLL _adminUserBll = new AdminUserBLL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAdminUserDetail();
            txtPassword.Attributes["type"] = "password";// replace password value by dots
        }
    }

    private void LoadAdminUserDetail()
    {
        var id = Convert.ToInt32(Request.QueryString["id"]);
        var adminUser = _adminUserBll.GetAdminUserById(id);
        if (adminUser == null) Response.Redirect("Default.aspx");

        txtUserName.Text = adminUser.UserName;
        txtPassword.Text = adminUser.Password;
        txtEmail.Text = adminUser.Email;
        txtFullName.Text = adminUser.UserName;
        chkbActive.Checked = adminUser.Active;
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        var adminUser = _adminUserBll.GetAdminUserById(Convert.ToInt32(Request.QueryString["id"]));
        if (adminUser == null)
        {
            throw new ArgumentNullException("adminUser");
        }
        else
        {
            adminUser.Password = txtPassword.Text != adminUser.Password ? MD5Password.MD5Hash(txtPassword.Text) : adminUser.Password;
            adminUser.Email = txtEmail.Text;
            adminUser.FullName = txtFullName.Text;
            adminUser.Active = chkbActive.Checked;

            _adminUserBll.UpdateAdminUser(adminUser);
            DisplayMessage.ShowMessage("Updated successfully !", Page);
        }
    }
}