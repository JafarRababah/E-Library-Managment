<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewBooks.aspx.cs" Inherits="ELibrary.ViewBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>

    
    
    <asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       
          <div class="container">
            <div class="row">

                <div class="col-sm-12">
                    <center>
                        <h3>
                        Book Inventory List</h3>
                    </center>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </asp:Panel>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="card">
                            <div class="card-body">

                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSourceBookInventory" runat="server" ConnectionString="<%$ ConnectionStrings:ELibraryDBConnectionString %>" ProviderName="<%$ ConnectionStrings:ELibraryDBConnectionString4.ProviderName %>" SelectCommand="SELECT * FROM [tblBookMaster]"></asp:SqlDataSource>
                                    <div class="col">
                                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="true" DataSourceID="SqlDataSourceBookInventory">
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <center>
                    <a href="home.aspx">
                        << Back to Home</a><span class="clearfix"></span>
                            <br />
                            <center>
            </div>
        </div>
</asp:Content>
