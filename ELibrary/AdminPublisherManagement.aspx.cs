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
    public partial class AdminPublisherManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        public string PublisherID { get; private set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //gvPublisher.DataBind();
        }
        protected void ResetPublisherLoad()
        {
            txtPublisherID.Text = "";
            txtPublisherName.Text = string.Empty;
        }
        protected void AddNewPublisher()
        {
            

            try
                {
                
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "insert into tblPublisherMaster (PublisherID,PublisherName) values(@PublisherID,@PublisherName)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@PublisherID", txtPublisherID.Text.Trim());
                    cmd.Parameters.AddWithValue("@PublisherName", txtPublisherName.Text.Trim());

                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Add New Publisher Successfully');</script>");

                }
           
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            gvPublisher.DataBind();
        }
        protected void UpdatePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "update tblPublisherMaster set PublisherName=@PublisherName where PublisherID=@PublisherID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@PublisherID", txtPublisherID.Text.Trim());
                cmd.Parameters.AddWithValue("@PublisherName", txtPublisherName.Text.Trim());

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Update Publisher Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            gvPublisher.DataBind();
        }
        protected void DeletePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "delete from tblPublisherMaster  where PublisherID=@PublisherID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@PublisherID", txtPublisherID.Text.Trim());
                cmd.Parameters.AddWithValue("@PublisherName", txtPublisherName.Text.Trim());

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Delete Publisher Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            gvPublisher.DataBind();
        }
        bool IsPublisherExist()
        {
            bool isFound = false;
            SqlConnection con = new SqlConnection(strcon);
            try
            {

                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "select * from tblPublisherMaster where PublisherID=@PublisherID";
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("PublisherID", txtPublisherID.Text.Trim());
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
        protected void GoPublisherByID(string PublisherID, ref string PublisherName)
        {



            SqlConnection con = new SqlConnection(strcon);
            try
            {

                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "select * from tblPublisherMaster where PublisherID=@PublisherID";
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("PublisherID", txtPublisherID.Text.Trim());
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                    PublisherName = (string)reader["PublisherName"];
                txtPublisherName.Text = PublisherName;

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
            if ((txtPublisherID.Text.Trim() == "") || (txtPublisherName.Text.Trim() == ""))
                Response.Write("<script>alert('Enter The Fields ');</script>");
            else
            {
                if (IsPublisherExist())
                {
                    Response.Write("<script>alert('This Publisher is Exist');</script>");
                }
                else
                {
                    AddNewPublisher();
                }
            }
            ResetPublisherLoad();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (IsPublisherExist())
            {
                UpdatePublisher();
            }
            else
            {
                Response.Write("<script>alert('This Publisher is Not Exist');</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (!IsPublisherExist())
            {
                Response.Write("<script>alert('This Publisher is Not Exist');</script>");
            }
            else
            {
                DeletePublisher();
            }
            ResetPublisherLoad();
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            string AuthorID = txtPublisherID.Text.Trim();
            string AuthorName = "";
            GoPublisherByID(AuthorID, ref AuthorName);
        }
    }
}