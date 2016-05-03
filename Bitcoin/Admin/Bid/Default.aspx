<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Bid_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" runat="Server">
    <section id="middle">
        <header id="page-header">
            <h1>Management Bid</h1>
            <ol class="breadcrumb">
                <li><a href="#">Admin</a></li>
                <li class="active">Bid</li>
            </ol>
        </header>
        <div id="content" class="padding-20">

            <!-- 
						PANEL CLASSES:
							panel-default
							panel-danger
							panel-warning
							panel-info
							panel-success

						INFO: 	panel collapse - stored on user localStorage (handled by app.js _panels() function).
								All pannels should have an unique ID or the panel collapse status will not be stored!
					-->
            <div id="panel-1" class="panel panel-default">
                <div class="panel-heading">
                    <span class="title elipsis">
                        <strong>LIST BIDS</strong>
                        <!-- panel title -->
                    </span>

                    <!-- right options -->
                    <ul class="options pull-right list-inline">
                        <li><a href="#" class="opt panel_colapse" data-toggle="tooltip" title="Colapse" data-placement="bottom"></a></li>
                        <li><a href="#" class="opt panel_fullscreen hidden-xs" data-toggle="tooltip" title="Fullscreen" data-placement="bottom"><i class="fa fa-expand"></i></a></li>
                        <li><a href="#" class="opt panel_close" data-confirm-title="Confirm" data-confirm-message="Are you sure you want to remove this panel?" data-toggle="tooltip" title="Close" data-placement="bottom"><i class="fa fa-times"></i></a></li>
                    </ul>
                    <!-- /right options -->

                </div>

                <!-- panel content -->
                <div class="panel-body">

                    <div class="table-responsive">
                        <table class="table table-bordered table-vertical-middle nomargin">
                            <thead>
                                <tr>
                                    <th class="width-30">Img</th>
                                    <th>Bid Code</th>
                                    <th>Email</th>
                                    <th>Amount</th>
                                    <th>Percentage</th>
                                    <th>Status</th>
                                    <th>Create Date</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptBids" runat="server" OnItemCommand="rptBids_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Image ID="Image1" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblBidCode" runat="server" Text='<%# Eval("BidCode") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("User.EmailID") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblPercentage" runat="server" Text='<%# Eval("Percentage") %>'></asp:Label>
                                                <span>%</span>
                                            </td>
                                            <td> 
                                                <span id="spanStatus" runat="server">
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                                </span>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblCreateDate" runat="server" Text='<%# Eval("CreateDate", "{0:d MMM, yyyy}") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lbtnEdit" runat="server" class="btn btn-default btn-xs" CommandName="Edit"><i class="fa fa-edit white"></i>Edit </asp:LinkButton>
                                                <asp:LinkButton ID="lbtnDelete" runat="server" class="btn btn-default btn-xs"><i class="fa fa-times white"></i>Delete </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>

                </div>
                <!-- /panel content -->

                <!-- panel footer -->
                <div class="panel-footer">
                    <%-- table footer --%>
                </div>
                <!-- /panel footer -->

            </div>
            <!-- /PANEL -->

        </div>

    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ctplScript" runat="Server">
</asp:Content>

