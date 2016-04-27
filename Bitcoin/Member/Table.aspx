<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="Table.aspx.cs" Inherits="Member_Table" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" runat="Server">
    <section id="middle">


        <!-- page title -->
        <header id="page-header">
            <h1>Bootstrap Tables</h1>
            <ol class="breadcrumb">
                <li><a href="#">Tables</a></li>
                <li class="active">Bootstrap Tables</li>
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
                        <strong>CLEAN TABLE</strong>
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
                                    <th>Column name</th>
                                    <th>Ratings</th>
                                    <th>Progress</th>
                                    <th>Share</th>
                                    <th>Column name</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="text-center">
                                        <img src="assets/images/male.png" alt="" width="20"></td>
                                    <td>Value 1</td>
                                    <td>
                                        <div class="rating rating-0 size-13 width-100">
                                            <!-- rating-0 ... rating-5 -->
                                        </div>
                                    </td>
                                    <td>
                                        <div class="progress progress-xxs margin-bottom-0">
                                            <div class="progress-bar progress-bar-default" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%; min-width: 2em;">
                                                <span class="sr-only">80% Complete</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <ul class="list-inline nomargin size-12">
                                            <li><a href="#" class="icon-facebook margin-top-6" data-toggle="tooltip" data-placement="top" title="Facebook"></a></li>
                                            <li><a href="#" class="icon-twitter margin-top-6" data-toggle="tooltip" data-placement="top" title="Twitter"></a></li>
                                            <li><a href="#" class="icon-gplus margin-top-6" data-toggle="tooltip" data-placement="top" title="Google Plus"></a></li>
                                            <li><a href="#" class="icon-linkedin margin-top-6" data-toggle="tooltip" data-placement="top" title="Linkedin"></a></li>
                                            <li><a href="#" class="icon-pinterest margin-top-6" data-toggle="tooltip" data-placement="top" title="Pinterest"></a></li>
                                        </ul>
                                    </td>
                                    <td><span class="label label-success">Approved </span></td>
                                </tr>
                                <tr>
                                    <td class="text-center">
                                        <img src="assets/images/female.png" alt="" width="20"></td>
                                    <td>Value 2</td>
                                    <td>
                                        <div class="rating rating-1 size-13 width-100">
                                            <!-- rating-0 ... rating-5 -->
                                        </div>
                                    </td>
                                    <td>
                                        <div class="progress progress-xxs margin-bottom-0">
                                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%; min-width: 2em;">
                                                <span class="sr-only">80% Complete</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <ul class="list-inline nomargin size-12">
                                            <li><a href="#" class="icon-facebook margin-top-6" data-toggle="tooltip" data-placement="top" title="Facebook"></a></li>
                                            <li><a href="#" class="icon-twitter margin-top-6" data-toggle="tooltip" data-placement="top" title="Twitter"></a></li>
                                            <li><a href="#" class="icon-gplus margin-top-6" data-toggle="tooltip" data-placement="top" title="Google Plus"></a></li>
                                            <li><a href="#" class="icon-linkedin margin-top-6" data-toggle="tooltip" data-placement="top" title="Linkedin"></a></li>
                                            <li><a href="#" class="icon-pinterest margin-top-6" data-toggle="tooltip" data-placement="top" title="Pinterest"></a></li>
                                        </ul>
                                    </td>
                                    <td><span class="label label-info">Pending </span></td>
                                </tr>
                                <tr>
                                    <td class="text-center">
                                        <img src="assets/images/female.png" alt="" width="20"></td>
                                    <td>Value 3</td>
                                    <td>
                                        <div class="rating rating-2 size-13 width-100">
                                            <!-- rating-0 ... rating-5 -->
                                        </div>
                                    </td>
                                    <td>
                                        <div class="progress progress-xxs margin-bottom-0">
                                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%; min-width: 2em;">
                                                <span class="sr-only">80% Complete</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <ul class="list-inline nomargin size-12">
                                            <li><a href="#" class="icon-facebook margin-top-6" data-toggle="tooltip" data-placement="top" title="Facebook"></a></li>
                                            <li><a href="#" class="icon-twitter margin-top-6" data-toggle="tooltip" data-placement="top" title="Twitter"></a></li>
                                            <li><a href="#" class="icon-gplus margin-top-6" data-toggle="tooltip" data-placement="top" title="Google Plus"></a></li>
                                            <li><a href="#" class="icon-linkedin margin-top-6" data-toggle="tooltip" data-placement="top" title="Linkedin"></a></li>
                                            <li><a href="#" class="icon-pinterest margin-top-6" data-toggle="tooltip" data-placement="top" title="Pinterest"></a></li>
                                        </ul>
                                    </td>
                                    <td><span class="label label-warning">Suspended </span></td>
                                </tr>
                                <tr>
                                    <td class="text-center">
                                        <img src="assets/images/male.png" alt="" width="20"></td>
                                    <td>Value 4</td>
                                    <td>
                                        <div class="rating rating-3 size-13 width-100">
                                            <!-- rating-0 ... rating-5 -->
                                        </div>
                                    </td>
                                    <td>
                                        <div class="progress progress-xxs margin-bottom-0">
                                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%; min-width: 2em;">
                                                <span class="sr-only">80% Complete</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <ul class="list-inline nomargin size-12">
                                            <li><a href="#" class="icon-facebook margin-top-6" data-toggle="tooltip" data-placement="top" title="Facebook"></a></li>
                                            <li><a href="#" class="icon-twitter margin-top-6" data-toggle="tooltip" data-placement="top" title="Twitter"></a></li>
                                            <li><a href="#" class="icon-gplus margin-top-6" data-toggle="tooltip" data-placement="top" title="Google Plus"></a></li>
                                            <li><a href="#" class="icon-linkedin margin-top-6" data-toggle="tooltip" data-placement="top" title="Linkedin"></a></li>
                                            <li><a href="#" class="icon-pinterest margin-top-6" data-toggle="tooltip" data-placement="top" title="Pinterest"></a></li>
                                        </ul>
                                    </td>
                                    <td><span class="label label-danger">Blocked </span></td>
                                </tr>
                                <tr>
                                    <td class="text-center">
                                        <img src="assets/images/male.png" alt="" width="20"></td>
                                    <td>Value 5</td>
                                    <td>
                                        <div class="rating rating-4 size-13 width-100">
                                            <!-- rating-0 ... rating-5 -->
                                        </div>
                                    </td>
                                    <td>
                                        <div class="progress progress-xxs margin-bottom-0">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%; min-width: 2em;">
                                                <span class="sr-only">80% Complete</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <ul class="list-inline nomargin size-12">
                                            <li><a href="#" class="icon-facebook margin-top-6" data-toggle="tooltip" data-placement="top" title="Facebook"></a></li>
                                            <li><a href="#" class="icon-twitter margin-top-6" data-toggle="tooltip" data-placement="top" title="Twitter"></a></li>
                                            <li><a href="#" class="icon-gplus margin-top-6" data-toggle="tooltip" data-placement="top" title="Google Plus"></a></li>
                                            <li><a href="#" class="icon-linkedin margin-top-6" data-toggle="tooltip" data-placement="top" title="Linkedin"></a></li>
                                            <li><a href="#" class="icon-pinterest margin-top-6" data-toggle="tooltip" data-placement="top" title="Pinterest"></a></li>
                                        </ul>
                                    </td>
                                    <td><span class="label label-primary">N/A </span></td>
                                </tr>
                                <tr>
                                    <td class="text-center">
                                        <img src="assets/images/female.png" alt="" width="20"></td>
                                    <td>Value 6</td>
                                    <td>
                                        <div class="rating rating-5 size-13 width-100">
                                            <!-- rating-0 ... rating-5 -->
                                        </div>
                                    </td>
                                    <td>
                                        <div class="progress progress-xxs margin-bottom-0">
                                            <div class="progress-bar progress-bar-default" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%; min-width: 2em;">
                                                <span class="sr-only">80% Complete</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <ul class="list-inline nomargin size-12">
                                            <li><a href="#" class="icon-facebook margin-top-6" data-toggle="tooltip" data-placement="top" title="Facebook"></a></li>
                                            <li><a href="#" class="icon-twitter margin-top-6" data-toggle="tooltip" data-placement="top" title="Twitter"></a></li>
                                            <li><a href="#" class="icon-gplus margin-top-6" data-toggle="tooltip" data-placement="top" title="Google Plus"></a></li>
                                            <li><a href="#" class="icon-linkedin margin-top-6" data-toggle="tooltip" data-placement="top" title="Linkedin"></a></li>
                                            <li><a href="#" class="icon-pinterest margin-top-6" data-toggle="tooltip" data-placement="top" title="Pinterest"></a></li>
                                        </ul>
                                    </td>
                                    <td>
                                        <a href="#" class="btn btn-default btn-xs"><i class="fa fa-edit white"></i>Edit </a>
                                        <a href="#" class="btn btn-default btn-xs"><i class="fa fa-times white"></i>Delete </a>
                                    </td>
                                </tr>
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

