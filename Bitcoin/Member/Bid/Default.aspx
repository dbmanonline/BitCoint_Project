﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Member_Bid_Default" %>

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
                                    <strong>
                                        <asp:Label ID="lblBidID" runat="server" Text=""></asp:Label></strong>
                                </h4>
                                <div>
                                    Participant:
                                    <asp:Label ID="lblFullName" runat="server" Text="" Font-Bold="True"></asp:Label>
                                </div>
                                <div>
                                    Amount:
                                    <asp:Label ID="lblAmount" runat="server" Text="" Font-Bold="True"></asp:Label>
                                </div>
                                <div>
                                    Remaining Amount:
                                    <asp:Label ID="lblRemainingAmount" runat="server" Text="" Font-Bold="True"></asp:Label>
                                </div>
                                <div>
                                    Date:
                                    <asp:Label ID="lblCreateDate" runat="server" Text="" Font-Bold="True"></asp:Label>
                                </div>
                                <div>
                                    Status:
                                    <asp:Label ID="lblStatus" runat="server" Text="" Font-Italic="True"></asp:Label>
                                </div>
                                <div>
                                    <asp:LinkButton ID="lbDeleteBid" runat="server" ForeColor="White" Font-Underline="True" OnClick="lbDeleteBid_Click">Delete Request </asp:LinkButton>
                                    << >>
                                    <asp:LinkButton ID="lbViewDetail" runat="server" ForeColor="#FF9900" Font-Underline="True" data-toggle="modal" data-target="#bidDetailModal">View Details</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Repeater ID="rptBidDetail" runat="server">
                                <ItemTemplate>
                                    <div class="alert alert-dark margin-bottom-30">
                                        <!-- DARK -->
                                        <h4><strong>
                                            <asp:Label ID="lblGRCode" runat="server" Text='<%# Eval("BidDetails.BidDetailCode") %>'></asp:Label></strong></h4>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

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
                        <div class="col-md-9">
                            <label>Deposit Amount  ( BitCoint )</label>
                            <asp:TextBox ID="txtDepositAmount" runat="server" class="form-control required" ReadOnly="True"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter deposit amount !"
                                ControlToValidate="txtDepositAmount" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Bid" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <!-- Modal Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnSave" runat="server" Text="Submit" class="btn btn-primary" OnClick="btnSave_Click" ValidationGroup="Bid" />
                </div>

            </div>
        </div>
    </div>

    <div id="bidDetailModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Bid Detail</h4>
                </div>

                <!-- Modal Body -->
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive nomargin">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="col-md-3">Order </td>
                                            <td>
                                                <asp:Label ID="lblGRCode" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>Bank Name </td>
                                            <td>
                                                <asp:Label ID="lblBankName" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>Account Number </td>
                                            <td>
                                                <asp:Label ID="lblAccountNumber" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>Name </td>
                                            <td>
                                                <asp:Label ID="lblName" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>Branch Name </td>
                                            <td>
                                                <asp:Label ID="lblBranchName" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>BitCoin Address </td>
                                            <td>
                                                <asp:Label ID="lblBitCoinAddress" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr id="trConfirm" runat="server">
                                            <td>Attach Photo </td>
                                            <td>
                                                <asp:FileUpload ID="fuPhotoConfirmation" runat="server" class="custom-file-upload" data-btn-text="Select a File" />
                                                <%--<input class="custom-file-upload" type="file" id="file" name="contact[attachment]" id="contact:attachment" data-btn-text="Select a File" />--%>
                                                <small class="text-muted block">Max file size: 2Mb (pdf/jpg/png)</small></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Footer -->
                <div class="modal-footer">
                    <asp:Button ID="btnSavePhoto" runat="server" Text="Save Photo" class="btn btn-primary" OnClick="btnSavePhoto_Click" />
                </div>

            </div>
        </div>
    </div>
</asp:Content>

