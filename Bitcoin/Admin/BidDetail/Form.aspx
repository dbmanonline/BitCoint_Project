<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.master" AutoEventWireup="true" CodeFile="Form.aspx.cs" Inherits="Admin_BidDetail_Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" runat="Server">
    <section id="middle">
        <header id="page-header">
            <h1>BID DETAIL</h1>
            <ol class="breadcrumb">
                <li><a href="#">Admin</a></li>
                <li><a href="Default.aspx">Bid Detail</a></li>
                <li class="active">Add New</li>
            </ol>
        </header>
        <div id="content" class="padding-20">
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-transparent">
                            <strong>CREATE GR</strong>
                        </div>
                        <div class="panel-body">
                            <fieldset>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6">
                                            <label>GR Code</label>
                                            <asp:TextBox ID="txtGRCode" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <label>GP Code</label>
                                            <asp:TextBox ID="txtGPCode" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <label>Percentage (%)</label>
                                            <asp:TextBox ID="txtPercentage" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
<%--                                            <asp:DropDownList ID="ddlPercentage" runat="server" class="form-control">
                                                <asp:ListItem Value="">-- Select --</asp:ListItem>
                                                <asp:ListItem Value="BP20">20</asp:ListItem>
                                                <asp:ListItem Value="BP80">80</asp:ListItem>
                                            </asp:DropDownList>--%>
                                        </div>
                                    </div>
                                </div>
                                <%--                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <label>IFSCCode</label>
                                            <asp:TextBox ID="txtIFSCCode" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>--%>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <label>Bank Name</label>
                                            <asp:TextBox ID="txtBankName" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <label>Account Number</label>
                                            <asp:TextBox ID="txtAccountNumber" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <label>Name</label>
                                            <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <label>Branch Name</label>
                                            <asp:TextBox ID="txtBranchName" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <label>BitCoin Address</label>
                                            <asp:TextBox ID="txtBitCoinAddress" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6">
                                            <label class="checkbox">
                                                <asp:CheckBox ID="ckbStatus" runat="server" /> 
                                                <i></i> Approve
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6">
                                            <label>Photo Confirmation</label>
                                            <asp:Image ID="imgConfirm" runat="server" Width="100" Height="100" class="form-control"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <asp:Button ID="btnList" runat="server" Text="List" class="btn btn-default btn-3d" OnClick="btnList_Click" />
                                            <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary btn-3d" OnClick="btnSave_Click" />
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

