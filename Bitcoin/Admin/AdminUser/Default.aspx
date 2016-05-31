<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_AdminUser_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" runat="Server">
    <section id="middle">
        <header id="page-header">
            <h1>Admin User Management</h1>
            <ol class="breadcrumb">
                <li><a href="Default.aspx">Admin User</a></li>
                <li class="active">List</li>
            </ol>
        </header>
        <div class="padding-15">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="title elipsis">
                        <strong>Admin User List</strong>
                        <!-- panel title -->
                    </span>
                    <ul class="options pull-right list-inline">
                        <li><a href="#" class="opt panel_colapse" data-toggle="tooltip" title="" data-placement="bottom" data-original-title="Colapse"></a></li>
                        <li><a href="#" class="opt panel_fullscreen hidden-xs" data-toggle="tooltip" title="" data-placement="bottom" data-original-title="Fullscreen"><i class="fa fa-expand"></i></a></li>
                    </ul>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-striped table-bordered table-hover" id="datatable_sample">
                                <thead>
                                    <tr>
                                        <th>Username</th>
                                        <th>Email</th>
                                        <th>Active</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rptAdminUser" runat="server" OnItemCommand="rptAdminUser_ItemCommand">
                                        <ItemTemplate>
                                            <tr class="odd gradeX">
                                                <td>
                                                    <asp:Label ID="txtUsername" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="txtEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="chkbActive" runat="server" Checked='<%# Eval("Active") %>' />
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" class="btn btn-primary btn-xs" />
                                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" class="btn btn-danger btn-xs" onClientClick=" return confirm('Are you sure want to delete this user ?')"/>
                                                    <asp:HiddenField ID="hfAdminUserId" runat="server" Value='<%# Eval("Id") %>' />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ctplScript" runat="Server">
    <!-- CSS DATATABLE -->
    <link href="../../Member/template/assets/css/layout-datatables.css" rel="stylesheet" />

    <script type="text/javascript">
        loadScript(plugin_path + "datatables/js/jquery.dataTables.min.js", function () {
            loadScript(plugin_path + "datatables/dataTables.bootstrap.js", function () {

                if (jQuery().dataTable) {

                    var table = jQuery("#datatable_sample");

                    table.dataTable({
                        "columns": [{
                            "orderable": true
                        }, {
                            "orderable": true
                        }, {
                            "orderable": false
                        }, {
                            "orderable": false
                        }],
                        "lengthMenu": [
                            [5, 15, 20, -1],
                            [5, 15, 20, "All"] // change per page values here
                        ],
                        // set the initial value
                        "pageLength": 5,
                        "pagingType": "bootstrap_full_number",
                        "language": {
                            "lengthMenu": "  _MENU_ records",
                            "paginate": {
                                "previous": "Prev",
                                "next": "Next",
                                "last": "Last",
                                "first": "First"
                            }
                        },
                        "columnDefs": [{  // set default column settings
                            'orderable': false,
                            'targets': [0]
                        }, {
                            "searchable": true
                            //"targets": [0]
                        }],
                        "order": [
                            [1, "asc"]
                        ] // set first column as a default sort by asc
                    });

                    var tableWrapper = jQuery('#datatable_sample_wrapper');
                    tableWrapper.find('.dataTables_length select').addClass("form-control input-xsmall input-inline"); // modify table per page dropdown
                }

            });
        });
    </script>
</asp:Content>

