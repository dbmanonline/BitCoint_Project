<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Member_Bank_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" runat="Server">
    <section id="middle">
        <header id="page-header">
            <h1>Your Bank Infomation</h1>
            <ol class="breadcrumb">
                <li><a href="#">Member</a></li>
                <li class="active">Bitcoin address</li>
            </ol>
        </header>

        <div class="padding-10">
            <div class="panel-body">
                <div>
                    <a data-toggle="modal" data-target=".bs-example-modal-sm" class="btn btn-default btn-3d">Add Your Bitcoin Addresss</a>
                </div>
            </div>
        </div>

        <!-- -List Bitcoin Addresses>-->
        <div class="padding-10">
            <div class="panel-body">
                <div class="table-responsive">
                    <asp:GridView ID="gvBank" runat="server"
                        class="table table-bordered table-vertical-middle nomargin" 
                        AutoGenerateColumns="False"
                        EmptyDataText="You do not have any bank information !" 
                        AllowPaging="True" 
                        OnPageIndexChanging="gvBank_PageIndexChanging" PageSize="1">
                        <Columns>
                            <asp:TemplateField HeaderText="No">
                                <ItemTemplate>
                                    <asp:Label ID="lblSTT" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Account Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccountName" runat="server" Text='<%# Eval("AccountName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField> 
                            <asp:TemplateField HeaderText="Bitcoin Address">
                                <ItemTemplate>
                                    <asp:Label ID="lblBitcoinAddress" runat="server" Text='<%# Eval("BitcoinAddress") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataRowStyle ForeColor="#333" />
                    </asp:GridView>
                    <%--<table class="table table-bordered table-vertical-middle nomargin">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Account Name</th>
                                <th>Bitcoin Address</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>--%>
                </div>
            </div>
        </div>

        <!-- -Add Bitcoin Address Modal >-->
        <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">

                    <!-- header modal -->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="mySmallModalLabel">LINK BITCOIN WALLET</h4>
                    </div>

                    <!-- body modal -->
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-12 col-sm-12">
                                    <label>Account Name *</label>
                                    <asp:TextBox ID="txtAccountName" runat="server" class="form-control required"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-12 col-sm-12">
                                    <label>Bitcoin Address *</label>
                                    <asp:TextBox ID="txtBitcoinAddress" runat="server" class="form-control required"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- footer modal -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary" OnClick="btnSave_Click" />
                    </div>

                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ctplScript" runat="Server">
</asp:Content>

