using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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
    readonly BidDetailBLL _bidDetailBll = new BidDetailBLL();

    // This is a temporary id of user and will replace by a real id when use session of user
    int userId = 6;

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Current default of deposit amount is 0.5
            txtDepositAmount.Text = "0.5";

            // Default panel of BidInfo will be invisible if records of Bid is null.
            // only display when user have bided successfully.
            LoadBidsOfUser();
            //if (_bidBll.GetLatestBid(userId) != null)
            //{
            //    pnBidInfo.Visible = true;

            //    //GetLatestBidOfUser();
            //}
            //else
            //{
            //    pnBidInfo.Visible = false;
            //}

            // This is a temporary name that will replace by 
            // a real fullname when get user from session of current user.
            //lblFullName.Text = "Nguyen Superman";
            LoadAllBidDetails();
            DisplayPanelInfo();
        }
    }

    private void LoadAllBidDetails()
    {
        rptBidDetail.DataSource = _bidDetailBll.GetAllBidDetailOfUser(userId);
        rptBidDetail.DataBind();
    }

    private void DisplayPanelInfo()
    {
        //var bid = _bidBll.GetBidById(lblBidID.Text);
        //if (bid.Percentage == 100)
        //{
        //    pnBidInfo.Visible = false;
        //}
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        InsertBid();
        LoadBidsOfUser();
    }

    /// <summary>
    /// Insert a Bid
    /// </summary>
    private void InsertBid()
    {
        _bid.BidCode = RandomValue.RandomNumberToString();
        _bid.UserID = userId;
        _bid.Amount = float.Parse(txtDepositAmount.Text);
        _bid.Percentage = 0;
        _bid.Status = 0;
        _bid.CreateDate = DateTime.Now.Date;
        _bidBll.InsertBid(_bid);
        DisplayMessage.ShowMessage("Your Bid have been saved successfully !", Page);
        //pnBidInfo.Visible = true;
    }

    /// <summary>
    /// Get latest bid of current user
    /// </summary>
    private void GetLatestBidOfUser()
    {
        //var bid = _bidBll.GetLatestBid(4);
        //lblBidID.Text = bid.BidCode;
        //lblAmount.Text = Convert.ToDouble(bid.Amount).ToString();
        //lblRemainingAmount.Text = Convert.ToDouble((bid.Amount - ((bid.Amount * bid.Percentage) / 100))).ToString();
        //lblCreateDate.Text = Convert.ToDateTime(bid.CreateDate).ToString("d MMM, yyyy");
        //if (bid.Status == 0)
        //{
        //    lblStatus.Text = "This request is waiting approve by admin.";
        //}
        //if (bid.Status == 1)
        //{
        //    lblStatus.Text = "This request processed.";
        //    lbDeleteBid.Visible = false;
        //}
        //if (bid.Status == 2)
        //{
        //    lblStatus.Text = "This request closed.";
        //    lbDeleteBid.Visible = false;
        //}
    }

    private void LoadBidsOfUser()
    {
        rptListBids.DataSource = _bidBll.GetAllBidsOfUser(userId);
        rptListBids.DataBind();
    }

    /// <summary>
    /// Delete a bid if status of bid is pending
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    //protected void lbDeleteBid_Click(object sender, EventArgs e)
    //{
    //    var bid = _bidBll.GetLatestBid(4);
    //    if (bid != null)
    //    {
    //        if (bid.Status == 0)
    //        {
    //            _bidBll.DeleteBid(bid);
    //            //pnBidInfo.Visible = false;
    //        }
    //        else
    //        {
    //            DisplayMessage.ShowMessage("You can not delete because this request processed  !", Page);
    //        }
    //    }
    //}

    /// <summary>
    /// Upload a photo confirmation for your bid
    /// and file can upload photo when status of bid detail is False
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSavePhoto_Click(object sender, EventArgs e)
    {
        if (!fuPhotoConfirmation.HasFiles)
        {
            DisplayMessage.ShowMessage("Please select a photo confirmation before save !", Page);
        }
        else
        {
            var fileName = DateTime.Now.ToString("yyyyMMddHHmmssfff") + fuPhotoConfirmation.FileName;
            fuPhotoConfirmation.SaveAs(Path.Combine(Server.MapPath("~/Uploads/Confirmation"), fileName));
            var bidDetail = _bidDetailBll.GetBidDetailById(lblOrder.Text);
            if (bidDetail.Status == false)
            {
                bidDetail.BidDetailCode = bidDetail.BidDetailCode;
                bidDetail.PhotoConfirmation = fileName;
                _bidDetailBll.UpdateBidDetail(bidDetail);
                DisplayMessage.ShowMessage("Attached successfully a photo confirmation !", Page);
                LoadAllBidDetails();
            }
        }
    }

    protected void rptBidDetail_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var grCode = e.Item.FindControl("lblGRCode") as Label;
        var iCheck = e.Item.FindControl("iCheck") as HtmlControl;
        var detailBid = _bidDetailBll.GetBidDetailById(grCode.Text);
        iCheck.Visible = !string.IsNullOrEmpty(detailBid.PhotoConfirmation);
    }

    protected void rptBidDetail_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "ViewDetail")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "ShowBidDetailModal();", true);
            var grCode = e.Item.FindControl("lblGRCode") as Label;
            var bidDetail = _bidDetailBll.GetBidDetailById(grCode.Text);
            if (bidDetail != null)
            {
                lblOrder.Text = bidDetail.BidDetailCode;
                lblBankName.Text = bidDetail.BankName;
                lblAccountNumber.Text = bidDetail.AccountNumber;
                lblName.Text = bidDetail.AccountName;
                lblBranchName.Text = bidDetail.BranchName;
                lblBitCoinAddress.Text = bidDetail.BitCoinAddress;
                if (bidDetail.Status == true)
                {
                    trConfirm.Visible = false;
                    btnSavePhoto.Visible = false;
                }
            }
            else
            {
                return;
            }
        }
    }

    /// <summary>
    /// Display bid modal to bid bitcoin
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnBid_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "ShowBidModal();", true);
    }

    protected void rptListBids_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var lblStatus = e.Item.FindControl("lblStatus") as Label;
        var lbtnDeleteBid = e.Item.FindControl("lbtnDeleteBid") as LinkButton;
        var lblRemainingAmount = e.Item.FindControl("lblRemainingAmount") as Label;
        var lblAmount = e.Item.FindControl("lblAmount") as Label;
        var pnBidInfo = e.Item.FindControl("pnBidInfo") as Panel;

        lblRemainingAmount.Text =  Convert.ToDouble(Convert.ToDouble(lblAmount.Text) - ((Convert.ToDouble(lblAmount.Text) * Convert.ToDouble(lblRemainingAmount.Text))/100)).ToString();

        if (lblStatus.Text == "0")
        {
            lblStatus.Text = "This request is waiting approve by admin.";
        }
        if (lblStatus.Text == "1")
        {
            lblStatus.Text = "This request processed.";
            lbtnDeleteBid.Visible = false;
        }
        if (lblStatus.Text == "2")
        {
            lblStatus.Text = "This request closed.";
            lbtnDeleteBid.Visible = false;
        }

        if (lblRemainingAmount.Text == "0")
        {
            pnBidInfo.Visible = false;
        }
    }

    protected void rptListBids_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            var lblBidCode = e.Item.FindControl("lblBidCode") as Label;
            var bid = _bidBll.GetBidById(lblBidCode.Text);
            if (bid != null)
            {
                if (bid.Status == 0)
                {
                    _bidBll.DeleteBid(bid);
                    LoadBidsOfUser();
                }
                else
                {
                    DisplayMessage.ShowMessage("You can not delete because this request processed  !", Page);
                }
            }
        }
    }
}