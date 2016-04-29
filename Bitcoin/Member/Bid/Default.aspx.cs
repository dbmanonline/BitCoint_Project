using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;
using Bitcoin.Data.DTO;
using Bitcoin.Data.Common;

public partial class Member_Bid_Default : System.Web.UI.Page
{
    readonly BidBLL _bidBll = new BidBLL();
    readonly Bid _bid = new Bid();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
    }
    
    public void InsertBid()
    {
        _bid.BidID = RandomValue.RandomStringToNumber();
        _bid.UserID = 4;
        _bid.Amount = Double.Parse(txtDepositAmount.Text);
        _bid.Currency = Convert.ToInt16(ddlCurrency.SelectedValue);
        _bid.PaidAmount = Double.Parse(txtDepositAmount.Text);
        _bid.CreateDate = DateTime.Now.Date;
        _bid.Status = 0;
        _bidBll.InsertBid(_bid);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        InsertBid();
    }
}