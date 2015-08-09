<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />View Profile 

    <div class="col-lg-6">
        <br />
        <asp:ListView runat="server" ID="lvUsers" >
                    <ItemTemplate>
        <p>FirstName: <asp:Literal ID="ltFN" runat="server" Text='<%#Eval("FirstName") %>' /></p>
        <p>LastName: <asp:Literal ID="ltLN" runat="server" Text='<%#Eval("LastName") %>' /></p>
        <p>Street: <asp:Literal ID="ltStreet" runat="server" Text='<%#Eval("Street") %>' /></p>
        <p>Municipality: <asp:Literal ID="ltMunicipality" runat="server" Text='<%#Eval("Municipality") %>' /></p>
        <p>City: <asp:Literal ID="ltCity" runat="server" Text='<%#Eval("City") %>'/></p>
        <p>Country: <asp:Literal ID="ltCountry" runat="server" Text='<%#Eval("Country") %>' /></p>
        <p>ZipCode: <asp:Literal ID="ltZipCode" runat="server" Text='<%#Eval("ZipCode") %>' /></p>
         </ItemTemplate>
                </asp:ListView>


    </div>
</asp:Content>

