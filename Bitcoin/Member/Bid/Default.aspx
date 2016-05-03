<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Member_Bid_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" runat="Server">
    <section id="middle">
        <header id="page-header">
            <h1>Bids</h1>
            <ol class="breadcrumb">
                <li><a href="#">Member</a></li>
                <li class="active">Bid</li>
            </ol>
        </header>
        <div id="content" class="padding-20">
            <div class="row">
                <div class="padding-15">
                    <div class="col-md-6">
                        <button id="btnBid" type="button" class="btn btn-default btn-lg btn-block"
                            data-toggle="modal" data-target="#bidModal">
                            Bid BitCoin</button>
                    </div>
                    <div class="col-md-6">
                        <button type="button" class="btn btn-default btn-lg btn-block">Ask BitCoin</button>
                    </div>
                </div>
            </div>
            <div class="row">
                <asp:Panel ID="pnBidInfo" runat="server">
                    <div class="padding-15">
                        <div class="col-md-6">
                            <div class="alert alert-theme-color margin-bottom-30">
                                <h4>
                                    <strong><asp:Label ID="lblBidID" runat="server" Text=""></asp:Label></strong>
                                </h4>
                                <div>Participant: <asp:Label ID="lblFullName" runat="server" Text="" Font-Bold="True"></asp:Label></div>
                                <div>Amount: <asp:Label ID="lblAmount" runat="server" Text="" Font-Bold="True"></asp:Label></div>
                                <div>Remaining Amount: <asp:Label ID="lblRemainingAmount" runat="server" Text="" Font-Bold="True"></asp:Label></div>
                                <div>Date: <asp:Label ID="lblCreateDate" runat="server" Text="" Font-Bold="True"></asp:Label></div>
                                <div>Status: <asp:Label ID="lblStatus" runat="server" Text="" Font-Italic="True"></asp:Label></div>
                                <div>
                                    <asp:LinkButton ID="lbDeleteBid" runat="server" ForeColor="White" Font-Underline="True" OnClick="lbDeleteBid_Click">Delete Request </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </section>
    <div id="bidModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">COMMITMENT</h4>
                </div>

                <!-- Modal Body -->
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-8">
                            <label>Deposit Amount  ( BitCoint )</label>
                            <asp:TextBox ID="txtDepositAmount" runat="server" class="form-control required" ReadOnly="True"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter deposit amount !"
                            ControlToValidate="txtDepositAmount" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Bid" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <%--<div class="row">
                        <div class="col-md-12">
                            <label>Currency</label>
                            <div class="fancy-form fancy-form-select">
                                <asp:DropDownList ID="ddlCurrency" runat="server" class="form-control">
                                    <asp:ListItem Value="1">BitCoin</asp:ListItem>
                                    <asp:ListItem Value="2">Dollar</asp:ListItem>
                                </asp:DropDownList>
                                <i class="fancy-arrow"></i>
                            </div>
                        </div>
                    </div>--%>
                </div>

                <!-- Modal Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnSave" runat="server" Text="Submit" class="btn btn-primary" OnClick="btnSave_Click" ValidationGroup="Bid"/>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

