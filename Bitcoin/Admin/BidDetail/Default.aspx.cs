using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;

public partial class Admin_BidDetail_Default : System.Web.UI.Page
{
    private readonly  BidDetailBLL _bidDetailBll = new BidDetailBLL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
             ListBidDetails();
        }
    }

    private void ListBidDetails()
    {
        rptBidDetails.DataSource = _bidDetailBll.GetAllBidDetails();
        rptBidDetails.DataBind();
        CustomRepeaterBidDetail();
    }

    private void CustomRepeaterBidDetail()
    {
        foreach (RepeaterItem repeaterItem in rptBidDetails.Items)
        {
            var lblStatus = repeaterItem.FindControl("lblStatus") as Label;
            var span = (HtmlControl)repeaterItem.FindControl("spanStatus");

            if (lblStatus.Text == "False")
            {
                lblStatus.Text = "Pending";
                span.Attributes.Add("class", "label label-info");
            }
            if (lblStatus.Text == "True")
            {
                lblStatus.Text = "Confirm";
                span.Attributes.Add("class", "label label-success");
            }
        }
    }

    protected void rptBidDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        RepeaterItem repeaterItem = (RepeaterItem)(((LinkButton)e.CommandSource).NamingContainer);
        string grcode = ((Label)repeaterItem.FindControl("lblGRCode")).Text;

        if (e.CommandName == "Edit")
        {
            Response.Redirect("Form.aspx?grcode=" + grcode + "&action=edit");
        }
    }
}