<%@ Page Title="New Registration" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Member_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctplContent" runat="Server">
    <section id="middle">


        <!-- page title -->
        <header id="page-header">
            <h1>Member Registration Form</h1>
            <ol class="breadcrumb">
                <li><a href="/Member/">Home</a></li>
                <li class="active">New Registration</li>
            </ol>
        </header>
        <!-- /page title -->


        <div id="content" class="padding-20">

            <div class="row">

                <div class="col-md-7">

                    <asp:Literal ID="ltrMsg" runat="server"></asp:Literal>

                    <!-- ------ -->
                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-transparent">
                            <strong>Sponsor Detail</strong>
                        </div>

                        <div class="panel-body">

                            <div class="validate" data-toastr-position="top-right">
                                <fieldset>

                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <label id="lblSponsorID">Sponsor ID * <i></i></label>
                                                <asp:TextBox ID="txtSponsorID" CssClass="form-control required" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvSponsorID" runat="server" ControlToValidate="txtSponsorID" Display="Dynamic" ValidationGroup="Submit" ErrorMessage="<p>Required Field</p>" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <label>Email ID *</label>
                                                <asp:TextBox ID="txtEmailID" CssClass="form-control required" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvEmailID" runat="server" ControlToValidate="txtEmailID" Display="Dynamic" ValidationGroup="Submit" ErrorMessage="<p>Required Field</p>" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="revEmailID" runat="server" ControlToValidate="txtEmailID" Display="Dynamic" ValidationGroup="Submit" ErrorMessage="<p>Invalid email address</p>" ForeColor="Red" SetFocusOnError="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                    </div>

                                </fieldset>

                            </div>

                        </div>

                    </div>
                    <!-- /----- -->

                    <!-- ------ -->
                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-transparent">
                            <strong>Verification</strong>
                        </div>

                        <div class="panel-body">

                            <div class="validate" data-toastr-position="top-right">
                                <fieldset>

                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <label>Select Currency *</label>
                                                <asp:DropDownList ID="drdlCurrency" CssClass="form-control pointer required" runat="server">
                                                    <asp:ListItem Value="1">Bitcoin</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <label>Mobile No: * (Ex- +011 63 862 7569)</label>
                                                <asp:TextBox ID="txtMobileNo" CssClass="form-control required" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvMobileNo" runat="server" ControlToValidate="txtMobileNo" Display="Dynamic" ValidationGroup="Submit" ErrorMessage="<p>Required Field</p>" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                </fieldset>

                            </div>

                        </div>

                    </div>
                    <!-- /----- -->

                    <!-- ------ -->
                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-transparent">
                            <strong>Information</strong>
                        </div>

                        <div class="panel-body">

                            <div class="validate" data-toastr-position="top-right">
                                <fieldset>

                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <label>Member Full Name *</label>
                                                <asp:TextBox ID="txtFullName" CssClass="form-control required" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" Display="Dynamic" ValidationGroup="Submit" ErrorMessage="<p>Required Field</p>" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <label>Country *</label>
                                                <asp:DropDownList ID="drdlCountry" CssClass="form-control pointer required" runat="server">
                                                    <asp:ListItem Value="+93">Afghanistan</asp:ListItem>
                                                    <asp:ListItem Value="+355">Albania</asp:ListItem>
                                                    <asp:ListItem Value="+213">Algeria</asp:ListItem>
                                                    <asp:ListItem Value="+684">American Samoa</asp:ListItem>
                                                    <asp:ListItem Value="+376">Andorra</asp:ListItem>
                                                    <asp:ListItem Value="+244">Angola</asp:ListItem>
                                                    <asp:ListItem Value="+1264">Anguilla</asp:ListItem>
                                                    <asp:ListItem Value="+672">Antarctica</asp:ListItem>
                                                    <asp:ListItem Value="+1268">Antigua</asp:ListItem>
                                                    <asp:ListItem Value="+54">Argentina</asp:ListItem>
                                                    <asp:ListItem Value="+374">Armenia</asp:ListItem>
                                                    <asp:ListItem Value="+297">Aruba</asp:ListItem>
                                                    <asp:ListItem Value="+247">Ascension</asp:ListItem>
                                                    <asp:ListItem Value="+61">Australia</asp:ListItem>
                                                    <asp:ListItem Value="+43">Austria</asp:ListItem>
                                                    <asp:ListItem Value="+994">Azerbaijan</asp:ListItem>
                                                    <asp:ListItem Value="+1242">Bahamas</asp:ListItem>
                                                    <asp:ListItem Value="+973">Bahrain</asp:ListItem>
                                                    <asp:ListItem Value="+880">Bangladesh</asp:ListItem>
                                                    <asp:ListItem Value="+1246">Barbados</asp:ListItem>
                                                    <asp:ListItem Value="+1268">Barbuda</asp:ListItem>
                                                    <asp:ListItem Value="+375">Belarus</asp:ListItem>
                                                    <asp:ListItem Value="+32">Belgium</asp:ListItem>
                                                    <asp:ListItem Value="+501">Belize</asp:ListItem>
                                                    <asp:ListItem Value="+229">Benin</asp:ListItem>
                                                    <asp:ListItem Value="+1441">Bermuda</asp:ListItem>
                                                    <asp:ListItem Value="+975">Bhutan</asp:ListItem>
                                                    <asp:ListItem Value="+591">Bolivia</asp:ListItem>
                                                    <asp:ListItem Value="+267">Botswana</asp:ListItem>
                                                    <asp:ListItem Value="+55">Brazil</asp:ListItem>
                                                    <asp:ListItem Value="+1284">British Virgin Islands</asp:ListItem>
                                                    <asp:ListItem Value="+673">Brunei Darussalam</asp:ListItem>
                                                    <asp:ListItem Value="+359">Bulgaria</asp:ListItem>
                                                    <asp:ListItem Value="+226">Burkina Faso</asp:ListItem>
                                                    <asp:ListItem Value="+257">Burundi</asp:ListItem>
                                                    <asp:ListItem Value="+855">Cambodia</asp:ListItem>
                                                    <asp:ListItem Value="+237">Cameroon</asp:ListItem>
                                                    <asp:ListItem Value="+124432">Canada</asp:ListItem>
                                                    <asp:ListItem Value="+238">Cape Verde Islands</asp:ListItem>
                                                    <asp:ListItem Value="+1345">Cayman Islands</asp:ListItem>
                                                    <asp:ListItem Value="+236">Central African Republic</asp:ListItem>
                                                    <asp:ListItem Value="+235">Chad</asp:ListItem>
                                                    <asp:ListItem Value="+56">Chile</asp:ListItem>
                                                    <asp:ListItem Value="+86">China</asp:ListItem>
                                                    <asp:ListItem Value="+57">Colombia</asp:ListItem>
                                                    <asp:ListItem Value="+269">Comoros</asp:ListItem>
                                                    <asp:ListItem Value="+242">Congo</asp:ListItem>
                                                    <asp:ListItem Value="+682">Cook Islands</asp:ListItem>
                                                    <asp:ListItem Value="+506">Costa Rica</asp:ListItem>
                                                    <asp:ListItem Value="+385">Croatia</asp:ListItem>
                                                    <asp:ListItem Value="+53">Cuba</asp:ListItem>
                                                    <asp:ListItem Value="+599">Curaçao</asp:ListItem>
                                                    <asp:ListItem Value="+357">Cyprus</asp:ListItem>
                                                    <asp:ListItem Value="+420">Czech Republic</asp:ListItem>
                                                    <asp:ListItem Value="+45">Denmark</asp:ListItem>
                                                    <asp:ListItem Value="+246">Diego Garcia</asp:ListItem>
                                                    <asp:ListItem Value="+253">Djibouti</asp:ListItem>
                                                    <asp:ListItem Value="+1767">Dominica</asp:ListItem>
                                                    <asp:ListItem Value="+670">East Timor</asp:ListItem>
                                                    <asp:ListItem Value="+56">Easter Island</asp:ListItem>
                                                    <asp:ListItem Value="+593">Ecuador</asp:ListItem>
                                                    <asp:ListItem Value="+20">Egypt</asp:ListItem>
                                                    <asp:ListItem Value="+503">El Salvador</asp:ListItem>
                                                    <asp:ListItem Value="+240">Equatorial Guinea</asp:ListItem>
                                                    <asp:ListItem Value="+291">Eritrea</asp:ListItem>
                                                    <asp:ListItem Value="+372">Estonia</asp:ListItem>
                                                    <asp:ListItem Value="+251">Ethiopia</asp:ListItem>
                                                    <asp:ListItem Value="+298">Faroe Islands</asp:ListItem>
                                                    <asp:ListItem Value="+679">Fiji Islands</asp:ListItem>
                                                    <asp:ListItem Value="+358">Finland</asp:ListItem>
                                                    <asp:ListItem Value="+33">France</asp:ListItem>
                                                    <asp:ListItem Value="+596">French Antilles</asp:ListItem>
                                                    <asp:ListItem Value="+594">French Guiana</asp:ListItem>
                                                    <asp:ListItem Value="+689">French Polynesia</asp:ListItem>
                                                    <asp:ListItem Value="+241">Gabonese Republic</asp:ListItem>
                                                    <asp:ListItem Value="+220">Gambia</asp:ListItem>
                                                    <asp:ListItem Value="+995">Georgia</asp:ListItem>
                                                    <asp:ListItem Value="+49">Germany</asp:ListItem>
                                                    <asp:ListItem Value="+233">Ghana</asp:ListItem>
                                                    <asp:ListItem Value="+350">Gibraltar</asp:ListItem>
                                                    <asp:ListItem Value="+30">Greece</asp:ListItem>
                                                    <asp:ListItem Value="+299">Greenland</asp:ListItem>
                                                    <asp:ListItem Value="+1473">Grenada</asp:ListItem>
                                                    <asp:ListItem Value="+590">Guadeloupe</asp:ListItem>
                                                    <asp:ListItem Value="+1671">Guam</asp:ListItem>
                                                    <asp:ListItem Value="+5399">Guantanamo Bay</asp:ListItem>
                                                    <asp:ListItem Value="+502">Guatemala</asp:ListItem>
                                                    <asp:ListItem Value="+245">Guinea-Bissau</asp:ListItem>
                                                    <asp:ListItem Value="+224">Guinea</asp:ListItem>
                                                    <asp:ListItem Value="+592">Guyana</asp:ListItem>
                                                    <asp:ListItem Value="+509">Haiti</asp:ListItem>
                                                    <asp:ListItem Value="+504">Honduras</asp:ListItem>
                                                    <asp:ListItem Value="+852">Hong Kong</asp:ListItem>
                                                    <asp:ListItem Value="+36">Hungary</asp:ListItem>
                                                    <asp:ListItem Value="+354">Iceland</asp:ListItem>
                                                    <asp:ListItem Value="+91">India</asp:ListItem>
                                                    <asp:ListItem Value="+62">Indonesia</asp:ListItem>
                                                    <asp:ListItem Value="+98">Iran</asp:ListItem>
                                                    <asp:ListItem Value="+964">Iraq</asp:ListItem>
                                                    <asp:ListItem Value="+353">Ireland</asp:ListItem>
                                                    <asp:ListItem Value="+972">Israel</asp:ListItem>
                                                    <asp:ListItem Value="+39">Italy</asp:ListItem>
                                                    <asp:ListItem Value="+1876">Jamaica</asp:ListItem>
                                                    <asp:ListItem Value="+81">Japan</asp:ListItem>
                                                    <asp:ListItem Value="+962">Jordan</asp:ListItem>
                                                    <asp:ListItem Value="+7">Kazakhstan</asp:ListItem>
                                                    <asp:ListItem Value="+254">Kenya</asp:ListItem>
                                                    <asp:ListItem Value="+686">Kiribati</asp:ListItem>
                                                    <asp:ListItem Value="+850">Korea (North)</asp:ListItem>
                                                    <asp:ListItem Value="+82">Korea (South)</asp:ListItem>
                                                    <asp:ListItem Value="+965">Kuwait</asp:ListItem>
                                                    <asp:ListItem Value="+996">Kyrgyz Republic</asp:ListItem>
                                                    <asp:ListItem Value="+856">Laos</asp:ListItem>
                                                    <asp:ListItem Value="+371">Latvia</asp:ListItem>
                                                    <asp:ListItem Value="+961">Lebanon</asp:ListItem>
                                                    <asp:ListItem Value="+266">Lesotho</asp:ListItem>
                                                    <asp:ListItem Value="+231">Liberia</asp:ListItem>
                                                    <asp:ListItem Value="+218">Libya</asp:ListItem>
                                                    <asp:ListItem Value="+423">Liechtenstein</asp:ListItem>
                                                    <asp:ListItem Value="+370">Lithuania</asp:ListItem>
                                                    <asp:ListItem Value="+352">Luxembourg</asp:ListItem>
                                                    <asp:ListItem Value="+853">Macao</asp:ListItem>
                                                    <asp:ListItem Value="+261">Madagascar</asp:ListItem>
                                                    <asp:ListItem Value="+265">Malawi</asp:ListItem>
                                                    <asp:ListItem Value="+60">Malaysia</asp:ListItem>
                                                    <asp:ListItem Value="+960">Maldives</asp:ListItem>
                                                    <asp:ListItem Value="+223">Mali Republic</asp:ListItem>
                                                    <asp:ListItem Value="+356">Malta</asp:ListItem>
                                                    <asp:ListItem Value="+692">Marshall Islands</asp:ListItem>
                                                    <asp:ListItem Value="+596">Martinique</asp:ListItem>
                                                    <asp:ListItem Value="+222">Mauritania</asp:ListItem>
                                                    <asp:ListItem Value="+230">Mauritius</asp:ListItem>
                                                    <asp:ListItem Value="+269">Mayotte Island</asp:ListItem>
                                                    <asp:ListItem Value="+52">Mexico</asp:ListItem>
                                                    <asp:ListItem Value="+1808">Midway Island</asp:ListItem>
                                                    <asp:ListItem Value="+373">Moldova</asp:ListItem>
                                                    <asp:ListItem Value="+377">Monaco</asp:ListItem>
                                                    <asp:ListItem Value="+976">Mongolia</asp:ListItem>
                                                    <asp:ListItem Value="+382">Montenegro</asp:ListItem>
                                                    <asp:ListItem Value="+1664">Montserrat</asp:ListItem>
                                                    <asp:ListItem Value="+212">Morocco</asp:ListItem>
                                                    <asp:ListItem Value="+258">Mozambique</asp:ListItem>
                                                    <asp:ListItem Value="+95">Myanmar</asp:ListItem>
                                                    <asp:ListItem Value="+264">Namibia</asp:ListItem>
                                                    <asp:ListItem Value="+674">Nauru</asp:ListItem>
                                                    <asp:ListItem Value="+977">Nepal</asp:ListItem>
                                                    <asp:ListItem Value="+31">Netherlands</asp:ListItem>
                                                    <asp:ListItem Value="+599">Netherlands Antilles</asp:ListItem>
                                                    <asp:ListItem Value="+1869">Nevis</asp:ListItem>
                                                    <asp:ListItem Value="+687">New Caledonia</asp:ListItem>
                                                    <asp:ListItem Value="+64">New Zealand</asp:ListItem>
                                                    <asp:ListItem Value="+505">Nicaragua</asp:ListItem>
                                                    <asp:ListItem Value="+227">Niger</asp:ListItem>
                                                    <asp:ListItem Value="+234">Nigeria</asp:ListItem>
                                                    <asp:ListItem Value="+683">Niue</asp:ListItem>
                                                    <asp:ListItem Value="+672">Norfolk Island</asp:ListItem>
                                                    <asp:ListItem Value="+47">Norway</asp:ListItem>
                                                    <asp:ListItem Value="+968">Oman</asp:ListItem>
                                                    <asp:ListItem Value="+92">Pakistan</asp:ListItem>
                                                    <asp:ListItem Value="+680">Palau</asp:ListItem>
                                                    <asp:ListItem Value="+970">Palestinian Settlements</asp:ListItem>
                                                    <asp:ListItem Value="+507">Panama</asp:ListItem>
                                                    <asp:ListItem Value="+675">Papua New Guinea</asp:ListItem>
                                                    <asp:ListItem Value="+595">Paraguay</asp:ListItem>
                                                    <asp:ListItem Value="+51">Peru</asp:ListItem>
                                                    <asp:ListItem Value="+63">Philippines</asp:ListItem>
                                                    <asp:ListItem Value="+48">Poland</asp:ListItem>
                                                    <asp:ListItem Value="+351">Portugal</asp:ListItem>
                                                    <asp:ListItem Value="+974">Qatar</asp:ListItem>
                                                    <asp:ListItem Value="+262">Réunion Island</asp:ListItem>
                                                    <asp:ListItem Value="+40">Romania</asp:ListItem>
                                                    <asp:ListItem Value="+7">Russia</asp:ListItem>
                                                    <asp:ListItem Value="+250">Rwandese Republic</asp:ListItem>
                                                    <asp:ListItem Value="+290">St. Helena</asp:ListItem>
                                                    <asp:ListItem Value="+1869">St. Kitts/Nevis</asp:ListItem>
                                                    <asp:ListItem Value="+1758">St. Lucia</asp:ListItem>
                                                    <asp:ListItem Value="+508">St. Pierre &amp; Miquelon</asp:ListItem>
                                                    <asp:ListItem Value="+1784">St. Vincent &amp; Grenadines</asp:ListItem>
                                                    <asp:ListItem Value="+685">Samoa</asp:ListItem>
                                                    <asp:ListItem Value="+378">San Marino</asp:ListItem>
                                                    <asp:ListItem Value="+239">São Tomé and Principe</asp:ListItem>
                                                    <asp:ListItem Value="+966">Saudi Arabia</asp:ListItem>
                                                    <asp:ListItem Value="+221">Senegal</asp:ListItem>
                                                    <asp:ListItem Value="+381">Serbia</asp:ListItem>
                                                    <asp:ListItem Value="+248">Seychelles Republic</asp:ListItem>
                                                    <asp:ListItem Value="+232">Sierra Leone</asp:ListItem>
                                                    <asp:ListItem Value="+65">Singapore</asp:ListItem>
                                                    <asp:ListItem Value="+421">Slovak Republic</asp:ListItem>
                                                    <asp:ListItem Value="+386">Slovenia</asp:ListItem>
                                                    <asp:ListItem Value="+677">Solomon Islands</asp:ListItem>
                                                    <asp:ListItem Value="+252">Somali Democratic Republic</asp:ListItem>
                                                    <asp:ListItem Value="+27">South Africa</asp:ListItem>
                                                    <asp:ListItem Value="+34">Spain</asp:ListItem>
                                                    <asp:ListItem Value="+94">Sri Lanka</asp:ListItem>
                                                    <asp:ListItem Value="+249">Sudan</asp:ListItem>
                                                    <asp:ListItem Value="+597">Suriname</asp:ListItem>
                                                    <asp:ListItem Value="+268">Swaziland</asp:ListItem>
                                                    <asp:ListItem Value="+46">Sweden</asp:ListItem>
                                                    <asp:ListItem Value="+41">Switzerland</asp:ListItem>
                                                    <asp:ListItem Value="+963">Syria</asp:ListItem>
                                                    <asp:ListItem Value="+886">Taiwan</asp:ListItem>
                                                    <asp:ListItem Value="+992">Tajikistan</asp:ListItem>
                                                    <asp:ListItem Value="+255">Tanzania</asp:ListItem>
                                                    <asp:ListItem Value="+66">Thailand</asp:ListItem>
                                                    <asp:ListItem Value="+670">Timor Leste</asp:ListItem>
                                                    <asp:ListItem Value="+228">Togolese Republic</asp:ListItem>
                                                    <asp:ListItem Value="+690">Tokelau</asp:ListItem>
                                                    <asp:ListItem Value="+676">Tonga Islands</asp:ListItem>
                                                    <asp:ListItem Value="+1868">Trinidad &amp; Tobago</asp:ListItem>
                                                    <asp:ListItem Value="+216">Tunisia</asp:ListItem>
                                                    <asp:ListItem Value="+90">Turkey</asp:ListItem>
                                                    <asp:ListItem Value="+993">Turkmenistan</asp:ListItem>
                                                    <asp:ListItem Value="+1649">Turks and Caicos Islands</asp:ListItem>
                                                    <asp:ListItem Value="+688">Tuvalu</asp:ListItem>
                                                    <asp:ListItem Value="+256">Uganda</asp:ListItem>
                                                    <asp:ListItem Value="+380">Ukraine</asp:ListItem>
                                                    <asp:ListItem Value="+971">United Arab Emirates</asp:ListItem>
                                                    <asp:ListItem Value="+44">United Kingdom</asp:ListItem>
                                                    <asp:ListItem Value="+1">United States of America</asp:ListItem>
                                                    <asp:ListItem Value="+1340">US Virgin Islands</asp:ListItem>
                                                    <asp:ListItem Value="+598">Uruguay</asp:ListItem>
                                                    <asp:ListItem Value="+998">Uzbekistan</asp:ListItem>
                                                    <asp:ListItem Value="+678">Vanuatu</asp:ListItem>
                                                    <asp:ListItem Value="+58">Venezuela</asp:ListItem>
                                                    <asp:ListItem Value="+84">Vietnam</asp:ListItem>
                                                    <asp:ListItem Value="+808">Wake Island</asp:ListItem>
                                                    <asp:ListItem Value="+967">Yemen</asp:ListItem>
                                                    <asp:ListItem Value="+260">Zambia</asp:ListItem>
                                                    <asp:ListItem Value="+255">Zanzibar</asp:ListItem>
                                                    <asp:ListItem Value="+263">Zimbabwe</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <label>State *</label>
                                                <asp:TextBox ID="txtState" CssClass="form-control required" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="txtState" Display="Dynamic" ValidationGroup="Submit" ErrorMessage="<p>Required Field</p>" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <label>City *</label>
                                                <asp:TextBox ID="txtCity" CssClass="form-control required" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" Display="Dynamic" ValidationGroup="Submit" ErrorMessage="<p>Required Field</p>" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <label>Password *</label>
                                                <asp:TextBox ID="txtPassword" CssClass="form-control required" TextMode="Password" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ValidationGroup="Submit" ErrorMessage="<p>Required Field</p>" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="revPassword" runat="server"
                                                    ErrorMessage="Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character"
                                                    ControlToValidate="txtPassword"
                                                    ValidationGroup="Submit"
                                                    Display="Dynamic"
                                                    SetFocusOnError="true"
                                                    ForeColor="Red"
                                                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <label>Security Password *</label>
                                                <asp:TextBox ID="txtSecurityPassword" CssClass="form-control required" TextMode="Password" runat="server"></asp:TextBox>
                                                <asp:CompareValidator ID="cvConfirmPass"
                                                    runat="server"
                                                    ControlToCompare="txtPassword"
                                                    ControlToValidate="txtSecurityPassword"
                                                    ErrorMessage="Your passwords do not match up!"
                                                    ValidationGroup="Submit"
                                                    Display="Dynamic"
                                                    SetFocusOnError="true"
                                                    ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                </fieldset>

                            </div>

                        </div>

                    </div>
                    <!-- /----- -->

                    <div class="row">
                        <div class="col-md-12" style="text-align: center">
                            <asp:CheckBox ID="chkCheck" runat="server" />
                            I am the Confidant of this participant
                            <br />
                            <br />
                            <asp:Button ID="btnSubmit" ValidationGroup="Submit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        </div>
                    </div>

                </div>


            </div>

        </div>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ctplScript" runat="Server">
    <script type="text/javascript">
        $("#ctplContent_txtSponsorID").focusout(function () {
            $.ajax({
                type: "POST",
                url: "Registration.aspx/CheckSponsorID",
                data: "{'SponsorID' : '" + $(this).val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != null) {
                        $('#lblSponsorID i').text(data.d);
                    }
                    else {
                        $(this).focus();
                    }
                }
            });
        });
    </script>
</asp:Content>
