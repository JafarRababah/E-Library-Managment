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
    public partial class UserProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserName"].ToString()=="" || Session["UserName"].ToString() == null)
                {
                    Response.Write("<script>alert('Session Expired');</script>");
                    Response.Redirect("UserLogin.aspx");
                }
                else
                {
                   // GetUserBookDate();
                    if (!Page.IsPostBack)
                    {
                        
                        GetUserPersonalDetails();
                    }
                }
              }
           catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            } 
        }
        void GetUserPersonalDetails()
        {
            SqlConnection con = new SqlConnection(strcon);
            try
            {
                
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "select * from tblMemberMaster where MemberID=@MemberID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@MemberID", Session["UserName"].ToString());
                
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())

                {
                    txtFullName.Text = (string)reader["FullName"];
                    txtFullName.Text = (string)reader["DOB"];
                    txtContactNo.Text = (string)reader["ContactNo"];
                    txtEmail.Text = (string)reader["Email"];
                    ddlState.SelectedValue = (string)reader["State"];
                    txtCity.Text = (string)reader["City"];
                    txtPinCode.Text = (string)reader["PinCode"];
                    txtAddress.Text = (string)reader["FullAddress"];
                    txtUserID.Text= (string)reader["MemberID"];
                }

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
        void GetUserBookDate()
        {
            SqlConnection con = new SqlConnection(strcon);
            try
            {

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string query = "select * from tblBookIssue where MemberID=@MemberID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@MemberID", Session["UserName"].ToString());
                DataTable tbl = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(tbl);
                gvUserProfile.DataSource = tbl;
                gvUserProfile.DataBind();


                
                
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
        protected void UpdateProfile()
        {
            SqlConnection con = new SqlConnection(strcon);
            try
            {
                
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "update tblMemberMaster set FullName=@FullName,DOB=@DOB,ContactNo=@ContactNo," +
                    "Email=@Email,State=@State,City=@City,PinCode=@PinCode,FullAddress=@FullAddress,Password=@Password where MemberID=@MemberID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@MemberID", txtUserID.Text.Trim());
                cmd.Parameters.AddWithValue("@FullName", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@DOB", txtBOD.Text.Trim());
                cmd.Parameters.AddWithValue("@ContactNo", txtContactNo.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@State", ddlState.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@City", txtCity.Text.Trim());
                cmd.Parameters.AddWithValue("@PinCode", txtPinCode.Text.Trim());
                cmd.Parameters.AddWithValue("@FullAddress", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtNewPassword.Text.Trim());
                

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Update Author Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
            gvUserProfile.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Session["UserName"].ToString() == "" || Session["UserName"].ToString() == null)
            {
                Response.Write("<script>alert('Session Expired');</script>");
                Response.Redirect("UserLogin.aspx");
            }
            else
            {
                UpdateProfile();
            }
            
        }
    }
}