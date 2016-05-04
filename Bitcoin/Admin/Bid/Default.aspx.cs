using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Bitcoin.Data.BLL;

public partial class Admin_Bid_Default : System.Web.UI.Page
{
    readonly BidBLL _bidBll = new BidBLL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetAllBids();
            CustomRepeaterBid();
        }
    }

    /// <summary>
    ///  Show all bids of users
    /// </summary>
    private void GetAllBids()
    {
        rptBids.DataSource = _bidBll.GetAllBids();
        rptBids.DataBind();
    }

    private void CustomRepeaterBid()
    {
        foreach (RepeaterItem repeaterItem in rptBids.Items)
        {
            var lblStatus = repeaterItem.FindControl("lblStatus") as Label;
            var span = (HtmlControl)repeaterItem.FindControl("spanStatus");

            if (lblStatus.Text == "0")
            {
                lblStatus.Text = "Pending";
                span.Attributes.Add("class", "label label-info");
            }
            if (lblStatus.Text == "1")
            {
                lblStatus.Text = "Approve";
                span.Attributes.Add("class", "label label-success");
            }
            if (lblStatus.Text == "2")
            {
                lblStatus.Text = "Close";
                span.Attributes.Add("class", "label label-danger");
            }
        }
    }

    protected void rptBids_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        RepeaterItem repeaterItem = (RepeaterItem)(((LinkButton)e.CommandSource).NamingContainer);
        string gpCode = ((Label)repeaterItem.FindControl("lblBidCode")).Text;

        if (e.CommandName == "Edit")
        {
            Response.Redirect("Form.aspx?bidcode=" + gpCode + "&action=edit");
        }
        if (e.CommandName == "CreateGR")
        {
            Response.Redirect("../BidDetail/Form.aspx?gpcode=" + gpCode + "&action=insert");
        }
    }
}