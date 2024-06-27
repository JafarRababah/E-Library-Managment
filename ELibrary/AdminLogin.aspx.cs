using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace ELibrary
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
             string query = "select * from tblAdminLogin where UserName=@UserName and Password=@Password";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("UserName", txtMemberID.Text.Trim());
            command.Parameters.AddWithValue("Password", txtPassword.Text.Trim());
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Response.Write("<script>alert('" + reader.GetValue(0).ToString() + "');</script>");
                    Session["UserName"] = reader.GetValue(0).ToString();
                    Session["FullName"] = reader.GetValue(2).ToString();
                    Session["Role"] = "Admin";
                    //Session["Status"] = reader.GetValue(10).ToString();
                }
                Response.Redirect("HomePage.aspx");

            }
            else
                Response.Write("<script>alert('The User is Not Valid ');</script>");
        }
    
    }
}