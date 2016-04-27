<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="Form.aspx.cs" Inherits="Member_Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" runat="Server">
    <section id="middle">


        <!-- page title -->
        <header id="page-header">
            <h1>Form Validate</h1>
            <ol class="breadcrumb">
                <li><a href="#">Forms</a></li>
                <li class="active">Form Validate</li>
            </ol>
        </header>
        <!-- /page title -->


        <div id="content" class="padding-20">

            <div class="row">

                <div class="col-md-7">

                    <!-- ------ -->
                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-transparent">
                            <strong>FORM VALIDATION</strong>
                        </div>

                        <div class="panel-body">

                            <div class="validate"  data-toastr-position="top-right">
                                <fieldset>
                                    <!-- required [php action request] -->
                                    <input type="hidden" name="action" value="contact_send" />

                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6">
                                                <label>First Name *</label>
                                                <input type="text" name="contact[first_name]" value="" class="form-control required">
                                            </div>
                                            <div class="col-md-6 col-sm-6">
                                                <label>Last Name *</label>
                                                <input type="text" name="contact[last_name]" value="" class="form-control required">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6">
                                                <label>Email *</label>
                                                <input type="email" name="contact[email]" value="" class="form-control required">
                                            </div>
                                            <div class="col-md-6 col-sm-6">
                                                <label>Phone *</label>
                                                <input type="text" name="contact[phone]" value="" class="form-control required">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <label>Position *</label>
                                                <select name="contact[position]" class="form-control pointer required">
                                                    <option value="">--- Select ---</option>
                                                    <option value="Marketing">PR &amp; Marketing</option>
                                                    <option value="Developer">Web Developer</option>
                                                    <option value="php">PHP Programmer</option>
                                                    <option value="Javascript">Javascript Programmer</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6">
                                                <label>Expected Salary *</label>
                                                <input type="text" name="contact[expected_salary]" value="" class="form-control required">
                                            </div>
                                            <div class="col-md-6 col-sm-6">
                                                <label>Start Date *</label>
                                                <input type="text" name="contact[start_date]" value="" class="form-control datepicker required" data-format="yyyy-mm-dd" data-lang="en" data-rtl="false">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <label>Experience *</label>
                                                <textarea name="contact[experience]" rows="4" class="form-control required"></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <label>
                                                    Website
																<small class="text-muted">- optional</small>
                                                </label>
                                                <input type="text" name="contact[website]" placeholder="http://" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                </fieldset>

                                <div class="row">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-3d btn-teal btn-xlg btn-block margin-top-30">
                                            SEND APPLICATION
														<span class="block font-lato">We'll get back to you within 48 hours</span>
                                        </button>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                    <!-- /----- -->

                </div>

                
            </div>

        </div>
    </section>
</asp:Content>

