using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;
using Bitcoin.Data.DTO;

public partial class Member_Profile_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            UserBLL userBLL = new UserBLL();
            var users = userBLL.GetByEmailID(BitcoinSession.LoginMemberEmailID);
            if(users != null)
            {
                txtNickname.Text = users.EmailID;
                txtFullName.Text = users.FullName;
                txtEmailID.Text = users.EmailID;
                txtCellNo.Text = users.MobileNo;
                txtCountry.Text = users.Country;
                txtState.Text = users.State;

                userBLL = new UserBLL();
                var sponsors = userBLL.GetByEmailID(users.SponsorID);
                if(sponsors != null)
                {
                    txtSponsorId.Text = sponsors.EmailID;
                    txtSponsorName.Text = sponsors.FullName;
                    txtSponsorMobileNo.Text = sponsors.MobileNo;

                    userBLL = new UserBLL();
                    var managers = userBLL.GetByEmailID(sponsors.SponsorID);
                    if (managers != null)
                    {
                        txtManagerID.Text = managers.EmailID;
                        txtManagerName.Text = managers.FullName;
                        txtSponsorMobileNo.Text = managers.MobileNo;
                    }
                }
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        UserBLL userBLL = new UserBLL();
        var users = userBLL.GetByEmailID(BitcoinSession.LoginMemberEmailID);

        users.FullName = txtFullName.Text.Trim();
        userBLL.UpdateFullName(users);
    }
}