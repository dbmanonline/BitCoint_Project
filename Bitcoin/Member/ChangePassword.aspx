<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Member_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" runat="Server">
    <section id="middle">


        <!-- page title -->
        <header id="page-header">
            <h1>Change Password</h1>
            <ol class="breadcrumb">
                <li><a href="/">Home</a></li>
                <li class="active">Change Password</li>
            </ol>
        </header>
        <!-- /page title -->


        <div id="content" class="padding-20">

            <div class="row">

                <div class="col-md-5">
                    <asp:Literal ID="ltrMsg" runat="server"></asp:Literal>

                    <!-- ------ -->
                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-transparent">
                            <strong>Change Password</strong>
                        </div>

                        <div class="panel-body">

                            <div class="validate" data-toastr-position="top-right">
                                <fieldset>

                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <label>Old Password *</label>
                                                <asp:TextBox ID="txtOldPass" TextMode="Password" runat="server" CssClass="form-control required"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvOldPass" runat="server" ControlToValidate="txtOldPass" Display="Dynamic" ValidationGroup="Submit" ErrorMessage="Required Field" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <label>New Password *</label>
                                                <asp:TextBox ID="txtNewPass" TextMode="Password" runat="server" CssClass="form-control required"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvNewPass" runat="server" ControlToValidate="txtNewPass" Display="Dynamic" ValidationGroup="Submit" ErrorMessage="<p>Required Field</p>" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="revNewPass" runat="server"
                                                    ErrorMessage="Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character"
                                                    ControlToValidate="txtNewPass"
                                                    ValidationGroup="Submit"
                                                    Display="Dynamic"
                                                    SetFocusOnError="true"
                                                    ForeColor="Red"
                                                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <label>Confirm Password *</label>
                                                <asp:TextBox ID="txtConfirmPass" TextMode="Password" runat="server" CssClass="form-control required"></asp:TextBox>
                                                <asp:CompareValidator ID="cvConfirmPass"
                                                    runat="server"
                                                    ControlToCompare="txtNewPass"
                                                    ControlToValidate="txtConfirmPass"
                                                    ErrorMessage="Your passwords do not match up!"
                                                    ValidationGroup="Submit"
                                                    Display="Dynamic"
                                                    SetFocusOnError="true"
                                                    ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                </fieldset>

                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit" ValidationGroup="Submit" CssClass="btn btn-3d btn-teal btn-xlg btn-block margin-top-30" runat="server" Text="Change Password" OnClick="btnSubmit_Click" />
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                    <!-- /----- -->

                </div>


            </div>

        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ctplScript" runat="Server">
</asp:Content>

