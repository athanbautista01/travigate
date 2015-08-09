<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Home1.aspx.cs" Inherits="Home1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server" class="form-horizontal">
        <br />
        <div class="thumbnail2 col-lg-offset-2 col-lg-5">
            <h6>Login to travigate <br />unfamiliar destination!</h6>
            <br />
            <center>
                <div id="error" runat="server" class="alert alert-danger" visible="false">
            Invalid email address or password.
        </div>
                <div class="form-group">
                    <label class="control-label">EMAIL</label>
                    <div class="col-lg-12">
                        <asp:TextBox ID="txtE" runat="server" type="email" class="form-control" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">PASSWORD</label>
                    <div class="col-lg-12">
                        <asp:TextBox ID="txtP" runat="server" type="password" class="form-control" required />
                    </div>
                </div>
                <a href="Register.aspx"><u>Register if you don't have account.</u></a>
                <div class="col-lg-offset-1 col-lg-5">
                    <br />
                    <asp:Button ID="btnLogin" runat="server" class="btn btn-success" Text="LOG IN"
                        OnClick="btnLogin_Click" /><br /><br /><br />
                    
                </div>
                </center>
            </div>
    </form>
</asp:Content>

