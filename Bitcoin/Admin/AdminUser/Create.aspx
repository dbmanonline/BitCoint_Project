<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.master" AutoEventWireup="true" CodeFile="Create.aspx.cs" Inherits="Admin_AdminUser_Create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" runat="Server">
    <section id="middle">
        <header id="page-header">
            <h1>Admin User Management</h1>
            <ol class="breadcrumb">
                <li><a href="Default.aspx">Admin User</a></li>
                <li class="active">Add new</li>
            </ol>
        </header>
        <div class="padding-10">
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-transparent">
                            <strong>ADD NEW</strong>
                        </div>
                        <div class="panel-body">
                            <fieldset>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <label>Username</label>
                                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="Username is required !" ControlToValidate="txtUserName" SetFocusOnError="True" ValidationGroup="AddNew" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ErrorMessage="Username only input from 5 to 50 characters !"
                                                ControlToValidate="txtUserName" SetFocusOnError="True" ValidationGroup="AddNew"
                                                Display="Dynamic" ValidationExpression="^[\s\S]{5,50}$"></asp:RegularExpressionValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ForeColor="Red" ErrorMessage="Username only input alphabets and number !"
                                                ControlToValidate="txtUserName" SetFocusOnError="True" ValidationGroup="AddNew"
                                                Display="Dynamic" ValidationExpression="^[A-Za-z][A-Za-z0-9]*$"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <label>Password</label>
                                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="Password is required !"
                                                ValidationGroup="AddNew" ControlToValidate="txtPassword" SetFocusOnError="True"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ErrorMessage="Password only input from 6 to 50 characters  !"
                                                ControlToValidate="txtPassword" SetFocusOnError="True" ValidationGroup="AddNew"
                                                Display="Dynamic" ValidationExpression="^[\s\S]{6,50}$"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>
<%--                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <label>Re-Password</label>
                                            <asp:TextBox ID="txtRePassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red" ControlToCompare="txtPassword"
                                                ControlToValidate="txtRePassword" Display="Dynamic" ErrorMessage="Re-Password and Password not match !"
                                                SetFocusOnError="True" ValidationGroup="AddNew"></asp:CompareValidator>
                                        </div>
                                    </div>
                                </div>--%>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <label>Email</label>
                                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="Email is required !"
                                                ValidationGroup="AddNew" ControlToValidate="txtEmail" SetFocusOnError="True"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ForeColor="Red"
                                                 ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="RegularExpressionValidator" ValidationGroup="AddNew" 
                                                Display="Dynamic" ControlToValidate="txtEmail" SetFocusOnError="True">
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
                                            <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary pull-right" OnClick="btnSave_Click" ValidationGroup="AddNew" />
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

