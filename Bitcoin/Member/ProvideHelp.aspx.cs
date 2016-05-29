using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.DTO;
using Bitcoin.Data.BLL;

public partial class Member_ProvideHelp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            PipCoinBLL pcBLL = new PipCoinBLL();
            var lst = pcBLL.GetByUserId(BitcoinSession.LoginMemberId);

            foreach (var itm in lst)
            {
                var countDate = DateTime.Now - itm.DateCreate;
                double availableAmount = itm.Amount + (countDate.TotalDays * itm.InterestByDay);
                itm.InterestByDay = Math.Round(availableAmount, 3);
            }

            rptPipCoins.DataSource = lst;
            rptPipCoins.DataBind();
        }
    }

    protected void rptPipCoins_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Literal ltrType = e.Item.FindControl("ltrType") as Literal;
        switch(ltrType.Text)
        {
            case "0":
                ltrType.Text = "Unconfirmed";
                break;
            case "2":
                ltrType.Text = "Confirmed";
                break;
        }
    }
}