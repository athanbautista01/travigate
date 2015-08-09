<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <div>
        <div class="container">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                </br>
                <h1 class="page-header">
                    Contact
                </h1>
                <div id="sub" runat="server" class="alert alert-success" visible="false">
                    Thank you! Your message has been successfully sent.
                </div>
            </div>
        </div>
        <!-- /.row -->
        <!-- Content Row -->
        <div class="row">
            <!-- Map Column -->
            <%--<div class="col-md-8">
                <!-- Embedded Google Map -->
                <script src='https://maps.googleapis.com/maps/api/js?v=3.exp'></script>
                <div style='overflow: hidden; height: 499px; width: 694px;'>
                    <div id='gmap_canvas' style='height: 499px; width: 694px;'>
                    </div>
                    <style>
                        #gmap_canvas img
                        {
                            max-width: none !important;
                            background: none !important;
                        }
                    </style>
                </div>
                <a href='http://www.maps-generator.com'>Maps-Generator.com</a>
                <script type='text/javascript' src='http://embedmaps.com/google-maps-authorization/script.js?id=2ce9891a7acd6fb42567243b4cca70c0cae8b556'></script>
                <script type='text/javascript'>                    function init_map() {
                        var myOptions = {
                            zoom: 17, center: new google.maps.LatLng(14.562995892650694, 120.99517577790984),
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
                        map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);
                        marker = new google.maps.Marker({ map: map, position: new google.maps.LatLng(14.562995892650694, 120.99517577790984) });
                        infowindow = new google.maps.InfoWindow({
                            content: '<strong></strong><br>' +
'P. Ocampo<br>' +
' manila<br>'
                        });
                        google.maps.event.addListener(marker, 'click', function () {
                            infowindow.open(map, marker);
                        });
                        infowindow.open(map, marker);
                    }
                    google.maps.event.addDomListener(window, 'load', init_map);
                </script>
            </div>--%>
            <!-- Contact Details Column -->
            <div class="col-md-4">
                <div class="container1">
                    <h3>
                        Contact Details</h3>
                    <hr />
                    <p>
                        2544 Taft Avenue Manila<br>
                        Philippines<br>
                    </p>
                    <p>
                        <i class="fa fa-phone"></i>
                        <abbr title="Phone">
                            P</abbr>: (02) 456-7890</p>
                    <p>
                        <i class="fa fa-envelope-o"></i>
                        <abbr title="Email">
                            E</abbr>: <a href="mailto:name@example.com">Travigate@benilde.edu.ph</a>
                    </p>
                    <ul class="list-unstyled list-inline list-social-icons">
                        <li><a href="#"><i class="fa fa-linkedin-square fa-2x"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter-square fa-2x"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus-square fa-2x"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /.row -->
        <!-- Contact Form -->
        <div class="row">
            <div class="col-md-8">
                <h3>
                    Send us a Message!</h3>
                <hr />
                <div class="form-group">
                    <label class="control-label col-lg-4">
                        Message:
                    </label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtMessage" runat="server" class="form-control" TextMode="MultiLine"
                            MaxLength="1000" required /><br />
                    </div>
                </div>
                <div class="col-lg-12">
                    <asp:LinkButton ID="btnSend" runat="server" class="btn btn-success pull-right" 
                        onclick="btnSend_Click">
                            Send Message
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <br />
    </div>
    </form>
</asp:Content>

