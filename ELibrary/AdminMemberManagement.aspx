<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminMemberManagement.aspx.cs" Inherits="ELibrary.AdminMemberManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
     $(document).ready(function () {

         $(".table").prepand($("<thread></thread>").append($(this).find("tr:first"))).datatable();
     });
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


                        <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        
                        <div class="row">
                            <div class="col">
                                <center>
                                  <h4>Member Details</h4>  
                                </center>
                            </div>
                        </div>
                        <div class="row">
    <div class="col">
        <center>
            <img src="imgs/generaluser.png" width="100" />
        </center>
    </div>
</div>
                        <div class="row">
                          <div class="col">
                           <hr>
                         </div>
                         </div>
                        <div class="row">
                                <div class="col-md-3">
       <label>Member ID:</label> <asp:RequiredFieldValidator ID="rfvMemberID" runat="server" ErrorMessage="Required" ControlToValidate="txtMemberID" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
<div class="form-group">
    <div class="input-group">
    <asp:TextBox class="form-control" ID="txtMemberID" runat="server" placeholder="ID"></asp:TextBox>
        <asp:LinkButton class="btn btn-primary" ID="lbtnGo" runat="server" OnClick="lbtnGo_Click" TabIndex="1" CausesValidation="False"><i class="fas fa-check-circle"></i></asp:LinkButton>
</div>
</div>
 </div>
                             <div class="col-md-4">
        <label>Full Name:</label> <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ErrorMessage="Required" ControlToValidate="txtFullName" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtFullName" runat="server" placeholder="Name" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
</div>
</div>
     
                              <div class="col-md-5">
        <label>Account Status:</label> <asp:RequiredFieldValidator ID="rfvAccountStatus" runat="server" ErrorMessage="Required" ControlToValidate="txtAccountStatus" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <div class="input-group">
    <asp:TextBox class="form-control" ID="txtAccountStatus" runat="server" placeholder="AccountStatus" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
        <asp:LinkButton class="btn btn-success" ID="lbtnSuccess" runat="server" OnClick="lbtnSuccess_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
        <asp:LinkButton class="btn btn-warning" ID="lbtnPending" runat="server" OnClick="lbtnPending_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
       <asp:LinkButton class="btn btn-danger" ID="lbtnDeactive" runat="server" OnClick="lbtnDeactive_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
</div>

</div>
</div>

 </div>

                                                

                                                                        <div class="row">
  
  
                             <div class="col-md-3">
        <label>BOD:</label> <asp:RequiredFieldValidator ID="rfvBOD" runat="server" ErrorMessage="Required" ControlToValidate="txtBOD" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtBOD" runat="server" placeholder="BOD" TextMode="Date" ReadOnly="True"></asp:TextBox>
</div>
</div>

                                                                                 <div class="col-md-4">
        <label>Contact Number:</label> <asp:RequiredFieldValidator ID="rfvContactNumber" runat="server" ErrorMessage="Required" ControlToValidate="txtContactNumber" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtContactNumber" runat="server" placeholder="Contact No" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
</div>
</div>
                                                                                 <div class="col-md-5">
        <label>Email ID:</label> <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Required" ControlToValidate="txtEmail" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtEmail" runat="server" placeholder="Email" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
</div>
</div>
                              
 </div>



                                                                                                <div class="row">
  
  
                             <div class="col-md-4">
        <label>State:</label> <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="Required" ControlToValidate="txtState" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtState" runat="server" placeholder="State" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
</div>
</div>

                                                                                 <div class="col-md-4">
        <label>City:</label> <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="Required" ControlToValidate="txtCity" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtCity" runat="server" placeholder="Contact No" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
</div>
</div>
                                                                                 <div class="col-md-4">
        <label>Pin Code:</label> <asp:RequiredFieldValidator ID="rfvPinCode" runat="server" ErrorMessage="Required" ControlToValidate="txtPinCode" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtPinCode" runat="server" placeholder="Email" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
</div>
</div>
                              
 </div>
                                                                        <div class="row">
  
  
                            

                                                                                 <div class="col-12">
        <label>Full Address:</label> <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Required" ControlToValidate="txtFullAddress" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtFullAddress" runat="server" placeholder="Full Postal Address" TextMode="MultiLine" ReadOnly="False" Rows="2"></asp:TextBox>
</div>
</div>

                              
 </div>


 <div class="row">
  
      
      <div class="col-8 mx-auto">
      <asp:Button class="btn btn-block  w-100 btn-danger" id="btnDelete" runat="server" Text="Delete User Permenently" OnClick="btnDelete_Click" />                                             
 </div>
   </div>

  </div>
  </div>                  
                <a href="HomePage.aspx">Back To Home Page</a><br /><br />
            
        </div>
          <div class="col-md-6">
                
                               <div class="card">
                    <div class="card-body">
                        
                        <div class="row">
                            <div class="col">
                                <center>
                                  <h4>Member List</h4>  
                                    
                                </center>
                            </div>
                        </div>
                        <div class="row">
                          <div class="col">
                           <hr>
                         </div>
                         </div>
                          <div class="row">

                              <asp:SqlDataSource ID="SqlDataSourceMember" runat="server" ConnectionString="<%$ ConnectionStrings:ELibraryDBConnectionString %>" ProviderName="<%$ ConnectionStrings:ELibraryDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [tblMemberMaster]"></asp:SqlDataSource>
                              <div class="col">
                                  <asp:GridView class="table table-striped table-bordered" ID="gvMembers" runat="server" CellPadding="4" DataSourceID="SqlDataSourceMember" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True">
                                      <AlternatingRowStyle BackColor="White" />
                                      <EditRowStyle BackColor="#2461BF" />
                                      <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                      <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                      <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                      <RowStyle BackColor="#EFF3FB" />
                                      <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                      <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                      <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                      <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                      <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                  </asp:GridView>
                               </div>
                         </div>
                        

                                                                                       
                                                
                                                                        
                    </div>
                </div>
             </div>   
            
       </div>
    </div>

</asp:Content>
