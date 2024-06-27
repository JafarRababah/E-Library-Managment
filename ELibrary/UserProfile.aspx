<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="ELibrary.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
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
                                  <h4>Your Profile</h4>  
                                    <span>Account Status - </span>
                                    <asp:Label class="badge rounded-pill text-bg-info" ID="Label1" runat="server" Text="Your Status"></asp:Label>
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
       <label>Full Name:</label>
<div class="form-group">
    <asp:TextBox Cssclass="form-control" ID="txtFullName" runat="server" placeholder="FullName"></asp:TextBox>
</div>
 </div>
                             <div class="col-md-6">
        <label>Date Of Birth:</label>
      <div class="form-group">
    <asp:TextBox Cssclass="form-control" ID="txtBOD" runat="server"  TextMode="Date"></asp:TextBox>
</div>
</div>
 </div>

                                                <div class="row">
  <div class="col-md-6">
       <label>Contact Number:</label>
<div class="form-group">
    <asp:TextBox Cssclass="form-control" ID="txtContactNo" runat="server" placeholder="Contact No"></asp:TextBox>
</div>
 </div>
                             <div class="col-md-6">
        <label>Email ID:</label>
      <div class="form-group">
    <asp:TextBox Cssclass="form-control" ID="txtEmail" runat="server"  TextMode="Email"></asp:TextBox>
</div>
</div>
 </div>

                                                                        <div class="row">
  <div class="col-md-4">
       <label>State:</label>
<div class="form-group">
    <asp:DropDownList Cssclass="form-control" ID="ddlState" runat="server">
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
        <label>City:</label>
      <div class="form-group">
    <asp:TextBox Cssclass="form-control" ID="txtCity" runat="server"  placeholder="City"></asp:TextBox>
</div>
</div>
                                                                                                         <div class="col-md-4">
        <label>Pin Code:</label>
      <div class="form-group">
    <asp:TextBox Cssclass="form-control" ID="txtPinCode" runat="server"  placeholder="PinCode" TextMode="Number"></asp:TextBox>
</div>
</div>
 </div>

                                                                        <div class="row">
  <div class="col">
       <label>Full Address:</label>
<div class="form-group">
    <asp:TextBox Cssclass="form-control" ID="txtAddress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
</div>
 </div>
                             
 </div>
                                                <div class="row">
  <div class="col">
     
     
            
        <center>    <span class="badge rounded-pill text-bg-info">Login Credentials</span></center>
 </div>
 </div>

                                                                        <div class="row">
  <div class="col-md-4">
       <label>User ID::</label>
<div class="form-group">
    <asp:TextBox Cssclass="form-control" ID="txtUserID" runat="server" placeholder="UserID" ReadOnly="True"></asp:TextBox>
</div>
 </div>
                             <div class="col-md-4">
        <label>Old Password:</label>
      <div class="form-group">
    <asp:TextBox Cssclass="form-control" ID="txtOldPassword" runat="server" placeholder="Passwrod" TextMode="Password" ReadOnly="True"></asp:TextBox>
</div>
</div>
        <div class="col-md-4">
        <label>New Password:</label>
      <div class="form-group">
    <asp:TextBox Cssclass="form-control" ID="txtNewPassword" runat="server" placeholder="Passwrod" TextMode="Password"></asp:TextBox>
</div>
</div>
 </div>

                        <div class="row">
  <div class="col">
     
     
            
                  <div class="form-group">
                      <asp:Button class="btn btn-primary btn-block w-100" runat="server" id="btnUpdate"  Text="Update" OnClick="btnUpdate_Click" />
</div>
 </div>
 </div>
                    </div>
                </div>
                <a href="HomePage.aspx">Back To Home Page</a><br /><br />
            
        </div>
            <div class="col-md-7">
                               <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/Books.png" width="100" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                  <h4>Your Issued Books</h4>  
                                    <span>Your Books - </span>
                                    <asp:Label class="badge rounded-pill text-bg-info" ID="Label2" runat="server" Text="Your Books Info"></asp:Label>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                          <div class="col">
                           <hr>
                         </div>
                         </div>
                          <div class="row">
                              <asp:SqlDataSource ID="SqlDataSourceBookIssue" runat="server" ConnectionString="<%$ ConnectionStrings:ELibraryDBConnectionString %>" ProviderName="<%$ ConnectionStrings:ELibraryDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [tblBookIssue]"></asp:SqlDataSource>
                              <div class="col">
                                  <asp:GridView class="table table-striped table-bordered" ID="gvUserProfile" runat="server" CellPadding="4" DataSourceID="SqlDataSourceBookIssue" ForeColor="#333333" GridLines="None">
                                      <AlternatingRowStyle BackColor="White" />
                                      <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                      <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                      <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                      <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                      <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                      <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                      <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                      <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                      <SortedDescendingHeaderStyle BackColor="#820000" />
                                  </asp:GridView>
                               </div>
                         </div>
                        

                                                

                                                                     

                                                                      
                                                

                                                                        
                    </div>
                </div>
                
            </div>
       </div>
    </div>


</asp:Content>
