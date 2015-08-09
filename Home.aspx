<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" codefile="Home.aspx.cs" inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server" class="form-horizontal">
        <br />
        <div class="thumbnail1 col-lg-12">
            <h4>Hi <a href='MyProfile.aspx?ID=<%# Eval("UserID") %>'><asp:Literal ID="ltName" runat="server" /></a>, <br />travigate now your unfamiliar destination!</h4>
            <br />
            <div class="col-lg-6">

                <div class="form-group">
                    <label class="control-label col-lg-4">Category</label>
                    <div class="col-lg-8">
                        <asp:DropDownList ID="ddlCategories" runat="server" class="form-control" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Name</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtName" runat="server" class="form-control" MaxLength="100" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Exact Location</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtEL" runat="server" class="form-control" MaxLength="200" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Country</label>
                    <div class="col-lg-8">
                        <asp:DropDownList ID="ddlCountry" runat="server" class="form-control">
                            <asp:ListItem>Philippines</asp:ListItem>
                            <asp:ListItem>United States</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="form-group">
                <label class="control-label col-lg-4">Image</label>
                <div class="col-lg-8">
                    <asp:FileUpload ID="fuImage" runat="server" class="form-control" />
                </div>
            </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Description</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtDesc" runat="server" class="form-control" TextMode="MultiLine"
                            MaxLength="1000" Height="90px" required />
                    </div>
                </div>

                <div class="col-lg-offset-4 col-lg-8">

                    <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="POST"
                        OnClick="btnAdd_Click" />
                </div>
            </div>
        </div>
<br>
<br>
        <asp:ListView ID="lvPlaces" runat="server">
            <ItemTemplate>
                <div class="col-lg-12">
                    <div class="thumbnail">
                        <br />
                        <%--<h4><%# Eval("FirstName") %> <%# Eval("LastName") %></h4>--%>
                        <img class="img-responsive" src='img/places/<%# Eval("Image") %>' />
                        <center>
                            <div class="caption">
                                <h1>
                                    <%# Eval("Name") %> [<%# Eval("Category") %>]</h1>
                                    <h6><%# Eval("DateAdded", "{0: MMMM dd, yyyy}")%></h6>
                                <h3>
                                        </h3>
                                <h7>
                                    <%# Eval("ExactLocation") %> ( <%# Eval("Country") %>)</h7>
                                    
                                <h7>
                                    <%# Eval("Description") %> </h7>
                                    
                            </div>
                                    </center>

                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
        <br />
        <br />
    </form>
</asp:Content>

