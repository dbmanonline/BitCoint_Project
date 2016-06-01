using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;

public partial class Admin_ChangePassword : System.Web.UI.Page
{
    private AdminUserBLL _adminUserBll = new AdminUserBLL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }

    private void ChangePassword()
    {
        var id = BitcoinSession.AdminUser;
        if (id != 0)
        {
            var adminUser = _adminUserBll.GetAdminUserById(id);
            if (adminUser == null) throw new ArgumentNullException("adminUser");
            if (adminUser.Password != MD5Password.MD5Hash(txtCurrentPassword.Text))
            {
                DisplayMessage.ShowMessage("Your current password is not valid !", Page);
            }
            else
            {
                adminUser.Password = MD5Password.MD5Hash(txtNewPassword.Text);
                _adminUserBll.UpdateAdminUser(adminUser);
                ClearControls.ClearControl(this);
                DisplayMessage.ShowMessage("You have been changed password successfully !", Page);
            }

        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        ChangePassword();
    }
}