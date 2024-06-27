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
    public partial class AdminMemberManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            gvMembers.DataBind();
        }
        protected bool GetMemberByID(string MemberID)
        {
            SqlConnection con = new SqlConnection(strcon);
            bool isFound = false;
            try
            {
                
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "select * from tblMemberMaster where MemberID=@MemberID";
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("MemberID", txtMemberID.Text.Trim());
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                    txtFullName.Text = (string)reader["FullName"];
                    txtBOD.Text = (string)reader["DOB"]; 
                    txtContactNumber.Text= (string)reader["ContactNo"];
                    txtEmail.Text= (string)reader["Email"];
                    txtState.Text= (string)reader["State"];
                    txtCity.Text= (string)reader["City"];
                    txtPinCode.Text= (string)reader["PinCode"];
                    txtFullAddress.Text= (string)reader["FullAddress"];
                    txtMemberID.Text= (string)reader["MemberID"];                  
                    txtAccountStatus.Text= (string)reader["AccountStatus"];

                reader.Close();

                isFound = true;
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
        protected void ActiveAccount(string MemberID)
        {
            txtAccountStatus.Text="Active";
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "update tblMemberMaster set AccountStatus=@AccountStatus where MemberID=@MemberID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@MemberID", txtMemberID.Text.Trim());
                cmd.Parameters.AddWithValue("@AccountStatus", txtAccountStatus.Text.Trim());

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Update Status Account to  "+txtAccountStatus.Text+" Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            gvMembers.DataBind();
        }
        protected void PendingAccount(string MemberID)
        {
            txtAccountStatus.Text = "Pending";
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "update tblMemberMaster set AccountStatus=@AccountStatus where MemberID=@MemberID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@MemberID", txtMemberID.Text.Trim());
                cmd.Parameters.AddWithValue("@AccountStatus", txtAccountStatus.Text.Trim());

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Update Status Account to "+txtAccountStatus.Text+"  Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            gvMembers.DataBind();
        }
        protected void DeAvtiveAccount(string MemberID)
        {
            txtAccountStatus.Text = "DeActive";
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "update tblMemberMaster set AccountStatus=@AccountStatus where MemberID=@MemberID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@MemberID", txtMemberID.Text.Trim());
                cmd.Parameters.AddWithValue("@AccountStatus", txtAccountStatus.Text.Trim());

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Update Status Account to " + txtAccountStatus.Text + "  Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            
            gvMembers.DataBind();
        }
        protected void DeleteMemeber(string MemberID)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string query = "delete from tblMemberMaster  where MemberID=@MemberID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@MemberID", txtMemberID.Text.Trim());

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Delete Member Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            gvMembers.DataBind();
        }
        protected void lbtnGo_Click(object sender, EventArgs e)
        {
            GetMemberByID(txtMemberID.Text);
        }

        protected void lbtnSuccess_Click(object sender, EventArgs e)
        {
            if (GetMemberByID(txtMemberID.Text))
                {
                ActiveAccount(txtMemberID.Text);
            }
            else
            {
                Response.Write("<script>alert('Invalid MemberID');</script>");
            }
        }

        protected void lbtnPending_Click(object sender, EventArgs e)
        {
            if (GetMemberByID(txtMemberID.Text))
            {
                PendingAccount(txtMemberID.Text);
            }
            else
            {
                Response.Write("<script>alert('Invalid MemberID');</script>");
            }
        }

        protected void lbtnDeactive_Click(object sender, EventArgs e)
        {
            if (GetMemberByID(txtMemberID.Text))
            {
                DeAvtiveAccount(txtMemberID.Text);
            }
            else
            {
                Response.Write("<script>alert('Invalid MemberID');</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (txtMemberID.Text.Trim() == "")
            {
                Response.Write("<script>alert('MembaerID Can not Be Blank');</script>");
            }
            else
            {
                DeleteMemeber(txtMemberID.Text);
            }
        }
    }
}