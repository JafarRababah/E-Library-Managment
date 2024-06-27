using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibrary
{
    public partial class AdminAuthorManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        public string AuthorID { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            gvAuthors.DataBind();
        }
        protected void ResetAuthorLoad()
        {
            txtAuthorID.Text = "";
            txtAuthorName.Text= string.Empty;
        }
       protected void AddNewAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "insert into tblAuthorMaster (AuthorID,AuthorName) values(@AuthorID,@AuthorName)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@AuthorID", txtAuthorID.Text.Trim());
                cmd.Parameters.AddWithValue("@AuthorName", txtAuthorName.Text.Trim());
               
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Add New Author Successfully');</script>");
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            gvAuthors.DataBind();
        }
        protected void UpdateAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "update tblAuthorMaster set AuthorName=@AuthorName where AuthorID=@AuthorID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@AuthorID", txtAuthorID.Text.Trim());
                cmd.Parameters.AddWithValue("@AuthorName", txtAuthorName.Text.Trim());

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Update Author Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            gvAuthors.DataBind();
        }
        protected void DeleteAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "delete from tblAuthorMaster  where AuthorID=@AuthorID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@AuthorID", txtAuthorID.Text.Trim());

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Delete Author Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            gvAuthors.DataBind();
        }
        bool IsAuthorExist()
        {
            bool isFound = false;
            SqlConnection con = new SqlConnection(strcon);
            try
            {

                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "select * from tblAuthorMaster where AuthorID=@AuthorID";
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("AuthorID", txtAuthorID.Text.Trim());
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
        protected void GoAuthorByID(string AuthorID, ref string AuthorName)
        {



            SqlConnection con = new SqlConnection(strcon);
            try
            {

                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "select * from tblAuthorMaster where AuthorID=@AuthorID";
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("AuthorID", txtAuthorID.Text.Trim());
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                    AuthorName = (string)reader["AuthorName"];
                txtAuthorName.Text = AuthorName;

                reader.Close();


            }

            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
            finally
            {
                con.Close();
            }


        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if ((txtAuthorID.Text.Trim() == "") || (txtAuthorName.Text.Trim() == ""))
                Response.Write("<script>alert('Enter The Fields ');</script>");
            else
            {
                if (IsAuthorExist())
                {
                    Response.Write("<script>alert('This Author is Exist');</script>");
                }
                else
                {
                    AddNewAuthor();
                }
                ResetAuthorLoad();
            }
           
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if(IsAuthorExist())
            {
                UpdateAuthor();
            }
            else
            {
                Response.Write("<script>alert('This Author is Not Exist');</script>");
            }
        }
       
        protected void btnGo_Click(object sender, EventArgs e)
        {
            string AuthorID=txtAuthorID.Text.Trim();
            string AuthorName = "";
            GoAuthorByID(AuthorID,ref AuthorName);
           
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (!IsAuthorExist())
            {
                Response.Write("<script>alert('This Author is Not Exist');</script>");
            }
            else
            {
                DeleteAuthor();
            }
            ResetAuthorLoad();
        }
    }
}