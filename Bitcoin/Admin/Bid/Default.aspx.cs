using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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

            if (lblStatus.Text == "0")
            {
                lblStatus.Text = "Pending";
            }
        }
    }

    protected void rptBids_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            RepeaterItem repeaterItem = (RepeaterItem)(((LinkButton)e.CommandSource).NamingContainer);
            int id = Convert.ToInt32(((HiddenField)repeaterItem.FindControl("hdfBidId")).Value);
            Response.Redirect("Form.aspx?id=" + id + "&action=edit");
        }
    }
}