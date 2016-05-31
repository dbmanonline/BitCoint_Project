<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Admin_AdminUser_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" Runat="Server">
    <section id="middle">
        <header id="page-header">
            <h1>Admin User Management</h1>
            <ol class="breadcrumb">
                <li><a href="Default.aspx">Admin User</a></li>
                <li class="active">Edit</li>
            </ol>
        </header>
        <div class="padding-10">
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-transparent">
                            <strong>Edit</strong>
                        </div>
                        <div class="panel-body">
                            <fieldset>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <label>Username</label>
                                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <label>Password</label>
                                            <asp:TextBox ID="txtPassword" runat="server"  CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="Password is required !"
                                                ValidationGroup="SaveAdminUser" ControlToValidate="txtPassword" SetFocusOnError="True"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ErrorMessage="Password only input from 6 to 50 characters  !"
                                                ControlToValidate="txtPassword" SetFocusOnError="True" ValidationGroup="SaveAdminUser"
                                                Display="Dynamic" ValidationExpression="^[\s\S]{6,50}$"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <label>Email</label>
                                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="Email is required !"
                                                ValidationGroup="SaveAdminUser" ControlToValidate="txtEmail" SetFocusOnError="True"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red"
                                                 ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="RegularExpressionValidator" ValidationGroup="SaveAdminUser" Display="Dynamic" ControlToValidate="txtEmail" SetFocusOnError="True">
                                            </asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <label>Full name</label>
                                            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <label class="checkbox">
                                                <asp:CheckBox ID="chkbActive" runat="server" />
                                                <i></i>Active
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary pull-right" ValidationGroup="SaveAdminUser" OnClick="btnUpdate_Click" />
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
<asp:Content ID="Content3" ContentPlaceHolderID="ctplScript" Runat="Server">
</asp:Content>

