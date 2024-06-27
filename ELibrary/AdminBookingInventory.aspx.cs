using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibrary
{
    public partial class AdminBookingInventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string GlobalFilePath = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillAuthorPublisherValues();
            }
            gvBooks.DataBind();
        }
        protected void FillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State==System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                
                string queryAuthor = "select AuthorName from tblMasterAuthor";
                string queryPublisher = "select PublisherName from tblMasterPublisher";

                SqlCommand cmd = new SqlCommand(queryAuthor, con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable() ;
                adapter.Fill(dt);
                ddlAuthor.DataSource = dt ;
                ddlAuthor.DataValueField = "AuthorName";
                ddlAuthor.DataBind();

                cmd = new SqlCommand(queryPublisher, con);
                adapter = new SqlDataAdapter(cmd);
                dt= new DataTable();
                adapter.Fill(dt);
                ddlPublisher.DataSource = dt;
                ddlPublisher.DataValueField = "PublisherName";
                ddlPublisher.DataBind();

                cmd = new SqlCommand(queryPublisher, con);
                adapter = new SqlDataAdapter(cmd);
                dt = new DataTable();
                adapter.Fill(dt);
                ddlPublisher.DataSource = dt;
                ddlPublisher.DataValueField = "PublisherName";
                ddlPublisher.DataBind();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                
            }
        }
        bool IsBookExist()
        {
            bool isFound = false;
            SqlConnection con = new SqlConnection(strcon);
            try
            {

                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "select * from tblBookMaster where BookID=@BookID";
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("BookID", txtBookID.Text.Trim());
                SqlDataReader reader = command.ExecuteReader();

                isFound = reader.HasRows;

                reader.Close();


            }

            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
            finally
            {
                con.Close();
            }
            return isFound;
        }
        protected bool GetBookByID(string BookID)
        {
            SqlConnection con = new SqlConnection(strcon);
            bool isFound = false;
            try
            {

                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "select * from tblBookMaster where BookID=@BookID";
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("BookID", txtBookID.Text.Trim());
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    lbGenres.ClearSelection();
                    string[] gengre = reader["Gengre"].ToString().Trim().Split(',');
                    for (int i = 0; i < gengre.Length; i++)
                    {
                        for (int j = 0; j < lbGenres.Items.Count; j++)
                        {
                            if (lbGenres.Items[j].ToString() == gengre[i].ToString())
                            {
                                lbGenres.Items[j].Selected = true;
                            }
                        }
                    }
                    txtBookName.Text = (string)reader["BookName"];
                    
                    txtDate.Text = (string)reader["PublishDate"];
                    ddlLanguage.SelectedValue = (string)reader["Language"];
                    ddlAuthor.SelectedValue = (string)reader["AuthorName"];
                    ddlPublisher.SelectedValue = (string)reader["AuthorName"];
                    txtEdition.Text = (string)reader["Edition"];
                    txtBookCost.Text = Convert.ToInt32(reader["BookCost"]).ToString();
                    txtPages.Text = Convert.ToInt32(reader["NoOfPapers"]).ToString();
                    txtBookDescription.Text = (string)reader["BookDescription"];
                    txtActualStock.Text =Convert.ToInt32(reader["ActualStock"]).ToString();
                    txtCurrentStock.Text = Convert.ToInt32(reader["CurrentStock"]).ToString();
                    txtIssuedBook.Text = (Convert.ToInt32(reader["ActualStock"]) - Convert.ToInt32(reader["CurrentStock"])).ToString();
                    GlobalFilePath= (string)reader["BookImage"];
                    reader.Close();

                    isFound = true;
                }
            }

            catch (Exception ex)
            {
                isFound = false;
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
            finally
            {
                con.Close();
            }
            return isFound;
        }
        protected void AddNewBook()
        {
            SqlConnection con = new SqlConnection(strcon);
            try
            {
                //string gengers = "";
                //foreach (int i in lbGenres.GetSelectedIndices())
                //{
                //    gengers = gengers + lbGenres.Items[i].ToString() + " , ";
                //}
                //gengers = gengers.Remove(gengers.Length - 1);
                //string filePath = "~/BookInventory/Books1.png";
                //string fileName = Path.GetFileName(fuBook.PostedFile.FileName);
                //fuBook.SaveAs(Server.MapPath("BookInventory/" + fileName));
                //filePath = "~/BookInventory/" + fileName;
                
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string query = "insert into tblBookMaster (BookID,BookName,Gengre,AuthorName,PublisherName,PublishDate,Language,Edition,BookCost,NoOfPapers,BookDescription,ActualStock,CurrentStock,BookImage)" +
                    " values(@BookID,@BookName,@Gengre,@AuthorName,@PublisherName,@PublishDate,@Language,@Edition,@BookCost,@NoOfPapers,@BookDescription,@ActualStock,@CurrentStock,@BookImage)";
                SqlCommand cmd = new SqlCommand(query, con);
                //cmd.Parameters.AddWithValue("@BookID", txtBookID.Text.Trim());
                //cmd.Parameters.AddWithValue("@BookName", txtBookName.Text.Trim());
                //cmd.Parameters.AddWithValue("@Gengre", null);
                //cmd.Parameters.AddWithValue("@AuthorName", ddlAuthor.SelectedValue.Trim());
                //cmd.Parameters.AddWithValue("@PublisherName", ddlPublisher.SelectedItem.Value.Trim());
                //cmd.Parameters.AddWithValue("@PublishDate", txtDate.Text.Trim());
                //cmd.Parameters.AddWithValue("@Language", ddlLanguage.SelectedItem.Value);
                //cmd.Parameters.AddWithValue("@Edition", txtEdition.Text.Trim());
                //cmd.Parameters.AddWithValue("@BookCost", txtBookCost.Text.Trim());
                //cmd.Parameters.AddWithValue("@NoOfPapers", txtPages.Text.Trim());
                //cmd.Parameters.AddWithValue("@BookDescription", txtBookDescription.Text.Trim());
                //cmd.Parameters.AddWithValue("@ActualStock", txtActualStock.Text.Trim());
                //cmd.Parameters.AddWithValue("@CurrentStock", txtCurrentStock.Text.Trim());
                //cmd.Parameters.AddWithValue("@BookImage", null);

                cmd.Parameters.AddWithValue("@BookID", txtBookID.Text.Trim());
                cmd.Parameters.AddWithValue("@BookName", null);
                cmd.Parameters.AddWithValue("@Gengre", null);
                cmd.Parameters.AddWithValue("@AuthorName", null);
                cmd.Parameters.AddWithValue("@PublisherName",null);
                cmd.Parameters.AddWithValue("@PublishDate", null);
                cmd.Parameters.AddWithValue("@Language", null);
                cmd.Parameters.AddWithValue("@Edition", null);
                cmd.Parameters.AddWithValue("@BookCost", null);
                cmd.Parameters.AddWithValue("@NoOfPapers", null);
                cmd.Parameters.AddWithValue("@BookDescription", null);
                cmd.Parameters.AddWithValue("@ActualStock", null);
                cmd.Parameters.AddWithValue("@CurrentStock", null);
                cmd.Parameters.AddWithValue("@BookImage", null);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Add New Book Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally { 
                con.Close();
            }
            gvBooks.DataBind();
        } 
        protected void UpdateBooks()
        {

            try
            {
                string gengers = "";
                foreach (int i in lbGenres.GetSelectedIndices())
                {
                    gengers = gengers + lbGenres.Items[i].ToString() + " , ";
                }
                gengers = gengers.Remove(gengers.Length - 1);
                string filePath = "~/BookInventory/Books1.png";
                string fileName = Path.GetFileName(fuBook.PostedFile.FileName);
                if(fileName=="" || fileName == null)
                {
                    filePath = GlobalFilePath;
                }
                else
                {
                    fuBook.SaveAs(Server.MapPath("BookInventory/" + fileName));
                    filePath = "~/BookInventory/" + fileName;
                }
                
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "update tblBookMaster set BookName=@BookName,Gengre=@Gengre,AuthorName=@AuthorName,PublisherName=@PublisherName,PublishDate=@PublishDate,Language=@Language,Edition=@Edtition,BookCost=@BookCost,NoOfPapers=@NoOfPapers,BookDescription=@BookDescription,ActualStock=@ActualStock,CurrentStock=@CurrentStock,BookImage=@BookImage where BookID=@BookID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@BookID", txtBookID.Text.Trim());
                cmd.Parameters.AddWithValue("@BookName", txtBookName.Text.Trim());
                cmd.Parameters.AddWithValue("@BookName", txtBookName.Text.Trim());
                cmd.Parameters.AddWithValue("@AuthorName", ddlAuthor.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@PublisherName", ddlPublisher.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@PublishDate", txtDate.Text.Trim());
                cmd.Parameters.AddWithValue("@Language", ddlLanguage.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@Edition", txtEdition.Text.Trim());
                cmd.Parameters.AddWithValue("@NoOfPapers", txtPages.Text.Trim());
                cmd.Parameters.AddWithValue("@BookDescription", txtBookDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@ActualStock", txtActualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@CurrentStock", txtCurrentStock.Text.Trim());
                cmd.Parameters.AddWithValue("@CurrentStock", txtCurrentStock.Text.Trim());
                cmd.Parameters.AddWithValue("@CurrentStock", txtCurrentStock.Text.Trim());
                cmd.Parameters.AddWithValue("@BookImage", filePath);

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Update Book Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            gvBooks.DataBind();
        }
        protected void DeleteBook(string BookID)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "delete from tblBookMaster  where BookID=@BookID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@BookID", txtBookID.Text.Trim());

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Delete Book Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            gvBooks.DataBind();
        }
        protected void lbtnGo_Click(object sender, EventArgs e)
        {
            if (!IsBookExist())
            {
                Response.Write("<script>alert('Book Is Not Exist');</script>");
            }
            else
            {
                GetBookByID(txtBookID.Text);
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsBookExist())
            {
                Response.Write("<script>alert('Book Is Exist');</script>");
            }
            else
            {
                AddNewBook();
            }

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (!IsBookExist())
            {
                Response.Write("<script>alert('Book Is Not Exist');</script>");
            }
            else
            {
                DeleteBook(txtBookID.Text);
            }
        }
    }
}