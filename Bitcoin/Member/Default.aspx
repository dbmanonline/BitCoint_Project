<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Member_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .list-group-item {
            border: 0;
            padding: 3px 0;
        }

            .list-group-item span {
                font-size: 12px;
            }
    </style>
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
                <div class="col-md-12">
                    <div id="alertError" runat="server" class="alert alert-danger margin-bottom-10">
                        <!-- DANGER -->
                        <button type="button" class="close" data-dismiss="alert">
                            <span aria-hidden="true">×</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <strong>Error!</strong> You already have a pending give help request.
                    </div>
                    <div id="alertSuccess" runat="server" class="alert alert-success margin-bottom-10">
                        <!-- SUCCESS -->
                        <button type="button" class="close" data-dismiss="alert">
                            <span aria-hidden="true">×</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <strong>Success!</strong> Your Bid have been saved successfully.
                    </div>
                </div>
                <div class="col-md-8 col-sm-8">
                    <a href="#" class="btn btn-featured btn-default btn-inverse size-20"
                        data-toggle="modal" data-target=".bs-example-modal-lg">
                        <span>Bid Bitcoin</span>
                        <i class="glyphicon glyphicon-bitcoin"></i>
                    </a>
                </div>
                <div class="col-md-4 col-sm-4">
                    <a href="#" class="btn btn-featured btn-red btn-inverse size-20">
                        <span>Ask Bitcoin</span>
                        <i class="glyphicon glyphicon-bitcoin"></i>
                    </a>
                </div>
            </div>
        </div>

        <div class="padding-10">
            <div class="row">
                <div class="col-md-8">
                </div>
                <div class="col-md-4">
                    <asp:Repeater ID="rptBid" runat="server" OnItemDataBound="rptBid_ItemDataBound">
                        <ItemTemplate>
                            <div id="panel-misc-portlet-r1" class="panel panel-default">

                                <div class="panel-heading">

                                    <span class="elipsis">
                                        <!-- panel title -->
                                        <strong>Give Help (
                                            <asp:Label ID="lblBidCode" runat="server" Text='<%# Eval("BidCode") %>'></asp:Label>
                                            )</strong>
                                    </span>

                                    <!-- right options -->
                                    <ul class="options pull-right list-inline">
                                        <li><a href="#" class="opt panel_colapse" data-toggle="tooltip" title="" data-placement="bottom" data-original-title="Colapse"></a></li>
                                    </ul>
                                    <!-- /right options -->

                                </div>

                                <!-- panel content -->
                                <div class="panel-body" style="display: block;">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <ul class="list-group">
                                                <li class="list-group-item"><span class="bold">PARTICIPANT : </span><span>
                                                    <asp:Label ID="lblAssociateName" runat="server" Text='<%# Eval("User.AssociateName") %>'></asp:Label></span></li>
                                                <li class="list-group-item"><span class="bold">TOTAL BITCOIN : </span><span>
                                                    <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("Amount") %>'></asp:Label></span></li>
                                                <li class="list-group-item"><span class="bold">REMAINING BITCOIN : </span><span>
                                                    <asp:Label ID="lblRemainingAmount" runat="server" Text='<%# Eval("Percentage") %>'></asp:Label></span></li>
                                                <li class="list-group-item"><span class="bold">DATE : </span><span>
                                                    <asp:Label ID="lblCreateDate" runat="server" Text='<%# Eval("CreateDate", "{0:MM/dd/yyyy}") %>'></asp:Label></span></li>
                                                <li class="list-group-item"><span class="bold">STATUS : </span><span id="spanStatus" runat="server">
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label></span></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- /panel content -->

                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
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
                                    <label>Amount (Bitcoin) *</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-bitcoin"></i></div>
                                        <asp:TextBox ID="txtBitcoinAmount" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="" SetFocusOnError="True" ControlToValidate="txtBitcoinAmount" Display="Dynamic" ValidationGroup="SaveBid"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- footer modal -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:Button ID="btnSaveBid" runat="server" Text="Send Request" class="btn btn-primary" ValidationGroup="SaveBank" OnClick="btnSaveBid_Click" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ctplScript" runat="Server">
</asp:Content>

