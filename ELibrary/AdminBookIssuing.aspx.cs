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
    public partial class AdminBookIssuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        bool GetBookNameByID()
        {
            SqlConnection con = new SqlConnection(strcon);
            bool isFound = false;
            try
            {

                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "select BookName,CurrentStock from tblBookMaster where BookID=@BookID";
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@BookID", txtBookID.Text.Trim());
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    
                    txtBookName.Text = (string)reader["BookName"];
                    txtCurrentStock.Text = (string)reader["CurrentStock"];
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
        bool GetMemberNameByID()
        {
            SqlConnection con = new SqlConnection(strcon);
            bool isFound = false;
            try
            {

                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "select FullName from tblMemberMaster where MemberID=@MemberID";
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@MemberID", txtMemberID.Text.Trim());
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {

                    txtMemberName.Text = (string)reader["FullName"];


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
              bool IsMemberHasBookIssued()
        {
            SqlConnection con = new SqlConnection(strcon);
            bool isFound = false;
            try
            {

                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "select * from tblBookIssue where MemberID=@MemberID and BookID=@BookID";
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@MemberID", txtMemberID.Text.Trim());
                command.Parameters.AddWithValue("@BookID", txtBookID.Text.Trim());
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {

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
        void IssueBook()
        {
            SqlConnection con = new SqlConnection(strcon);
            try
            {
                
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "insert into tblBookIssue (MemberID,MemberName,BookID," +
                    "BookName,IssueDate,DueDate) values(@MemberID,@MemberName,@BookID,@BookName,@IssueDate,@DueDate)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@MemberID", txtMemberID.Text.Trim());
                cmd.Parameters.AddWithValue("@MemberName", txtMemberName.Text.Trim());
                cmd.Parameters.AddWithValue("@BookID", txtBookID.Text.Trim());
                cmd.Parameters.AddWithValue("@BookName", txtBookName.Text.Trim());
                cmd.Parameters.AddWithValue("@IssueDate", txtStartDate.Text.Trim());
                cmd.Parameters.AddWithValue("@DueDate", txtEndDate.Text.Trim());
                
                cmd.ExecuteNonQuery();
                string query2 = "update tblBookMaster set CurrentStock=CurrentStock-1 where BookID=@BookID";
                cmd = new SqlCommand(query2, con);
                cmd.Parameters.AddWithValue("@BookID", txtBookID.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign Up Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
            gvIssueBook.DataBind();
        }
        void ReturnBook()
        {
            SqlConnection con = new SqlConnection(strcon);
            try
            {

                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query2 = "update tblBookMaster set CurrentStock=CurrentStock+1 where BookID=@BookID";
                SqlCommand cmd = new SqlCommand(query2, con);
                cmd.Parameters.AddWithValue("@BookID", txtBookID.Text.Trim());
                cmd.ExecuteNonQuery();
                string query = "delete from tblBookIssue where MemberID=@MemberID";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@MemberID", txtMemberID.Text.Trim());
                cmd.ExecuteNonQuery();
                
                Response.Write("<script>alert('Sign Up Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
            gvIssueBook.DataBind();
        }
        
        protected void btnGo_Click(object sender, EventArgs e)
        {
            GetBookNameByID();
            GetMemberNameByID();
           
            if (Convert.ToInt32(txtCurrentStock.Text) <= 0)
            {
                btnIssue.Enabled = false;
            }
        }

        protected void btnIssue_Click(object sender, EventArgs e)
        {
            if (GetBookNameByID() && GetMemberNameByID())
            {
                IssueBook();
                
            }
            else
            {
                Response.Write("<script>alert('This Member Already has This Book');</script>");
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            if (IsMemberHasBookIssued())
            {
                ReturnBook();

            }
            else
            {
                Response.Write("<script>alert('This Member Not has This Book');</script>");
            }
        }
    }
}