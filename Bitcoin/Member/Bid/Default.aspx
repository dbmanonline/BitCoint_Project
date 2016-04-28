<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Member_Bid_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" runat="Server">
    <section id="middle">
        <header id="page-header">
            <h1>Bids</h1>
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">Bids</li>
            </ol>
        </header>
        <div id="content" class="padding-20">
            <div class="row">
                <div class="padding-15">
                    <div class="col-md-6">
                        <button id="btnBid" type="button" class="btn btn-default btn-lg btn-block"
                            data-toggle="modal" data-target="#bidModal">
                            Bids BitCoin</button>
                    </div>
                    <div class="col-md-6">
                        <button type="button" class="btn btn-default btn-lg btn-block">Ask BitCoin</button>
                    </div>
                </div>
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
                        <div class="col-md-12">
                            <label>Enter Deposit Amount</label>
                            <asp:TextBox ID="txtDepositAmount" runat="server" class="form-control required"></asp:TextBox>
                        </div>                        
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Currency</label>
                            <div class="fancy-form fancy-form-select">
                                <asp:DropDownList ID="ddlCurrency" runat="server" class="form-control">
                                    <asp:ListItem Value="1">BitCoin</asp:ListItem>
                                </asp:DropDownList>
                                <i class="fancy-arrow"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnSave" runat="server" Text="Submit" class="btn btn-primary" OnClick="btnSave_Click" />
                </div>

            </div>
        </div>
    </div>
</asp:Content>

