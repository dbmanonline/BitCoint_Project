using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;
using Bitcoin.Data.DTO;

public partial class Admin_AdminUser_Create : System.Web.UI.Page
{
    #region Fields

    private AdminUserBLL _adminUserBll = new AdminUserBLL();
    private AdminUser _adminUser = new AdminUser();

    #endregion

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (_adminUserBll.CheckUserNameExists(txtUserName.Text))
        {
            DisplayMessage.ShowMessage("Username already registered, please choose a another username !", Page);
            return;
        }
        else if (_adminUserBll.CheckEmailExists(txtEmail.Text))
        {
            DisplayMessage.ShowMessage("Email already registered, please choose a another email !", Page);
            return;
        }
        else
        {
            AddNewAdminUser();
            ClearControls.ClearControl(this);
            DisplayMessage.ShowMessage("Inserted successfully !", Page);
        }
    }

    #endregion

    #region Methods

    private void AddNewAdminUser()
    {
        _adminUser.UserName = txtUserName.Text;
        _adminUser.Password = MD5Password.MD5Hash(txtPassword.Text);
        _adminUser.Email = txtEmail.Text;
        _adminUser.FullName = txtFullName.Text;
        _adminUser.Active = chkbActive.Checked;

        _adminUserBll.InsertAdminUser(_adminUser);
    }

    #endregion
}