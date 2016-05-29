using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Bitcoin.Data.BLL;
using Bitcoin.Data.DTO;

public partial class Member_Bank_Default : System.Web.UI.Page
{
    #region Fields

    private readonly BankBLL _bankBLL = new BankBLL();
    private readonly Bank _bank = new Bank();

    // UserId is temporary value that will be changed by session of user 
    //private int UserId = -1;
    public int UserId { get; set; }

    #endregion

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        UserId = BitcoinSession.LoginMemberId;

        if (!IsPostBack)
        {
            LoadAllUserBanks();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        AddNewBank();
        ResetControl();
        LoadAllUserBanks();
        DisplayMessage.ShowAlertModal("ShowAlertSuccess()", Page);
    }

    protected void gvBank_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Pagination.PageIndexChanging(gvBank,e);
        LoadAllUserBanks();
    }

    protected void lbAddBitcoinAddress_Click(object sender, EventArgs e)
    {
        DisplayMessage.ShowAlertModal("ShowBitcoinAddressModal()", Page);
    }

    #endregion

    #region Methods

    private void AddNewBank()
    {
        _bank.UserID = UserId;
        _bank.AccountName = txtAccountName.Text.Trim();
        _bank.BitcoinAddress = txtBitcoinAddress.Text.Trim();
        _bankBLL.InsertBank(_bank);
    }

    private void LoadAllUserBanks()
    {
        gvBank.DataSource = _bankBLL.GetAllUserBanks(UserId);
        gvBank.DataBind();
    }

    private void ResetControl()
    {
        txtAccountName.Text = "";
        txtBitcoinAddress.Text = "";
    }

    #endregion

}