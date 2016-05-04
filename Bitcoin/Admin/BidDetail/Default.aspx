<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_BidDetail_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" runat="Server">
    <section id="middle">
        <header id="page-header">
            <h1>Management Bid Details</h1>
            <ol class="breadcrumb">
                <li><a href="#">Admin</a></li>
                <li><a href="#">Bid Details</a></li>
                <li class="active">List</li>
            </ol>
        </header>
        <div id="content" class="padding-20">
            <div id="panel-1" class="panel panel-default">
                <div class="panel-heading">
                    <span class="title elipsis">
                        <strong>LIST BID DETAILS</strong>
                        <!-- panel title -->
                    </span>
                </div>

                <!-- panel content -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-vertical-middle nomargin">
                            <thead>
                                <tr>
                                    <th>Img</th>
                                    <th>GP Code</th>
                                    <th>GR Code</th>
                                    <th>Percentage</th>
                                    <th>Name</th>
<%--                                    <th>BitCoin Address</th>--%>
                                    <th>Create Date</th>
                                    <th>Status</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptBidDetails" runat="server" OnItemCommand="rptBidDetails_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Image ID="Image1" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblGPCode" runat="server" Text='<%# Eval("BidCode") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblGRCode" runat="server" Text='<%# Eval("BidDetailCode") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblPercentage" runat="server" Text='<%# Eval("Percentage") %>'></asp:Label>
                                                <span>%</span>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("AccountName") %>'></asp:Label>
                                            </td>
<%--                                            <td>
                                                <asp:Label ID="lblBitCoinAddress" runat="server" Text='<%# Eval("BitCoinAddress") %>'></asp:Label>
                                            </td>--%>
                                            <td>
                                                <asp:Label ID="lblCreateDate" runat="server" Text='<%# Eval("CreateDate", "{0:d MMM, yyyy}") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <span id="spanStatus" runat="server">
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                                </span>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lbtnEdit" runat="server" class="btn btn-default btn-xs" CommandName="Edit"><i class="fa fa-edit white"></i>Edit </asp:LinkButton>
                                                <asp:LinkButton ID="lbtnDelete" runat="server" class="btn btn-default btn-xs" CommandName="Delete"><i class="fa fa-times white"></i>Delete </asp:LinkButton>
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

