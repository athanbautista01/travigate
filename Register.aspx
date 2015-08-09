<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server" class="form-horizontal">
        <br />
        <div class="thumbnail2 col-lg-offset-2 col-lg-5">
            <h6>Register to travigate <br />unfamiliar destination!</h6>
            <br />
            <center>
                <div id="error" runat="server" class="alert alert-danger" visible="false">
            Email address already existing.
            </div>
                <div class="form-group">
                    <label class="control-label">FIRSTNAME</label>
                    <div class="col-lg-12">
                        <asp:TextBox ID="txtFN" runat="server" class="form-control" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">LASTNAME</label>
                    <div class="col-lg-12">
                        <asp:TextBox ID="txtLN" runat="server" class="form-control" required />
                    </div>
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

                <div class="col-lg-offset-1 col-lg-5">
                    <br />
                    <asp:Button ID="btnRegister" runat="server" class="btn btn-success" Text="REGISTER"
                        OnClick="btnRegister_Click" /><br /><br /><br />
                </div>
                </center>
            </div>
    </form>
</asp:Content>

