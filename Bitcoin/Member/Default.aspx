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
                <div class="col-md-8 col-sm-8">
                    <asp:LinkButton ID="lbBidBitcoin" runat="server" class="btn btn-featured btn-default btn-inverse size-20" OnClick="lbBidBitcoin_Click"><span>Bid Bitcoin</span>
                        <i class="glyphicon glyphicon-bitcoin"></i></asp:LinkButton>
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
                    <asp:Repeater ID="rptAsk" runat="server">
                        <ItemTemplate>
                            <div id="panel-misc-portlet-r1" class="panel panel-default">
                                <div class="panel-heading">
                                    <span class="elipsis">
                                        <!-- panel title -->
                                        <strong>Give Help (
                                            <asp:Label ID="lblGHCode" runat="server" Text='<%# Eval("OrderDetailCode") %>'></asp:Label>
                                            )</strong>
                                    </span>
                                    <span>
                                        <asp:LinkButton ID="lbtnShowOrderDetail" runat="server" class="label label-default" OnClick="lbtnShowOrderDetail_Click">Show details</asp:LinkButton>
                                    </span>
                                    <!-- right options -->
                                    <ul class="options pull-right list-inline">
                                        <li><a href="#" class="opt panel_colapse" data-toggle="tooltip" title="" data-placement="bottom" data-original-title="Colapse"></a></li>
                                    </ul>
                                    <!-- /right options -->
                                </div>
                                <!-- panel content -->
                                <div class="panel-body" style="display: block;">
                                    <div class="row size-12">
                                        <div class="col-md-1">
                                            <i class="fa fa-play-circle fa-2x"></i>
                                        </div>
                                        <div class="col-md-2">
                                            <asp:Label ID="lblSendDate" runat="server" Text="15 May 2016"></asp:Label>
                                        </div>
                                        <div class="col-md-2">
                                            You
                                        </div>
                                        <div class="col-md-3 bold" style="color: green">
                                            >
                                                <asp:Label ID="lblSendAmount" runat="server" Text="0.1 Bitcoin"></asp:Label>
                                            >
                                        </div>
                                        <div class="col-md-2">
                                            <asp:Label ID="lblReceiverId" runat="server" Text="Arena Lala"></asp:Label>
                                        </div>
                                        <div class="col-md-2">
                                            <asp:LinkButton ID="lbtnSendMessage" runat="server" class="label label-primary">Message <span>0</span></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!-- /panel content -->
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="col-md-4">
                    <asp:Repeater ID="rptBid" runat="server" OnItemDataBound="rptBid_ItemDataBound">
                        <ItemTemplate>
                            <div id="panel-misc-portlet-r1" class="panel panel-default">

                                <div class="panel-heading">

                                    <span class="elipsis">
                                        <!-- panel title -->
                                        <strong>Provide Help (
                                            <asp:Label ID="lblBidCode" runat="server" Text='<%# Eval("OrderCode") %>'></asp:Label>
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
                                                    <asp:Label ID="lblRemainingAmount" runat="server" Text='<%# Eval("RemainingAmount") %>'></asp:Label></span></li>
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
        <div id="bidModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
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
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Default Amount Bitcoin</label>
                                </div>
                                <div class="form-inline">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-bitcoin"></i></div>
                                            <asp:TextBox ID="txtBitcoinAmount" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                    <asp:Button ID="btnSaveBid" runat="server" Text="Send" class="btn btn-success" OnClick="btnSaveBid_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <h4>Please, Read the information !</h4>
                                <p>We also have some new extensions available for you to try out. We are excited to announce that starting with this build, both AdBlock and Adblock Plus are now available for download in the Windows Store in addition to Pin It Button, Mouse Gestures, Reddit Enhancement Suite, Microsoft Translator, and OneNote Web Clipper. It is recommended that you only install one of either AdBlock or Adblock Plus as having them both running at the same time can cause issues with viewing websites in Microsoft Edge.</p>
                                <p><em>Important note: There is a bug in this build that occurs if you turn off all extensions without uninstalling them, you may not be able to close the browser or get context menus to work. To avoid this issue, uninstall any extensions you no longer want to use instead of turning them off. If you do hit this issue, to get out of this state you will need to turn on one or more extensions or uninstall all extensions, kill any Microsoft Edge processes running in Task Manager, and restart Microsoft Edge.</em></p>
                                <p><strong>Real-time web notifications in Microsoft Edge:</strong> Microsoft Edge now supports real-time web notifications, which allow participating websites to send notifications to you via Action Center, with your permission. For example, when your friend sends you a message on <a href="https://web.skype.com/"><strong>Skype for Web</strong></a> while you’re busy in the Xbox app, you won’t miss a thing. A notification from the website will appear in Windows, just like an app might send. Click on the notification and you’ll be right back in Microsoft Edge at the site that sent it!</p>
                            </div>
                        </div>
                    </div>

                    <!-- footer modal -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

        <!-- order detail modal -->
        <div id="orderDetailModal" class="modal fade bs-example-modal-default" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-default">
                <div class="modal-content">

                    <!-- header modal -->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Order Detail</h4>
                    </div>

                    <!-- body modal -->
                    <div class="modal-body">
                        <div class="row text-center">
                            <div class="col-md-12">
                                <label class="size-18">Bitcoin Address</label>
                            </div>
                            <div class="col-md-12">
                                <asp:TextBox ID="txtBitcoinAddress" runat="server" class="form-control" Text="fs8124hjkvkhv9283yrbvxcvbi23419cvc923830czxfj38923czs" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <td colspan="2" class="bold text-center">RECEPIENT</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Recepient</td>
                                            <td>Klose</td>
                                        </tr>
                                        <tr>
                                            <td>Country</td>
                                            <td>Korea</td>
                                        </tr>
                                        <tr>
                                            <td>Mobile No</td>
                                            <td>38976245879</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-6">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <td colspan="2" class="bold text-center">SENDER</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Sender</td>
                                            <td>Kabu</td>
                                        </tr>
                                        <tr>
                                            <td>Country</td>
                                            <td>Cambodia</td>
                                        </tr>
                                        <tr>
                                            <td>Mobile No</td>
                                            <td>2579456587</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Attach photo</label>
                                <asp:FileUpload ID="fuPhoto" runat="server" class="custom-file-upload" data-btn-text="Select a File" />
                                <small class="text-muted block">Max file size: 1Mb (jpeg/jpg/png)</small>
                            </div>
                        </div>
                    </div>

                    <!-- footer modal -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:Button ID="btnCompletePayment" runat="server" Text="I complete this payment" class="btn btn-success" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Alert Modals >-->
        <div id="alertErrorModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="alert alert-danger margin-bottom-30">
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">×</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <strong>Error!</strong> You already have a pending provide help request.
                    </div>
                </div>
            </div>
        </div>
        <div id="alertSuccessModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="alert alert-success margin-bottom-30">
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">×</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <strong>Success!</strong> Your Bid have been saved successfully.
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ctplScript" runat="Server">
    <script src="template/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function ShowAlertError() {
            $('#alertErrorModal').modal('show');
        };
        function ShowAlertSuccess() {
            $('#alertSuccessModal').modal('show');
        };
        function ShowBid() {
            $('#bidModal').modal('show');
        };
        function ShowOrderDetail() {
            $('#orderDetailModal').modal('show');
        };
    </script>
</asp:Content>

