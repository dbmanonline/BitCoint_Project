using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.BLL;
using Bitcoin.Data.DTO;

public partial class Member_ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        UserBLL uBLL = new UserBLL();
        var _user = uBLL.GetByEmailID(txtEmail.Text);
        if (_user != null)
        {
            string pass = MD5Password.GetRandomPassword();
            _user.Password = MD5Password.MD5Hash(pass);
            uBLL.UpdatePassword(_user);
            
            var fromAddress = new MailAddress("vongbithegioi@gmail.com", "dobaman");
            var toAddress = new MailAddress(txtEmail.Text, "dobaman");
            string fromPassword = "dlmyhccnpsiqiarb";

            string body = "Mật khẩu mới của bạn là: " + pass;

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword),
                Timeout = 30000
            };
            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = "Forgot Password",
                Body = body,
                IsBodyHtml = true
            })
            {
                smtp.Send(message);
            }

            ltrMsg.Text += @"<div class='alert alert-danger noborder text-center weight-400 nomargin noradius'>
                                Password Sender To Email
                            </div>";
        }
        else
        {
            ltrMsg.Text += @"<div class='alert alert-danger noborder text-center weight-400 nomargin noradius'>
                                Invalid Email!
                            </div>";
        }
    }
}