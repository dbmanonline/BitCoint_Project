using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;
using Bitcoin.Data.DTO;

public partial class Member_test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SetInterest("4238364124", float.Parse("0,5"));
    }
    private void SetInterest(string OrderCode, float Amount)
    {
        PipCoin pc = new PipCoin();
        pc.OrderCode = OrderCode;
        pc.Amount = Amount;//Tổng tiền bid
        pc.Type = 0;//Trạng thái chưa thanh toán
        pc.InterestByDay = pc.Amount / 30;//Tính tiền lãi mỗi ngày
        pc.DateCreate = DateTime.Now;

        PipCoinBLL pcBLL = new PipCoinBLL();
        pcBLL.Insert(pc);
    }
}