<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookIssuing.aspx.cs" Inherits="ELibrary.AdminBookIssuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                  <h4>Booking Issuing</h4>  
                                </center>
                            </div>
                        </div>
                        <div class="row">
    <div class="col">
        <center>
            <img src="imgs/Books.png" width="100" />
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
        <label>Member ID:</label>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtMemberID" runat="server" placeholder="ID" TextMode="SingleLine"></asp:TextBox>
</div>
</div>
                              <div class="col-md-6">
       <label>Book ID:</label>
<div class="form-group">
    <div class="input-group">
    <asp:TextBox Cssclass="form-control" ID="txtBookID" runat="server" placeholder="ID" TextMode="SingleLine"></asp:TextBox>
     <asp:Button class="btn btn-primary" id="btnGo" runat="server"  Text="Go" OnClick="btnGo_Click" />
</div>
</div>
 </div>
 </div>

                                                <div class="row">
  
  
                             <div class="col-md-6">
        <label>Member Name:</label>
      <div class="form-group">
    <asp:TextBox Cssclass="form-control" ID="txtMemberName" runat="server" placeholder="Member Name" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
</div>
</div>

                                                                                 <div class="col-md-6">
        <label>Book Name:</label>
      <div class="form-group">
    <asp:TextBox Cssclass="form-control" ID="txtBookName" runat="server" placeholder="Book Name" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
</div>
</div>

                              
 </div>


                                                                        <div class="row">
  
  
                             <div class="col-md-6">
        <label>Start Date:</label>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtStartDate" runat="server" placeholder="Start Date" TextMode="Date" ReadOnly="False"></asp:TextBox>
</div>
</div>

                                                                                 <div class="col-md-6">
        <label>End Date:</label>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="txtEndDate" runat="server" placeholder="End Date" TextMode="Date" ReadOnly="False"></asp:TextBox>
</div>
</div>

                              
 </div>

                                                                        <div class="row">
  
  
                             <div class="col-md-6">
        <label>CurrentStock:</label>
      <div class="form-group">
    <asp:TextBox Cssclass="form-control" ID="txtCurrentStock" runat="server" placeholder="CurrentStock" TextMode="SingleLine" ReadOnly="False"></asp:TextBox>
</div>
</div>

                                                                                 <div class="col-md-6">
        <label>End Date:</label>
      <div class="form-group">
    <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="End Date" TextMode="Date" ReadOnly="False"></asp:TextBox>
</div>
</div>

                              
 </div>
 <div class="row">
  
      <div class="col-6">
      <asp:Button class="btn btn-primary btn-block w-100 " id="btnIssue" runat="server" Text="Issue" OnClick="btnIssue_Click" />                                             
 </div>
      <div class="col-6">
      <asp:Button class="btn btn-block  w-100 btn-success" id="btnReturn" runat="server" Text="Return" OnClick="btnReturn_Click" />                                             
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
                                  <h4>Issued Book List</h4>  
                                    
                                </center>
                            </div>
                        </div>
                        <div class="row">
                          <div class="col">
                           <hr>
                         </div>
                         </div>
                          <div class="row">
                              <asp:SqlDataSource ID="SqlDataSourceBooks" runat="server" ConnectionString="<%$ ConnectionStrings:ELibraryDBConnectionString %>" SelectCommand="SELECT * FROM [tblBookIssue]" ProviderName="<%$ ConnectionStrings:ELibraryDBConnectionString6.ProviderName %>"></asp:SqlDataSource>
                              <div class="col">
                                  <asp:GridView clas="table table-striped table-bordered" ID="gvIssueBook" runat="server" CellPadding="4" DataSourceID="SqlDataSourceBooks" ForeColor="#333333" GridLines="None">
                                      <AlternatingRowStyle BackColor="White" />
                                      <Columns>
                                          <asp:BoundField DataField="MemberID" HeaderText="MemberID" SortExpression="MemberID" />
                                          <asp:BoundField DataField="MemberName" HeaderText="MemberName" SortExpression="MemberName" />
                                          <asp:BoundField DataField="BookID" HeaderText="BookID" SortExpression="BookID" />
                                          <asp:BoundField DataField="BookName" HeaderText="BookName" SortExpression="BookName" />
                                          <asp:BoundField DataField="IssueDate" HeaderText="IssueDate" SortExpression="IssueDate" />
                                          <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" />
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
