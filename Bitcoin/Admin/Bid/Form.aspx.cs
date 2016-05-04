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
    /// *** Status of Bid is hard code and please don't change value. ***
    ///     0 : Pending
    ///     1 : Approve
    ///     2 : Close
    /// </summary>

    readonly BidBLL _bidBll = new BidBLL();
    readonly Bid _bid = new Bid();
    readonly BidDetailBLL _bidDetailBll = new BidDetailBLL();
    readonly BidDetail _bidDetail = new BidDetail();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetBid();
            LoadPaymentCheckBox();
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

    private void UpdateBid()
    {
        var bid = _bidBll.GetBidById(Request.QueryString["bidcode"]);
        bid.Status = Convert.ToByte(dlStatus.SelectedValue);
        _bidDetail.BidDetailCode = "GR" + RandomValue.RandomNumberToString();
        _bidDetail.BidCode = bid.BidCode;
        _bidDetail.Status = false;
        _bidDetail.CreateDate = Convert.ToDateTime(DateTime.Now.ToShortDateString());
        _bidBll.UpdateBid(bid);
        if (ckb20.Checked && bid.Status == 1)
        {
            _bidDetail.Percentage = 20;
            _bidDetailBll.InsertBidDetail(_bidDetail);
        }
        else if (ckb80.Checked && bid.Status == 1)
        {
            _bidDetail.Percentage = 80;
            _bidDetailBll.InsertBidDetail(_bidDetail);
        }
        else
        {
            return;
        }
        
        DisplayMessage.ShowMessage("Your Bid have been saved successfully !", Page);
    }
   
    private void LoadPaymentCheckBox()
    {
        var bid = _bidBll.GetBidById(Request.QueryString["bidcode"]);
        if (bid.Percentage == 0)
        {
            ckb80.Enabled = false;
        }
        else if(bid.Percentage == 20)
        {
            ckb20.Enabled = false;
            ckb80.Enabled = true;
        }
        else if(bid.Percentage == 100)
        {
            ckb20.Enabled = false;
            ckb80.Enabled = false;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["action"] != null && Request.QueryString["action"] == "edit")
        {
            UpdateBid();
        }
    }

    protected void btnList_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}