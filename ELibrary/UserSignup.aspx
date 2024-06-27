<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserSignup.aspx.cs" Inherits="ELibrary.UserSignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/generaluser.png" width="100" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                  <h4>User Registration</h4>  
                                </center>
                            </div>
                        </div>
                        <div class="row">
                          <div class="col">
                           <hr>
                         </div>
                         </div>

                        <div class="row">
  <div class="col-md-6">
       <label>Full Name:</label><asp:RequiredFieldValidator ID="rfvFullName" runat="server" ErrorMessage="Required" ControlToValidate="txtFullName" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
<div class="form-group">
    <asp:TextBox class="form-control" ID="txtFullName" runat="server" placeholder="FullName"></asp:TextBox>
</div>
 </div>
                             <div class="col-md-6">
        <label>Date Of Birth:</label> <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ErrorMessage="Required" ControlToValidate="txtFullName" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtDOB" runat="server"  TextMode="Date"></asp:TextBox>
</div>
</div>
 </div>

                                                <div class="row">
  <div class="col-md-6">
       <label>Contact Number:</label> <asp:RequiredFieldValidator ID="rfvContactNumber" runat="server" ErrorMessage="Required" ControlToValidate="txtContactNo" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
<div class="form-group">
    <asp:TextBox class="form-control" ID="txtContactNo" runat="server" placeholder="Contact No"></asp:TextBox>
</div>
 </div>
                             <div class="col-md-6">
        <label>Email ID: <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Required" ControlToValidate="txtEmail" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
                                 </label>
      &nbsp;<div class="form-group">
    <asp:TextBox class="form-control" ID="txtEmail" runat="server"  TextMode="Email"></asp:TextBox>
</div>
</div>
 </div>

                                                                        <div class="row">
  <div class="col-md-4">
       <label>State:</label> <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="Required" ControlToValidate="ddlState" BackColor="White" InitialValue="Select" style="color: #FF0000"></asp:RequiredFieldValidator>
<div class="form-group">
    <asp:DropDownList class="form-control" ID="ddlState" runat="server">
        <asp:ListItem text="Select" value="Select"></asp:ListItem>
        <asp:ListItem text="Doha" value="Doha"></asp:ListItem>
        <asp:ListItem text="Wakra" value="Wakra"></asp:ListItem>
        <asp:ListItem text="Rayyan" value="Rayyan"></asp:ListItem>
        <asp:ListItem text="Gharrafah" value="Gharrafah"></asp:ListItem>
        <asp:ListItem text="Khor" value="Khor"></asp:ListItem>
    </asp:DropDownList>

</div>
 </div>
                             <div class="col-md-4">
        <label>City:</label> <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="Required" ControlToValidate="txtCity" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtCity" runat="server"  placeholder="City"></asp:TextBox>
</div>
</div>
                                                                                                         <div class="col-md-4">
        <label>Pin Code:</label> <asp:RequiredFieldValidator ID="rfvPinCode" runat="server" ErrorMessage="Required" ControlToValidate="txtPinCode" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtPinCode" runat="server"  placeholder="PinCode" TextMode="Number"></asp:TextBox>
</div>
</div>
 </div>

                                                                        <div class="row">
  <div class="col">
       <label>Full Address:</label> <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Required" ControlToValidate="txtAddress" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
<div class="form-group">
    <asp:TextBox class="form-control" ID="txtAddress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
</div>
 </div>
                             
 </div>
                                                <div class="row">
  <div class="col">
     
     
            
        <center>    <span class="badge rounded-pill text-bg-info">Login Credentials</span></center>
 </div>
 </div>

                                                                        <div class="row">
  <div class="col-md-6">
       <label>User ID::</label> <asp:RequiredFieldValidator ID="rfvUserID" runat="server" ErrorMessage="Required" ControlToValidate="txtUserID" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
<div class="form-group">
    <asp:TextBox class="form-control" ID="txtUserID" runat="server" placeholder="UserID"></asp:TextBox>
</div>
 </div>
                             <div class="col-md-6">
        <label>Password:</label> <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Required" ControlToValidate="txtPassword" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtPassword" runat="server" placeholder="Passwrod" TextMode="Password"></asp:TextBox>
</div>
</div>
 </div>

                        <div class="row">
  <div class="col">
     
     
            
                  <div class="form-group">
                      <asp:Button class="btn btn-success btn-block w-100 btn-lg" runat="server" id="btnSignUp" value="Sign Up" OnClick="btnSignUp_Click" Text="Sign Up" />
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
