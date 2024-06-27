<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminAuthorManagement.aspx.cs" Inherits="ELibrary.AdminAuthorManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
           
            $(".table").prepand($("<thread></thread>").append($(this).find("tr:first"))).datatable();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

                <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        
                        <div class="row">
                            <div class="col">
                                <center>
                                  <h4>Author Details</h4>  
                                </center>
                            </div>
                        </div>
   <div class="row">
    <div class="col">
        <center>
            <img src="imgs/writer.png" width="100" />
        </center>
    </div>
</div>
                        <div class="row">
                          <div class="col">
                           <hr>
                         </div>
                         </div>

                        <div class="row">
  <div class="col-md-4">
       <label>Author ID:</label> <asp:RequiredFieldValidator ID="rfvAuthorID" runat="server" ErrorMessage="Required" ControlToValidate="txtAuthorID" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
<div class="form-group">
    <div class="input-group">
    <asp:TextBox class="form-control" ID="txtAuthorID" runat="server" placeholder="ID" TextMode="Number"></asp:TextBox>
     <asp:Button class="btn btn-primary" runat="server" id="btnGo" type="button" Text="Go" OnClick="btnGo_Click" />
</div>
</div>
 </div>
  
                             <div class="col-md-8">
        <label>Author Name:</label> <asp:RequiredFieldValidator ID="rfvAuthorName" runat="server" ErrorMessage="Required" ControlToValidate="txtAuthorName" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtAuthorName" runat="server" placeholder="Author Name" TextMode="SingleLine"></asp:TextBox>
</div>
</div>
 </div>

 <div class="row">
  <div class="col-4">
       <asp:Button class="btn btn-success btn-block w-100 btn-lg" id="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />                                             
  </div>
      <div class="col-4">
      <asp:Button class="btn btn-primary btn-block w-100 btn-lg" id="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />                                             
 </div>
      <div class="col-4">
      <asp:Button class="btn btn-block btn-lg w-100 btn-danger" id="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />                                             
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
                                  <h4>Author List</h4>  
                                    
                                </center>
                            </div>
                        </div>
                        <div class="row">
                          <div class="col">
                           <hr>
                         </div>
                         </div>
                                                      <asp:SqlDataSource ID="SqlDataSourceAuthor" runat="server" ConnectionString='<%$ ConnectionStrings:ELibraryDBConnectionString %>' ProviderName='<%$ ConnectionStrings:ELibraryDBConnectionString.ProviderName %>' SelectCommand="SELECT * FROM [tblAuthorMaster]"></asp:SqlDataSource>

                          <div class="row">
                              <div class="col">
                                  <asp:GridView  class="table table-striped table-bordered" ID="gvAuthors" runat="server" CellPadding="4" DataSourceID="SqlDataSourceAuthor" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True">
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
