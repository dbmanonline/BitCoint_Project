using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (BitcoinSession.AdminUser == 0)
            {
                Response.Redirect("/Admin/Login.aspx");
            }
        }
    }

    protected void lbtnLogOutLeft_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("/Admin/Login.aspx");
    }
}
