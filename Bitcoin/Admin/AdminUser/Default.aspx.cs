using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;

public partial class Admin_AdminUser_Default : System.Web.UI.Page
{
    #region Fields

    private AdminUserBLL _adminUserBll = new AdminUserBLL();

    #endregion

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAllAdminUsers();
        }
    }

    protected void rptAdminUser_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        var adminUserId = e.Item.FindControl("hfAdminUserId") as HiddenField;

        if (e.CommandName == "Edit")
        {
            Response.Redirect("Edit.aspx?id=" + adminUserId.Value);
        }
        if (e.CommandName == "Delete")
        {
            var adminUser = _adminUserBll.GetAdminUserById(Convert.ToInt32(adminUserId.Value));
            if (adminUser == null) throw new ArgumentNullException("adminUser");
            _adminUserBll.DeleteAdminUser(adminUser);
            LoadAllAdminUsers();
        }
    }

    #endregion

    #region Methods

    private void LoadAllAdminUsers()
    {
        rptAdminUser.DataSource = _adminUserBll.GetAllAdminUsers();
        rptAdminUser.DataBind();
    }

    #endregion
}