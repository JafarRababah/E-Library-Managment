<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookingInventory.aspx.cs" Inherits="ELibrary.AdminBookingInventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
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
                                  <h4>Book Details</h4>  
                                </center>
                            </div>
                        </div>
                        <div class="row">
    <div class="col">
        <center>
            <img id="imgview" src="BookInventory/Books1.png" height="120" width="100" />
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
      <asp:FileUpload onchange="readURL(this);" class="form-control" ID="fuBook" runat="server" />
 </div>
 </div>

                 <div class="row">

                                <div class="col-md-3">
       <label>Book ID:</label> <asp:RequiredFieldValidator ID="rfvBookID" runat="server" ErrorMessage="Required" ControlToValidate="txtBookID" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
<div class="form-group">
    <div class="input-group">
    <asp:TextBox class="form-control" ID="txtBookID" runat="server" placeholder="ID" TextMode="SingleLine"></asp:TextBox>
        <asp:LinkButton class="btn btn-primary" ID="lbtnGo" runat="server" OnClick="lbtnGo_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
</div>
</div>
 </div>
                             <div class="col-md-9">
        <label>Book Name:</label>&nbsp; <asp:RequiredFieldValidator ID="rfvBookName" runat="server" ErrorMessage="Required" ControlToValidate="txtBookName" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtBookName" runat="server" placeholder="Name" TextMode="SingleLine"></asp:TextBox>
</div>
</div>
     
                              

 </div>

                                                

                                                                        <div class="row">
  
  
                             <div class="col-md-4">
        <label>Language:</label> <asp:RequiredFieldValidator ID="rfvLanguage" runat="server" ErrorMessage="Required" ControlToValidate="ddlLanguage" BackColor="White" InitialValue="Select" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
          <asp:DropDownList CssClass="form-control" ID="ddlLanguage" runat="server">
          <asp:ListItem  Text="English" value="English" />
          <asp:ListItem  Text="Arabic" value="Arabic" />
          <asp:ListItem  Text="French" value="French" />
          <asp:ListItem  Text="Dutch" value="Dutch" />
          <asp:ListItem  Text="Spain" value="Spain" />
          <asp:ListItem  Text="Urdo" value="Urdo" />
              </asp:DropDownList>
</div>
                                         <label>Publisher Name:</label> <asp:RequiredFieldValidator ID="rfvPublisherName" runat="server" ErrorMessage="Required" ControlToValidate="ddlPublisher" BackColor="White" InitialValue="Select" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
          <asp:DropDownList CssClass="form-control" ID="ddlPublisher" runat="server">
              <asp:ListItem  Text="Publisher1" value="Publisher1" />
              <asp:ListItem  Text="Publisher2" value="Publisher2" />
          </asp:DropDownList>

</div>
</div>

                                                                                 <div class="col-md-4">
        <label>Author Name:</label> <asp:RequiredFieldValidator ID="rfvAuthorName" runat="server" ErrorMessage="Required" ControlToValidate="ddlAuthor" BackColor="White" InitialValue="Select" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
          <asp:DropDownList CssClass="form-control" ID="ddlAuthor" runat="server">
              <asp:ListItem  Text="Author1" value="Author1" />
              <asp:ListItem  Text="Author2" value="Author2" />
          </asp:DropDownList>

</div>
                                                                                             <label>Publish Date:</label> <asp:RequiredFieldValidator ID="rfvFullName4" runat="server" ErrorMessage="Required" ControlToValidate="txtDate" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox Cssclass="form-control" ID="txtDate" runat="server" placeholder="Date" TextMode="Date" ></asp:TextBox>
</div>
</div>
                                                                                 <div class="col-md-4">
        <label>Gengre:</label> <asp:RequiredFieldValidator ID="rfvGengre" runat="server" ErrorMessage="Required" ControlToValidate="lbGenres" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
          <asp:ListBox CssClass="form-control" ID="lbGenres" runat="server">
           

          </asp:ListBox>

