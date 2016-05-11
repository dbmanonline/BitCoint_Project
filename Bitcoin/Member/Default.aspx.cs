using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;
using Bitcoin.Data.DTO;

public partial class Member_Default : System.Web.UI.Page
{
    #region Fields

    private readonly BidBLL _bidBll = new BidBLL();
    private readonly BidDetailBLL _bidDetailBll = new BidDetailBLL();
    private readonly Bid _bid = new Bid();

    // Current default of amount bitcoin is 0.5
    private const float AmountBitcoin = (float)0.5;
    // UserId is temporary value that will be changed by session of user 
    private const int UserId = 4;
    private const int StatusPending = 0;
    private const int StatusReceived = 1;

    #endregion

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtBitcoinAmount.Text = AmountBitcoin.ToString();
            LoadAllUserBids();
        }
    }

    protected void btnSaveBid_Click(object sender, EventArgs e)
    {
        AddNewBid();
        LoadAllUserBids();
        DisplayMessage.ShowMessage("Your Bid have been saved successfully !", Page);
    }

    protected void rptBid_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var lblAmount = e.Item.FindControl("lblAmount") as Label;
        var lblRemainingAmount = e.Item.FindControl("lblRemainingAmount") as Label;
        var lblStatus = e.Item.FindControl("lblStatus") as Label;
        var spanStatus = e.Item.FindControl("spanStatus") as HtmlControl;

        lblRemainingAmount.Text = Convert.ToDouble(Convert.ToDouble(lblAmount.Text) - ((Convert.ToDouble(lblAmount.Text) * Convert.ToDouble(lblRemainingAmount.Text)) / 100)).ToString();

        if (lblStatus.Text == StatusPending.ToString())
        {
            lblStatus.Text = "PENDING";
            spanStatus.Attributes.Add("class", "label label-danger");
        }
        if (lblStatus.Text == StatusReceived.ToString())
        {
            lblStatus.Text = "RECEIVED";
            spanStatus.Attributes.Add("class", "label label-success");
        }
    }

    #endregion

    #region Methods

    private void AddNewBid()
    {
        _bid.BidCode = RandomValue.RandomNumberToString();
        while (_bidBll.CheckBidCodeIsExists(_bid.BidCode) == true)
        {
            _bid.BidCode = RandomValue.RandomNumberToString();
        }
        _bid.UserID = UserId;
        _bid.Amount = AmountBitcoin;
        _bid.Percentage = 0;
        _bid.Status = 0;
        _bid.CreateDate = DateTime.Now.Date;
        _bidBll.InsertBid(_bid);
    }

    private void LoadAllUserBids()
    {
        rptBid.DataSource = _bidBll.GetAllUserBids(UserId);
        rptBid.DataBind();
    }

    #endregion
}