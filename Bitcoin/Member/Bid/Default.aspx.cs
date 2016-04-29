using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;
using Bitcoin.Data.DTO;

public partial class Member_Bid_Default : System.Web.UI.Page
{
    #region Fields

    readonly BidBLL _bidBll = new BidBLL();
    readonly Bid _bid = new Bid();

    #endregion

    #region Methods

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Current default of deposit amount is 0.5
            txtDepositAmount.Text = "0.5";

            // Default panel of BidInfo will be invisible if records of Bid is null.
            // Only display when user have bided successfully.
            if (_bidBll.GetLatestBid(4) != null)
            {
                pnBidInfo.Visible = true;
                GetLatestBidOfUser();
            }
            else
            {
                pnBidInfo.Visible = false;
            }

            // This is a temp name that will replace by a real fullname when get user from session of current user.
            lblFullName.Text = "Nguyen Superman";

        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        InsertBid();
    }

    /// <summary>
    /// Insert a Bid
    /// </summary>
    private void InsertBid()
    {
        _bid.BidID = RandomValue.RandomStringToNumber();
        _bid.UserID = 4;
        _bid.Amount = 0.5;
        _bid.Currency = Convert.ToInt16(ddlCurrency.SelectedValue);
        _bid.Percentage = 20;
        _bid.PaidAmount = ((_bid.Amount*_bid.Percentage)/100);
        _bid.CreateDate = DateTime.Now.Date;
        _bid.Status = 0;
        _bidBll.InsertBid(_bid);
        DisplayMessage.ShowMessage("Your Bid have been saved successfully !", Page);
        pnBidInfo.Visible = true;
        GetLatestBidOfUser();
    }

    /// <summary>
    /// Get latest bid of current user
    /// </summary>
    private void GetLatestBidOfUser()
    {
        var bid = _bidBll.GetLatestBid(4);
        lblBidID.Text = bid.BidID;
        lblAmount.Text = Convert.ToDouble(bid.Amount).ToString();
        lblRemainingAmount.Text = Convert.ToDouble((bid.Amount - ((bid.Amount * bid.Percentage) / 100))).ToString();
        lblCreateDate.Text = Convert.ToDateTime(bid.CreateDate).ToString("d MMM, yyyy");
        if (bid.Status == 0)
        {
            lblStatus.Text = "This request is waiting approve by admin in next 24 hours.";
        }
        if (bid.Status == 1)
        {
            lblStatus.Text = "This request processed.";
        }
    }

    #endregion


}