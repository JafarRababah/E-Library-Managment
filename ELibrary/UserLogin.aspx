<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="ELibrary.UserLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/generaluser.png" width="150" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                  <h3>Member Login</h3>  
                                </center>
                            </div>
                        </div>
                        <div class="row">
                          <div class="col">
                           <hr>
                         </div>
                         </div>
                        <div class="row">
  <div class="col">
      <label>Member ID:</label>
  <div class="form-group">
      <asp:TextBox class="form-control" ID="txtMemberID" runat="server" placeholder="Member ID"></asp:TextBox>
  </div>
      <label>Password:</label>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
</div>
            <div class="form-group">
                <asp:Button  class="btn btn-success btn-block w-100 btn-lg"  ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />

</div>
                  <div class="form-group">
                      <input class="btn btn-info btn-block w-100 btn-lg" id="btnSignUp" type="button" value="Sign Up" />
</div>
 </div>
 </div>
                    </div>
                </div>
                <a href="HomePage.aspx">Back To Home Page</a><br /><br />
            
        </div>
       </div>
    </div>
</asp:Content>
