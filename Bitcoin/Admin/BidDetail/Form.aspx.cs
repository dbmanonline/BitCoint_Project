using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;
using Bitcoin.Data.DTO;

public partial class Admin_BidDetail_Form : System.Web.UI.Page
{
    private readonly BidBLL _bidBll = new BidBLL();
    private readonly BidDetail _bidDetail = new BidDetail();
    private readonly BidDetailBLL _bidDetailBll = new BidDetailBLL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["action"] == "insert")
            {
                var bid = _bidBll.GetBidById(Request.QueryString["gpcode"]);
                if (bid != null)
                {
                    txtGRCode.Text = AutoGenGRCode();
                    txtGPCode.Text = Request.QueryString["gpcode"];
                    txtPercentage.Text = Request.QueryString["percentage"];
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            if (Request.QueryString["action"] == "edit")
            {
                GetGetailBidDetail();
            }
        }
    }

    private void GetGetailBidDetail()
    {
        var bidDetail = _bidDetailBll.GetBidDetailById(Request.QueryString["grcode"]);
        if (bidDetail != null)
        {
            txtGRCode.Text = bidDetail.BidDetailCode;
            txtGPCode.Text = bidDetail.BidCode;
            txtPercentage.Text = bidDetail.Percentage.ToString();
            txtBankName.Text = bidDetail.BankName;
            txtAccountNumber.Text = bidDetail.AccountNumber;
            txtName.Text = bidDetail.AccountName;
            txtBranchName.Text = bidDetail.BranchName;
            txtBitCoinAddress.Text = bidDetail.BitCoinAddress;
            ckbStatus.Checked = Convert.ToBoolean(bidDetail.Status);
            imgConfirm.ImageUrl = "/Uploads/Confirmation/" + bidDetail.PhotoConfirmation;
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }


    private void InsertBidDetail()
    {
        _bidDetail.BidDetailCode = txtGRCode.Text.Trim();
        _bidDetail.BidCode = txtGPCode.Text.Trim();
        _bidDetail.Percentage = Convert.ToDouble(txtPercentage.Text);
        _bidDetail.PhotoConfirmation = "";
        _bidDetail.IFSCCode = "";
        _bidDetail.BankName = txtBankName.Text.Trim();
        _bidDetail.AccountNumber = txtAccountNumber.Text.Trim();
        _bidDetail.AccountName = txtName.Text.Trim();
        _bidDetail.BranchName = txtBranchName.Text.Trim();
        _bidDetail.BitCoinAddress = txtBitCoinAddress.Text.Trim();
        _bidDetail.Status = ckbStatus.Checked;
        _bidDetail.CreateDate = Convert.ToDateTime(DateTime.Now.ToShortDateString());
        _bidDetailBll.InsertBidDetail(_bidDetail);
        DisplayMessage.ShowMessage("You have been saved successfully !", Page);

    }

    private void UpdateBidDetail()
    {
        var bidDetail = _bidDetailBll.GetBidDetailById(Request.QueryString["grcode"]);
        bidDetail.BidDetailCode = Request.QueryString["grcode"];
        bidDetail.BidDetailCode = txtGRCode.Text.Trim();
        bidDetail.BankName = txtBankName.Text.Trim();
        bidDetail.AccountNumber = txtAccountNumber.Text.Trim();
        bidDetail.AccountName = txtName.Text.Trim();
        bidDetail.BranchName = txtBranchName.Text.Trim();
        bidDetail.BitCoinAddress = txtBitCoinAddress.Text.Trim();
        bidDetail.Status = ckbStatus.Checked;
        _bidDetailBll.UpdateBidDetail(bidDetail);

        // Only update percentage of bid when status of bid detail is true
        if (bidDetail.Status == true)
        {
            var bid = _bidBll.GetBidById(bidDetail.BidCode);
            bid.BidCode = bid.BidCode;
            if (bidDetail.Percentage == 20)
            {
                bid.Percentage = 20;
            }
            else if (bidDetail.Percentage == 80)
            {
                bid.Percentage = 100;
            }
            _bidBll.UpdateBid(bid);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["action"] != null && Request.QueryString["action"] == "insert")
        {
            if (CheckStatusOfBidBeforeInsertBidDetail() == true)
            {
                InsertBidDetail();
                ResetForm();
            }
            else
            {
                DisplayMessage.ShowMessage("GP Code is not approved yet. Thus you can not create GR !", Page);
            }
        }

        if (Request.QueryString["action"] != null && Request.QueryString["action"] == "edit")
        {
            UpdateBidDetail();
            DisplayMessage.ShowMessage("You have been updated successfully !", Page);
        }
    }

    private bool CheckStatusOfBidBeforeInsertBidDetail()
    {
        var bid = _bidBll.GetBidById(Request.QueryString["gpcode"]);
        return bid.Status == 1;
    }

    /// <summary>
    /// Reset and clean controls after submit form
    /// </summary>
    private void ResetForm()
    {
        txtGRCode.Text = AutoGenGRCode();
        //txtPercentage.Text = 0;
        txtBankName.Text = "";
        txtAccountNumber.Text = "";
        txtName.Text = "";
        txtBranchName.Text = "";
        txtBitCoinAddress.Text = "";
        ckbStatus.Checked = false;
    }

    /// <summary>
    /// Generate a string for GR Code
    /// </summary>
    /// <returns> string </returns>
    private string AutoGenGRCode()
    {
        return "GR" + RandomValue.RandomNumberToString();
    }

    protected void btnList_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}