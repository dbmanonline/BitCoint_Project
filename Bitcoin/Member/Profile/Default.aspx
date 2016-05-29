<%@ Page Title="Profile Update" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Member_Profile_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" runat="Server">
    <section id="middle">
        <header id="page-header">
            <h1>Member</h1>
            <ol class="breadcrumb">
                <li><a href="/Member/">Home</a></li>
                <li class="active">Profile Update</li>
            </ol>
        </header>
        <div id="content" class="padding-20">

            <div class="row">

                <div class="col-md-12">

                    <asp:Literal ID="ltrMsg" runat="server"></asp:Literal>

                    <!-- ------ -->
                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-transparent">
                            <strong>General Information</strong>
                        </div>

                        <div class="panel-body">

                            <div class="validate" data-toastr-position="top-right">
                                <fieldset>

                                    <div class="row">

                                        <div class="form-group col-md-4">
                                            <div class="col-md-12 col-sm-12">
                                                <label id="lblNickname">Invite (Nickname in the system)<i></i></label>
                                                <asp:TextBox ID="txtNickname" CssClass="form-control required" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <div class="col-md-12 col-sm-12">
                                                <label id="lblFullName">Full Name<i></i></label>
                                                <asp:TextBox ID="txtFullName" CssClass="form-control required" runat="server"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <div class="col-md-12 col-sm-12">
                                                <label>Email ID</label>
                                                <asp:TextBox ID="txtEmailID" CssClass="form-control required" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <div class="col-md-12 col-sm-12">
                                                <label id="lblCellNo">Cell No<i></i></label>
                                                <asp:TextBox ID="txtCellNo" CssClass="form-control required" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <div class="col-md-12 col-sm-12">
                                                <label id="lblCountry">Country<i></i></label>
                                                <asp:TextBox ID="txtCountry" CssClass="form-control required" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <div class="col-md-12 col-sm-12">
                                                <label id="lblState">State<i></i></label>
                                                <asp:TextBox ID="txtState" CssClass="form-control required" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                </fieldset>

                            </div>

                        </div>

                    </div>
                    <!-- /----- -->


                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-transparent">
                            <strong>Sponsor Details</strong>
                        </div>

                        <div class="panel-body">

                            <div class="validate" data-toastr-position="top-right">
                                <fieldset>

                                    <div class="row">

                                        <div class="form-group col-md-4">
                                            <div class="col-md-12 col-sm-12">
                                                <label id="lblSponsorId">Sponsor Id<i></i></label>
                                                <asp:TextBox ID="txtSponsorId" CssClass="form-control required" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <div class="col-md-12 col-sm-12">
                                                <label id="lblSponsorName">Sponsor Name<i></i></label>
                                                <asp:TextBox ID="txtSponsorName" CssClass="form-control required" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <div class="col-md-12 col-sm-12">
                                                <label>Sponsor Mobile No</label>
                                                <asp:TextBox ID="txtSponsorMobileNo" CssClass="form-control required" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>

                                </fieldset>

                            </div>

                        </div>

                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-transparent">
                            <strong>Manager Details</strong>
                        </div>

                        <div class="panel-body">

                            <div class="validate" data-toastr-position="top-right">
                                <fieldset>

                                    <div class="row">

                                        <div class="form-group col-md-4">
                                            <div class="col-md-12 col-sm-12">
                                                <label id="lblManagerID">Manager ID<i></i></label>
                                                <asp:TextBox ID="txtManagerID" CssClass="form-control required" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <div class="col-md-12 col-sm-12">
                                                <label id="lblManagerName">Manager Name<i></i></label>
                                                <asp:TextBox ID="txtManagerName" CssClass="form-control required" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <div class="col-md-12 col-sm-12">
                                                <label id="lblManagerMobileNo">Manager Mobile No</label>
                                                <asp:TextBox ID="txtManagerMobileNo" CssClass="form-control required" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>

                                </fieldset>

                            </div>

                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <asp:Button ID="btnSubmit" ValidationGroup="Submit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>


            </div>

        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ctplScript" runat="Server">
</asp:Content>

