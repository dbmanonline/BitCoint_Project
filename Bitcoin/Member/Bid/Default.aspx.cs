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
    //jurefisiz@leeching.net Password id : 123456 Security Code : 123456

    #region Fields

    readonly BidBLL _bidBll = new BidBLL();
    readonly BidPercentageBLL _bidPercentageBll = new BidPercentageBLL();
    readonly Bid _bid = new Bid();

    #endregion

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
        _bid.BidCode = RandomValue.RandomStringToNumber();
        _bid.UserID = 4;
        _bid.Amount = float.Parse(txtDepositAmount.Text);
        _bid.Percentage = _bidPercentageBll.GetCurrentPercentage().Percentage;
        _bid.Status = 0;
        _bid.CreateDate = DateTime.Now.Date;
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
        lblBidID.Text = bid.BidCode;
        lblAmount.Text = Convert.ToDouble(bid.Amount).ToString();
        lblRemainingAmount.Text = Convert.ToDouble((bid.Amount - ((bid.Amount * bid.Percentage) / 100))).ToString();
        lblCreateDate.Text = Convert.ToDateTime(bid.CreateDate).ToString("d MMM, yyyy");
        if (bid.Status == 0)
        {
            lblStatus.Text = "This request is waiting approve by admin.";
        }
        if (bid.Status == 1)
        {
            lblStatus.Text = "This request processed.";
        }
    }

    protected void lbDeleteBid_Click(object sender, EventArgs e)
    {
        var bid = _bidBll.GetLatestBid(4);
        if (bid != null)
        {
            if (bid.Status == 0)
            {
                _bidBll.DeleteBid(bid);
                pnBidInfo.Visible = false;
            }
            else
            {
                DisplayMessage.ShowMessage("You can not delete because this request processed  !", Page);
            }
        }
    }
}