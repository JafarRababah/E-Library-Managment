using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibrary
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Role"]==null)
                {
                    lbUserLogin.Visible = true;
                    lbSignUp.Visible = true;
                    lbLogout.Visible = true;

                    lbAdminLogin.Visible = true;
                    lbAuthorManagement.Visible = false;
                    lbBookingIssuing.Visible = false;
                    lbBookInventory.Visible = false;
                    lbMemberManagement.Visible = false;
                    lbPublisherManagement.Visible = false;
                }
                else if (Session["Role"].Equals("User"))
                {
                    lbUserLogin.Visible = false;
                    lbSignUp.Visible = false;
                    lbLogout.Visible = true;
                    lblHello.Visible = true;
                    lblHello.Text ="Hello  "+ Session["UserName"].ToString();
                    lbAdminLogin.Visible = true;
                    lbAuthorManagement.Visible = false;
                    lbBookingIssuing.Visible = false;
                    lbBookInventory.Visible = false;
                    lbMemberManagement.Visible = false;
                    lbPublisherManagement.Visible = false;

                }
                else if (Session["Role"].Equals("Admin"))
                {
                    lbUserLogin.Visible = false;
                    lbSignUp.Visible = false;
                    lbLogout.Visible = true;
                    lblHello.Visible = true;
                    lblHello.Text = "Hello ADMIN  " ;
                    lbAdminLogin.Visible = false;
                    lbAuthorManagement.Visible = true;
                    lbBookingIssuing.Visible = true;
                    lbBookInventory.Visible = true;
                    lbMemberManagement.Visible = true;
                    lbPublisherManagement.Visible = true;

                    }
                }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void lbAuthorManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAuthorManagement.aspx");
        }

        protected void lbAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void lbPublisherManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPublisherManagement.aspx");
        }

        protected void lbBookInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookingInventory.aspx");
        }

        protected void lbBookingIssuing_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookIssuing.aspx");
        }

        protected void lbMemberManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminMemberManagement.aspx");
        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
            Session["UserName"] = "";
            Session["FullName"] = "";
            Session["Role"] = "";
            Session["Status"] = "";
            lbUserLogin.Visible = true;
            lbSignUp.Visible = true;
            lbLogout.Visible = true;
            lblHello.Visible = false;
            lbAdminLogin.Visible = true;
            lbAuthorManagement.Visible = false;
            lbBookingIssuing.Visible = false;
            lbBookInventory.Visible = false;
            lbMemberManagement.Visible = false;
            lbPublisherManagement.Visible = false;
        }

        protected void lbSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignUp.aspx");
        }

        protected void lbUserLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void lblViewBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewBooks.aspx");
        }

        protected void lblHello_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }
    }
}