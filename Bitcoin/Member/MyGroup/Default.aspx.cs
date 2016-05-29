using Bitcoin.Data.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Member_MyGroup_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            UserBLL userBLL = new UserBLL();
            var userList = userBLL.GetFullChildByEmailID(BitcoinSession.LoginMemberEmailID);
            rptMyRefer.DataSource = userList;
            rptMyRefer.DataBind();
        }
    }

    protected void rptMyRefer_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Literal ltrStatus = e.Item.FindControl("ltrStatus") as Literal;
        switch (ltrStatus.Text)
        {
            case "1":
                ltrStatus.Text = "<span class='label label-success'>Active </span>";
                break;
            case "2":
                ltrStatus.Text = "<span class='label label-danger'>Blocked </span>";
                break;
        }
    }
}