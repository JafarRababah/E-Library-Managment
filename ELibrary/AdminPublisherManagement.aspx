<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminPublisherManagement.aspx.cs" Inherits="ELibrary.AdminPublisherManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                  <h4>Publisher Details</h4>  
                                </center>
                            </div>
                        </div>
   <div class="row">
    <div class="col">
        <center>
            <img src="imgs/publisher.png" width="100" />
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
       <label>Publisher ID:</label>
<div class="form-group">
    <div class="input-group">
    <asp:TextBox class="form-control" ID="txtPublisherID" runat="server" placeholder="ID" TextMode="Number"></asp:TextBox>
     <asp:Button runat="server" class="btn btn-primary" id="btnGo"  Text="Go" OnClick="btnGo_Click" />
</div>
</div>
 </div>
  
                             <div class="col-md-8">
        <label>Publisher Name:</label>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtPublisherName" runat="server" placeholder="Publisher Name" TextMode="SingleLine"></asp:TextBox>
</div>
</div>
 </div>

 <div class="row">
  <div class="col-4">
       <asp:Button class="btn btn-success w-100 btn-block btn-lg" id="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />                                             
  </div>
      <div class="col-4">
      <asp:Button class="btn btn-primary w-100 btn-block btn-lg" id="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />                                             
 </div>
      <div class="col-4">
      <asp:Button class="btn btn-block w-100 btn-lg btn-danger" id="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />                                             
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
                                  <h4>Publisher List</h4>  
                                    
                                </center>
                            </div>
                        </div>
                        <div class="row">
                          <div class="col">
                           <hr>
                         </div>
                         </div>
                          <div class="row">
                              <asp:SqlDataSource ID="SqlDataSourcePublisher" runat="server" ConnectionString="<%$ ConnectionStrings:ELibraryDBConnectionString %>" ProviderName="<%$ ConnectionStrings:ELibraryDBConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [tblPublisherMaster]"></asp:SqlDataSource>
                              <div class="col">
                                  <asp:GridView class="table table-striped table-bordered" ID="gvPublisher" runat="server" AutoGenerateColumns="False" DataKeyNames="PublisherID" DataSourceID="SqlDataSourcePublisher">
                                      <Columns>
                                          <asp:BoundField DataField="PublisherID" HeaderText="PublisherID" ReadOnly="True" SortExpression="PublisherID" />
                                          <asp:BoundField DataField="PublisherName" HeaderText="PublisherName" SortExpression="PublisherName" />
                                      </Columns>
                                  </asp:GridView>
                               </div>
                         </div>
                        

                                                                                       
                                                

                                                                        
                    </div>
                </div>
             </div>   
            
       </div>
    </div>

</asp:Content>
