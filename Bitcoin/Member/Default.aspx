<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Member_Default" %>

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
        <div class="padding-10">
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <a href="#" class="btn btn-featured btn-default btn-inverse size-20"
                        data-toggle="modal" data-target=".bs-example-modal-lg">
                        <span>Bid Bitcoin</span>
                        <i class="glyphicon glyphicon-bitcoin"></i>
                    </a>
                </div>
                <div class="col-md-6 col-sm-6">
                    <a href="#" class="btn btn-featured btn-red btn-inverse size-20">
                        <span>Ask Bitcoin</span>
                        <i class="glyphicon glyphicon-bitcoin"></i>
                    </a>
                </div>
            </div>
        </div>

        <!-- bid bitcoin modal -->
        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- header modal -->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="mySmallModalLabel">COMMITEMENT</h4>
                    </div>

                    <!-- body modal -->
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <label >Amount (Bitcoin) *</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-bitcoin"></i></div>
                                        <asp:TextBox ID="txtBitcoinAmount" runat="server" class="form-control" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="" SetFocusOnError="True" ControlToValidate="txtBitcoinAmount" Display="Dynamic" ValidationGroup="SaveBid"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- footer modal -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:Button ID="btnSaveBid" runat="server" Text="Bid" class="btn btn-primary" ValidationGroup="SaveBank" />
                    </div>

                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ctplScript" runat="Server">
</asp:Content>

