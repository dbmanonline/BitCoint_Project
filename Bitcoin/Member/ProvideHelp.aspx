<%@ Page Title="PipCoins" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="ProvideHelp.aspx.cs" Inherits="Member_ProvideHelp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" Runat="Server">
    <section id="middle">


        <!-- page title -->
        <header id="page-header">
            <h1>PipCoins</h1>
            <ol class="breadcrumb">
                <li><a href="/Member/">Home</a></li>
                <li class="active">PipCoins</li>
            </ol>
        </header>
        <!-- /page title -->


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
                        <strong>PipCoins</strong>
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
                                    <th class="width-30">SR#</th>
                                    <th>Order ID</th>
                                    <th>Date of Creating</th>
                                    <th>Provide Amount</th>
                                    <th>Confirm Amount</th>
                                    <th>Available For Get Amount</th>
                                    <th>Type</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptPipCoins" runat="server" OnItemDataBound="rptPipCoins_ItemDataBound">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="text-center"><%# Container.ItemIndex + 1 %></td>
                                            <td><%# Eval("OrderCode", "PH{0}") %></td>
                                            <td><%# Eval("DateCreate") %></td>
                                            <td><%# Eval("Amount") %></td>
                                            <td><%# Eval("Order.RemainingAmount") %></td>
                                            <td><%# Eval("InterestByDay") %></td>
                                            <td>
                                                <asp:Literal ID="ltrType" Text='<%# Eval("Order.Status") %>' runat="server"></asp:Literal>
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
<asp:Content ID="Content3" ContentPlaceHolderID="ctplScript" Runat="Server">
</asp:Content>

