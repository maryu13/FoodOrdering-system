using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace FoodOrdering.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            CategoryCount();
            UserCount();
            ProductCount();
            BlogsCount();

            if (!IsPostBack)
            {
                Session["breadCrum"] = "";

                if (Session["admin"] == null)
                {
                    Response.Redirect("../User/Login.aspx");
                }

            }
        }


        void CategoryCount()
        {
            SqlConnection con = new SqlConnection(Connection.GetConnectionString());
            SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Categories", con);

            con.Open();

            int count = (int)command.ExecuteScalar();
            Session["category"] = count;
        }
        void UserCount()
        {
            SqlConnection con = new SqlConnection(Connection.GetConnectionString());
            SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Users", con);

            con.Open();

            int count = (int)command.ExecuteScalar();
            Session["Usercount"] = count;
        }

        void ProductCount()
        {
            SqlConnection con = new SqlConnection(Connection.GetConnectionString());
            SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Products", con);

            con.Open();

            int count = (int)command.ExecuteScalar();
            Session["ProductCount"] = count;
        }
        void BlogsCount()
        {
            SqlConnection con = new SqlConnection(Connection.GetConnectionString());
            SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Blogs", con);

            con.Open();

            int count = (int)command.ExecuteScalar();
            Session["BlogCount"] = count;
        }
    }
}