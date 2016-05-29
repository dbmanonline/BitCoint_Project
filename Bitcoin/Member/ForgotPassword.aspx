<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="Member_ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <title>Forgot Password</title>
    <meta name="description" content="" />
    <meta name="Author" content="" />

    <!-- mobile settings -->
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />

    <!-- WEB FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&amp;subset=latin,latin-ext,cyrillic,cyrillic-ext" rel="stylesheet" type="text/css" />

    <!-- CORE CSS -->
    <link href="template/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <!-- THEME CSS -->
    <link href="template/assets/css/essentials.css" rel="stylesheet" type="text/css" />
    <link href="template/assets/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="template/assets/css/color_scheme/green.css" rel="stylesheet" type="text/css" id="color_scheme" />

</head>
<body>


    <div class="padding-15">

        <div class="login-box">

            <!-- login form -->
            <form runat="server" class="sky-form boxed">
                <header><i class="fa fa-users"></i>Forgot Password</header>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <!--
					<div class="alert alert-danger noborder text-center weight-400 nomargin noradius">
						Invalid Email or Password!
					</div>

					<div class="alert alert-warning noborder text-center weight-400 nomargin noradius">
						Account Inactive!
					</div>

					<div class="alert alert-default noborder text-center weight-400 nomargin noradius">
						<strong>Too many failures!</strong> <br />
						Please wait: <span class="inlineCountdown" data-seconds="180"></span>
					</div>
					-->
                        <asp:Literal ID="ltrMsg" runat="server"></asp:Literal>
                        <fieldset>

                            <section>
                                <label class="label">E-mail</label>
                                <label class="input">
                                    <i class="icon-append fa fa-envelope"></i>
                                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                    <span class="tooltip tooltip-top-right">Email Address</span>
                                </label>
                            </section>

                        </fieldset>

                        <footer>
                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary pull-right" Text="Submit" OnClick="btnSubmit_Click" />
                            
                        </footer>
                    </ContentTemplate>
                </asp:UpdatePanel>



            </form>
            <!-- /login form -->

        </div>

    </div>

    <!-- JAVASCRIPT FILES -->
    <script type="text/javascript">var plugin_path = 'template/assets/plugins/';</script>
    <script type="text/javascript" src="template/assets/plugins/jquery/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="template/assets/js/app.js"></script>
</body>
</html>
