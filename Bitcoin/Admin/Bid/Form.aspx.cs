using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;
using Bitcoin.Data.DTO;

public partial class Admin_Bid_Form : System.Web.UI.Page
{
    /// <summary>
    /// *** Status of Bid is hard code and don't change value, please. ***
    ///     0 : Pending
    ///     1 : Approve
    ///     2 : Close
    /// </summary>

    readonly BidBLL _bidBll = new BidBLL();
    readonly Bid _bid = new Bid();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetBid();
        }
    }

    private void GetBid()
    {
        if (Request.QueryString["bidcode"] == null) return;
        var bid = _bidBll.GetBidById(Request.QueryString["bidcode"]);
        if (bid != null)
        {
            txtBidCode.Text = bid.BidCode;
            txtEmailID.Text = bid.User.EmailID;
            txtAmount.Text = Convert.ToDouble(bid.Amount).ToString();
            txtPercentage.Text = Convert.ToDouble(bid.Percentage).ToString();
            dlStatus.SelectedValue = Convert.ToInt16(bid.Status).ToString();
            txtCreateDate.Text = Convert.ToDateTime(bid.CreateDate).ToString("d MMM, yyyy");
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["action"] != null && Request.QueryString["action"] == "edit")
        {
            UpdateBid();
        }
    }

    private void UpdateBid()
    {
        var bid = _bidBll.GetBidById(Request.QueryString["bidcode"]);

        bid.Status = Convert.ToInt16(dlStatus.SelectedValue);
        _bidBll.UpdateBid(bid);
        DisplayMessage.ShowMessage("Your Bid have been saved successfully !", Page);
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}