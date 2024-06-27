using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibrary
{
    public partial class UserSignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void ResetSignup()
        {
            
            
                txtAddress.Text = "";
                txtCity.Text = "";
                txtContactNo.Text = "";
                txtDOB.Text = "";
                txtEmail.Text = "";
                txtFullName.Text = "";
                txtPassword.Text = "";
                txtPinCode.Text = "";
                txtUserID.Text = "";
            ddlState.Text = "";
                   }
        protected void SignupNewUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "insert into tblMemberMaster (FullName,DOB,ContactNo," +
                    "Email,State,City,PinCode,FullAddress,MemberID,Password,AccountStatus) values(@FullName,@DOB,@ContactNo,@Email,@State,@City,@PinCode,@FullAddress,@MemberID,@Password,@AccountStatus)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@FullName", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text.Trim());
                cmd.Parameters.AddWithValue("@ContactNo", txtContactNo.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@State", ddlState.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@City", txtCity.Text.Trim());
                cmd.Parameters.AddWithValue("@PinCode", txtPinCode.Text.Trim());
                cmd.Parameters.AddWithValue("@FullAddress", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@MemberID", txtUserID.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@AccountStatus", "Pending");
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Sign Up Successfully');</script>");
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool IsMemberExist(string MemberID)
        {
            
            bool isFound= false;
            SqlConnection con = new SqlConnection(strcon);
            try
            {
                
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "select * from tblMemberMaster where MemberID=@MemberID";
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("MemberID", txtUserID.Text.Trim());
                SqlDataReader reader = command.ExecuteReader();

                isFound = reader.HasRows;

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
            return isFound;
        }
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (IsMemberExist(txtUserID.Text.Trim()))
            {
                Response.Write("<script>alert('MEMBER IS EXIST');</script>");
            }
            else
            {
                SignupNewUser();
                ResetSignup();
            }
        }
    }
    
}