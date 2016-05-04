<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.master" AutoEventWireup="true" CodeFile="Form.aspx.cs" Inherits="Admin_Bid_Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" runat="Server">
    <section id="middle">
        <header id="page-header">
            <h1>BID</h1>
            <ol class="breadcrumb">
                <li><a href="#">Admin</a></li>
                <li><a href="Default.aspx">Bid</a></li>
                <li class="active">Edit</li>
            </ol>
        </header>
        <div id="content" class="padding-20">
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-transparent">
                            <strong>EDIT BID</strong>
                        </div>
                        <div class="panel-body">
                            <fieldset>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <label>Bid Code</label>
                                            <asp:TextBox ID="txtBidCode" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <label>Email</label>
                                            <asp:TextBox ID="txtEmailID" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <label>Amount</label>
                                            <asp:TextBox ID="txtAmount" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <label>Payed %</label>
                                            <asp:TextBox ID="txtPercentage" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <label>Status</label>
                                            <asp:DropDownList ID="dlStatus" runat="server" class="form-control">
                                                <asp:ListItem Value="0">Pending</asp:ListItem>
                                                <asp:ListItem Value="1">Approve</asp:ListItem>
                                                <asp:ListItem Value="2">Close</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <label>Date of Bid</label>
                                            <asp:TextBox ID="txtCreateDate" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6">
                                            <label class="checkbox">
                                                <asp:CheckBox ID="ckb20" runat="server" />
                                                <i></i>Pay 20 %
                                            </label>
                                            <label class="checkbox">
                                                <asp:CheckBox ID="ckb80" runat="server" />
                                                <i></i>Pay 80 %
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <asp:Button ID="btnList" runat="server" Text="List" OnClick="btnList_Click" class="btn btn-default btn-3d" />
                                            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" class="btn btn-primary  btn-3d" />
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

