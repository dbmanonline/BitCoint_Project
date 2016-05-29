<%@ Page Title="My Bonus" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="MyBonus.aspx.cs" Inherits="Member_MyBonus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" Runat="Server">
    <section id="middle">


        <!-- page title -->
        <header id="page-header">
            <h1>Account</h1>
            <ol class="breadcrumb">
                <li><a href="/Member/">Home</a></li>
                <li class="active">My Bonus</li>
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
                        <strong>My Earning</strong>
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
                                    <th>Bonus Date</th>
                                    <th>Remark</th>
                                    <th>Bonus Amount</th>
                                    <th>Type</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptMyBonus" runat="server" OnItemDataBound="rptMyBonus_ItemDataBound">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="text-center"><%# Container.ItemIndex + 1 %></td>
                                            <td><%# Eval("CommissionDate") %></td>
                                            <td>
                                                <asp:Literal ID="ltrSenderId" Text='<%# Eval("FromUserId") %>' runat="server"></asp:Literal></td>
                                            <td><%# Math.Round(Convert.ToDouble(Eval("CommissionPrice")), 3) %></td>
                                            <td></td>
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

