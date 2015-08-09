<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <h1> <i class="fa fa-users"></i> View User Content </h1>
    <form runat="server" class="form-horizontal">
        <div class="col-lg-12">
            <table class="table table-hover">
             <thead>
                <th>Place ID</th>
                <th>Name</th>
                <th>Exact Location</th>
                <th>Country</th>
                <th>Image</th>
                <th>Description</th>
                <th>Date Added</th>
                <th>Status</th>
                <th></th>
             </thead>
             <tbody>
                <asp:ListView ID="lvUsers" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("PlaceID") %></td>
                            <td><%# Eval("Name") %></td>
                            <td><%# Eval("ExactLocation") %> </td>
                            <td ><%# Eval("Country") %> </td>
                              <td>
                                <img id="Img1" runat="server" src='<%# string.Concat("~/img/user/", Eval("Image")) %>'
                                class="img-responsive" width="100" />
                              </td>
                            <td> <%# Eval("Description") %> </td>
                            <td> <%# Eval("DateAdded","{0:MMMM dd, yyyy hh:mm:ss tt}") %></td>
                            <td> <%# Eval("Status") %></td>
                            <td>
                                <a href='Edit.aspx?ID=<%# Eval("PlaceID") %>'>
                                    <i class="fa fa-edit"></i>
                                </a>
                                <a href='Delete.aspx?ID=<%# Eval("PlaceID") %>' 
                                onclick ='return confirm("Are you sure?");'>
                                    <i class="fa fa-trash"></i>
                                </a>

                            </td>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <tr>
                            <td colspan="9">
                                <h2 class="text-center">No users found</h2>
                            </td>
                        </tr>
                    </EmptyDataTemplate>
                </asp:ListView>
             
             </tbody>
            </table>
        </div>
    </form>
</asp:Content>
