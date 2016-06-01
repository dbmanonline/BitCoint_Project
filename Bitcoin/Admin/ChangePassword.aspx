<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Admin_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" runat="Server">
    <section id="middle">
        <header id="page-header">
            <h1>Admin User Management</h1>
            <ol class="breadcrumb">
                <li><a href="Default.aspx">Admin</a></li>
                <li class="active">Change password</li>
            </ol>
        </header>
        <div class="padding-10">
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-transparent">
                            <strong>CHANGE PASSWORD</strong>
                        </div>
                        <div class="panel-body">
                            <fieldset>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <label>Current Password</label>
                                            <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password" CssClass="form-control"
                                                CausesValidation="True" ClientIDMode="Static"></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Current Password is required !" ForeColor="Red" ValidationGroup="ChangePassword" SetFocusOnError="True" Display="Dynamic" ControlToValidate="txtCurrentPassword"></asp:RequiredFieldValidator>--%>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <label>New Password</label>
                                            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="Password is required !"
                                                ValidationGroup="ChangePassword" ControlToValidate="txtNewPassword" SetFocusOnError="True"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ErrorMessage="Password only input from 6 to 50 characters  !"
                                                ControlToValidate="txtNewPassword" SetFocusOnError="True" ValidationGroup="ChangePassword"
                                                Display="Dynamic" ValidationExpression="^[\s\S]{6,50}$"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <label>Re-Password</label>
                                            <asp:TextBox ID="txtRePassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red" ErrorMessage="New password is not match with Re-password !"
                                                ControlToCompare="txtNewPassword" ControlToValidate="txtRePassword" Display="Dynamic"
                                                SetFocusOnError="True" ValidationGroup="ChangePassword"></asp:CompareValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red"
                                                ErrorMessage="Re-Password is required !" ValidationGroup="ChangePassword"
                                                SetFocusOnError="True" Display="Dynamic" ControlToValidate="txtRePassword">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary pull-right" ValidationGroup="ChangePassword" OnClick="btnSave_Click" />
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ctplScript" runat="Server">
</asp:Content>