</div>
</div>
                              
 </div>




                                                                                                <div class="row">
  
  
                             <div class="col-md-4">
        <label>Edition:</label> <asp:RequiredFieldValidator ID="rfvEdition" runat="server" ErrorMessage="Required" ControlToValidate="txtEdition" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtEdition" runat="server" placeholder="Edition" TextMode="SingleLine" ></asp:TextBox>
</div>
</div>

                                                                                 <div class="col-md-4">
        <label>Book Cost per(unit):</label> <asp:RequiredFieldValidator ID="rfvBookCost" runat="server" ErrorMessage="Required" ControlToValidate="txtBookCost" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtBookCost" runat="server" placeholder="Book Cost per U" TextMode="Number" ></asp:TextBox>
</div>
</div>
                                                                                 <div class="col-md-4">
        <label>Pages:</label> <asp:RequiredFieldValidator ID="rfvPages" runat="server" ErrorMessage="Required" ControlToValidate="txtPages" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtPages" runat="server" placeholder="Pages" TextMode="Number" ></asp:TextBox>
</div>
</div>
                              
 </div>

                                                                                                                        <div class="row">
  
  
                             <div class="col-md-4">
        <label>Actual Stock:</label> <asp:RequiredFieldValidator ID="rfvActualStock" runat="server" ErrorMessage="Required" ControlToValidate="txtActualStock" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtActualStock" runat="server" placeholder="Actual Stock" TextMode="Number" ></asp:TextBox>
</div>
</div>

                                                                                 <div class="col-md-4">
        <label>Current Stock:</label>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtCurrentStock" runat="server" placeholder="Current Stock" TextMode="Number" ReadOnly="True"></asp:TextBox>
</div>
</div>
                                                                                 <div class="col-md-4">
        <label>Issued Book:</label>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtIssuedBook" runat="server" placeholder="Issued Book" TextMode="Number" ReadOnly="True"></asp:TextBox>
</div>
</div>
                              
 </div>

                                                                        <div class="row">
  
  
                            

                                                                                 <div class="col-12">
        <label>Book Description:</label> <asp:RequiredFieldValidator ID="rfvBookDescription" runat="server" ErrorMessage="Required" ControlToValidate="txtBookDescription" BackColor="White" style="color: #FF0000"></asp:RequiredFieldValidator>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtBookDescription" runat="server" placeholder="Book Description" TextMode="MultiLine"  Rows="2"></asp:TextBox>
</div>
</div>

                              
 </div>


 <div class="row">
  
      
      <div class="col-4">
      <asp:Button class="btn btn-block  w-100 btn-success" id="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />                                             
 </div>
          <div class="col-4">
     <asp:Button class="btn btn-block  w-100 btn-warning" id="btnUpdate" runat="server" Text="Update" />                                             
</div>
          <div class="col-4">
     <asp:Button class="btn btn-block  w-100 btn-danger" id="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />                                             
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
                                  <h4>Book Inventory List</h4>  
                                    
                                </center>
                            </div>
                        </div>
                        <div class="row">
                          <div class="col">
                           <hr>
                         </div>
                         </div>
                          <div class="row">
                              <asp:SqlDataSource ID="SqlDataSourceBookInventory" runat="server" ConnectionString="<%$ ConnectionStrings:ELibraryDBConnectionString %>" ProviderName="<%$ ConnectionStrings:ELibraryDBConnectionString4.ProviderName %>" SelectCommand="SELECT * FROM [tblBookMaster]"></asp:SqlDataSource>
                              <div class="col">
                                  <asp:GridView clas="table table-striped table-bordered" ID="gvBooks" runat="server" CellPadding="4" DataSourceID="SqlDataSourceBookInventory" ForeColor="#333333" GridLines="None">
                                      <AlternatingRowStyle BackColor="White" />
                                      <Columns>
                                          
                                      </Columns>
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
