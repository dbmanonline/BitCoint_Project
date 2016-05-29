using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;
using Bitcoin.Data.DTO;
using System.Web.Services;
using System.Web.Script.Serialization;

public partial class Member_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        ltrMsg.Text = string.Empty;

        if (!chkCheck.Checked)
        {
            ltrMsg.Text = String.Format("<div class='alert alert-warning margin-bottom-30'><strong>Warning!</strong> {0}</div>", "Chọn checkbox");
            return;
        }

        Bitcoin.Data.DTO.User user = new Bitcoin.Data.DTO.User();
        user.SponsorID = txtSponsorID.Text.Trim();
        user.EmailID = txtEmailID.Text.Trim();
        user.Currency = Convert.ToInt32(drdlCurrency.SelectedItem.Value);
        user.MobileNo = txtMobileNo.Text;
        user.FullName = txtFullName.Text;
        user.Country = drdlCountry.SelectedItem.Text;
        user.State = txtState.Text;
        user.City = txtCity.Text;
        user.Password = MD5Password.MD5Hash(txtPassword.Text);
        user.AssociateName = string.Empty;
        user.CreateDate = DateTime.Now;
        user.LevelID = 1;
        user.Status = 1;//Đã kích hoạt
        user.Rate = 15;

        UserBLL userBLL = new UserBLL();
        int result = userBLL.InsertUser(user);

        switch(result)
        {
            case 1:
                userBLL.UpdateUserLevel(user.EmailID);
                break;
            case 9:
                ltrMsg.Text = String.Format("<div class='alert alert-warning margin-bottom-30'><strong>Warning!</strong> {0}</div>", "Email ID already exists.");
                break;
            case 10:
                ltrMsg.Text = String.Format("<div class='alert alert-warning margin-bottom-30'><strong>Warning!</strong> {0}</div>", "Sponsor ID does not exist.");
                break;
        }
    }
    [WebMethod]
    public static string CheckSponsorID(string SponsorID)
    {
        UserBLL userBLL = new UserBLL();
        var users = userBLL.GetByEmailID(SponsorID);
        if (users == null)
            return "";
        return users.FullName;
    }
}