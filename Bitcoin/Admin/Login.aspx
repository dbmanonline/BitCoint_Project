<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administration</title>

    <!-- mobile settings -->
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />

    <!-- WEB FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&amp;subset=latin,latin-ext,cyrillic,cyrillic-ext" rel="stylesheet" type="text/css" />

    <!-- CORE CSS -->
    <link href="../Member/template/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <!-- THEME CSS -->
    <link href="../Member/template/assets/css/essentials.css" rel="stylesheet" type="text/css" />
    <link href="../Member/template/assets/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="../Member/template/assets/css/color_scheme/green.css" rel="stylesheet" />
</head>
<body>

    <div class="padding-15">

        <div class="login-box">
            <form id="form1" runat="server" class="sky-form boxed">
                <header><i class="fa fa-users"></i>Sign In</header>

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

                <fieldset>

                    <section>
                        <label class="label">Username</label>
                        <label class="input">
                            <i class="icon-append fa fa-envelope"></i>
                            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                            <span class="tooltip tooltip-top-right">Username</span>
                        </label>
                    </section>

                    <section>
                        <label class="label">Password</label>
                        <label class="input">
                            <i class="icon-append fa fa-lock"></i>
                            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                            <b class="tooltip tooltip-top-right">Type your Password</b>
                        </label>
                        <label class="checkbox">
                            <input type="checkbox" name="checkbox-inline" checked=""><i></i>Keep me logged in</label>
                    </section>

                </fieldset>

                <footer>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-primary pull-right" OnClick="btnLogin_Click"/>

                    <%--                        <div class="forgot-password pull-left">
                            <a href="page-password.html">Forgot password?</a>
                            <br>
                            <a href="page-register.html"><b>Need to Register?</b></a>
                        </div>--%>
                </footer>
            </form>
        </div>

    </div>
    <script type="text/javascript">var plugin_path = '../Member/template/assets/plugins/';</script>
    <script type="text/javascript" src="../Member/template/assets/plugins/jquery/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="../Member/template/assets/js/app.js"></script>
</body>
</html>
