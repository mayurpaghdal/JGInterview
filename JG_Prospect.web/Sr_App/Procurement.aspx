<%@ Page Title="" Language="C#" MasterPageFile="~/Sr_App/SR_app.Master" AutoEventWireup="true" EnableEventValidation="false"
    CodeBehind="Procurement.aspx.cs" Inherits="JG_Prospect.Sr_App.Procurement" %>

<%@ Register TagPrefix="asp" Namespace="Saplin.Controls" Assembly="DropDownCheckBoxes" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../js/jquery.MultiFile.js" type="text/javascript"></script>
    <style>
        #googleMap > div {
            width: 100% !important;
        }

        .button_cls {
            background: url(img/main-header-bg.png) repeat-x;
            color: #fff !important;
            display: inline-block;
            text-decoration: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            float: right;
        }

        .btnSaveAddress {
            background: url(img/main-header-bg.png) repeat-x;
            color: #fff !important;
            display: inline-block;
            text-decoration: none;
            padding: 10px;
            border-radius: 5px;
            margin-top: 10px;
        }

        .btnAddNewVendor {
            background: url(img/main-header-bg.png) repeat-x;
            color: #fff !important;
            display: inline-block;
            text-decoration: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            float: right;
        }

        .btnNewAddress {
            background: url(img/main-header-bg.png) repeat-x;
            color: #fff !important;
            display: inline-block;
            text-decoration: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        #tblPrimaryEmail tr td, #tblSecEmail tr td, #tblAltEmail tr td {
            width: 20%;
        }

            #tblPrimaryEmail tr td input, #tblSecEmail tr td input, #tblAltEmail tr td input {
                max-width: 170px;
            }

        .newcontactdiv input {
            width: inherit !important;
            margin-bottom: 5px;
        }
    </style>
    <style type="text/css">
        #tabs.ui-tabs {
            background: transparent;
        }

            #tabs.ui-tabs .ui-tabs-nav {
                height: auto;
                margin-left: 0;
            }

        .ui-tabs .ui-tabs-nav li {
            width: 20%;
        }

        #tabs.ui-tabs .ui-tabs-nav li.ui-tabs-selected {
            background: #ffffff;
        }

        .ui-tabs.ui-widget-content {
            border: 1px solid #aaaaaa !important;
        }

        .ui-tabs .ui-tabs-panel {
            padding: 10px 0px !important;
        }

        .uiblack {
            display: block;
            position: fixed;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.55);
            z-index: 99 !important;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=80);
            overflow-y: hidden;
        }

        .btnnotes {
            background-size: cover !important;
            width: 250px;
        }

        .popup_heading {
            border-radius: 0px 0px;
            background: #A33E3F;
            margin-bottom: 10px;
        }

        .categorylist_Heading {
            width: 32.33%;
            float: left;
            margin-left: 1%;
        }

            .categorylist_Heading h4 {
                background: #ddd;
                color: #000;
            }
    </style>
    <style>
        table tr th {
            border: 1px solid;
            padding: 0px;
        }

        table.table tr.trHeader {
            background: #000000;
            color: #ffffff;
        }

        .FirstRow {
            background: #f57575;
            padding: 2px;
        }

        .AlternateRow {
            background: #f6f1f3;
            padding: 2px;
        }

        .dark-gray-background {
            background-color: darkgray;
            background-image: none;
        }

        .AlternateRow a, .FirstRow a {
            color: #111;
        }

        .textbox {
            padding: 5px;
            border-radius: 5px;
            border: #b5b4b4 1px solid;
            margin-left: 0;
            margin-right: 0;
            margin-bottom: 5px;
        }

        .tablealign {
            margin-top: 5px;
        }

        div.dd_chk_select {
            height: 30px;
        }

            div.dd_chk_select div#caption {
                top: 7px;
                margin-left: 10px;
            }

        div.dd_chk_drop {
            top: 30px;
        }

        .ui-autocomplete {
            max-height: 250px;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
        }

        .ui-autocomplete-category {
            font-weight: bold;
            padding: .2em .4em;
            margin: .8em 0 .2em;
            line-height: 1.5;
            text-align: center;
        }

        .ui-autocomplete-loading {
            background: white url("../img/ui-anim_basic_16x16.png") right center no-repeat;
        }

        .task-history-tab {
            min-height: 200px;
            max-height: 400px;
            overflow: auto;
            overflow-x: hidden;
        }
    </style>

    <script type="text/javascript">

        function ShowModalPopup() {
            $find("mpe").show();
            return false;
        }
        function HideModalPopup() {
            //debugger;
            $find("mpe").hide();
            return false;
        }

        function ClosePopup() {
            document.getElementById('light').style.display = 'none';
            document.getElementById('fade').style.display = 'none';
        }

        function overlay() {
            document.getElementById('light').style.display = 'block';
            document.getElementById('fade').style.display = 'block';
        }

        //google.maps.event.addDomListener(window, 'load', initialize);

        function AddLocation(e) {
            var dataTypeValue = $(e).attr("data-type");
            var subCount = $(e).closest('table').find('tr').length - 1;
            $(e).closest('table').append("<tr class='newAddressrow'>" +
                                            "<td><select TabIndex='1' name='nameddlAddresstype" + dataTypeValue + subCount + "' id='ddlAddressType" + dataTypeValue + subCount + "'>" +
                                                    "<option value='--Select--'>Select</option>" +
                                                    "<option value='Primary'>Primary</option>" +
                                                    "<option value='Secondary'>Secondary</option>" +
                                                    "<option value='Billing'>Billing</option></select></td>" +
                                            "<td><textarea TabIndex='1' id='txtAddress" + dataTypeValue + subCount + "' name='nametxtAddress" + dataTypeValue + subCount + "' placeholder='Address' rows='2' cols='40' clientidmode='Static' /></td>" +
                                            "<td><input TabIndex='1' type='text' id='txtCity" + dataTypeValue + subCount + "' name='nametxtCity" + dataTypeValue + subCount + "' placeholder='City' clientidmode='Static' /></td>" +
                                            "<td><input TabIndex='1' type='text' id='txtZip" + dataTypeValue + subCount + "' name='nametxtZip" + dataTypeValue + subCount + "' placeholder='Zip' clientidmode='Static' /></td>" +
                                            "</tr>");
        }

        function AddEmailRow(e) {
            var EmailType = $(e).attr("data-EmailType");
            var subCount = $(e).closest('table').find('tr').length;
            $(e).closest('table').append("<tr>" +
                                            "<td><div class='newEmaildiv'><input TabIndex='1' type='text' id='txt" + EmailType + "Email" + subCount + "' name='nametxt" + EmailType + "Email" + subCount + "' placeholder='Email' class='clsemail' clientidmode='Static' />" +
                                            "<br/><a TabIndex='1' onclick='AddEmail(this)' style='cursor: pointer' data-emailtype='" + EmailType + "' data-type='" + subCount + "'>Add Email</a><br/></div></td>" +
                                            "<td><input TabIndex='1' type='text' id='txt" + EmailType + "FName" + subCount + "' name='nametxt" + EmailType + "FName" + subCount + "' placeholder='First Name' clientidmode='Static' /></td>" +
                                            "<td><input TabIndex='1' type='text' id='txt" + EmailType + "LName" + subCount + "' name='nametxt" + EmailType + "LName" + subCount + "' placeholder='Last Name' clientidmode='Static' /></td>" +
                                           "<td><select TabIndex='1' id='ddl" + EmailType + "Title" + subCount + "' name='nameddl" + EmailType + "Title" + subCount + "' clientidmode='Static'>" +
                                            "<option value=''>Select</option>" +
                                            "<option value='DM'>DM</option>" +
                                            "<option value='Spouse'>Spouse</option>" +
                                            "<option value='Partner'>Partner</option>" +
                                            "<option value='Others'>Others</option>" +
                                            "</select></td>" +
                                            "<td><div class='newcontactdiv'>" +
                                            "<input TabIndex='1' type='text' id='txt" + EmailType + "Contact" + subCount + "' name='nametxt" + EmailType + "Contact" + subCount + "' style='width:50%' onkeypress='return isNumericKey(event);' class='clsmaskphone' maxlength='10' placeholder='___-___-____' clientidmode='Static' />" +
                                            "&nbsp;<input TabIndex='1' type='text' id='txt" + EmailType + "ContactExten" + subCount + "' name='nametxt" + EmailType + "ContactExten" + subCount + "' style='width:35%' onkeypress='return isNumericKey(event);' maxlength='6' class='clsmaskphoneexten' placeholder='Extension' clientidmode='Static' />" +
                                            "&nbsp;<label> Phone Type</label>" +
                                            "<select id='ddl" + EmailType + "PhoneType" + subCount + "' name='nameddl" + EmailType + "PhoneType" + subCount + "' class='clsphonetype' cliendidmode='static'>" +
                                                "<option value=''>Select</option>" +
                                                "<option value='Cell'>Cell Phone #</option>" +
                                                "<option value='House'>House Phone  #</option>" +
                                                "<option value='Work'>Work Phone #</option>" +
                                                "<option value='Alt'>Alt. Phone #</option>" +
                                            "</select>" +
                                            "<a TabIndex='1' onclick='AddContact(this)' style='cursor:pointer' data-type='" + subCount + "' data-EmailType='" + EmailType + "' clientidmode='Static'>Add Contact</a><br/></div></td>" +
                                            " <td><label>Fax</label><br /><input type='text' id='txt" + EmailType + "Fax" + subCount + "' name='nametxt" + EmailType + "Fax" + subCount + "' maxlength='15' onkeypress='return isNumericKey(event);' clientidmode='Static'><br /></td>" +
                                            "</tr>");
            $('.clsmaskphone').mask("(999) 999-9999");
            $('.clsmaskphoneexten').mask("999999");
        }

        function AddEmail(e) {
            var dataTypeValue = $(e).attr("data-type");
            var EmailType = $(e).attr("data-EmailType");
            var subCount = $(e).closest('tr').find('.newEmaildiv').length;
            $(e).closest('td').append(
                        "<br/><div class='newEmaildiv'><input TabIndex='1' type='text' id='txt" + EmailType + "Email" + dataTypeValue + subCount + "' name='nametxt" + EmailType + "Email" + dataTypeValue + subCount + "' class='clsemail' clientidmode='Static' />"
                );
        }

        function AddContact(e) {
            var dataTypeValue = $(e).attr("data-type");
            var EmailType = $(e).attr("data-EmailType");
            var subCount = $(e).closest('td').find('.clsmaskphone').length - 1;
            $(e).closest('td').append(
                                            "<br/><div class='newcontactdiv'>" +
                                            "<input TabIndex='1' type='text' id='txt" + EmailType + "Contact" + dataTypeValue + subCount + "' name='nametxt" + EmailType + "Contact" + dataTypeValue + subCount + "' style='width:50%;' onkeypress='return isNumericKey(event);' maxlength='10' class='clsmaskphone' maxlength='10' placeholder='___-___-____' clientidmode='Static' />" +
                                            "&nbsp;<input TabIndex='1' type='text' id='txt" + EmailType + "ContactExten" + dataTypeValue + subCount + "' name='nametxt" + EmailType + "ContactExten" + dataTypeValue + subCount + "' style='width:35%;' onkeypress='return isNumericKey(event);' maxlength='6' class='clsmaskphoneexten' placeholder='Extension' clientidmode='Static' />" +
                                            "&nbsp;<label> Phone Type</label>" +
                                            "<select id='ddl" + EmailType + "PhoneType" + dataTypeValue + subCount + "' name='nameddl" + EmailType + "PhoneType" + dataTypeValue + subCount + "' class='clsphonetype' cliendidmode='static'>" +
                                                "<option value=''>Select</option>" +
                                                "<option value='Cell'>Cell Phone #</option>" +
                                                "<option value='House'>House Phone  #</option>" +
                                                "<option value='Work'>Work Phone #</option>" +
                                                "<option value='Alt'>Alt. Phone #</option>" +
                                            "</select>" +
                                            "<br/></div>");
            $('.clsmaskphone').mask("(999) 999-9999");
            $('.clsmaskphoneexten').mask("999999");

        }

          function GetVendorDetails(e) {
            //debugger;
            $('#<%=LblSave.ClientID%>').text("");
            if ($('#<%=txtVendorNm.ClientID%>').val() == '') {
                $('#<%=LblSave.ClientID%>').text("Please enter Vendor name!");
                return false;
            }
            if ($('#<%=ddlSource.ClientID%>').val() == 'Select Source') {
                $('#<%=LblSave.ClientID%>').text("Please select source!");
                return false;
            }
            if ($('#<%=txtPrimaryAddress.ClientID%>').val() == '') {
                $('#<%=LblSave.ClientID%>').text("Please enter address!");
                return false;
            }
            var selectedChkProductCategoryListValues = "";
            $("[id*=chkVendorCategoryList] input:checked").each(function () {
                //alert($(this).val());
                selectedChkProductCategoryListValues += $(this).val();
            });
            <%--if ($('#<%=ddlVndrCategory.ClientID%>').val() == 'Select' && $('#<%=hidIsEditVendor.ClientID%>').val() == 'false') {
                $('#<%=LblSave.ClientID%>').text("Please select Vendor Category!")
                return false;
            }--%>
            if (selectedChkProductCategoryListValues == '' && $('#<%=hidIsEditVendor.ClientID%>').val() == 'false') {
                $('#<%=LblSave.ClientID%>').text("Please select Vendor Category!");
                return false;
            }
            //$("#divModalPopup").show();
            var AddressData = [];
            var VendorEmailData = [];
            var vid = $('.clsvendorid').val();
            var AddrType = "Other";
            //$(".vendor_table").find(".fixedAddressrow").each(function (index, node) {
            //    if (index == 0) {
            AddressData.push({
                AddressID: ($(".clsvendoraddress").val() == undefined || $(".clsvendoraddress").val() == "Select") ? "0" : $(".clsvendoraddress").val(),
                AddressType: $(".clstxtAddressType0").val(),
                Address: $(".clstxtAddress0").val(),
                City: $(".clstxtCity0").val(),
                State: $(".clstxtState0").val(),
                Zip: $(".clstxtZip0").val(),
                Country: $(".clstxtCountry0").val()
            })
            //}
            // });
            $("#tblVendorLocation").find(".newAddressrow").each(function (index, node) {
                AddressData.push({
                    AddressType: $("#ddlAddressType1" + index).val(),
                    Address: $("#txtAddress1" + index).val(),
                    City: $("#txtCity1" + index).val(),
                    State: $("#txtState1" + index).val(),
                    Zip: $("#txtZip1" + index).val()
                })
            });
            $("#tblPrimaryEmail").find("tr").each(function (index, node) {
                var c = [];
                var Emails = [];
                $(this).find(".newEmaildiv").each(function () {
                    Emails.push({ Email: $(this).find(".clsemail").val() });
                });
                $(this).find(".newcontactdiv").each(function () {
                    c.push({
                        Extension: $(this).find(".clsmaskphoneexten").val(),
                        Number: $(this).find(".clsmaskphone").val(),
                        PhoneType: $(this).find(".clsphonetype option:selected").val()
                    });
                });
                var EmailData = {
                    EmailType: "Primary",
                    Email: Emails,
                    FirstName: $(this).find(".clsfname").val(),
                    LastName: $(this).find(".clslname").val(),
                    Title: $(this).find(".clstitle").val() == undefined ? "" : $(this).find(".clstitle").val(),
                    Contact: c,
                    Fax: $(this).find(".clsfax").val(),
                    AddressID: $(".clsvendoraddress").val() == undefined || $(".clsvendoraddress").val() == "Select" ? "0" : $(".clsvendoraddress").val(),
                };
                VendorEmailData.push(EmailData);

            });
            $("#tblSecEmail").find("tr").each(function (index, node) {
                var c = [];
                var Emails = [];
                $(this).find(".newEmaildiv").each(function () {
                    Emails.push({ Email: $(this).find(".clsemail").val() });
                });
                $(this).find(".newcontactdiv").each(function () {
                    c.push({
                        Extension: $(this).find(".clsmaskphoneexten").val(),
                        Number: $(this).find(".clsmaskphone").val(),
                        PhoneType: $(this).find(".clsphonetype option:selected").val()
                    });
                });
                var EmailData = {
                    EmailType: "Secondary",
                    Email: Emails,
                    FirstName: $(this).find(".clsfname").val(),
                    LastName: $(this).find(".clslname").val(),
                    Title: $(this).find(".clstitle").val() == undefined ? "" : $(this).find(".clstitle").val(),
                    Contact: c,
                    Fax: $(this).find(".clsfax").val(),
                    AddressID: $(".clsvendoraddress").val() == undefined || $(".clsvendoraddress").val() == "Select" ? "0" : $(".clsvendoraddress").val(),
                };
                VendorEmailData.push(EmailData);
            });
            $("#tblAltEmail").find("tr").each(function (index, node) {
                var c = [];
                var Emails = [];
                $(this).find(".newEmaildiv").each(function () {
                    Emails.push({ Email: $(this).find(".clsemail").val() });
                });
                $(this).find(".newcontactdiv").each(function () {
                    // console.log($("#txtPrimaryContact" + index).html());
                    c.push({
                        Extension: $(this).find(".clsmaskphoneexten").val(),
                        Number: $(this).find(".clsmaskphone").val(),
                        PhoneType: $(this).find(".clsphonetype option:selected").val()
                    });
                });
                var EmailData = {
                    EmailType: "Alternate",
                    Email: Emails,
                    FirstName: $(this).find(".clsfname").val(),
                    LastName: $(this).find(".clslname").val(),
                    Title: $(this).find(".clstitle").val() == undefined ? "" : $(this).find(".clstitle").val(),
                    Contact: c,
                    Fax: $(this).find(".clsfax").val(),
                    AddressID: $(".clsvendoraddress").val() == undefined || $(".clsvendoraddress").val() == "Select" ? "0" : $(".clsvendoraddress").val(),
                };
                VendorEmailData.push(EmailData);
            });
            //console.log(JSON.stringify(VendorEmailData));
            //console.log(JSON.stringify(AddressData));

            var datalength = JSON.parse(JSON.stringify(VendorEmailData)).length;
            //debugger
            $.ajax({
                type: "POST",
                url: "Procurement.aspx/PostVendorDetails",
                contentType: "application/json; charset=utf-8",
                dataType: "JSON",
                data: JSON.stringify({ vendorid: vid, Address: AddressData, VendorEmails: VendorEmailData }),
                success: function (data) {
                    console.log(data);
                    checkAddress();
                    //AddOldEmailContent(datalength);
                }
            });
        }

        function SetVendorEmails(e) {
            //debugger;
            $('#<%=LblSave.ClientID%>').text("");
            if ($('#<%=txtVendorNm.ClientID%>').val() == '') {
                $('#<%=LblSave.ClientID%>').text("Please enter Vendor name!");
                return false;
            }
            if ($('#<%=ddlSource.ClientID%>').val() == 'Select Source') {
                $('#<%=LblSave.ClientID%>').text("Please select source!");
                return false;
            }
            if ($('#<%=txtPrimaryAddress.ClientID%>').val() == '') {
                $('#<%=LblSave.ClientID%>').text("Please enter address!");
                return false;
            }
      
            var AddressData = [];
            var VendorEmailData = [];
            var vid = $('.clsvendorid').val();
            var AddrType = "Other";
            //$(".vendor_table").find(".fixedAddressrow").each(function (index, node) {
            //    if (index == 0) {
            AddressData.push({
                AddressID: ($(".clsvendoraddress").val() == undefined || $(".clsvendoraddress").val() == "Select") ? "0" : $(".clsvendoraddress").val(),
                AddressType: $(".clstxtAddressType0").val(),
                Address: $(".clstxtAddress0").val(),
                City: $(".clstxtCity0").val(),
                State: $(".clstxtState0").val(),
                Zip: $(".clstxtZip0").val(),
                Country: $(".clstxtCountry0").val()
            })
            //}
            // });
            $("#tblVendorLocation").find(".newAddressrow").each(function (index, node) {
                AddressData.push({
                    AddressType: $("#ddlAddressType1" + index).val(),
                    Address: $("#txtAddress1" + index).val(),
                    City: $("#txtCity1" + index).val(),
                    State: $("#txtState1" + index).val(),
                    Zip: $("#txtZip1" + index).val()
                })
            });
            $("#tblPrimaryEmail").find("tr").each(function (index, node) {
                var c = [];
                var Emails = [];
                $(this).find(".newEmaildiv").each(function () {
                    Emails.push({ Email: $(this).find(".clsemail").val() });
                });
                $(this).find(".newcontactdiv").each(function () {
                    c.push({
                        Extension: $(this).find(".clsmaskphoneexten").val(),
                        Number: $(this).find(".clsmaskphone").val(),
                        PhoneType: $(this).find(".clsphonetype option:selected").val()
                    });
                });
                var EmailData = {
                    EmailType: "Primary",
                    Email: Emails,
                    FirstName: $(this).find(".clsfname").val(),
                    LastName: $(this).find(".clslname").val(),
                    Title: $(this).find(".clstitle").val() == undefined ? "" : $(this).find(".clstitle").val(),
                    Contact: c,
                    Fax: $(this).find(".clsfax").val(),
                    AddressID: $(".clsvendoraddress").val() == undefined || $(".clsvendoraddress").val() == "Select" ? "0" : $(".clsvendoraddress").val(),
                };
                VendorEmailData.push(EmailData);

            });
            $("#tblSecEmail").find("tr").each(function (index, node) {
                var c = [];
                var Emails = [];
                $(this).find(".newEmaildiv").each(function () {
                    Emails.push({ Email: $(this).find(".clsemail").val() });
                });
                $(this).find(".newcontactdiv").each(function () {
                    c.push({
                        Extension: $(this).find(".clsmaskphoneexten").val(),
                        Number: $(this).find(".clsmaskphone").val(),
                        PhoneType: $(this).find(".clsphonetype option:selected").val()
                    });
                });
                var EmailData = {
                    EmailType: "Secondary",
                    Email: Emails,
                    FirstName: $(this).find(".clsfname").val(),
                    LastName: $(this).find(".clslname").val(),
                    Title: $(this).find(".clstitle").val() == undefined ? "" : $(this).find(".clstitle").val(),
                    Contact: c,
                    Fax: $(this).find(".clsfax").val(),
                    AddressID: $(".clsvendoraddress").val() == undefined || $(".clsvendoraddress").val() == "Select" ? "0" : $(".clsvendoraddress").val(),
                };
                VendorEmailData.push(EmailData);
            });
            $("#tblAltEmail").find("tr").each(function (index, node) {
                var c = [];
                var Emails = [];
                $(this).find(".newEmaildiv").each(function () {
                    Emails.push({ Email: $(this).find(".clsemail").val() });
                });
                $(this).find(".newcontactdiv").each(function () {
                    // console.log($("#txtPrimaryContact" + index).html());
                    c.push({
                        Extension: $(this).find(".clsmaskphoneexten").val(),
                        Number: $(this).find(".clsmaskphone").val(),
                        PhoneType: $(this).find(".clsphonetype option:selected").val()
                    });
                });
                var EmailData = {
                    EmailType: "Alternate",
                    Email: Emails,
                    FirstName: $(this).find(".clsfname").val(),
                    LastName: $(this).find(".clslname").val(),
                    Title: $(this).find(".clstitle").val() == undefined ? "" : $(this).find(".clstitle").val(),
                    Contact: c,
                    Fax: $(this).find(".clsfax").val(),
                    AddressID: $(".clsvendoraddress").val() == undefined || $(".clsvendoraddress").val() == "Select" ? "0" : $(".clsvendoraddress").val(),
                };
                VendorEmailData.push(EmailData);
            });
            //console.log(JSON.stringify(VendorEmailData));
            //console.log(JSON.stringify(AddressData));
            //debugger;
            var datalength = JSON.parse(JSON.stringify(VendorEmailData)).length;
            $.ajax({
                type: "POST",
                url: "Procurement.aspx/PostVendorDetails",
                contentType: "application/json; charset=utf-8",
                dataType: "JSON",
                data: JSON.stringify({ vendorid: vid, Address: AddressData, VendorEmails: VendorEmailData }),
                success: function (data) {
                    console.log(data);
                    checkAddress();
                    //AddOldEmailContent(datalength);
                }
            });
        }

        function checkAddress() {
            if ($(".clsvendoraddress").val() == undefined || $(".clsvendoraddress").val() == "") {
                alert("select address from Address Dropdown or Add new address");
                return false;
            }
            else {
                return true;
            }
        }

        function setProcSelectedValue(dropdownlist, sVal) {
            $(dropdownlist).val(sVal);
        }

        function AddVenderEmails(data) {
            var PID = -1;
            var SID = -1;
            var AID = -1;
            try {
                if (data.length <= 0) { return; }
            }
            catch (e2) {
                return;
            }
            for (var i = 0; i < data.length; i++) {
                var AddressID = data[i].AddressID;
                var Email = JSON.parse(data[i].Email);
                var Contact = JSON.parse(data[i].Contact);
                var EmailType = data[i].EmailType;
                var FName = data[i].FName;
                var LName = data[i].LName;
                var Fax = data[i].Fax;
                var Title = data[i].Title;
                var SeqNo = data[i].SeqNo;
                var VendorId = data[i].VendorId;
                var TempID = data[i].TempID;
                var ID = "";
                if (EmailType == "Primary") {
                    ID = "Primary";
                    PID++;
                    $('#<%=txtPrimaryEmail0.ClientID%>').val(Email[0].Email);
                    $('#<%=txtPrimaryContact0.ClientID%>').val(Contact[0].Number);
                    $('#<%=txtPrimaryContactExten0.ClientID%>').val(Contact[0].Extension);
                    $('#<%=txtPrimaryFax0.ClientID%>').val(Fax);
                    $('#<%=txtPrimaryFName0.ClientID%>').val(FName);
                    $('#<%=txtPrimaryLName0.ClientID%>').val(LName);
                    setProcSelectedValue('#<%=ddlPrimaryTitle0.ClientID%>', Title);
                    setProcSelectedValue('#<%=ddlPrimaryPhoneType0.ClientID%>', Contact[0].PhoneType);
                }
                if (EmailType == "Secondary") {
                    ID = "Sec";
                    SID++;
                    $('#<%=txtSecEmail0.ClientID%>').val(Email[0].Email);
                    $('#<%=txtSecContact0.ClientID%>').val(Contact[0].Number);
                    $('#<%=txtSecContactExten0.ClientID%>').val(Contact[0].Extension);
                    $('#<%=txtSecFax0.ClientID%>').val(Fax);
                    $('#<%=txtSecFName0.ClientID%>').val(FName);
                    $('#<%=txtSecLName0.ClientID%>').val(LName);
                    setProcSelectedValue('#<%=ddlSecTitle0.ClientID%>', Title);
                    setProcSelectedValue('#<%=ddlSecPhoneType0.ClientID%>', Contact[0].PhoneType);
                }
                if (EmailType == "Alternate") {
                    ID = "Alt";
                    AID++;
                    $('#<%=txtAltEmail0.ClientID%>').val(Email[0].Email);
                    $('#<%=txtAltContact0.ClientID%>').val(Contact[0].Number);
                    $('#<%=txtAltContactExten0.ClientID%>').val(Contact[0].Extension);
                    $('#<%=txtAltFax0.ClientID%>').val(Fax);
                    $('#<%=txtAltFName0.ClientID%>').val(FName);
                    $('#<%=txtAltLName0.ClientID%>').val(LName);
                    setProcSelectedValue('#<%=ddlAltTitle0.ClientID%>', Title);
                    setProcSelectedValue('#<%=ddlAltPhoneType0.ClientID%>', Contact[0].PhoneType);
                }

                var NewRow = 0;
                if (PID > 0 || SID > 0 || AID > 0) {
                    if (EmailType == "Primary") {
                        NewRow = PID;
                    }
                    if (EmailType == "Secondary") {
                        NewRow = SID;
                    }
                    if (EmailType == "Alternate") {
                        NewRow = AID;
                    }
                }

                GenereateHTML(data[i], ID, NewRow);
            }
            // $('.clsmaskphone').mask("(999) 999-9999");
            //  $('.clsmaskphoneexten').mask("999999");
        }

        function GenereateHTML(data, ID, NewRow) {
            var ContentPlaceHolder = "ContentPlaceHolder1_";
            var AddressID = data.AddressID;
            var Email = JSON.parse(data.Email);
            var Contact = JSON.parse(data.Contact);
            var Fax = data.Fax;
            var EmailType = data.EmailType;
            var FName = data.FName;
            var LName = data.LName;
            var Title = data.Title;
            var SeqNo = data.SeqNo;
            var VendorId = data.VendorId;
            var TempID = data.TempID;


            if (NewRow > 0) {
                var MainHTML = '<tr><td><div class="newEmaildiv">';
                MainHTML += '<input TabIndex="1" type="text" id="txt' + ID + 'Email' + NewRow + '" name="nametxt' + ID + 'Email' + NewRow + '" value="' + Email[0].Email + '" placeholder="Email" class="clsemail" clientidmode="Static"/><br>';
                MainHTML += '<a TabIndex="1" onclick="AddEmail(this)" style="cursor: pointer" data-emailtype="Primary" data-type="1">Add Email</a><br></div></td>';
                MainHTML += '<td><input TabIndex="1" type="text" id="txt' + ID + 'FName' + NewRow + '" name="nametxt' + ID + 'FName' + NewRow + '" value="' + FName + '" placeholder="First Name" clientidmode="Static"></td>';
                MainHTML += '<td><input TabIndex="1" type="text" id="txt' + ID + 'LName' + NewRow + '" name="nametxt' + ID + 'LName' + NewRow + '" value="' + LName + '" placeholder="Last Name" clientidmode="Static"></td>';

                MainHTML += '<td><select TabIndex="1" id="ddl' + ID + 'Title' + NewRow + '" name="nameddl' + ID + 'Title' + NewRow + '" clientidmode="Static">'
                    + '<option value="">Select</option>'
                    + '<option value="DM">DM</option>'
                    + '<option value="Spouse">Spouse</option>'
                    + '<option value="Partner">Partner</option>'
                    + '<option value="Others">Others</option>'
                    + '</select></td>';

                MainHTML += '<td><div class="newcontactdiv"><input type="text" id="txt' + ID + 'Contact' + NewRow + '" name="nametx' + ID + 'Contact' + NewRow + '" value="' + Contact[0].Number + '" style="width:50%" class="clsmaskphone" maxlength="10" TabIndex="1" placeholder="___-___-____" clientidmode="Static"/>&nbsp;<input TabIndex="1" type="text" id="txt' + ID + 'ContactExten' + NewRow + '" name="nametxt' + ID + 'ContactExten' + NewRow + '" value="' + Contact[0].Extension + '" style="width:35%" maxlength="6" class="clsmaskphoneexten" placeholder="Extension" clientidmode="Static"/>';
                MainHTML += '&nbsp;<label> Phone Type</label> <select id="ddl' + ID + 'PhoneType' + NewRow + '" name="nameddl' + ID + 'PhoneType' + NewRow + '" class="clsphonetype" cliendidmode="static">' +
                '<option value="">Select</option>' +
                '<option value="Cell">Cell Phone #</option>' +
                '<option value="House">House Phone  #</option>' +
                '<option value="Work">Work Phone #</option>' +
                '<option value="Alt">Alt. Phone #</option></select>';
                MainHTML += '<a TabIndex="1" onclick="AddContact(this)" style="cursor:pointer" data-type="1" data-emailtype="Primary" clientidmode="Static">Add Contact</a><br></div></td>';
                MainHTML += '<td><input type="text" id="txt' + ID + 'Fax' + NewRow + '" name="nametxt' + ID + 'Fax' + NewRow + '" maxlength="15" value="' + Fax + '" placeholder="Fax" clientidmode="Static"><br /></td></tr>';
                $("#tbl" + ID + "Email").find("tr:last-child").after(MainHTML);

                $("#ddl" + ID + "Title" + NewRow).val(Title);
                $("#ddl" + ID + "PhoneType" + NewRow).val(Contact[0].PhoneType);

                for (j = 1; j < Email.length; j++) {
                    var HTML = '<br/>';
                    HTML += '<div class="newEmaildiv"><input TabIndex="1" type="text" id="txt' + ID + 'Email' + NewRow + '' + j + '" name="nametxt' + ID + 'Email' + NewRow + '' + j + '" class="clsemail" value="' + Email[j].Email + '" clientidmode="Static"?></div>';
                    $("#tbl" + ID + "Email").find("tr:last-child .newEmaildiv").append(HTML);
                    //$("#txt" + ID + "Email0" + j).val(Email[j].Email);
                }
                for (j = 1; j < Contact.length; j++) {
                    var n = j - 1;
                    var HTML = '<br/>';
                    HTML += '<div class="newcontactdiv"><input type="text" id="txt' + ID + 'Contact' + NewRow + '' + n + '" name="nametxt' + ID + 'Contact' + NewRow + '' + n + '" style="width:50%;" maxlength="10" class="clsmaskphone" placeholder="___-___-____" value="' + Contact[j].Number + '" TabIndex="1" clientidmode="Static"/>&nbsp;<input TabIndex="1" type="text" id="txt' + ID + 'ContactExten' + NewRow + '' + n + '" name="nametxt' + ID + 'ContactExten' + NewRow + '' + n + '" style="width:35%;" maxlength="6" class="clsmaskphoneexten" placeholder="Extension" value="' + Contact[j].Extension + '" clientidmode="Static"/>';
                    HTML += '&nbsp;<label> Phone Type</label> <select id="ddl' + ID + 'PhoneType' + NewRow + '' + n + '" name="nameddl' + ID + 'PhoneType' + NewRow + '' + n + '" class="clsphonetype" cliendidmode="static">' +
                                '<option value="">Select</option>' +
                                '<option value="Cell">Cell Phone #</option>' +
                                '<option value="House">House Phone  #</option>' +
                                '<option value="Work">Work Phone #</option>' +
                                '<option value="Alt">Alt. Phone #</option></select></div>';
                    $("#tbl" + ID + "Email").find("tr:last-child .newcontactdiv").append(HTML);
                    $("#ddl" + ID + "PhoneType" + NewRow + '' + n).val(Contact[j].PhoneType);
                    //$("#" + ContentPlaceHolder + "txt" + ID + "ContactExten0" + j).val(Contact[j].Extension);
                    //$("#" + ContentPlaceHolder + "txt" + ID + "Contact0" + j).val(Contact[j].Number);
                }
            }
            else {
                $("#txt" + ID + "Email" + NewRow).val(Email[0].Email);
                $("#txt" + ID + "FName" + NewRow).val(FName);
                $("#txt" + ID + "LName" + NewRow).val(LName);
                $("#ddl" + ID + "Title" + NewRow).val(Title);
                $("#" + ContentPlaceHolder + "txt" + ID + "ContactExten" + NewRow).val(Contact[0].Extension);
                $("#" + ContentPlaceHolder + "txt" + ID + "Contact" + NewRow).val(Contact[0].Number);
                $("#ddl" + ID + "PhoneType" + NewRow).val(Contact[0].PhoneType);
                $("#txt" + ID + "Fax" + NewRow).val(Fax);

                for (j = 1; j < Email.length; j++) {
                    var HTML = '<br/>';
                    HTML += '<div class="newEmaildiv"><input TabIndex="1" type="text" id="txt' + ID + 'Email' + NewRow + '' + j + '" name="nametxt' + ID + 'Email' + NewRow + '' + j + '" class="clsemail" value="' + Email[j].Email + '" clientidmode="Static"?></div>';
                    $("#tbl" + ID + "Email").find("tr:last-child .newEmaildiv").append(HTML);
                    //$("#txt" + ID + "Email0" + j).val(Email[j].Email);
                }
                for (j = 1; j < Contact.length; j++) {
                    var n = j - 1;
                    var HTML = '<br/>';
                    HTML += '<div class="newcontactdiv"><input type="text" id="txt' + ID + 'Contact' + NewRow + '' + n + '" name="nametxt' + ID + 'Contact' + NewRow + '' + n + '" style="width:50%;" maxlength="10" class="clsmaskphone" placeholder="___-___-____" value="' + Contact[j].Number + '" TabIndex="1" clientidmode="Static"/>&nbsp;';
                    HTML += '<input TabIndex="1" type="text" id="txt' + ID + 'ContactExten' + NewRow + '' + n + '" name="nametxt' + ID + 'ContactExten' + NewRow + '' + n + '" style="width:35%;" maxlength="6" class="clsmaskphoneexten" placeholder="Extension" value="' + Contact[j].Extension + '" clientidmode="Static"/>';
                    HTML += '&nbsp;<label> Phone Type</label><select id="ddl' + ID + 'PhoneType' + NewRow + '' + n + '" name="nameddl' + ID + 'PhoneType' + NewRow + '' + n + '" class="clsphonetype" cliendidmode="static">' +
                                '<option value="">Select</option>' +
                                '<option value="Cell">Cell Phone #</option>' +
                                '<option value="House">House Phone  #</option>' +
                                '<option value="Work">Work Phone #</option>' +
                                '<option value="Alt">Alt. Phone #</option></select>'
                    HTML += '<br></div>';
                    $("#tbl" + ID + "Email").find("tr:last-child .newcontactdiv").append(HTML);
                    $("#ddl" + ID + "PhoneType" + NewRow + '' + n).val(Contact[j].PhoneType);
                    //$("#" + ContentPlaceHolder + "txt" + ID + "ContactExten0" + j).val(Contact[j].Extension);
                    //$("#" + ContentPlaceHolder + "txt" + ID + "Contact0" + j).val(Contact[j].Number);
                }
            }
        }


    </script>


    <style type="text/css">
        .black_overlay {
            display: none;
            position: fixed;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=80);
            overflow-y: hidden;
        }

        .white_content {
            display: none;
            position: absolute;
            top: 10%;
            left: 20%;
            width: auto;
            height: auto;
            padding: 16px;
            border: 10px solid #327FB5;
            background-color: white;
            z-index: 1002;
            overflow: auto;
        }



        .tabs {
            position: relative;
            top: 1px;
            z-index: 2;
        }

        .tab {
            border: 1px solid black;
            background-image: url(images/navigation.jpg);
            background-repeat: repeat-x;
            color: White;
            padding: 2px 10px;
        }

        .selectedtab {
            background: none;
            background-repeat: repeat-x;
            color: black;
        }

        .tabcontents {
            border: 1px solid black;
            padding: 10px;
            /*width: 600px;
            height: 500px;*/
            background-color: white;
        }

        div.dd_chk_select div#caption {
            width: 152px;
            overflow: hidden;
            height: 16px;
            margin-right: 20px;
            margin-left: 2px;
            text-align: left;
            vertical-align: middle;
            position: relative;
            top: 1px;
        }

        .modal {
            position: fixed;
            z-index: 999;
            height: 100%;
            width: 100%;
            top: 0;
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
        }

        .center {
            z-index: 1000;
            margin: 250px 100px 250px 450px;
            padding: 10px;
            width: 130px;
            background-color: White;
            border-radius: 10px;
            filter: alpha(opacity=100);
            opacity: 1;
            -moz-opacity: 1;
        }

            .center img {
                height: 128px;
                width: 128px;
            }

        .clsbtnEditVendor {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- appointment tabs section start -->
    <ul class="appointment_tab">
        <li><a href="Procurement.aspx">Sold Jobs</a></li>
        <li><a href="OverheadExp.aspx">Overhead Expenses</a></li>
    </ul>
    <h1>
        <b>Procurement </b>
        <b>
            <asp:Label ID="lblerrornew" runat="server"></asp:Label></b>
    </h1>
    <div class="form_panel">
        <div class="right_panel">
            <!-- appointment tabs section end -->
            <div class="tabcontents">
                <div class="grid_h">
                    <asp:Button ID="btnDisable" runat="server" Text="Disable" Style="background: url(img/main-header-bg.png) repeat-x; color: #fff;" Height="40px" Width="75px" OnClick="btnDisable_Click" />
                    <%--<strong>Sold Jobs</strong></div>--%>
                    <div class="grid">
                        <div>
                            <asp:GridView ID="grdsoldjobs" runat="server" AutoGenerateColumns="false" CssClass="tableClass" DataKeyNames="CustomerId"
                                Width="100%" OnRowDataBound="grdsoldjobs_RowDataBound" OnSelectedIndexChanged="grdsoldjobs_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField HeaderText="Date Sold" DataField="SoldDate" DataFormatString="{0:d}"
                                        HeaderStyle-Width="11%" />
                                    <asp:TemplateField HeaderText="Customer ID" HeaderStyle-Width="10%">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkcustomerid" runat="server" Text='<%#Eval("CustomerId") %>'
                                                OnClick="lnkcustomerid_Click"></asp:LinkButton>
                                            <asp:HiddenField ID="hdnproductid" runat="server" Value='<%#Eval("ProductId") %>' />
                                            <asp:HiddenField ID="hdnProductTypeId" runat="server" Value='<%#Eval("ProductTypeId") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Customer Name" DataField="LastName" HeaderStyle-Width="10%" />
                                    <asp:TemplateField HeaderText="Sold Jobs #" HeaderStyle-Width="11%">
                                        <ItemTemplate>
                                            <%-- <asp:Label ID="lblsoldjobid" runat="server" Text='<%#Eval("SoldJob#") %>'></asp:Label>--%>
                                            <asp:LinkButton ID="lnksoldjobid" runat="server" Text='<%#Eval("SoldJob#") %>' OnClick="lnksoldjobid_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Install Category" HeaderStyle-Width="16%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCategory" runat="server" Text='<%#Eval("Category") %>' HeaderStyle-Width="200px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Final Material List" HeaderStyle-Width="16%">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkmateriallist" runat="server" Text='<%#Eval("MaterialList") %>'
                                                OnClick="lnkmateriallist_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status/Approval" HeaderStyle-Width="16%">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hdnStatusId" runat="server" Value='<%#Eval("StatusId") %>' />
                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>' ClientIDMode="Static"></asp:Label>
                                            <asp:DropDownList ID="ddlstatus" runat="server" Visible="false" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlstatus_selectedindexchanged">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status/Approval">
                                        <ItemTemplate>
                                            <asp:Label ID="lblReason" runat="server" Text='<%#Eval("Reason") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Paid / Total">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotalPaid" runat="server" Text='<%#Eval("TotalPaid").ToString() +" / " + Eval("TotalPrice").ToString() %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PasswordStatus" HeaderStyle-Width="16%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblfrmPassword" Text="FRM" runat="server"></asp:Label><br />
                                            <br />
                                            <asp:Label ID="lblSalePassword" Text="SLE" runat="server"></asp:Label><br />
                                            <br />
                                            <asp:Label ID="lblADMPassword" Text="ADM" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Charge Order" HeaderStyle-Width="16%">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkCharge" runat="server" CommandName='<%#Eval("TotalPrice") %>' CommandArgument='<%#Eval("CustomerID")+":"+Eval("LastName") %>' OnClick="lnkCharge_Click">Charge Order</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div>
                        <asp:Button ID="Button1" runat="server" Text="" />
                        <asp:ModalPopupExtender ID="mp_sold" runat="server" TargetControlID="Button1"
                            PopupControlID="pnlsold" CancelControlID="btnCancelsold">
                        </asp:ModalPopupExtender>
                        <asp:Panel ID="pnlsold" runat="server" BackColor="White" Height="" Width="500px"
                            Style="display: none;">
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <table style="border: Solid 3px #A33E3F; width: 100%; height: 100%; background: #fff;">
                                        <tr style="background-color: #A33E3F">
                                            <td colspan="4" style="height: 10%; color: White; font-weight: bold; font-size: larger"
                                                align="center">Sold Details
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width: 31%"></td>
                                            <td colspan="3">
                                                <asp:Label ID="lblcheck" runat="server" Text="Please Accept Terms & Conditions" ForeColor="Red"></asp:Label>
                                                <label>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width: 31%">Payment Mode:
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlpaymode" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlpaymode_SelectedIndexChanged">
                                                    <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                                    <asp:ListItem Text="E-Check" Value="E-Check"></asp:ListItem>
                                                    <asp:ListItem Text="Credit/Debit Card (3% fee)" Value="CreditCard"></asp:ListItem>
                                                    <asp:ListItem Text="Check/Escrow" Value="Cash/Escrow"></asp:ListItem>
                                                    <asp:ListItem Text="Financing" Value="Financing"></asp:ListItem>
                                                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td align="right" style="width: 31%">
                                                <asp:Label runat="server" ID="lblMsg" Text="" />
                                                <asp:Label ID="lblPro" runat="server" Text="Promotional Code:"></asp:Label>
                                                <asp:Label ID="lblPwd" runat="server" Text="Password" Visible="false"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPromotionalcode" runat="server"
                                                    MaxLength="30" ViewStateMode="Disabled"></asp:TextBox>
                                                <asp:TextBox ID="txtPwd" runat="server" Visible="false" TextMode="Password"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr id="otheramount" runat="server">
                                            <td align="right" style="width: 31%">Amount($)<asp:Label ID="lblReqAmt" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtAmount" runat="server" EnableViewState="true" onkeypress="return isNumericKey(event);"
                                                    MaxLength="20" ReadOnly="true"></asp:TextBox>
                                                <asp:CheckBox ID="chkedit" runat="server" Text="Edit" onclick="if(this.checked) {ShowPopup();}" />
                                                <label>
                                                    <asp:Label ID="lblAmount" runat="server" Text="Please Enter Amount" ForeColor="Red" CssClass="hide"></asp:Label>
                                                </label>
                                            </td>
                                            <td colspan="2">
                                                <asp:RadioButton ID="rdoChecking" runat="server" Text="Checking" GroupName="checkSave" Checked="true" />
                                                &nbsp;
                                        <asp:RadioButton ID="rdoSaving" runat="server" Text="Saving" GroupName="checkSave" />
                                            </td>
                                        </tr>
                                        <!-- Cradit Card -->
                                        <tr id="Name" runat="server" visible="false">
                                            <td align="center" style="width: 31%">First Name<asp:Label ID="lblFirstName" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFirstName" MaxLength="40" runat="server" Height="20px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Enter First Name" ForeColor="Red" Display="Dynamic" ValidationGroup="CCsold"></asp:RequiredFieldValidator>
                                                <asp:Label runat="server" Text="As displayed on card" Colon="False" ID="Label8" /></small>
                                            </td>
                                            <td align="center" style="width: 31%">Last Name<asp:Label ID="lblLastName" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtLastName" Height="20px" runat="server" MaxLength="40"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Enter Last Name" ForeColor="Red" Display="Dynamic" ValidationGroup="CCsold"></asp:RequiredFieldValidator>
                                                <small>
                                                    <asp:Label runat="server" Text="As displayed on card" Colon="False" ID="lblLastNameMsg" /></small>
                                            </td>
                                        </tr>

                                        <tr id="Address" runat="server" visible="false">
                                            <td align="center" style="width: 31%">Address<asp:Label ID="Label9" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                            </td>
                                            <td>
                                                <textarea name="txtAddress" rows="2" cols="15" id="txtAddress" style="height: 33px; width: 167px;" runat="server"></textarea>

                                            </td>
                                            <td align="right" style="width: 31%" id="labelAmount" visible="false" runat="server">Amount($)<asp:Label ID="Label12" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                            </td>
                                            <td id="amountvalue" visible="false" runat="server">
                                                <asp:TextBox ID="txtccamount" runat="server" EnableViewState="true" onkeypress="return isNumericKey(event);"
                                                    MaxLength="20" ReadOnly="true"></asp:TextBox>
                                                <asp:CheckBox ID="CheckBox1" runat="server" Text="Edit" onclick="if(this.checked) {ShowPopup();}" />
                                                <label>
                                                    <asp:Label ID="Label14" runat="server" Text="Please Enter Amount" ForeColor="Red" CssClass="hide"></asp:Label>
                                                </label>
                                            </td>

                                        </tr>

                                        <tr id="CountryState" runat="server" visible="false">
                                            <td align="center" style="width: 31%">Country<asp:Label ID="Label11" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                            </td>
                                            <td>
                                                <asp:DropDownList runat="server" ID="DropDownList1" AutoPostBack="true">
                                                    <asp:ListItem Text="US" Value="US"></asp:ListItem>
                                                </asp:DropDownList>


                                            </td>
                                            <td align="center" style="width: 31%">State<asp:Label ID="Label13" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                            </td>
                                            <td>
                                                <asp:DropDownList runat="server" ID="ddlState" AutoPostBack="true">
                                                    <asp:ListItem Text="Pennsylvania" Value="Pennsylvania"></asp:ListItem>
                                                </asp:DropDownList>


                                            </td>
                                        </tr>

                                        <tr id="CityZip" runat="server" visible="false">
                                            <td align="center" style="width: 31%">City<asp:Label ID="Label15" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                            </td>
                                            <td>
                                                <asp:DropDownList runat="server" ID="ddlCity" AutoPostBack="true">
                                                    <asp:ListItem Text="Malvern" Value="Malvern"></asp:ListItem>
                                                </asp:DropDownList>


                                            </td>
                                            <td align="center" style="width: 31%">Zip<asp:Label ID="Label17" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtZip" Height="20px" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvZip" runat="server" ControlToValidate="txtZip" ErrorMessage="Enter Zip" ForeColor="Red" Display="Dynamic" ValidationGroup="CCsold"></asp:RequiredFieldValidator>
                                                <asp:Label runat="server" Text="As displayed on card" Colon="False" ID="Label18" />
                                            </td>
                                        </tr>


                                        <tr id="Currency" runat="server" visible="false">
                                            <td align="center" style="width: 31%">Currency<asp:Label ID="lblCurrency" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                            </td>
                                            <td>
                                                <asp:DropDownList runat="server" ID="ddlCurrency" AutoPostBack="true">
                                                    <asp:ListItem Text="U.S. Dollar" Value="USD"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>

                                            <td align="center" style="width: 31%">Expiration Date
                                                <asp:Label ID="lblExpDate" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ccExpireMonth" runat="server">
                                                </asp:DropDownList>

                                                <asp:DropDownList ID="ccExpireYear" runat="server">
                                                </asp:DropDownList>
                                            </td>

                                        </tr>

                                        <tr id="Card" runat="server" visible="false">
                                            <td align="center" style="width: 31%">Card Number<asp:Label ID="lblCardNumber" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCardNumber" Height="20px" runat="server" MaxLength="17"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtCardNumber" ErrorMessage="Enter Card Number" ForeColor="Red" Display="Dynamic" ValidationGroup="CCsold"></asp:RequiredFieldValidator>
                                            </td>


                                            <td align="center" style="width: 31%">Security Code
                                                <asp:Label ID="lblSecurityCode" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSecurityCode" TextMode="Password" Height="20px" runat="server" MaxLength="4"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtSecurityCode" ErrorMessage="Enter Security Code" ForeColor="Red" Display="Dynamic" ValidationGroup="CCsold"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>

                                        <!-- Cradit Card -->

                                        <asp:Panel ID="PanelHide" runat="server">
                                            <tr>
                                                <td align="right" style="width: 31%">Bank<asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtBank" runat="server" CssClass="OnFocus_Cls" Height="20px" pleasholder="Name"
                                                        TabIndex="2" Width="179px"></asp:TextBox>

                                                    <asp:AutoCompleteExtender ID="tdsearchbyname_AutoCompleteExtender" runat="server"
                                                        ServiceMethod="GetCompletionList" MinimumPrefixLength="1" EnableCaching="true"
                                                        CompletionSetCount="1" CompletionInterval="1000" TargetControlID="txtBank">
                                                    </asp:AutoCompleteExtender>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBank" ErrorMessage="Enter Bank" ForeColor="Red" Display="Dynamic" ValidationGroup="sold"></asp:RequiredFieldValidator>
                                                </td>
                                                <td align="right" style="width: 31%">Account #<asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtMFAATRT" runat="server" Height="20px" onkeypress="return isNumericKey(event);"
                                                        MaxLength="10" ViewStateMode="Disabled"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtMFAATRT" ErrorMessage="Enter Account #" ForeColor="Red" ValidationGroup="sold" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="width: 31%">Routing #<asp:Label ID="Label10" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtRoutingNo" MaxLength="10" runat="server" Height="20px" onkeypress="return isNumericKey(event);"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtRoutingNo" ErrorMessage="Enter Synapse User Name" ForeColor="Red" Display="Dynamic" ValidationGroup="sold"></asp:RequiredFieldValidator>
                                                </td>
                                                <td align="right" style="width: 31%">Last 4 SSN<asp:Label ID="Label16" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtLASTSSN" TextMode="Password" Height="20px" runat="server" onkeypress="return isNumericKey(event);"
                                                        MaxLength="4" ViewStateMode="Disabled"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtLASTSSN" ErrorMessage="Enter SSN" ForeColor="Red" Display="Dynamic" ValidationGroup="sold"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="width: 31%">D.O.B<asp:Label ID="Label19" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtDOB" Height="20px" runat="server"></asp:TextBox>
                                                    <asp:CalendarExtender ID="calExt" runat="server" TargetControlID="txtDOB"></asp:CalendarExtender>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtDOB" ErrorMessage="Enter Date of Birth" ForeColor="Red" Display="Dynamic" ValidationGroup="sold"></asp:RequiredFieldValidator>
                                                </td>
                                                <td align="right" style="width: 31%">Personal/Bussiness<asp:Label ID="Label20" runat="server" Text="*" ForeColor="Red"></asp:Label>:
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlperbus" runat="server">
                                                        <asp:ListItem Selected="True" Text="Select" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="Personal" Value="Personal"></asp:ListItem>
                                                        <asp:ListItem Text="Bussiness" Value="Bussiness"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlperbus" ErrorMessage="Select Account Type" ForeColor="Red" InitialValue="0" Display="Dynamic" ValidationGroup="sold"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>


                                        </asp:Panel>
                                        <tr>
                                            <td align="right" style="width: 31%">
                                                <asp:UpdatePanel ID="upnlAdd" runat="server">
                                                    <ContentTemplate>
                                                        <asp:LinkButton ID="lnkbtnAdd" OnClick="lnkbtnAdd_Click" runat="server">Add Email</asp:LinkButton>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                            <td colspan="3">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <asp:TextBox ID="txtEmailId" runat="server" placeholder="Email Id"
                                                            ViewStateMode="Disabled"></asp:TextBox>
                                                        <br />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtEmailId" ErrorMessage="Enter Email Id" ForeColor="Red" Display="Dynamic" ValidationGroup="sold"></asp:RequiredFieldValidator>
                                                        <asp:Panel ID="pnlControls" runat="server" Style="width: 300px;">
                                                        </asp:Panel>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="lnkbtnAdd" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr id="trauthpass" class="hide">
                                            <td align="right" style="width: 31%">Admin Password:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtauthpass" runat="server" TextMode="Password"></asp:TextBox>
                                                <label>
                                                    <asp:Label ID="lblPassword" runat="server" Text="Please Enter Password" ForeColor="Red" CssClass="hide"></asp:Label>
                                                </label>
                                                <asp:CustomValidator ID="CV" runat="server" ErrorMessage="Invalid Password"></asp:CustomValidator>
                                            </td>
                                        </tr>
                                        <tr id="trcheque" class="hide">
                                            <td align="right" style="width: 31%">Check #:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtchequeno" runat="server" onkeypress="return isNumericKey(event);"
                                                    MaxLength="50"></asp:TextBox>
                                                <label>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr id="trcard" class="hide">
                                            <td align="right" style="width: 31%">Card Holder's Details:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtcardholderNm" runat="server" MaxLength="200"></asp:TextBox>
                                                <label>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width: 31%">
                                                <asp:CheckBox ID="chkSendEmailSold" runat="server" Checked="true" />
                                            </td>
                                            <td>Send email to customer
                                            </td>
                                            <td align="right" colspan="2">
                                                <asp:CheckBox ID="chksignature" Checked="false" runat="server" />
                                                I Signed & Agreed on Terms & Conditions
                                            </td>
                                        </tr>

                                        <tr>
                                            <td align="center" colspan="4">
                                                <asp:Button ID="btnsavesold" CommandName="Insert" runat="server" Text="Save" ValidationGroup="sold"
                                                    OnClick="btnSold_Click" Style="margin-left: -150px; margin-top: 25px" />
                                                <asp:Button ID="btnSaveSold2" runat="server" OnClick="btnSaveSold2_Click" ValidationGroup="CCsold" Text="Save" Visible="false" Style="margin-left: -150px; margin-top: 25px" />
                                                <asp:Button ID="btnCancelsold" runat="server" Text="Cancel" Width="100" Style="margin-top: -15px" OnClick="btnCancelsold_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btnSaveSold2" />
                                    <asp:PostBackTrigger ControlID="btnsavesold" />
                                    <asp:PostBackTrigger ControlID="btnCancelsold" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </asp:Panel>
                    </div>
                    <div class="btn_sec">
                        <asp:Button ID="btnAddcategory" runat="server" Text="Add Category" Visible="false" OnClick="btnAddcategory_Click" />
                        <asp:Button ID="btndeletecategory" runat="server" Text="Delete Category" Visible="false" OnClick="btndeletecategory_Click" />
                        <br />
                        <br />
                        <br />
                    </div>
                    <div>
                        <asp:ModalPopupExtender ID="mpevendorcatelog" runat="server" TargetControlID="btnAddcategory"
                            PopupControlID="pnlpopup" CancelControlID="btnCancel">
                        </asp:ModalPopupExtender>


                        <asp:Panel ID="pnlpopup" runat="server" BackColor="White" Height="269px" Width="550px"
                            Style="display: none; border: Solid 3px #A33E3F; border-radius: 10px 10px 0 0;">
                            <table style="border: Solid 3px #A33E3F; width: 100%; height: 100%;" cellpadding="0"
                                cellspacing="0">
                                <tr style="background-color: #A33E3F">
                                    <td colspan="2" style="height: 10%; color: White; font-weight: bold; font-size: larger; width: 100%;"
                                        align="center">Add Vendor Category
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 31%">Vendor Category Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtname" runat="server" onkeypress="return isAlphaKey(event);"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="Requiredvendorcategoryname" runat="server" ControlToValidate="txtname"
                                            ValidationGroup="addvendorcategory" ErrorMessage="Enter Category Name." ForeColor="Red"
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <asp:Button ID="btnUpdate" CommandName="Update" Style="width: 100px;" runat="server"
                                            Text="Save" OnClick="btnsave_Click" ValidationGroup="addvendorcategory" />
                                        <asp:Button ID="btnCancel" runat="server" Style="width: 100px;" Text="Cancel" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:ModalPopupExtender ID="Mpedeletecategory" runat="server" TargetControlID="btndeletecategory"
                            PopupControlID="pnlpopup2" CancelControlID="btnCancel2">
                        </asp:ModalPopupExtender>
                        <asp:Panel ID="pnlpopup2" runat="server" BackColor="White" Height="269px" Width="550px" CssClass="pnlDeleteVendor"
                            Style="display: none">
                        </asp:Panel>
                        <button id="btnquotes" style="display: none" runat="server">
                        </button>
                        <button id="btnmateriallist" style="display: none" runat="server">
                        </button>
                        <asp:ModalPopupExtender ID="ModalMateriallist" runat="server" PopupControlID="PanelMateriallist"
                            TargetControlID="btnmateriallist" CancelControlID="btncancelmateriallist">
                        </asp:ModalPopupExtender>
                        <asp:Panel ID="PanelMateriallist" runat="server" BackColor="White" Height="269px"
                            Width="550px" Style="display: none">
                            <table width="100%" style="border: Solid 3px #A33E3F; width: 100%; height: 100%"
                                cellpadding="0" cellspacing="0">
                                <tr style="background-color: #A33E3F">
                                    <td colspan="2" style="height: 10%; color: White; font-weight: bold; font-size: larger"
                                        align="center">Edit Material List
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 45%">Material List
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtmateriallist" TextMode="MultiLine" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <asp:Button ID="btnsavematerials" CommandName="Save" runat="server" Style="width: 100px;"
                                            Text="Save Quotes" />
                                        <asp:Button ID="btncancelmateriallist" runat="server" Text="Cancel" Style="width: 100px;" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </div>

                    <div id="divVendorFilter" class="vendorFilter">
                        <div align="left">
                            <h2>Vendor Contacts</h2>
                            <br />
                        </div>
                        <asp:UpdatePanel ID="updtpnlfilter" runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <table style="width:100%;border-collapse:collapse;border-width:1px">
                                    <tr>
                                        <td ><b>Vendor Status</b>
                                          <div>
                                            <asp:DropDownList ID="ddlVendorStatusfltr" runat="server" TabIndex="1" Style="width: 120px;" AutoPostBack="true" OnSelectedIndexChanged="ddlVendorStatusfltr_SelectedIndexChanged">
                                                <asp:ListItem>Select</asp:ListItem>
                                                <asp:ListItem Selected="True">All</asp:ListItem>
                                                <asp:ListItem>Prospect</asp:ListItem>
                                                <asp:ListItem>Active-Past</asp:ListItem>
                                                <asp:ListItem>Deactivate</asp:ListItem>
                                            </asp:DropDownList>
                                          </div>
                                        </td>
                                        <td style="padding-top: 25px;">
                                          <asp:RadioButton ID="rdoAll" runat="server" Checked="true" Text="All" GroupName="MT" OnCheckedChanged="rdoAll_CheckedChanged" AutoPostBack="true" />
                                          <asp:RadioButton ID="rdoRetailWholesale" runat="server" Checked="false" Text="Retail/Wholesale" GroupName="MT" OnCheckedChanged="rdoRetailWholesale_CheckedChanged" AutoPostBack="true" />
                                        
                                            <asp:RadioButton ID="rdoManufacturer" runat="server" Text="Manufacturer" GroupName="MT" OnCheckedChanged="rdoManufacturer_CheckedChanged" AutoPostBack="true" />
                                        </td>
                                        <td style="padding-top: 19px;">
                                            <%--<div class="ui-widget">--%>
                                            <asp:TextBox ID="txtVendorSearchBox" runat="server" placeholder="Search" Width="90%"></asp:TextBox>
                                            <%--</div>--%>
                                        </td>
                                        <td>
                                        <asp:ImageButton ID="btnSearchProcVendor" runat="server" ImageUrl="~/img/search_btn.png" CssClass="searchbtn" Style="display: none;" OnClick="btnSearch_Click" /></td>
                                        <input type="hidden" id="hdnvendorId" name="vendorId" />
                                        <input type="hidden" id="hdnVendorAddId" name="hdnVendorAddId" />
                                        <asp:Button ID="btnEditVendor" runat="server" Text="EditVendor" CssClass="clsbtnEditVendor" OnClick="btneditVendor_Click" />

                                    </tr>
                                    <tr>
                                        <td style="padding-top: 19px;"><b>Product Category</b>
                                          <div>
                                            <asp:CheckBox runat="server" ID="chkProductCategorySelectAll" AutoPostBack="true" Text="Select All" OnCheckedChanged="chkProductCategorySelectAll_CheckChanged"/>
                                          </div>
                                          <div>
                                            <%--<asp:DropDownList ID="ddlprdtCategory" runat="server" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="ddlprdtCategory_SelectedIndexChanged"></asp:DropDownList>--%>
                                            <asp:DropDownCheckBoxes CssClass="form_panel_checkbox_dropdown" ID="ddlprdtCategory" runat="server" UseSelectAllNode="false" AutoPostBack="true" OnSelectedIndexChanged="ddlprdtCategory_SelectedIndexChanged">
                                                <Style SelectBoxWidth="100%" DropDownBoxBoxWidth="190" DropDownBoxBoxHeight="150" />
                                                <Items></Items>
                                            </asp:DropDownCheckBoxes>
                                            </div>
                                        </td>
                                        <td style="padding-top: 19px;"><b>Vendor Category</b>
                                          <div>
                                            <asp:CheckBox runat="server" ID="chkVendorCategorySelectAll" Text="Select All" AutoPostBack="true" OnCheckedChanged="chkVendorCategorySelectAll_CheckedChanged" />
                                          </div>
                                          <div>
                                            <%--<asp:DropDownList ID="ddlVndrCategory" runat="server" Width="150px" AutoPostBack="True" OnSelectedIndexChanged="ddlVndrCategory_SelectedIndexChanged"></asp:DropDownList>--%>
                                            <asp:DropDownCheckBoxes CssClass="form_panel_checkbox_dropdown" ID="ddlVndrCategory" runat="server" UseSelectAllNode="false" AutoPostBack="true" OnSelectedIndexChanged="ddlVndrCategory_SelectedIndexChanged">
                                                <Style SelectBoxWidth="100%" DropDownBoxBoxWidth="120" DropDownBoxBoxHeight="150" />
                                                <Items></Items>
                                            </asp:DropDownCheckBoxes>
                                            <br />
                                            <asp:LinkButton ID="lnkAddVendorCategory1" Text="Add Vendor Category" Visible="false" runat="server" OnClick="lnkAddVendorCategory1_Click"></asp:LinkButton>
                                            <br />
                                            <asp:ModalPopupExtender ID="ModalPopupExtender3" runat="server" TargetControlID="lnkAddVendorCategory1"
                                                PopupControlID="pnlpopupVendorCategory" CancelControlID="btnCancelVendor">
                                            </asp:ModalPopupExtender>
                                            <asp:Panel ID="pnlpopupVendorCategory" runat="server" BackColor="White" Height="269px" Width="550px"
                                                Style="display: none; border: Solid 3px #A33E3F; border-radius: 10px 10px 0 0;">
                                                <table style="border: Solid 3px #A33E3F; width: 100%; height: 100%;" cellpadding="0"
                                                    cellspacing="0">
                                                    <tr style="background-color: #A33E3F">
                                                        <td colspan="2" style="height: 10%; color: White; font-weight: bold; font-size: larger; width: 100%;"
                                                            align="center">Add Vendor Category
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="width: 31%">Product Category Name
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlProductCatgoryPopup" runat="server" Width="150px"></asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlProductCatgoryPopup"
                                                                ValidationGroup="addvendorcat" ErrorMessage="Select Product Category Name." InitialValue="Select" ForeColor="Red"
                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="width: 31%">Vendor Category Name
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtnewVendorCat" runat="server" onkeypress="return isAlphaKey(event);"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtnewVendorCat"
                                                                ValidationGroup="addvendorcat" ErrorMessage="Enter Vendor Category Name." ForeColor="Red"
                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="width: 31%">Manufacturer Type
                                                        </td>
                                                        <td>

                                                            <asp:CheckBox ID="chkVCRetail_Wholesale" runat="server" Text="Retail/Wholesale" />
                                                            <asp:CheckBox ID="chkVCManufacturer" runat="server" Text="Manufacturer" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="center">
                                                            <asp:Button ID="btnNewVendor" Style="width: 100px;" runat="server"
                                                                OnClick="btnNewVendor_Click" Text="Save" ValidationGroup="addvendorcat" />
                                                            <asp:Button ID="btnCancelVendor" runat="server" Style="width: 100px;" Text="Cancel" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            <asp:LinkButton ID="Lnkdeletevendercategory1" Text="Delete Vendor Category" Visible="false" runat="server"></asp:LinkButton>
                                            <asp:ModalPopupExtender ID="ModalPopupExtender4" runat="server" TargetControlID="Lnkdeletevendercategory1"
                                                PopupControlID="pnlpopupdeleteVendorCategory" CancelControlID="btnCancel2">
                                            </asp:ModalPopupExtender>
                                            <asp:Panel ID="pnlpopupdeleteVendorCategory" runat="server" BackColor="White" Height="269px" Width="550px" CssClass="pnlDeleteVendor"
                                                Style="display: none">
                                                <table width="100%" style="border: Solid 3px #A33E3F; width: 100%; height: 100%"
                                                    cellpadding="0" cellspacing="0">
                                                    <tr style="background-color: #A33E3F">
                                                        <td colspan="2" style="height: 10%; color: White; font-weight: bold; font-size: larger"
                                                            align="center">Delete Vendor Category
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="width: 45%">Select Vendor Category Name
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlvendercategoryname" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="center">
                                                            <asp:Button ID="btndeletevender" CommandName="Delete" runat="server" Style="width: 100px;"
                                                                Text="Delete" OnClick="btndelete_Click" />
                                                            <asp:Button ID="btnCancel2" runat="server" Text="Cancel" Style="width: 100px;" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            </div>
                                        </td>
                                        <td style="padding-top: 19px;"><b>Vendor Sub Category</b>
                                          <div>
                                            <asp:CheckBox runat="server" ID="chkVendorSubCategorySelectAll" Text="Select All" AutoPostBack="true" OnCheckedChanged="chkVendorSubCategorySelectAll_CheckedChanged" />
                                          </div>
                                          <div>
                                            <%--<asp:DropDownList ID="ddlVendorSubCategory" runat="server" Width="150px" AutoPostBack="True" OnSelectedIndexChanged="ddlVendorSubCategory_SelectedIndexChanged"></asp:DropDownList>--%>
                                            <asp:DropDownCheckBoxes CssClass="form_panel_checkbox_dropdown" ID="ddlVendorSubCategory" runat="server" UseSelectAllNode="false" AutoPostBack="true" OnSelectedIndexChanged="ddlVendorSubCategory_SelectedIndexChanged">
                                                <Style SelectBoxWidth="100%" DropDownBoxBoxWidth="120" DropDownBoxBoxHeight="150" />
                                                <Items></Items>
                                            </asp:DropDownCheckBoxes>
                                            <br />
                                            <asp:LinkButton ID="lnkAddVendorSubCategory" Text="Add Vendor Sub Category" Visible="false" runat="server"></asp:LinkButton>
                                            <asp:ModalPopupExtender ID="ModalPopupExtender5" runat="server" TargetControlID="lnkAddVendorSubCategory"
                                                PopupControlID="pnlvendorSubCat" CancelControlID="btnCancelVendorSubCat">
                                            </asp:ModalPopupExtender>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <asp:Panel ID="pnlvendorSubCat" runat="server" BackColor="White" Height="269px" Width="550px"
                                                        Style="display: none; border: Solid 3px #A33E3F; border-radius: 10px 10px 0 0;">
                                                        <table style="border: Solid 3px #A33E3F; width: 100%; height: 100%;" cellpadding="0"
                                                            cellspacing="0">
                                                            <tr style="background-color: #A33E3F">
                                                                <td colspan="2" style="height: 10%; color: White; font-weight: bold; font-size: larger; width: 100%;"
                                                                    align="center">Add Vendor Sub Category
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" style="width: 31%">Vendor Category Name
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlVendorCatPopup" runat="server" Width="150px"></asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlVendorCatPopup"
                                                                        ValidationGroup="addvendorsubcat" ErrorMessage="Select Vendor Category Name." InitialValue="Select" ForeColor="Red"
                                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" style="width: 31%">Vendor Sub Category Name
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtVendorSubCat" runat="server" onkeypress="return isAlphaKey(event);"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtVendorSubCat"
                                                                        ValidationGroup="addvendorsubcat" ErrorMessage="Enter Vendor Sub Category Name." ForeColor="Red"
                                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" style="width: 31%">Manufacturer Type
                                                                </td>
                                                                <td>
                                                                    <asp:CheckBox ID="chkVSCRetail_Wholesale" runat="server" Text="Retail/Wholesale" />
                                                                    <asp:CheckBox ID="chkVSCManufacturer" runat="server" Text="Manufacturer" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" align="center">
                                                                    <asp:Button ID="btnVendorSubCat" Style="width: 100px;" runat="server"
                                                                        OnClick="btnNewVendorSubCat_Click" Text="Save" ValidationGroup="addvendorsubcat" />
                                                                    <asp:Button ID="btnCancelVendorSubCat" runat="server" Style="width: 100px;" Text="Cancel" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <asp:LinkButton ID="lnkdeletevendersubcategory" Text="Delete Vendor Sub Category" Visible="false" runat="server"></asp:LinkButton>
                                            <asp:ModalPopupExtender ID="ModalPopupExtender6" runat="server" TargetControlID="Lnkdeletevendersubcategory"
                                                PopupControlID="pnldeleteVendorSubCat" CancelControlID="btnCancelDelete">
                                            </asp:ModalPopupExtender>
                                            <asp:Panel ID="pnldeleteVendorSubCat" runat="server" BackColor="White" Height="269px" Width="550px"
                                                Style="display: none; border: Solid 3px #A33E3F; border-radius: 10px 10px 0 0;">
                                                <table style="border: Solid 3px #A33E3F; width: 100%; height: 100%;" cellpadding="0"
                                                    cellspacing="0">
                                                    <tr style="background-color: #A33E3F">
                                                        <td colspan="2" style="height: 10%; color: White; font-weight: bold; font-size: larger; width: 100%;"
                                                            align="center">Delete Vendor Sub Category
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="width: 31%">Select Vendor Sub Category
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlvendorsubcatpopup" runat="server" Width="150px"></asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlvendorsubcatpopup"
                                                                ValidationGroup="deletevendorsubcat" ErrorMessage="Select Vendor Sub Category Name." InitialValue="Select" ForeColor="Red"
                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="2" align="center">
                                                            <asp:Button ID="btndeleteVendorSubCat" Style="width: 100px;" runat="server"
                                                                OnClick="btndeleteVendorSubCat_Click" Text="Delete" ValidationGroup="deletevendorsubcat" />
                                                            <asp:Button ID="btnCancelDelete" runat="server" Style="width: 100px;" Text="Cancel" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            </div>
                                        </td>
                                      <td></td>
                                    </tr>
                                </table>
                                <div style="width: 100%">
                                    <div class="grid_h" style="width: 47%; float: left; box-sizing: border-box;">
                                        <h2>Vendor List</h2>
                                    </div>
                                    <div class="grid">
                                        <asp:GridView ID="grdVendorList" runat="server" AutoGenerateColumns="false" CssClass="tableClass" Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Vendor Name">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkVendorName" runat="server" Text='<%#Eval("Zip").ToString()==""?Eval("VendorName"):Eval("VendorName")+" - " +Eval("Zip")  %>' OnClick="lnkVendorName_Click"></asp:LinkButton>
                                                        <asp:HiddenField ID="hdnVendorId" runat="server" Value='<%#Eval("VendorId") %>' />
                                                        <asp:HiddenField ID="hdnVendorAddressId" runat="server" Value='<%#Eval("AddressId") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkDeleteVendor" runat="server" OnClientClick="return confirm('Are you sure want to delete vendor?');" OnClick="lnkDeleteVendor_Click">Delete</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                No Data Found.
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </div>
                                    <div style="width: 50%; float: initial; margin-left: 3%; margin-top: 20px; box-sizing: border-box; display: none;">
                                        <div id="googleMap" style="width: 100%; height: 254px;"></div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:HiddenField ID="hidIsEditVendor" runat="server" Value="false" />
                    </div>
                    <br />

                    <asp:UpdatePanel ID="updtpnlAddVender" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
                            <asp:TabContainer ID="tabContainer" runat="server">
                                <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="Add/Edit Vendor">
                                    <ContentTemplate>
                                        <div id="divVendor" class="vendorForm">
                                            <ul style="padding: 0px;">
                                                <li style="width: 99%; padding-left: 0px; margin-left: 0px;">
                                                    <table border="0" cellspacing="0" cellpadding="0" style="padding: 0px; margin: 0px;">
                                                        <tr>
                                                            <td colspan="2">
                                                                <span style="font-weight: bold; font-size: 15px; font-style: normal; padding: 15px 15px 5px; display: inline-block;">Add Vendor</span>
                                                                <asp:LinkButton ID="btnAddNewVenodr" runat="server" OnClick="btnAddNewVenodr_Click" CssClass="btnNewAddress">Add New Vendor</asp:LinkButton>
                                                            </td>
                                                            <td colspan="2"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:HiddenField ID="hdnVendorID" runat="server" />
                                                                <label>Vendor Id #:</label>&nbsp;<asp:LinkButton ID="txtVendorId" runat="server"></asp:LinkButton>
                                                                <br />
                                                                <label><span>* </span>Vendor Name:</label><br />
                                                                <asp:TextBox ID="txtVendorNm" runat="server" MaxLength="30" TabIndex="1" AutoComplete="off"></asp:TextBox><br />
                                                                <asp:RequiredFieldValidator ID="Requiredvendorname" runat="server" ControlToValidate="txtVendorNm" Display="Dynamic"
                                                                    ValidationGroup="addvendor" ErrorMessage="Please Enter Vendor Name." ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                <label><span>* </span>Website:</label><br />
                                                                <asp:DropDownList ID="ddlWebSite" runat="server" TabIndex="2" Width="250px">
                                                                </asp:DropDownList><br />
                                                                <asp:TextBox ID="txtWebsite" TabIndex="3" runat="server" MaxLength="100"></asp:TextBox>
                                                                <asp:Button runat="server" ID="btnAddWebsite" TabIndex="4" Text="Add" ValidationGroup="AddWebsite" Style="background: url(img/main-header-bg.png) repeat-x; color: #fff; cursor: pointer;" OnClick="btnAddWebsite_Click" Height="30px" />&nbsp;
                                                                <asp:RequiredFieldValidator ID="rfvWebSite" runat="server" ControlToValidate="ddlWebSite" Display="Dynamic"
                                                                    ValidationGroup="addvendor" ErrorMessage="Please Enter Website." ForeColor="Red"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="revWebsite" runat="server" ControlToValidate="txtWebsite" Display="Dynamic"
                                                                    ValidationGroup="AddWebsite" ErrorMessage="Please Enter Valid Website." ForeColor="Red" ValidationExpression="(([\w]+:)?\/\/)?(([\d\w]|%[a-fA-f\d]{2,2})+(:([\d\w]|%[a-fA-f\d]{2,2})+)?@)?([\d\w][-\d\w]{0,253}[\d\w]\.)+[\w]{2,4}(:[\d]+)?(\/([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)*(\?(&?([-+_~.\d\w]|%[a-fA-f\d]{2,2})=?)*)?(#([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)?$" />
                                                            </td>
                                                            <td>
                                                                <label>Vendor Source<asp:Label ID="lblSourceReq" runat="server" Text="*" ForeColor="Green"></asp:Label></label>
                                                                <asp:DropDownList ID="ddlSource" runat="server" TabIndex="3" Width="250px">
                                                                </asp:DropDownList>
                                                                <asp:TextBox ID="txtSource" runat="server" TabIndex="4" Width="125px"></asp:TextBox>
                                                                <asp:Button runat="server" ID="btnAddSource" TabIndex="5" Text="Add" Style="background: url(img/main-header-bg.png) repeat-x; color: #fff; cursor: pointer;" OnClick="btnAddSource_Click" Height="30px" />&nbsp;
                                                                <asp:Button runat="server" ID="btnDeleteSource" TabIndex="6" Style="background: url(img/main-header-bg.png) repeat-x; color: #fff; cursor: pointer;" Text="Delete" OnClick="btnDeleteSource_Click" Height="30px" />
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="rfvSource" runat="server" ControlToValidate="ddlSource" Display="Dynamic" 
                                                                 ValidationGroup="addvendor" ErrorMessage="Please select the source." ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                <label>General Phone No :</label><br />
                                                                <asp:TextBox ID="txtGeneralPhone" runat="server" placeholder='___-___-____' MaxLength="10" onkeypress="return isNumericKey(event);" CssClass="clsmaskphone"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label>Vendor Status</label><br />
                                                                <asp:DropDownList ID="ddlVendorStatus" runat="server" TabIndex="3">
                                                                    <asp:ListItem Value="Prospect" Selected="True">Prospect</asp:ListItem>
                                                                    <asp:ListItem Value="Active">Active</asp:ListItem>
                                                                    <asp:ListItem Value="Deactivate">Deactivate</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td colspan="2">
                                                                <label>Hours of operation:</label><br />
                                                                <asp:CheckBox ID="chk24Hours" runat="server" Text="24 Hr" />
                                                                <asp:DropDownList ID="ddlHoursOfOperation" runat="server" TabIndex="3" Width="180px" OnSelectedIndexChanged="ddlHoursOfOperation_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <br />
                                                                <asp:DropDownList ID="ddlDays" runat="server" TabIndex="3">
                                                                    <asp:ListItem Value="M-F">Mon-Fri</asp:ListItem>
                                                                    <asp:ListItem Value="M-S">Mon-Sat</asp:ListItem>
                                                                    <asp:ListItem Value="Sat">Sat</asp:ListItem>
                                                                    <asp:ListItem Value="S-S">Sat-Sun</asp:ListItem>
                                                                    <asp:ListItem Value="Sun">Sun</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:DropDownList ID="ddlFromHours" runat="server" TabIndex="3">
                                                                </asp:DropDownList>
                                                                <asp:DropDownList ID="ddlFromAMPM" runat="server" TabIndex="3">
                                                                    <asp:ListItem Value="AM">AM</asp:ListItem>
                                                                    <asp:ListItem Value="PM">PM</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:DropDownList ID="ddlToHours" runat="server" TabIndex="3">
                                                                </asp:DropDownList>
                                                                <asp:DropDownList ID="ddlToAMPM" runat="server" TabIndex="3">
                                                                    <asp:ListItem Value="AM">AM</asp:ListItem>
                                                                    <asp:ListItem Value="PM">PM</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:Button runat="server" ID="btnHoursOfOperation" TabIndex="4" Text="Add" Style="background: url(img/main-header-bg.png) repeat-x; color: #fff; cursor: pointer;" OnClick="btnHoursOfOperation_Click" Height="30px" />
                                                                <br />
                                                                <label>Note : Select 00-AM to 00-AM for Close</label>
                                                            </td>
                                                            <td>
                                                                <label>Fax Number :</label><br />
                                                                <asp:TextBox ID="txtFaxNumber" TabIndex="1" runat="server" placeholder='___-___-____' MaxLength="10" onkeypress="return isNumericKey(event);" CssClass="clsmaskphone"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4" style="padding: 0px;">
                                                                <table class="vendor_table">
                                                                    <tr class="fixedAddressrow">
                                                                        <td colspan="2">
                                                                            <span style="font-weight: bold; font-size: 15px; font-style: normal; padding: 15px 15px 5px; display: inline-block;">Vendor Address</span>
                                                                            <asp:LinkButton ID="lblNewAddress" runat="server" OnClientClick="return SetVendorEmails(this)" OnClick="lblNewAddress_Click" CssClass="btnNewAddress">Add New Address</asp:LinkButton>
                                                                        </td>
                                                                        <td>
                                                                            <label>Address Location:</label><br />
                                                                            <asp:DropDownList ID="DrpVendorAddress" TabIndex="1" AutoPostBack="True" OnSelectedIndexChanged="DrpVendorAddress_SelectedIndexChanged" runat="server" Style="width: 180px;" CssClass="clsvendoraddress">
                                                                                <asp:ListItem Value="0">Primary</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr class="fixedAddressrow">
                                                                        <td style="width: 12%">
                                                                            <label>Zip:</label><br />
                                                                            <asp:TextBox ID="txtPrimaryZip" runat="server" TabIndex="1" placeholder="Zip" CssClass="clstxtZip0" onkeypress="return isNumericKey(event);" autocomplete="off" onblur="GetCityStateOnBlur(this)"></asp:TextBox>
                                                                        </td>
                                                                        <td style="width: 12%">
                                                                            <label>City:</label><br />
                                                                            <asp:TextBox ID="txtPrimaryCity" runat="server" TabIndex="1" placeholder="City" CssClass="clstxtCity0"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            <label>State</label><br />
                                                                            <asp:TextBox ID="txtPrimaryState" runat="server" TabIndex="1" placeholder="State" CssClass="clstxtState0"></asp:TextBox>
                                                                        </td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <label>Address:</label><br />
                                                                            <asp:TextBox ID="txtPrimaryAddress" runat="server" TabIndex="1" placeholder="Address" TextMode="MultiLine" Columns="40" Rows="2" CssClass="clstxtAddress0" Width="86%"></asp:TextBox>
                                                                            <br />
                                                                            <asp:RequiredFieldValidator ID="RfvAddress" runat="server" ControlToValidate="txtPrimaryAddress" Display="Dynamic"
                                                                                ValidationGroup="addvendor" ErrorMessage="Please Enter Primary Address." ForeColor="Red"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                        <td>
                                                                            <label>Country:</label><br />
                                                                            <asp:DropDownList ID="ddlCountry" TabIndex="1" runat="server" Width="190px" CssClass="clstxtCountry0">
                                                                                <asp:ListItem>Select Country</asp:ListItem>
                                                                                <asp:ListItem Value="AF">Afghanistan</asp:ListItem>
                                                                                <asp:ListItem Value="AL">Albania</asp:ListItem>
                                                                                <asp:ListItem Value="DZ">Algeria</asp:ListItem>
                                                                                <asp:ListItem Value="AS">American Samoa</asp:ListItem>
                                                                                <asp:ListItem Value="AD">Andorra</asp:ListItem>
                                                                                <asp:ListItem Value="AO">Angola</asp:ListItem>
                                                                                <asp:ListItem Value="AI">Anguilla</asp:ListItem>
                                                                                <asp:ListItem Value="AQ">Antarctica</asp:ListItem>
                                                                                <asp:ListItem Value="AG">Antigua And Barbuda</asp:ListItem>
                                                                                <asp:ListItem Value="AR">Argentina</asp:ListItem>
                                                                                <asp:ListItem Value="AM">Armenia</asp:ListItem>
                                                                                <asp:ListItem Value="AW">Aruba</asp:ListItem>
                                                                                <asp:ListItem Value="AU">Australia</asp:ListItem>
                                                                                <asp:ListItem Value="AT">Austria</asp:ListItem>
                                                                                <asp:ListItem Value="AZ">Azerbaijan</asp:ListItem>
                                                                                <asp:ListItem Value="BS">Bahamas</asp:ListItem>
                                                                                <asp:ListItem Value="BH">Bahrain</asp:ListItem>
                                                                                <asp:ListItem Value="BD">Bangladesh</asp:ListItem>
                                                                                <asp:ListItem Value="BB">Barbados</asp:ListItem>
                                                                                <asp:ListItem Value="BY">Belarus</asp:ListItem>
                                                                                <asp:ListItem Value="BE">Belgium</asp:ListItem>
                                                                                <asp:ListItem Value="BZ">Belize</asp:ListItem>
                                                                                <asp:ListItem Value="BJ">Benin</asp:ListItem>
                                                                                <asp:ListItem Value="BM">Bermuda</asp:ListItem>
                                                                                <asp:ListItem Value="BT">Bhutan</asp:ListItem>
                                                                                <asp:ListItem Value="BO">Bolivia</asp:ListItem>
                                                                                <asp:ListItem Value="BA">Bosnia And Herzegowina</asp:ListItem>
                                                                                <asp:ListItem Value="BW">Botswana</asp:ListItem>
                                                                                <asp:ListItem Value="BV">Bouvet Island</asp:ListItem>
                                                                                <asp:ListItem Value="BR">Brazil</asp:ListItem>
                                                                                <asp:ListItem Value="IO">British Indian Ocean Territory</asp:ListItem>
                                                                                <asp:ListItem Value="BN">Brunei Darussalam</asp:ListItem>
                                                                                <asp:ListItem Value="BG">Bulgaria</asp:ListItem>
                                                                                <asp:ListItem Value="BF">Burkina Faso</asp:ListItem>
                                                                                <asp:ListItem Value="BI">Burundi</asp:ListItem>
                                                                                <asp:ListItem Value="KH">Cambodia</asp:ListItem>
                                                                                <asp:ListItem Value="CM">Cameroon</asp:ListItem>
                                                                                <asp:ListItem Value="CA">Canada</asp:ListItem>
                                                                                <asp:ListItem Value="CV">Cape Verde</asp:ListItem>
                                                                                <asp:ListItem Value="KY">Cayman Islands</asp:ListItem>
                                                                                <asp:ListItem Value="CF">Central African Republic</asp:ListItem>
                                                                                <asp:ListItem Value="TD">Chad</asp:ListItem>
                                                                                <asp:ListItem Value="CL">Chile</asp:ListItem>
                                                                                <asp:ListItem Value="CN">China</asp:ListItem>
                                                                                <asp:ListItem Value="CX">Christmas Island</asp:ListItem>
                                                                                <asp:ListItem Value="CC">Cocos (Keeling) Islands</asp:ListItem>
                                                                                <asp:ListItem Value="CO">Colombia</asp:ListItem>
                                                                                <asp:ListItem Value="KM">Comoros</asp:ListItem>
                                                                                <asp:ListItem Value="CG">Congo</asp:ListItem>
                                                                                <asp:ListItem Value="CK">Cook Islands</asp:ListItem>
                                                                                <asp:ListItem Value="CR">Costa Rica</asp:ListItem>
                                                                                <asp:ListItem Value="CI">Cote D'Ivoire</asp:ListItem>
                                                                                <asp:ListItem Value="HR">Croatia (Local Name: Hrvatska)</asp:ListItem>
                                                                                <asp:ListItem Value="CU">Cuba</asp:ListItem>
                                                                                <asp:ListItem Value="CY">Cyprus</asp:ListItem>
                                                                                <asp:ListItem Value="CZ">Czech Republic</asp:ListItem>
                                                                                <asp:ListItem Value="DK">Denmark</asp:ListItem>
                                                                                <asp:ListItem Value="DJ">Djibouti</asp:ListItem>
                                                                                <asp:ListItem Value="DM">Dominica</asp:ListItem>
                                                                                <asp:ListItem Value="DO">Dominican Republic</asp:ListItem>
                                                                                <asp:ListItem Value="TP">East Timor</asp:ListItem>
                                                                                <asp:ListItem Value="EC">Ecuador</asp:ListItem>
                                                                                <asp:ListItem Value="EG">Egypt</asp:ListItem>
                                                                                <asp:ListItem Value="SV">El Salvador</asp:ListItem>
                                                                                <asp:ListItem Value="GQ">Equatorial Guinea</asp:ListItem>
                                                                                <asp:ListItem Value="ER">Eritrea</asp:ListItem>
                                                                                <asp:ListItem Value="EE">Estonia</asp:ListItem>
                                                                                <asp:ListItem Value="ET">Ethiopia</asp:ListItem>
                                                                                <asp:ListItem Value="FK">Falkland Islands (Malvinas)</asp:ListItem>
                                                                                <asp:ListItem Value="FO">Faroe Islands</asp:ListItem>
                                                                                <asp:ListItem Value="FJ">Fiji</asp:ListItem>
                                                                                <asp:ListItem Value="FI">Finland</asp:ListItem>
                                                                                <asp:ListItem Value="FR">France</asp:ListItem>
                                                                                <asp:ListItem Value="GF">French Guiana</asp:ListItem>
                                                                                <asp:ListItem Value="PF">French Polynesia</asp:ListItem>
                                                                                <asp:ListItem Value="TF">French Southern Territories</asp:ListItem>
                                                                                <asp:ListItem Value="GA">Gabon</asp:ListItem>
                                                                                <asp:ListItem Value="GM">Gambia</asp:ListItem>
                                                                                <asp:ListItem Value="GE">Georgia</asp:ListItem>
                                                                                <asp:ListItem Value="DE">Germany</asp:ListItem>
                                                                                <asp:ListItem Value="GH">Ghana</asp:ListItem>
                                                                                <asp:ListItem Value="GI">Gibraltar</asp:ListItem>
                                                                                <asp:ListItem Value="GR">Greece</asp:ListItem>
                                                                                <asp:ListItem Value="GL">Greenland</asp:ListItem>
                                                                                <asp:ListItem Value="GD">Grenada</asp:ListItem>
                                                                                <asp:ListItem Value="GP">Guadeloupe</asp:ListItem>
                                                                                <asp:ListItem Value="GU">Guam</asp:ListItem>
                                                                                <asp:ListItem Value="GT">Guatemala</asp:ListItem>
                                                                                <asp:ListItem Value="GN">Guinea</asp:ListItem>
                                                                                <asp:ListItem Value="GW">Guinea-Bissau</asp:ListItem>
                                                                                <asp:ListItem Value="GY">Guyana</asp:ListItem>
                                                                                <asp:ListItem Value="HT">Haiti</asp:ListItem>
                                                                                <asp:ListItem Value="HM">Heard And Mc Donald Islands</asp:ListItem>
                                                                                <asp:ListItem Value="VA">Holy See (Vatican City State)</asp:ListItem>
                                                                                <asp:ListItem Value="HN">Honduras</asp:ListItem>
                                                                                <asp:ListItem Value="HK">Hong Kong</asp:ListItem>
                                                                                <asp:ListItem Value="HU">Hungary</asp:ListItem>
                                                                                <asp:ListItem Value="IS">Icel And</asp:ListItem>
                                                                                <asp:ListItem Value="IN">India</asp:ListItem>
                                                                                <asp:ListItem Value="ID">Indonesia</asp:ListItem>
                                                                                <asp:ListItem Value="IR">Iran (Islamic Republic Of)</asp:ListItem>
                                                                                <asp:ListItem Value="IQ">Iraq</asp:ListItem>
                                                                                <asp:ListItem Value="IE">Ireland</asp:ListItem>
                                                                                <asp:ListItem Value="IL">Israel</asp:ListItem>
                                                                                <asp:ListItem Value="IT">Italy</asp:ListItem>
                                                                                <asp:ListItem Value="JM">Jamaica</asp:ListItem>
                                                                                <asp:ListItem Value="JP">Japan</asp:ListItem>
                                                                                <asp:ListItem Value="JO">Jordan</asp:ListItem>
                                                                                <asp:ListItem Value="KZ">Kazakhstan</asp:ListItem>
                                                                                <asp:ListItem Value="KE">Kenya</asp:ListItem>
                                                                                <asp:ListItem Value="KI">Kiribati</asp:ListItem>
                                                                                <asp:ListItem Value="KP">Korea, Dem People'S Republic</asp:ListItem>
                                                                                <asp:ListItem Value="KR">Korea, Republic Of</asp:ListItem>
                                                                                <asp:ListItem Value="KW">Kuwait</asp:ListItem>
                                                                                <asp:ListItem Value="KG">Kyrgyzstan</asp:ListItem>
                                                                                <asp:ListItem Value="LA">Lao People'S Dem Republic</asp:ListItem>
                                                                                <asp:ListItem Value="LV">Latvia</asp:ListItem>
                                                                                <asp:ListItem Value="LB">Lebanon</asp:ListItem>
                                                                                <asp:ListItem Value="LS">Lesotho</asp:ListItem>
                                                                                <asp:ListItem Value="LR">Liberia</asp:ListItem>
                                                                                <asp:ListItem Value="LY">Libyan Arab Jamahiriya</asp:ListItem>
                                                                                <asp:ListItem Value="LI">Liechtenstein</asp:ListItem>
                                                                                <asp:ListItem Value="LT">Lithuania</asp:ListItem>
                                                                                <asp:ListItem Value="LU">Luxembourg</asp:ListItem>
                                                                                <asp:ListItem Value="MO">Macau</asp:ListItem>
                                                                                <asp:ListItem Value="MK">Macedonia</asp:ListItem>
                                                                                <asp:ListItem Value="MG">Madagascar</asp:ListItem>
                                                                                <asp:ListItem Value="MW">Malawi</asp:ListItem>
                                                                                <asp:ListItem Value="MY">Malaysia</asp:ListItem>
                                                                                <asp:ListItem Value="MV">Maldives</asp:ListItem>
                                                                                <asp:ListItem Value="ML">Mali</asp:ListItem>
                                                                                <asp:ListItem Value="MT">Malta</asp:ListItem>
                                                                                <asp:ListItem Value="MH">Marshall Islands</asp:ListItem>
                                                                                <asp:ListItem Value="MQ">Martinique</asp:ListItem>
                                                                                <asp:ListItem Value="MR">Mauritania</asp:ListItem>
                                                                                <asp:ListItem Value="MU">Mauritius</asp:ListItem>
                                                                                <asp:ListItem Value="YT">Mayotte</asp:ListItem>
                                                                                <asp:ListItem Value="MX">Mexico</asp:ListItem>
                                                                                <asp:ListItem Value="FM">Micronesia, Federated States</asp:ListItem>
                                                                                <asp:ListItem Value="MD">Moldova, Republic Of</asp:ListItem>
                                                                                <asp:ListItem Value="MC">Monaco</asp:ListItem>
                                                                                <asp:ListItem Value="MN">Mongolia</asp:ListItem>
                                                                                <asp:ListItem Value="MS">Montserrat</asp:ListItem>
                                                                                <asp:ListItem Value="MA">Morocco</asp:ListItem>
                                                                                <asp:ListItem Value="MZ">Mozambique</asp:ListItem>
                                                                                <asp:ListItem Value="MM">Myanmar</asp:ListItem>
                                                                                <asp:ListItem Value="NA">Namibia</asp:ListItem>
                                                                                <asp:ListItem Value="NR">Nauru</asp:ListItem>
                                                                                <asp:ListItem Value="NP">Nepal</asp:ListItem>
                                                                                <asp:ListItem Value="NL">Netherlands</asp:ListItem>
                                                                                <asp:ListItem Value="AN">Netherlands Ant Illes</asp:ListItem>
                                                                                <asp:ListItem Value="NC">New Caledonia</asp:ListItem>
                                                                                <asp:ListItem Value="NZ">New Zealand</asp:ListItem>
                                                                                <asp:ListItem Value="NI">Nicaragua</asp:ListItem>
                                                                                <asp:ListItem Value="NE">Niger</asp:ListItem>
                                                                                <asp:ListItem Value="NG">Nigeria</asp:ListItem>
                                                                                <asp:ListItem Value="NU">Niue</asp:ListItem>
                                                                                <asp:ListItem Value="NF">Norfolk Island</asp:ListItem>
                                                                                <asp:ListItem Value="MP">Northern Mariana Islands</asp:ListItem>
                                                                                <asp:ListItem Value="NO">Norway</asp:ListItem>
                                                                                <asp:ListItem Value="OM">Oman</asp:ListItem>
                                                                                <asp:ListItem Value="PK">Pakistan</asp:ListItem>
                                                                                <asp:ListItem Value="PW">Palau</asp:ListItem>
                                                                                <asp:ListItem Value="PA">Panama</asp:ListItem>
                                                                                <asp:ListItem Value="PG">Papua New Guinea</asp:ListItem>
                                                                                <asp:ListItem Value="PY">Paraguay</asp:ListItem>
                                                                                <asp:ListItem Value="PE">Peru</asp:ListItem>
                                                                                <asp:ListItem Value="PH">Philippines</asp:ListItem>
                                                                                <asp:ListItem Value="PN">Pitcairn</asp:ListItem>
                                                                                <asp:ListItem Value="PL">Poland</asp:ListItem>
                                                                                <asp:ListItem Value="PT">Portugal</asp:ListItem>
                                                                                <asp:ListItem Value="PR">Puerto Rico</asp:ListItem>
                                                                                <asp:ListItem Value="QA">Qatar</asp:ListItem>
                                                                                <asp:ListItem Value="RE">Reunion</asp:ListItem>
                                                                                <asp:ListItem Value="RO">Romania</asp:ListItem>
                                                                                <asp:ListItem Value="RU">Russian Federation</asp:ListItem>
                                                                                <asp:ListItem Value="RW">Rwanda</asp:ListItem>
                                                                                <asp:ListItem Value="KN">Saint K Itts And Nevis</asp:ListItem>
                                                                                <asp:ListItem Value="LC">Saint Lucia</asp:ListItem>
                                                                                <asp:ListItem Value="VC">Saint Vincent, The Grenadines</asp:ListItem>
                                                                                <asp:ListItem Value="WS">Samoa</asp:ListItem>
                                                                                <asp:ListItem Value="SM">San Marino</asp:ListItem>
                                                                                <asp:ListItem Value="ST">Sao Tome And Principe</asp:ListItem>
                                                                                <asp:ListItem Value="SA">Saudi Arabia</asp:ListItem>
                                                                                <asp:ListItem Value="SN">Senegal</asp:ListItem>
                                                                                <asp:ListItem Value="SC">Seychelles</asp:ListItem>
                                                                                <asp:ListItem Value="SL">Sierra Leone</asp:ListItem>
                                                                                <asp:ListItem Value="SG">Singapore</asp:ListItem>
                                                                                <asp:ListItem Value="SK">Slovakia (Slovak Republic)</asp:ListItem>
                                                                                <asp:ListItem Value="SI">Slovenia</asp:ListItem>
                                                                                <asp:ListItem Value="SB">Solomon Islands</asp:ListItem>
                                                                                <asp:ListItem Value="SO">Somalia</asp:ListItem>
                                                                                <asp:ListItem Value="ZA">South Africa</asp:ListItem>
                                                                                <asp:ListItem Value="GS">South Georgia , S Sandwich Is.</asp:ListItem>
                                                                                <asp:ListItem Value="ES">Spain</asp:ListItem>
                                                                                <asp:ListItem Value="LK">Sri Lanka</asp:ListItem>
                                                                                <asp:ListItem Value="SH">St. Helena</asp:ListItem>
                                                                                <asp:ListItem Value="PM">St. Pierre And Miquelon</asp:ListItem>
                                                                                <asp:ListItem Value="SD">Sudan</asp:ListItem>
                                                                                <asp:ListItem Value="SR">Suriname</asp:ListItem>
                                                                                <asp:ListItem Value="SJ">Svalbard, Jan Mayen Islands</asp:ListItem>
                                                                                <asp:ListItem Value="SZ">Sw Aziland</asp:ListItem>
                                                                                <asp:ListItem Value="SE">Sweden</asp:ListItem>
                                                                                <asp:ListItem Value="CH">Switzerland</asp:ListItem>
                                                                                <asp:ListItem Value="SY">Syrian Arab Republic</asp:ListItem>
                                                                                <asp:ListItem Value="TW">Taiwan</asp:ListItem>
                                                                                <asp:ListItem Value="TJ">Tajikistan</asp:ListItem>
                                                                                <asp:ListItem Value="TZ">Tanzania, United Republic Of</asp:ListItem>
                                                                                <asp:ListItem Value="TH">Thailand</asp:ListItem>
                                                                                <asp:ListItem Value="TG">Togo</asp:ListItem>
                                                                                <asp:ListItem Value="TK">Tokelau</asp:ListItem>
                                                                                <asp:ListItem Value="TO">Tonga</asp:ListItem>
                                                                                <asp:ListItem Value="TT">Trinidad And Tobago</asp:ListItem>
                                                                                <asp:ListItem Value="TN">Tunisia</asp:ListItem>
                                                                                <asp:ListItem Value="TR">Turkey</asp:ListItem>
                                                                                <asp:ListItem Value="TM">Turkmenistan</asp:ListItem>
                                                                                <asp:ListItem Value="TC">Turks And Caicos Islands</asp:ListItem>
                                                                                <asp:ListItem Value="TV">Tuvalu</asp:ListItem>
                                                                                <asp:ListItem Value="UG">Uganda</asp:ListItem>
                                                                                <asp:ListItem Value="UA">Ukraine</asp:ListItem>
                                                                                <asp:ListItem Value="AE">United Arab Emirates</asp:ListItem>
                                                                                <asp:ListItem Value="GB">United Kingdom</asp:ListItem>
                                                                                <asp:ListItem Value="US" Selected="True">United States</asp:ListItem>
                                                                                <asp:ListItem Value="UM">United States Minor Is.</asp:ListItem>
                                                                                <asp:ListItem Value="UY">Uruguay</asp:ListItem>
                                                                                <asp:ListItem Value="UZ">Uzbekistan</asp:ListItem>
                                                                                <asp:ListItem Value="VU">Vanuatu</asp:ListItem>
                                                                                <asp:ListItem Value="VE">Venezuela</asp:ListItem>
                                                                                <asp:ListItem Value="VN">Viet Nam</asp:ListItem>
                                                                                <asp:ListItem Value="VG">Virgin Islands (British)</asp:ListItem>
                                                                                <asp:ListItem Value="VI">Virgin Islands (U.S.)</asp:ListItem>
                                                                                <asp:ListItem Value="WF">Wallis And Futuna Islands</asp:ListItem>
                                                                                <asp:ListItem Value="EH">Western Sahara</asp:ListItem>
                                                                                <asp:ListItem Value="YE">Yemen</asp:ListItem>
                                                                                <asp:ListItem Value="ZR">Zaire</asp:ListItem>
                                                                                <asp:ListItem Value="ZM">Zambia</asp:ListItem>
                                                                                <asp:ListItem Value="ZW">Zimbabwe</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3" style="border-bottom: 0px none #000 !important;">
                                                                            <label>Contact Preference : </label>
                                                                            &nbsp;&nbsp;
                                                                        <asp:CheckBox ID="chkContactPreferenceEmail" runat="server" Text="Email" />&nbsp;&nbsp;
                                                                        <asp:CheckBox ID="chkContactPreferenceCall" runat="server" Text="Call" />&nbsp;&nbsp;
                                                                        <asp:CheckBox ID="chkContactPreferenceText" runat="server" Text="Text" />&nbsp;&nbsp;
                                                                        <asp:CheckBox ID="chkContactPreferenceMail" runat="server" Text="Mail" />&nbsp;&nbsp;
                                                                        </td>
                                                                        <td></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div style="width: 100%; overflow: auto;">
                                                        <table border="0" cellspacing="0" cellpadding="0" style="padding: 0px; margin: 0px;">
                                                            <tr>
                                                                <td colspan="4" style="padding: 0px;">
                                                                    <table id="tblPrimaryEmail" style="margin: 0px;">
                                                                        <tr>
                                                                            <td>

                                                                                <label>
                                                                                    Primary Contact Email
                                                                                </label>
                                                                                <div class="newEmaildiv">
                                                                                    <asp:TextBox ID="txtPrimaryEmail0" runat="server" placeholder='Email' class="clsemail" MaxLength="50" />
                                                                                    <br />
                                                                                    <a style="cursor: pointer" tabindex="1" data-emailtype="Primary" onclick="AddEmailRow(this)">Add New Row</a> &nbsp;&nbsp;
                                                                                    <a onclick="AddEmail(this)" tabindex="1" style="cursor: pointer" data-emailtype="Primary" data-type="0">Add Email</a>
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <label>
                                                                                    First Name</label><br />
                                                                                <asp:TextBox ID="txtPrimaryFName0" runat="server" TabIndex="1" MaxLength="50" class="clsfname" />
                                                                            </td>

                                                                            <td>
                                                                                <label>
                                                                                    Last Name</label><br />
                                                                                <asp:TextBox ID="txtPrimaryLName0" runat="server" MaxLength="50" class="clslname" />
                                                                                <br />

                                                                            </td>
                                                                            <td>
                                                                                <label>Title</label><br />
                                                                                <asp:DropDownList ID="ddlPrimaryTitle0" runat="server" class="clstitle">
                                                                                    <asp:ListItem>Select</asp:ListItem>
                                                                                    <asp:ListItem Value="Secretary">Secretary</asp:ListItem>
                                                                                    <asp:ListItem Value="FloorSalesman">Floor salesman</asp:ListItem>
                                                                                    <asp:ListItem Value="SalesAcctExecutive">Sales/acct. executive</asp:ListItem>
                                                                                    <asp:ListItem Value="Manager">Manager</asp:ListItem>
                                                                                    <asp:ListItem Value="Owner">Owner</asp:ListItem>
                                                                                    <asp:ListItem Value="Others">Others</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td>
                                                                                <label>
                                                                                    Contact #
                                                                                </label>
                                                                                <br />
                                                                                <div class='newcontactdiv' style="width: 605px;">
                                                                                    <asp:TextBox ID="txtPrimaryContact0" TabIndex="1" runat="server" placeholder='___-___-____' MaxLength="10" onkeypress="return isNumericKey(event);" CssClass="clsmaskphone" Width="50%"></asp:TextBox>
                                                                                    <asp:TextBox ID="txtPrimaryContactExten0" TabIndex="1" runat="server" placeholder="Extension" class="clsmaskphoneexten" onkeypress="return isNumericKey(event);" MaxLength="6" Width="34%"></asp:TextBox>
                                                                                    <label>Phone Type</label>
                                                                                    <asp:DropDownList ID="ddlPrimaryPhoneType0" runat="server" class="clsphonetype">
                                                                                        <asp:ListItem>Select</asp:ListItem>
                                                                                        <asp:ListItem Value="Cell">Cell Phone #</asp:ListItem>
                                                                                        <asp:ListItem Value="House">House Phone  #</asp:ListItem>
                                                                                        <asp:ListItem Value="Work">Work Phone #</asp:ListItem>
                                                                                        <asp:ListItem Value="Alt">Alt. Phone #</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                    <br />
                                                                                    <a onclick="AddContact(this)" tabindex="1" style="cursor: pointer" data-emailtype="Primary" data-type="0">Add Contact</a><br />
                                                                                </div>

                                                                            </td>
                                                                            <td>
                                                                                <label>
                                                                                    Fax</label><br />
                                                                                <asp:TextBox ID="txtPrimaryFax0" runat="server" MaxLength="15" class="clsfax" onkeypress="return isNumericKey(event);"></asp:TextBox>
                                                                                <br />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4" style="padding: 0px;">
                                                                    <table id="tblSecEmail" style="margin: 0px; padding: 0px;">
                                                                        <tr>
                                                                            <td>
                                                                                <label>
                                                                                    Secondary Contact Email</label><br />
                                                                                <div class="newEmaildiv">
                                                                                    <asp:TextBox ID="txtSecEmail0" runat="server" MaxLength="50" class="clsemail"></asp:TextBox>
                                                                                    <br />
                                                                                    <a style="cursor: pointer" tabindex="1" data-emailtype="Sec" onclick="AddEmailRow(this)">Add New Row</a> &nbsp;&nbsp; 
                                                                                    <a onclick="AddEmail(this)" tabindex="1" style="cursor: pointer" data-emailtype="Sec" data-type="0">Add Email</a>
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <label>
                                                                                    First Name</label><br />
                                                                                <asp:TextBox ID="txtSecFName0" runat="server" class="clsfname" MaxLength="50"></asp:TextBox>
                                                                            </td>

                                                                            <td>
                                                                                <label>
                                                                                    Last Name</label><br />
                                                                                <asp:TextBox ID="txtSecLName0" runat="server" class="clslname" MaxLength="50"></asp:TextBox>
                                                                                <br />

                                                                            </td>
                                                                            <td>
                                                                                <label>Title</label><br />
                                                                                <asp:DropDownList ID="ddlSecTitle0" runat="server" class="clstitle">
                                                                                    <asp:ListItem>Select</asp:ListItem>
                                                                                    <asp:ListItem Value="Secretary">Secretary</asp:ListItem>
                                                                                    <asp:ListItem Value="FloorSalesman">Floor salesman</asp:ListItem>
                                                                                    <asp:ListItem Value="SalesAcctExecutive">Sales/acct. executive</asp:ListItem>
                                                                                    <asp:ListItem Value="Manager">Manager</asp:ListItem>
                                                                                    <asp:ListItem Value="Owner">Owner</asp:ListItem>
                                                                                    <asp:ListItem Value="Others">Others</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td>
                                                                                <label>
                                                                                    Contact #
                                                                                </label>
                                                                                <br />
                                                                                <div class='newcontactdiv' style="width: 605px;">
                                                                                    <asp:TextBox ID="txtSecContact0" TabIndex="1" runat="server" MaxLength="10" onkeypress="return isNumericKey(event);" placeholder='___-___-____' CssClass="clsmaskphone" Width="50%"></asp:TextBox>
                                                                                    <asp:TextBox ID="txtSecContactExten0" TabIndex="1" runat="server" MaxLength="6" class="clsmaskphoneexten" onkeypress="return isNumericKey(event);" placeholder="Extension" Width="35%"></asp:TextBox>
                                                                                    <label>Phone Type</label>
                                                                                    <asp:DropDownList ID="ddlSecPhoneType0" runat="server" class="clsphonetype">
                                                                                        <asp:ListItem>Select</asp:ListItem>
                                                                                        <asp:ListItem Value="Cell">Cell Phone #</asp:ListItem>
                                                                                        <asp:ListItem Value="House">House Phone  #</asp:ListItem>
                                                                                        <asp:ListItem Value="Work">Work Phone #</asp:ListItem>
                                                                                        <asp:ListItem Value="Alt">Alt. Phone #</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                    <br />
                                                                                    <a onclick="AddContact(this)" tabindex="1" data-emailtype="Sec" style="cursor: pointer" data-type="0">Add Contact</a>
                                                                                    <br />
                                                                                </div>

                                                                            </td>
                                                                            <td>
                                                                                <label>
                                                                                    Fax</label><br />
                                                                                <asp:TextBox ID="txtSecFax0" runat="server" onkeypress="return isNumericKey(event);" MaxLength="15" class="clsfax"></asp:TextBox>
                                                                                <br />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4" style="padding: 0px;">
                                                                    <table id="tblAltEmail" style="margin: 0px; padding: 0px;">
                                                                        <tr>
                                                                            <td>
                                                                                <label>
                                                                                    Alt. Contact Email</label><br />
                                                                                <div class="newEmaildiv">
                                                                                    <asp:TextBox ID="txtAltEmail0" runat="server" MaxLength="50" class="clsemail"></asp:TextBox>
                                                                                    <br />
                                                                                    <a style="cursor: pointer" tabindex="1" data-emailtype="Alt" onclick="AddEmailRow(this)">Add New Row</a> &nbsp;&nbsp;
                                                                                    <a onclick="AddEmail(this)" tabindex="1" style="cursor: pointer" data-emailtype="Alt" data-type="0">Add Email</a>
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <label>
                                                                                    First Name</label><br />
                                                                                <asp:TextBox ID="txtAltFName0" runat="server" class="clsfname" MaxLength="50"></asp:TextBox>
                                                                                <br />
                                                                            </td>
                                                                            <td>
                                                                                <label>
                                                                                    Last Name</label><br />
                                                                                <asp:TextBox ID="txtAltLName0" runat="server" class="clslname" MaxLength="50"></asp:TextBox>
                                                                                <br />
                                                                            </td>
                                                                            <td>
                                                                                <label>Title</label><br />
                                                                                <asp:DropDownList ID="ddlAltTitle0" runat="server" class="clstitle">
                                                                                    <asp:ListItem>Select</asp:ListItem>
                                                                                    <asp:ListItem Value="Secretary">Secretary</asp:ListItem>
                                                                                    <asp:ListItem Value="FloorSalesman">Floor salesman</asp:ListItem>
                                                                                    <asp:ListItem Value="SalesAcctExecutive">Sales/acct. executive</asp:ListItem>
                                                                                    <asp:ListItem Value="Manager">Manager</asp:ListItem>
                                                                                    <asp:ListItem Value="Owner">Owner</asp:ListItem>
                                                                                    <asp:ListItem Value="Others">Others</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td>
                                                                                <label>
                                                                                    Contact #
                                                                                </label>
                                                                                <br />
                                                                                <div class='newcontactdiv' style="width: 605px;">
                                                                                    <asp:TextBox ID="txtAltContact0" TabIndex="1" runat="server" MaxLength="10" CssClass="clsmaskphone" onkeypress="return isNumericKey(event);" placeholder='___-___-____' Width="50%"></asp:TextBox>
                                                                                    <asp:TextBox ID="txtAltContactExten0" TabIndex="1" runat="server" MaxLength="6" class="clsmaskphoneexten" onkeypress="return isNumericKey(event);" placeholder="Extension" Width="32%"></asp:TextBox>
                                                                                    <label>Phone Type</label>
                                                                                    <asp:DropDownList ID="ddlAltPhoneType0" runat="server" class="clsphonetype">
                                                                                        <asp:ListItem>Select</asp:ListItem>
                                                                                        <asp:ListItem Value="Cell">Cell Phone #</asp:ListItem>
                                                                                        <asp:ListItem Value="House">House Phone  #</asp:ListItem>
                                                                                        <asp:ListItem Value="Work">Work Phone #</asp:ListItem>
                                                                                        <asp:ListItem Value="Alt">Alt. Phone #</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                    <br />
                                                                                    <a onclick="AddContact(this)" tabindex="1" style="cursor: pointer" data-emailtype="Alt" data-type="0">Add Contact</a>
                                                                                    <br />
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <label>
                                                                                    Fax</label><br />
                                                                                <asp:TextBox ID="txtAltFax0" runat="server" onkeypress="return isNumericKey(event);" MaxLength="15" class="clsfax"></asp:TextBox>
                                                                                <br />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="Add Product">
                                    <ContentTemplate>
                                        <div id="divAddProduct" class="vendorForm">
                                            <ul style="padding: 0px;">
                                                <li style="width: 99%; padding-left: 0px; margin-left: 0px;">
                                                    <table border="0" cellspacing="0" cellpadding="0" style="padding: 0px; margin: 0px;">
                                                        <tr>
                                                            <td colspan="3" style="font-weight: bold; font-size: large; font-style: normal">Add Product
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="btnAddNewProduct" runat="server" CssClass="button" OnClick="btnAddNewProduct_Click" Text="Add New Product" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label><span>* </span>SKU-Vendor STATUS :</label><br />
                                                                <asp:TextBox ID="txtSKUVendorSTATUS" CssClass="clsvendorid" TabIndex="1" runat="server" MaxLength="50"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvSKUVendorSTATUS" runat="server" ControlToValidate="txtSKUVendorSTATUS" Display="Dynamic"
                                                                    ValidationGroup="AddProduct" ErrorMessage="Please Enter JG SKU MODEL number." ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                <label><span>* </span>JG SKU: MODEL#:</label><br />
                                                                <asp:TextBox ID="txtJGSKUModelNumber" runat="server" MaxLength="30" TabIndex="2" AutoComplete="off"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvJGSKUModelNumber" runat="server" ControlToValidate="txtJGSKUModelNumber" Display="Dynamic"
                                                                    ValidationGroup="AddProduct" ErrorMessage="Please Enter JG SKU MODEL number." ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="style1">
                                                                <label><span>* </span>Total Cost ($var)</label><br />
                                                                <asp:TextBox ID="txtProductTotalCost" runat="server" TabIndex="4" Width="125px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvProductTotalCost" runat="server" ControlToValidate="txtProductTotalCost" Display="Dynamic"
                                                                    ValidationGroup="AddProduct" ErrorMessage="Please Enter Total Cost ($var)." ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label><span>* </span>item Description :</label><br />
                                                                <asp:TextBox ID="txtProductItemDescription" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvProductItemDescription" runat="server" ControlToValidate="txtProductItemDescription" Display="Dynamic"
                                                                    ValidationGroup="AddProduct" ErrorMessage="Please Enter item Description." ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                <label><span>* </span>JG Description :</label><br />
                                                                <asp:TextBox ID="txtProductJGDescription" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvProductJGDescription" runat="server" ControlToValidate="txtProductJGDescription" Display="Dynamic"
                                                                    ValidationGroup="AddProduct" ErrorMessage="Please Enter JG Description ." ForeColor="Red"></asp:RequiredFieldValidator>

                                                            </td>
                                                            <td></td>
                                                            <%-- <td>
                                                            <label>
                                                                Fax</label><br />
                                                            <asp:TextBox ID="txtVendorFax" TabIndex="1" runat="server" MaxLength="20"></asp:TextBox>
                                                            <br />
                                                        </td>--%>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label><span>* </span>Vendor Part # </label>
                                                                <br />
                                                                <asp:TextBox ID="txtProductVendorPart" TabIndex="1" runat="server" MaxLength="100"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvProductVendorPart" runat="server" ControlToValidate="txtProductVendorPart" Display="Dynamic"
                                                                    ValidationGroup="AddProduct" ErrorMessage="Please Enter vendor part number." ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                <label><span>* </span>Vendor Model# </label>
                                                                <br />
                                                                <asp:TextBox ID="txtProductVendorModel" TabIndex="1" runat="server" MaxLength="100"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvProductVendorModel" runat="server" ControlToValidate="txtProductVendorModel" Display="Dynamic"
                                                                    ValidationGroup="AddProduct" ErrorMessage="Please Enter vendor model number." ForeColor="Red"></asp:RequiredFieldValidator>

                                                            </td>
                                                            <td>
                                                                <label><span>* </span>UNIT COST </label>
                                                                <br />
                                                                <asp:TextBox ID="txtProductUnitCost" TabIndex="1" runat="server" MaxLength="100"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvProductUnitCostUom" runat="server" ControlToValidate="txtProductUnitCost" Display="Dynamic"
                                                                    ValidationGroup="AddProduct" ErrorMessage="Please Enter unit cost." ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <%-- <td>
                                                            <label>
                                                                Fax</label><br />
                                                            <asp:TextBox ID="txtVendorFax" TabIndex="1" runat="server" MaxLength="20"></asp:TextBox>
                                                            <br />
                                                        </td>--%>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label><span>* </span>UOM</label><br />
                                                                <asp:DropDownList ID="ddlProductUOM" runat="server" TabIndex="1" Style="width: 180px;">
                                                                    <asp:ListItem>Select</asp:ListItem>
                                                                    <asp:ListItem>In Advance</asp:ListItem>
                                                                    <asp:ListItem>COD</asp:ListItem>
                                                                    <asp:ListItem>NET 15</asp:ListItem>
                                                                    <asp:ListItem>Net 30</asp:ListItem>
                                                                    <asp:ListItem>Net 60</asp:ListItem>
                                                                    <asp:ListItem>1% 10 Net 30</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="rfvddlProductUOM" runat="server" ControlToValidate="ddlProductUOM" Display="Dynamic"
                                                                    ValidationGroup="AddProduct" ErrorMessage="Select UOM." ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                <label>Add variables cost/feature </label>
                                                                <br />
                                                                <asp:Button ID="btnAddProductVariable" runat="server" Text="Add Variables" CssClass="button" />
                                                            </td>
                                                            <td colspan="2">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4" style="padding: 0px;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label>Post Title</label><br />
                                                                <asp:TextBox ID="txtPostTitle" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <label>Post Name (AKA Model#)</label><br />
                                                                <asp:TextBox ID="txtPostName" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <label>Post Excerpt</label><br />
                                                                <asp:TextBox ID="txtPostExcerpt" TabIndex="1" runat="server" MaxLength="100"></asp:TextBox>
                                                            </td>
                                                            <%-- <td>
                                                            <label>
                                                                Fax</label><br />
                                                            <asp:TextBox ID="txtVendorFax" TabIndex="1" runat="server" MaxLength="20"></asp:TextBox>
                                                            <br />
                                                        </td>--%>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label>Post content</label><br />
                                                                <asp:TextBox ID="txtPostContent" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <label>Post Status</label><br />
                                                                <asp:TextBox ID="txtPostStatus" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>

                                                            </td>
                                                            <td>
                                                                <label>Post Date</label><br />
                                                                <asp:TextBox ID="txtPostDate" TabIndex="1" runat="server" MaxLength="100"></asp:TextBox>
                                                            </td>
                                                            <%-- <td>
                                                            <label>
                                                                Fax</label><br />
                                                            <asp:TextBox ID="txtVendorFax" TabIndex="1" runat="server" MaxLength="20"></asp:TextBox>
                                                            <br />
                                                        </td>--%>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label>Post Parent</label><br />
                                                                <asp:TextBox ID="txtPostParent" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <label>Post Author</label><br />
                                                                <asp:TextBox ID="txtPostAuthor" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <label>Comment status</label><br />
                                                                <asp:TextBox ID="txtCommentStatus" TabIndex="1" runat="server" MaxLength="100"></asp:TextBox>
                                                            </td>
                                                            <%-- <td>
                                                            <label>
                                                                Fax</label><br />
                                                            <asp:TextBox ID="txtVendorFax" TabIndex="1" runat="server" MaxLength="20"></asp:TextBox>
                                                            <br />
                                                        </td>--%>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label>Downloadable? Attach IMG </label>
                                                                <br />
                                                            </td>
                                                            <td>
                                                                <label>Virtual</label><br />
                                                                <asp:TextBox ID="txtVirtual" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>

                                                            </td>
                                                            <td>
                                                                <label>Visibility</label><br />
                                                                <asp:TextBox ID="txtVisibility" TabIndex="1" runat="server" MaxLength="100"></asp:TextBox>
                                                            </td>
                                                            <%-- <td>
                                                            <label>
                                                                Fax</label><br />
                                                            <asp:TextBox ID="txtVendorFax" TabIndex="1" runat="server" MaxLength="20"></asp:TextBox>
                                                            <br />
                                                        </td>--%>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label>Stock Status</label><br />
                                                                <asp:TextBox ID="txtStockStatus" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <label>Backorders</label><br />
                                                                <asp:TextBox ID="txtBackorders" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>

                                                            </td>
                                                            <td>
                                                                <label>Manage_stock</label><br />
                                                                <asp:TextBox ID="txtManage_stock" TabIndex="1" runat="server" MaxLength="100"></asp:TextBox>
                                                            </td>
                                                            <%-- <td>
                                                            <label>
                                                                Fax</label><br />
                                                            <asp:TextBox ID="txtVendorFax" TabIndex="1" runat="server" MaxLength="20"></asp:TextBox>
                                                            <br />
                                                        </td>--%>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label>Regular price</label><br />
                                                                <asp:TextBox ID="txtRegularPrice" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <label>Sale Price</label><br />
                                                                <asp:TextBox ID="txtSalePrice" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>

                                                            </td>
                                                            <td>
                                                                <label>Featured</label><br />
                                                                <asp:TextBox ID="txtFeatured" TabIndex="1" runat="server" MaxLength="100"></asp:TextBox>
                                                            </td>
                                                            <%-- <td>
                                                            <label>
                                                                Fax</label><br />
                                                            <asp:TextBox ID="txtVendorFax" TabIndex="1" runat="server" MaxLength="20"></asp:TextBox>
                                                            <br />
                                                        </td>--%>
                                                        </tr>
                                                    </table>
                                                </li>
                                            </ul>
                                            <div class="btn_sec">
                                                <asp:Button ID="Button2" runat="server" Text="Update" Visible="false" OnClick="btnupdateVendor_Click1" />
                                                <asp:Button ID="btnSaveProduct" runat="server" Text="Save Product" CssClass="cssOpenCategoryPopup" ValidationGroup="AddProduct" />
                                                <br />
                                                <asp:Label ID="Label23" runat="server" ForeColor="Red"></asp:Label>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="Payment & Shipping">
                                    <ContentTemplate>
                                        <div id="divPaymentShipping" class="vendorForm">
                                            <ul style="padding: 0px;">
                                                <li style="width: 99%; padding-left: 0px; margin-left: 0px;">
                                                    <table border="0" cellspacing="0" cellpadding="0" style="padding: 0px; margin: 0px;">
                                                        <tr>
                                                            <td colspan="3" style="font-weight: bold; font-size: large; font-style: normal">Payment & Shipping
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="Button3" runat="server" CssClass="button" OnClick="btnAddNewProduct_Click" Text="Add New Product" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label><span>* </span>Payment Terms :</label><br />
                                                                <asp:DropDownList ID="ddlPaymentTerms" runat="server" TabIndex="1" Style="width: 180px;">
                                                                    <asp:ListItem>Select</asp:ListItem>
                                                                    <asp:ListItem>In Advance</asp:ListItem>
                                                                    <asp:ListItem>COD</asp:ListItem>
                                                                    <asp:ListItem>NET 15</asp:ListItem>
                                                                    <asp:ListItem>Net 30</asp:ListItem>
                                                                    <asp:ListItem>Net 60</asp:ListItem>
                                                                    <asp:ListItem>1% 10 Net 30</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="rfvPaymentTerms" runat="server" ControlToValidate="ddlPaymentTerms" Display="Dynamic"
                                                                    ValidationGroup="PaymentShipping" ErrorMessage="Select payment terms." ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                <label><span>* </span>Delivery Fee:$</label><br />
                                                                <asp:TextBox ID="txtDeliveryFee" runat="server" MaxLength="30" TabIndex="2" AutoComplete="off"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvDeliveryFee" runat="server" ControlToValidate="txtDeliveryFee" Display="Dynamic"
                                                                    ValidationGroup="PaymentShipping" ErrorMessage="Please Enter Delivery Fee." ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="style1">
                                                                <label><span>* </span>Stocking/Return Fee:$</label><br />
                                                                <asp:TextBox ID="txtStockingReturnFee" runat="server" TabIndex="4" Width="125px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvStockingReturnFee" runat="server" ControlToValidate="txtStockingReturnFee" Display="Dynamic"
                                                                    ValidationGroup="PaymentShipping" ErrorMessage="Please Enter Stocking/Return Fee." ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label><span>* </span>Misc. Fee:$ :</label><br />
                                                                <asp:TextBox ID="txtMiscFee" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvMiscFee" runat="server" ControlToValidate="txtMiscFee" Display="Dynamic"
                                                                    ValidationGroup="PaymentShipping" ErrorMessage="Please Enter Misc. Fee." ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                <label><span>* </span>add/edit cost variable </label>
                                                                <br />
                                                            </td>
                                                            <td>
                                                                <label><span>* </span>Preferred Payment Method</label><br />
                                                                <asp:DropDownList ID="ddlPaymentMethod" runat="server" TabIndex="1" Style="width: 180px;">
                                                                    <asp:ListItem Value="Select">Select</asp:ListItem>
                                                                    <asp:ListItem>amex2343</asp:ListItem>
                                                                    <asp:ListItem>Discover3494</asp:ListItem>
                                                                    <asp:ListItem>echeck101</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="rfvPreferredPayment" runat="server" ControlToValidate="ddlPaymentMethod" Display="Dynamic"
                                                                    ValidationGroup="PaymentShipping" ErrorMessage="Select Preferred Payment Method." ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <%-- <td>
                                                            <label>
                                                                Fax</label><br />
                                                            <asp:TextBox ID="txtVendorFax" TabIndex="1" runat="server" MaxLength="20"></asp:TextBox>
                                                            <br />
                                                        </td>--%>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label><span>* </span>Preferred Delivery Method</label><br />
                                                                <asp:DropDownList ID="ddlPreferredDeliveryMethod" runat="server" TabIndex="1" Style="width: 180px;">
                                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                                    <asp:ListItem Value="1">JG stock</asp:ListItem>
                                                                    <asp:ListItem Value="2">JG ship</asp:ListItem>
                                                                    <asp:ListItem Value="3">Vendor ship</asp:ListItem>
                                                                    <asp:ListItem Value="4">Drop ship</asp:ListItem>
                                                                    <asp:ListItem Value="5">Consignment</asp:ListItem>
                                                                    <asp:ListItem Value="6">Pick up</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="rfvPreferredDelivery" runat="server" ControlToValidate="ddlPreferredDeliveryMethod" Display="Dynamic"
                                                                    ValidationGroup="PaymentShipping" ErrorMessage="Select Preferred Delivery Method." ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                <label>Freight terms</label><br />
                                                                <asp:DropDownList ID="ddlFreightTerms" runat="server" TabIndex="1" Style="width: 180px;">
                                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                                    <asp:ListItem Value="1">Bill-of-Lading(BoL)</asp:ListItem>
                                                                    <asp:ListItem Value="2">Freight Bill</asp:ListItem>
                                                                    <asp:ListItem Value="3">Free-on-Board)</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="rfvFreightTerms" runat="server" ControlToValidate="ddlFreightTerms" Display="Dynamic"
                                                                    ValidationGroup="PaymentShipping" ErrorMessage="Select Freight Terms." ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td colspan="2">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4" style="padding: 0px;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label><span>* </span>Tax Id</label><br />
                                                                <asp:TextBox ID="txtTaxId" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvTaxId" runat="server" ControlToValidate="txtTaxId" Display="Dynamic"
                                                                    ValidationGroup="PaymentShipping" ErrorMessage="Please Enter Tax Id." ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                <label><span>* </span>Tax: % (state)</label><br />
                                                                <asp:TextBox ID="txtSPTax" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvSPTax" runat="server" ControlToValidate="txtSPTax" Display="Dynamic"
                                                                    ValidationGroup="PaymentShipping" ErrorMessage="Please Enter Tax Id." ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                <label>Vendor Quote #</label><br />
                                                                <asp:TextBox ID="txtVendorQuote" TabIndex="1" runat="server" MaxLength="100"></asp:TextBox>
                                                            </td>
                                                            <%-- <td>
                                                            <label>
                                                                Fax</label><br />
                                                            <asp:TextBox ID="txtVendorFax" TabIndex="1" runat="server" MaxLength="20"></asp:TextBox>
                                                            <br />
                                                        </td>--%>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label>Attach Vendor Quote</label><br />
                                                                <asp:TextBox ID="txtAttachVendorQuote" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <label>Revision # </label>
                                                                <br />
                                                                <asp:TextBox ID="txtRevision" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>

                                                            </td>
                                                            <td>
                                                                <label>Vendor Invoice#</label><br />
                                                                <asp:TextBox ID="txtVendorInvoice" TabIndex="1" runat="server" MaxLength="100"></asp:TextBox>
                                                            </td>
                                                            <%-- <td>
                                                            <label>
                                                                Fax</label><br />
                                                            <asp:TextBox ID="txtVendorFax" TabIndex="1" runat="server" MaxLength="20"></asp:TextBox>
                                                            <br />
                                                        </td>--%>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label>JG Customer P.O. #</label><br />
                                                                <asp:TextBox ID="txtJGCustomerPO" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <label>Lead time/ Due date</label><br />
                                                                <asp:TextBox ID="txtLeadtimeduedate" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <label>Econimical Order Quantity</label><br />
                                                                <asp:TextBox ID="txtEconimicalOrderQuantity" TabIndex="1" runat="server" MaxLength="100"></asp:TextBox>
                                                            </td>
                                                            <%-- <td>
                                                            <label>
                                                                Fax</label><br />
                                                            <asp:TextBox ID="txtVendorFax" TabIndex="1" runat="server" MaxLength="20"></asp:TextBox>
                                                            <br />
                                                        </td>--%>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label>Discount per unit </label>
                                                                <br />
                                                                <asp:TextBox ID="txtDiscountPerUnit" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <label>Re-Order point (Min.)</label><br />
                                                                <asp:TextBox ID="txtReOrderPoint" TabIndex="1" runat="server" MaxLength="500"></asp:TextBox>

                                                            </td>
                                                            <td>
                                                                <label>Order QTY (Max)</label><br />
                                                                <asp:TextBox ID="txtOrderQTYMax" TabIndex="1" runat="server" MaxLength="100"></asp:TextBox>
                                                            </td>
                                                            <%-- <td>
                                                            <label>
                                                                Fax</label><br />
                                                            <asp:TextBox ID="txtVendorFax" TabIndex="1" runat="server" MaxLength="20"></asp:TextBox>
                                                            <br />
                                                        </td>--%>
                                                        </tr>
                                                    </table>
                                                </li>
                                            </ul>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>

                            <table border="0" cellspacing="0" cellpadding="0" style="padding: 0px; margin: 0px; width: 100%">
                                <tr>
                                    <td colspan="4" style="padding: 0px;">
                                        <div class="grid_h" style="font-weight: bold; font-size: large; font-style: normal">
                                            Notes
                                        </div>
                                        <div class="grid">
                                            <asp:GridView ID="grdTouchPointLog" runat="server" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="tableClass" Width="100%" Style="margin: 0px;">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="User Id">
                                                        <ItemTemplate>
                                                            <%#Eval("userid")%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Date">
                                                        <ItemTemplate>
                                                            <%#Eval("CreatedOn")%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Notes">
                                                        <ItemTemplate>
                                                            <%#Eval("Notes")%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    No Data Found.
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                        </div>
                                        <br />
                                        <table cellspacing="0" cellpadding="0" width="950px" border="1" style="width: 100%; border-collapse: collapse;">
                                            <tr>
                                                <td>
                                                    <div class="">
                                                        <asp:TextBox ID="txtAddNotes" runat="server" TextMode="MultiLine" Rows="7" Width="100%" CssClass="textbox"></asp:TextBox>
                                                        <br />
                                                        <asp:RequiredFieldValidator ID="rfvAddNotes" runat="server" ControlToValidate="txtAddNotes" Display="Dynamic"
                                                            ValidationGroup="addAddNotes" ErrorMessage="Please Enter Notes." ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 50%">
                                                                <div class="btn_sec" style="text-align: right;">
                                                                 <asp:Button ID="btnAddNotes" runat="server" Text="Add Notes" CssClass="ui-button" OnClick="btnAddNotes_Click" ValidationGroup="addAddNotes" />
                                                                </div>
                                                            </td>
                                                            <td style="width: 50%">
                                                                <div id="divNoteDropzone" runat="server" class="dropzone work-file-Note">
                                                                    <div class="fallback">
                                                                        <input name="file" type="file" multiple />
                                                                        <input type="submit" value="Upload" />
                                                                    </div>
                                                                </div>
                                                                <div id="divNoteDropzonePreview" runat="server" class="dropzone-previews work-file-previews-note">
                                                                </div>
                                                                <div class="hide">
                                                                    <asp:Button ID="btnUploadLogFiles" runat="server" Text="Upload File" CssClass="ui-button"  />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <div id="Div1" style="text-align: right;" runat="server" visible="false">
                                <asp:LinkButton ID="BtnSaveLoaction" CssClass="btnSaveAddress" TabIndex="1" runat="server" Text="Save Address" OnClientClick="return GetVendorDetails(this)" ValidationGroup="addaddress" OnClick="BtnSaveLoaction_Click" />
                                <br />
                                <asp:Label ID="lbladdress" runat="server" ForeColor="Red"></asp:Label>
                            </div>
                            <asp:Button ID="btnPageLoad" runat="server" CssClass="cssbtnPageLoad" />
                            <asp:Label ID="dummyLabel" runat="server" />
                            <asp:ModalPopupExtender ID="mpeCategoryPopup" runat="server" TargetControlID="dummyLabel"
                                PopupControlID="pnlcategorypopup" CancelControlID="btnCancelCategory" BackgroundCssClass="uiblack">
                            </asp:ModalPopupExtender>
                            <asp:Panel ID="pnlcategorypopup" runat="server" Style="display: none;z-index:1000 !important; background: white; border: 5px solid rgb(179, 71, 74)">
                                <div class="popup_heading">
                                    <h1>Select Category</h1>
                                </div>
                                <div id="categoriesList">
                                    <div id="productCategory" class="categorylist_Heading" style="width: 250px; float: left">
                                        <h4>Product Category</h4>
                                        <%--<asp:CheckBoxList ID="chkProductCategoryList" runat="server" AutoPostBack="true" RepeatLayout="Flow" OnSelectedIndexChanged="chkProductCategoryList_SelectedIndexChanged">
                                        </asp:CheckBoxList>--%>
                                        <asp:CheckBox ID="chkProductCategoryList_All" runat="server" AutoPostBack="true" Text="Select All" OnCheckedChanged="chkProductCategoryList_All_CheckedChanged" /><br />
                                        <asp:DropDownCheckBoxes CssClass="form_panel_checkbox_dropdown" ID="chkProductCategoryList" runat="server" UseSelectAllNode="false" AutoPostBack="true" OnSelectedIndexChanged="chkProductCategoryList_SelectedIndexChanged">
                                            <Style SelectBoxWidth="250" DropDownBoxBoxWidth="250" DropDownBoxBoxHeight="150" />
                                            <Items></Items>
                                        </asp:DropDownCheckBoxes>
                                    </div>
                                    <div id="vendorcategory" class="categorylist_Heading" style="width: 250px; float: left">
                                        <h4>Vendor Category</h4>
                                       <%-- <asp:CheckBoxList ID="chkVendorCategoryList" runat="server" AutoPostBack="true" RepeatLayout="Flow" OnSelectedIndexChanged="chkVendorCategoryList_SelectedIndexChanged">
                                        </asp:CheckBoxList>--%>
                                        <asp:CheckBox ID="chkVendorCategoryList_All" runat="server" AutoPostBack="true" Text="Select All" OnCheckedChanged="chkVendorCategoryList_All_CheckedChanged" /><br />
                                        <asp:DropDownCheckBoxes CssClass="form_panel_checkbox_dropdown" ID="chkVendorCategoryList" runat="server" UseSelectAllNode="false" AutoPostBack="true" OnSelectedIndexChanged="chkVendorCategoryList_SelectedIndexChanged">
                                            <Style SelectBoxWidth="250" DropDownBoxBoxWidth="250" DropDownBoxBoxHeight="150" />
                                            <Items></Items>
                                        </asp:DropDownCheckBoxes>
                                    </div>
                                    <div id="vendorsubcategory" class="categorylist_Heading" style="width: 250px; float: left">
                                        <h4>Vendor Sub Category</h4>
                                        <%--<asp:CheckBoxList ID="chkVendorSubcategoryList" runat="server" RepeatLayout="Flow" OnSelectedIndexChanged="chkVendorSubcategoryList_SelectedIndexChanged">
                                        </asp:CheckBoxList>--%>
                                        <asp:CheckBox ID="chkVendorSubcategoryList_All" runat="server" AutoPostBack="true" Text="Select All" OnCheckedChanged="chkVendorSubcategoryList_All_CheckedChanged" /><br />
                                        <asp:DropDownCheckBoxes CssClass="form_panel_checkbox_dropdown" ID="chkVendorSubcategoryList" runat="server" UseSelectAllNode="false" AutoPostBack="true" OnSelectedIndexChanged="chkVendorSubcategoryList_SelectedIndexChanged">
                                            <Style SelectBoxWidth="250" DropDownBoxBoxWidth="250" DropDownBoxBoxHeight="150" />
                                            <Items></Items>
                                        </asp:DropDownCheckBoxes>
                                    </div>
                                </div>
                                <div class="btn_sec">
                                    <asp:Button ID="btnSave" runat="server" TabIndex="1" Text="Save" CssClass="cssbtnSave" ValidationGroup="addvendor" OnClientClick="return GetVendorDetails(this);" OnClick="btnSave_Click" /><%--OnClick="btnSave_Click" ValidationGroup="addvendor"--%>
                                    <asp:Button ID="btnCancelCategory" runat="server" TabIndex="1" CssClass="cssbtnCancelCategory" Text="Cancel" OnClick="btnCancelCategory_Click" />
                                    <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" ShowMessageBox="true" EnableClientScript="true" HeaderText="You must enter a value in the following fields:" runat="server" ValidationGroup="addvendor" />
                                    <asp:Label ID="LblSave" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                            </asp:Panel>
                            <div class="btn_sec">
                                <%--<asp:Button ID="btnSave" runat="server" TabIndex="1" Text="Save" OnClientClick="return GetVendorDetails(this);" OnClick="btnSave_Click" />--%><%--OnClick="btnSave_Click" ValidationGroup="addvendor"--%>
                                <asp:Button ID="btnupdateVendor" runat="server" Text="Update" Visible="false" OnClientClick="return GetVendorDetails(this);" OnClick="btnupdateVendor_Click1" />
                                <asp:Button ID="btnOpenCategoryPopup" runat="server" TabIndex="1" Text="Save" OnClick="btnOpenCategoryPopup_Click" CssClass="cssOpenCategoryPopup" ValidationGroup="addvendor" />
                                <asp:Button ID="Button4" runat="server" TabIndex="1" Text="Save" Visible="false" />
                            </div>
                        </ContentTemplate>
                      <Triggers>
                      </Triggers>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="updateMaterialList" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
                            <div class="form_panel_custom vendorFilter">
                                <table id="Table1" cellpadding="0" cellspacing="0" border="0" runat="server">
                                    <tr>
                                        <td>
                                            <label>
                                                <strong>Select Period: </strong><span>*</span>
                                            </label>
                                        </td>
                                        <td>&nbsp;
                                        </td>
                                        <td>
                                            <label style="width: 50%;">
                                                <strong>Select Pay Period : </strong>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>
                                                From :
                                            </label>
                                            <asp:TextBox ID="txtfrmdate" runat="server" TabIndex="2" CssClass="date"
                                                MaxLength="10" AutoPostBack="true" OnTextChanged="txtfrmdate_TextChanged"
                                                Style="width: 150px;"></asp:TextBox>
                                            <label></label>
                                            <asp:RequiredFieldValidator ID="requirefrmdate" ControlToValidate="txtfrmdate"
                                                runat="server" ErrorMessage=" Select From date" ForeColor="Red" ValidationGroup="display">
                                            </asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <label style="width: 50px; text-align: right;">
                                                <span>*</span> To :
                                            </label>
                                            <asp:TextBox ID="txtTodate" CssClass="date"
                                                MaxLength="10" runat="server" TabIndex="3" AutoPostBack="true" OnTextChanged="txtTodate_TextChanged"
                                                Style="width: 150px;"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="Requiretodate" ControlToValidate="txtTodate"
                                                runat="server" ErrorMessage=" Select To date" ForeColor="Red" ValidationGroup="display">
                                            </asp:RequiredFieldValidator>
                                        </td>
                                        <td>

                                            <asp:DropDownList ID="drpPayPeriod" runat="server" Width="250px" AutoPostBack="true"
                                                OnSelectedIndexChanged="drpPayPeriod_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                                <div class="grid">
                                    <asp:GridView ID="grdtransations" runat="server" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="tableClass" Width="100%" Style="margin: 0px;">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Date">
                                                <ItemTemplate>
                                                    <%#Eval("Date")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total Amount">
                                                <ItemTemplate>
                                                    <%#Eval("TotalAmount")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Description">
                                                <ItemTemplate>
                                                    <%#Eval("Description")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Payment Method">
                                                <ItemTemplate>
                                                    <%#Eval("PaymentMethod")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Transaction # - Transaction type">
                                                <ItemTemplate>
                                                    <%#Eval("Transations")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <%#Eval("Status")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Invoice Attachement">
                                                <ItemTemplate>
                                                    <%#Eval("InvoiceAttach")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            No Data Found.
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </div>
                                <br />
                                <br />
                                <div class="grid">
                                    <div style="float: left; width: 23%;">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="rdoRetailWholesale1" runat="server" Text="Retail/Wholesale" GroupName="MT" />
                                                    <br />
                                                    <asp:CheckBox ID="rdoManufacturer1" runat="server" Text="Manufacturer" GroupName="MT" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Product Category
                                            <br />
                                                    <asp:DropDownList ID="ddlprdtCategory1" runat="server" Width="162px" AutoPostBack="true" OnSelectedIndexChanged="ddlprdtCategory1_SelectedIndexChanged"></asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Vendor Category
                                            <br />
                                                    <asp:DropDownList ID="ddlVndrCategory1" runat="server" Width="162px" AutoPostBack="True" OnSelectedIndexChanged="ddlVndrCategory1_SelectedIndexChanged"></asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Vendor Sub Category
                                            <br />
                                                    <asp:DropDownList ID="ddlVendorSubCategory1" runat="server" Width="162px" AutoPostBack="True"></asp:DropDownList>
                                                    <%--OnSelectedIndexChanged="ddlVendorSubCategory1_SelectedIndexChanged"--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>SKU
                                            <br />
                                                    <asp:DropDownList ID="DrpSku" runat="server" Width="162px">
                                                        <asp:ListItem>--Select</asp:ListItem>
                                                        <asp:ListItem Value="SOF001">SOF001</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Description
                                            <br />
                                                    <asp:TextBox ID="TxtDescription" runat="server" Width="150px"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div style="float: right; width: 76%; vertical-align: top;">
                                        <asp:GridView ID="grdprimaryvendor" runat="server" AutoGenerateColumns="false" Width="100%"
                                            CssClass="tableClass" HeaderStyle-Wrap="true" ShowHeaderWhenEmpty="true">
                                            <Columns>
                                                <asp:BoundField HeaderText="Primary vendor - Vendor List" DataField="PrimaryVendor" />
                                                <asp:BoundField HeaderText="Total Cost:$ - Notes & fees " DataField="TotalCost" />
                                                <asp:BoundField HeaderText="UOM - $Unit Cost - $Bulk Cost" DataField="UnitCost" />
                                                <asp:BoundField HeaderText="Vendor Part#- Model#" DataField="VendorPart" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <br />
                    <asp:Panel ID="pnlpopupMaterialList" runat="server" BackColor="White" Height="175px" Width="300px"
                        Style="z-index: 111; background-color: White; position: absolute; left: 35%; top: 12%; border: outset 2px gray; padding: 5px; display: none">
                        <table width="100%" style="width: 100%; height: 100%;" cellpadding="0" cellspacing="5">
                            <tr style="background-color: #b5494c">
                                <td colspan="2" style="color: White; font-weight: bold; font-size: 1.2em; padding: 3px"
                                    align="center">Admin Verification
                        <asp:Button ID="btnXAdmin" runat="server" OnClick="btnXAdmin_Click" Text="X" Style="float: right; text-decoration: none" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="width: 45%; text-align: center;">
                                    <asp:Label ID="LabelValidate" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">Admin Password:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAdminPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                                    <asp:CustomValidator ID="CVAdmin" runat="server" ErrorMessage="Invalid Password"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnVerifyAdmin" runat="server" Text="Verify" OnClick="VerifyAdminPermission" />
                                    &nbsp;&nbsp;
                        <input type="button" id="btnCloseAdmin" class="btnClose" value="Cancel" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="pnlSrSalesmanPermissionA" runat="server" BackColor="White" Height="175px"
                        Width="300px" Style="z-index: 111; background-color: White; position: absolute; left: 35%; top: 12%; border: outset 2px gray; padding: 5px; display: none">
                        <table width="100%" style="width: 100%; height: 100%;" cellpadding="0" cellspacing="5">
                            <tr style="background-color: #b5494c">
                                <td colspan="2" style="color: White; font-weight: bold; font-size: 1.2em; padding: 3px" align="center">Sr. Salesman Verification
                                    <asp:Button ID="btnXSrSalesmanA" runat="server" OnClick="btnXSrSalesmanA_Click" Text="X" Style="float: right; text-decoration: none" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="width: 45%; text-align: center;">
                                    <asp:Label ID="Label3" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">Sr. Salesman Password:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSrSalesmanPasswordA" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                                    <asp:CustomValidator ID="CVSrSalesmanA" runat="server" ErrorMessage="Invalid Password"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnVerifySrSalesmanA" runat="server" Text="Verify" OnClick="VerifySrSalesmanPermissionA" />
                                    &nbsp;&nbsp;                       
                                    <input type="button" id="btnCloseSrSalesmanA" class="btnClose" value="Cancel" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="pnlForemanPermission" runat="server" BackColor="White" Height="175px"
                        Width="300px" Style="z-index: 111; background-color: White; position: absolute; left: 35%; top: 12%; border: outset 2px gray; padding: 5px; display: none">
                        <table width="100%" style="width: 100%; height: 100%;" cellpadding="0" cellspacing="5">
                            <tr style="background-color: #b5494c">
                                <td colspan="2" style="color: White; font-weight: bold; font-size: 1.2em; padding: 3px"
                                    align="center">Foreman Verification
                        <asp:Button ID="btnXForeman" runat="server" OnClick="btnXForeman_Click" Text="X"
                            Style="float: right; text-decoration: none" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="width: 45%; text-align: center;">
                                    <asp:Label ID="Label1" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">Foreman Password:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtForemanPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:Label ID="lblErrorForeman" runat="server" Text=""></asp:Label>
                                    <asp:CustomValidator ID="CVForeman" runat="server" ErrorMessage="Invalid Password"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnVerifyForeman" runat="server" Text="Verify" OnClick="VerifyForemanPermission" />
                                    &nbsp;&nbsp;
                        <input type="button" id="btnCloseForeman" class="btnClose" value="Cancel" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="pnlSrSalesManPermissionF" runat="server" BackColor="White" Height="175px"
                        Width="300px" Style="z-index: 111; background-color: White; position: absolute; left: 35%; top: 12%; border: outset 2px gray; padding: 5px; display: none">
                        <table width="100%" style="width: 100%; height: 100%;" cellpadding="0" cellspacing="5">
                            <tr style="background-color: #b5494c">
                                <td colspan="2" style="color: White; font-weight: bold; font-size: 1.2em; padding: 3px"
                                    align="center">Sr. Salesman Verification
                        <asp:Button ID="btnXSrSalesmanF" runat="server" OnClick="btnXSrSalesmanF_Click" Text="X"
                            Style="float: right; text-decoration: none" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="width: 45%; text-align: center;">
                                    <asp:Label ID="Label4" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">Sr. Salesman Password:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSrSalesmanPasswordF" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                                    <asp:CustomValidator ID="CVSrSalesmanF" runat="server" ErrorMessage="Invalid Password"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnVerifySrSalesmanF" runat="server" Text="Verify" OnClick="VerifySrSalesmanPermissionF" />
                                    &nbsp;&nbsp;
                        <input type="button" id="btnCloseSrSalesmanF" class="btnClose" value="Cancel" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
            </div>
        </div>
        <asp:Panel ID="panelPopup" runat="server">
            <div id="light" class="white_content">
                <h3>Disable</h3>
                <a href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">Close</a>
                <br />
                <table>
                    <tr>
                        <td>Enter reaason to disable the Customer.
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtReasonDisable" runat="server" TextMode="MultiLine"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtReasonDisable" ValidationGroup="Reason" runat="server" ErrorMessage="Enter Reason."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnSaveDisable" Height="27px" Width="60px" runat="server" Text="Submit" Style="background: url(img/main-header-bg.png) repeat-x; color: #fff;" ValidationGroup="Reason" OnClick="btnSaveDisable_Click" />
                        </td>
                    </tr>
                </table>
                <asp:HiddenField ID="hidCategoryVendorSearchText" runat="server" />
            </div>
        </asp:Panel>
        <div id="fade" class="black_overlay">
        </div>
    </div>

    <link href="../css/jquery-ui.css" rel="stylesheet" />
    <script src="../js/jquery-ui.js"></script>
    <script src="../Scripts/jquery.maskedinput.min.js" type="text/javascript"></script>
    <%--<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyD0X4v7eqMFcWCR-VZAJwEMfb47id9IZao"></script>--%>


    <script type="text/javascript">
        $(function () {
            //functions for auto search suggestions.
            CreateProcCategorisedAutoSearch();
            SearchProcText();
        });

        var prmProcTaskGenerator = Sys.WebForms.PageRequestManager.getInstance();

        prmProcTaskGenerator.add_endRequest(function () {
            //functions for auto search suggestions.
            CreateProcCategorisedAutoSearch();
            SearchProcText();
        });

        SearchZipCode();

        $('.clsmaskphone').mask("(999) 999-9999");
        $('.clsmaskphoneexten').mask("999999");

        $(".cssbtnPageLoad").click();
        setTimeout(function () {
            // initialize();
        }, 500);

        /*  var mapProp;
          var map;
          function initialize() {
              SearchText();
              SearchZipCode();
              mapProp = {
                  center: new google.maps.LatLng(40.042838, -75.528559),
                  zoom: 9,
                  mapTypeId: google.maps.MapTypeId.ROADMAP
              };
              map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
              getAllAddressOnMap();
          }
          */
        function CreateProcCategorisedAutoSearch() {
            $.widget("custom.proccomplete", $.ui.autocomplete, {
                _create: function () {
                    this._super();
                    this.widget().menu("option", "items", "> :not(.ui-autocomplete-category)");
                },
                _renderMenu: function (ul, items) {
                    var that = this,
                    currentCategory = "";
                    $.each(items, function (index, item) {
                        var li;
                        if (item.Category != currentCategory) {
                            ul.append("<li class='ui-autocomplete-category'> Search " + item.Category + "</li>");
                            currentCategory = item.Category;
                        }
                        li = that._renderItemData(ul, item);
                        if (item.Category) {
                            li.attr("aria-label", item.Category + " : " + item.label);
                        }
                    });

                }
            });
        }


        function getAllAddressOnMap() {
            var manufacturer = "Manufacturer";
            if ($("#<%=rdoRetailWholesale.ClientID%>").attr("checked") == "checked") {
                manufacturer = "Retail/Wholesale";
            }
            var productId = $("#<%=ddlprdtCategory.ClientID%>").val();
            var vendorCatId = $("#<%= ddlVndrCategory.ClientID%>").val();
            var vendorSubCatId = $("#<%=ddlVendorSubCategory.ClientID%>").val();

            productId = productId == "Select" ? "" : productId;
            vendorCatId = vendorCatId == "Select" ? "" : vendorCatId;
            vendorSubCatId = vendorSubCatId == "Select" ? "" : vendorSubCatId;

            $.ajax({
                type: "POST",
                url: "Procurement.aspx/GetAllVendorsAddressDetail",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: '{manufacturer:"' + manufacturer + '", productId: "' + productId + '", vendorCatId: "' + vendorCatId + '", vendorSubCatId:"' + vendorSubCatId + '" }',
                success: function (data) {
                    if (data.d != "") {
                        initializeMapIcon(JSON.parse(data.d));
                    }
                }
            });
        }

        function SearchProcText() {
            $("#<%=txtVendorSearchBox.ClientID%>").proccomplete({
                delay: 500,
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        url: "Procurement.aspx/SearchVendor",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({ searchstring: request.term }),
                        success: function (data) {
                            // Handle 'no match' indicated by [ "" ] response
                            if (data.d) {
                                response(data.length === 1 && data[0].length === 0 ? [] : JSON.parse(data.d));
                            }
                            // remove loading spinner image.                                
                            $("#<%=txtVendorSearchBox.ClientID%>").removeClass("ui-autocomplete-loading");
                        }
                    });
                },
                minLength: 2,
                select: function (event, ui) {
                    $("#<%=txtVendorSearchBox.ClientID%>").val(ui.item.label);
                    $("#<%=hidCategoryVendorSearchText.ClientID%>").val(ui.item.Category);
                    TriggerProcVendorSearch();
                }
            });
        }

        function initializeMapIcon(MapJSON) {
            // Setup the different icons and shadows
            /*    var iconURLPrefix = 'http://maps.google.com/mapfiles/ms/icons/';
    
                var icons = [
                iconURLPrefix + 'red-dot.png',
                iconURLPrefix + 'green-dot.png',
                iconURLPrefix + 'blue-dot.png',
                iconURLPrefix + 'orange-dot.png',
                iconURLPrefix + 'purple-dot.png',
                iconURLPrefix + 'pink-dot.png',
                iconURLPrefix + 'yellow-dot.png'];
    
                var icons_length = icons.length;
    
                for (var i = 0; i < MapJSON.length; i++) {
                    var address = MapJSON[i];
                    var VendorName = address["VendorName"];
                    var Latitude = address["Latitude"];
                    var Longitude = address["Longitude"];
                    var AddressType = address["AddressType"];
                    var VendorStatus = address["VendorStatus"]
                    if (Latitude != null && Latitude != "" && Longitude != null && Longitude != "") {
                        var iconCounter = 0;
                        //if (AddressType == "Primary") {
                        //    iconCounter = 0;
                        //}
                        //if (AddressType == "Secondary") {
                        //    iconCounter = 2;
                        //}
                        //if (AddressType == "Billing") {
                        //    iconCounter = 3;
                        //}
                        if (VendorStatus == "Prospect") {
                            iconCounter = 0;
                        }
                        if (VendorStatus == "Active-Past") {
                            iconCounter = 2;
                        }
                        if (VendorStatus == "Deactivate") {
                            iconCounter = 3;
                        }
                        var infowindow = new google.maps.InfoWindow({
                            maxWidth: 160
                        });
    
                        var marker = new google.maps.Marker({
                            position: new google.maps.LatLng(Latitude, Longitude),
                            map: map,
                            icon: icons[iconCounter],
                            title: VendorName
                        });
    
                        google.maps.event.addListener(marker, 'click', (function (marker, i) {
                            return function () {
                                var FullAddress = "";
                                if (MapJSON[i]['VendorName'] != null)
                                    FullAddress += "<b>" + MapJSON[i]['VendorName'] + "</b>";
                                FullAddress += "<p>";
                                if (MapJSON[i]['Address'] != null)
                                    FullAddress += MapJSON[i]['Address'];
                                if (MapJSON[i]['City'] != null)
                                    FullAddress += ", " + MapJSON[i]['City'];
                                if (MapJSON[i]['State'] != null)
                                    FullAddress += ", " + MapJSON[i]['State'];
                                if (MapJSON[i]['Country'] != null)
                                    FullAddress += ", " + MapJSON[i]['Country'];
                                if (MapJSON[i]['Zip'] != null)
                                    FullAddress += ", " + MapJSON[i]['Zip'];
                                FullAddress += "</p>";
    
                                infowindow.setContent(FullAddress);
                                infowindow.open(map, marker);
                            }
                        })(marker, i));
                    }
                }*/
        }

        function GetCityStateOnBlur(e) {
            ////debugger;
            $.ajax({
                type: "POST",
                url: "Procurement.aspx/GetCityState",
                data: "{'strZip':'" + $(e).val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "JSON",
                success: function (data) {
                    ////debugger;
                    //alert(data.d);
                    var dataInput = (data.d).split("@^");
                    $("#<%=txtPrimaryCity.ClientID%>").val(dataInput[0]);
                    $("#<%=txtPrimaryState.ClientID%>").val(dataInput[1]);
                }
            });
        }

        function onclientselect(strZip) {
            ////debugger;
            $.ajax({
                type: "POST",
                url: "Procurement.aspx/GetCityState",
                data: "{'strZip':'" + strZip + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "JSON",
                success: function (data) {
                    // //debugger;
                    //alert(data.d);
                    var dataInput = (data.d).split("@^");
                    $("#<%=txtPrimaryCity.ClientID%>").val(dataInput[0]);
                    $("#<%=txtPrimaryState.ClientID%>").val(dataInput[1]);
                }
            });
        }

        function SearchZipCode() {
            $(".clstxtZip0").autocomplete({
                minLength: 2,
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Procurement.aspx/GetZipcodes",
                        data: "{'prefixText':'" + $(".clstxtZip0").val() + "'}",
                        dataType: "json",
                        success: function (data) {
                            response($.parseJSON(data.d));
                        },
                        error: function (result) {
                            console.log("No Match");
                        }
                    });
                },
                select: function (event, ui) {
                    $(".clstxtZip0").val(ui.item.value);
                    onclientselect(ui.item.value);
                    return false;
                }
            });
        }

        if ($('#tabs').length) {
            $('#tabs').tabs();
        }

    </script>
    <input type="hidden" id="hdnAmount" runat="server" />
    <style type="text/css">
        .style2 {
            wi h: 100;
        }


        #mas {
            ;
            ositi: ixed;
            ft: top: 0px;
            de: opacit: 0. er: " a form.M crosof y=40); /*
                        opacity= 0)

                 
         lor: gray;
                      displa : non
        
                   width: 100%;
                
                    }
    </style>
    <script type="text/javascript">
        function ShowPopup() {

            if (document.getElementById('<%=txtccamount.ClientID%>')) {
                $('#<%=txtccamount.ClientID%>').attr('readonly', 'readonly');
                $('#<%=txtChangeAmount.ClientID%>').focus();
                if (document.getElementById('<%=txtccamount.ClientID %>').value != '') {
                    document.getElementById('<%=txtChangeAmount.ClientID %>').value = document.getElementById('<%=txtccamount.ClientID %>').value;
                }
            }
            if (document.getElementById('<%=txtAmount.ClientID%>')) {
                $('#<%=txtAmount.ClientID%>').attr('readonly', 'readonly');
                $('#<%=txtChangeAmount.ClientID%>').focus();
                if (document.getElementById('<%=txtAmount.ClientID %>').value != '') {
                    document.getElementById('<%=txtChangeAmount.ClientID %>').value = document.getElementById('<%=txtAmount.ClientID %>').value;
                }
            }
            $('#mask').show();
            $('#<%=pnlPopupChangeAmt.ClientID %>').show();
        }
        function HidePopup() {

            $('#<%=txtChangeAmount.ClientID%>, #<%=txtadminCode.ClientID%>').val('');
            $('#<%=lblError.ClientID%>').text('');
            if (document.getElementById('<%=CheckBox1.ClientID %>')) { document.getElementById('<%=CheckBox1.ClientID %>').checked = false; }
            if (document.getElementById('<%=chkedit.ClientID %>')) { document.getElementById('<%=chkedit.ClientID %>').checked = false; }
            $('#mask').hide();
            $('#<%=pnlPopupChangeAmt.ClientID %>').hide();
        }
        function IsExists(pagePath, dataString, textboxid, errorlableid) {
            $.ajax({
                type: "POST",
                url: pagePath,
                data: dataString,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error:
          function (XMLHttpRequest, textStatus, errorThrown) {
              $(errorlableid).show();
              $(errorlableid).html("Error");
          },
                success:
          function (result) {
              if (result != null) {
                  var flg = (result.d);

                  if (flg == "True") {
                      $(errorlableid).show();
                      $(errorlableid).html('Verified');
                      if (document.getElementById('<%=txtccamount.ClientID %>')) { document.getElementById('<%=txtccamount.ClientID %>').value = document.getElementById('<%=txtChangeAmount.ClientID %>').value; }
                      if (document.getElementById('<%=txtAmount.ClientID %>')) { document.getElementById('<%=txtAmount.ClientID %>').value = document.getElementById('<%=txtChangeAmount.ClientID %>').value; }
                      document.getElementById('<%=hdnAmount.ClientID %>').value = document.getElementById('<%=txtChangeAmount.ClientID %>').value;

                      $('#mask').hide();
                      $('#<%=pnlPopupChangeAmt.ClientID %>').hide();
                      if (document.getElementById('<%=CheckBox1.ClientID %>')) { document.getElementById('<%=CheckBox1.ClientID %>').checked = false; }
                      if (document.getElementById('<%=chkedit.ClientID %>')) { document.getElementById('<%=chkedit.ClientID %>').checked = false; }
                  }
                  else {
                      $(errorlableid).show();
                      $(errorlableid).html('failure');
                  }
              }
          }
            });
  }

  function focuslost() {
      if (document.getElementById('<%= txtChangeAmount.ClientID%>').value == '') {
          alert('Please enter proposal cost!');
          return false;
      }
      else if (document.getElementById('<%= txtadminCode.ClientID%>').value == '') {
          alert('Please enter admin code!');
          return false;
      }
      else {
          var pagePath = "Custom.aspx/Exists";
          var dataString = "{ 'value':'" + document.getElementById('<%= txtadminCode.ClientID%>').value + "' }";
          var textboxid = "#<%= txtadminCode.ClientID%>";
          var errorlableid = "#<%= lblError.ClientID%>";

          IsExists(pagePath, dataString, textboxid, errorlableid);
          return true;
      }
}
function TriggerProcVendorSearch() {
    $('#<%=btnSearchProcVendor.ClientID %>').click();
}
    </script>
    <div id="mask">
    </div>
    <asp:Panel ID="pnlPopupChangeAmt" runat="server" BackColor="White" Height="175px" Width="300px"
        Style="ex: 9999 9; ba: Whit; pos
            left: 3 %; to
        der: outset 2px gray; padding: 5px; display: none">
        <table width="100%" style="width: 100%; height: 100%;" cellpadding="0" cellspacing="5">
            <tr style="background-color: #b5494c">
                <td colspan="2" style="color: White; font-weight: bold; font-size: 1.2em; padding: 3px"
                    align="center">Admin Verification <a id="closebtn" style="color: white; float: right; text-decoration: none"
                        class="btnClose" href="#">X</a>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 45%; text-align: center;">
                    <asp:Label ID="Label21" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 45%">Amount:
                </td>
                <td>
                    <asp:TextBox ID="txtChangeAmount" runat="server" onkeypress="return isNumericKey(event);"
                        MaxLength="20" Text=""></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">Admin Password:
                </td>
                <td>
                    <asp:TextBox ID="txtadminCode" runat="server" TextMode="Password" Text=""></asp:TextBox>
                    <asp:Label ID="Label22" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="button" class="btnVerify" value="Verify" onclick="javascript: return focuslost();" />
                    &nbsp;&nbsp;
                    <input type="button" class="btnClose" value="Cancel" onclick="javascript: HidePopup();" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
