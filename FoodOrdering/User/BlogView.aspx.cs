using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodOrdering.User
{
    public partial class BlogView : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                getBlogs();
            }
        }

        private void getBlogs()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Blog_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rBlog.DataSource = dt;
            rBlog.DataBind();
        }

        protected void rBlog_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            getBlogs();
        }
    }
}