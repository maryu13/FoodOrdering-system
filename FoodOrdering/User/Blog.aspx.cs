using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodOrdering.User
{
    public partial class Blog : System.Web.UI.Page
    {
        private static SqlConnection con;
        static string recognizedText1 = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            //load the control
            //Control SliderUserControl = (Control)Page.LoadControl("SliderWebUserControl.ascx");
            //add the control
            // pnlSlider.Controls.Add(SliderUserControl);


            if (Session["userId"] != null)
            {

                //lblLogout.Text = "Logout";
                Utils utils = new Utils();
                Session["cartCount"] = utils.cartCount(Convert.ToInt32(Session["userId"])).ToString();
            }
            else
            {
                //lblLogout.Text = "Login";
                Response.Redirect("Login.aspx");
                Session["cartCount"] = "0";
            }
        }

        protected void lblLogout_Click(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {

                Response.Redirect("Login.aspx");
            }
            else
            {
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }


        }

        [WebMethod]
        public static void ProcessRecognizedText(string recognizedText)
        {
            recognizedText1 = recognizedText;

        }


        protected void createBlog_Click(object sender, EventArgs e)
        {
            string fileExtension = string.Empty, topic, imagePath = "";
            topic = txtTopic.Text.Trim();
            int userId = Convert.ToInt32(Session["userId"]);

            if (file.HasFile)
            {
                if (Utils.IsValidExtension(file.FileName))
                {
                    Guid obj = Guid.NewGuid();
                    fileExtension = Path.GetExtension(file.FileName);
                    imagePath = "Images/Blogs/" + obj.ToString() + fileExtension;
                    file.PostedFile.SaveAs(Server.MapPath("~/Images/Blogs/") + obj.ToString() + fileExtension);
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Please select .jpg or .png or .jpeg image";
                    lblMsg.CssClass = "alert alert-danger";
                }

                con = new SqlConnection(Connection.GetConnectionString());
                Response.Write(recognizedText1);

                using (con)
                {
                    con.Open();
                    string sql = "INSERT INTO Blogs (UserId,Topic,BlogMssg,ImageUrl, Date) VALUES (@userId,@topic,@blogMssg,@imageUrl,@date)";
                    using (SqlCommand command = new SqlCommand(sql, con))
                    {
                        command.Parameters.AddWithValue("@userId", userId);
                        command.Parameters.AddWithValue("@topic", topic);
                        command.Parameters.AddWithValue("@blogMssg", recognizedText1);
                        command.Parameters.AddWithValue("@imageUrl", imagePath);
                        command.Parameters.AddWithValue("@date", DateTime.Now);

                        command.ExecuteNonQuery();
                        recognizedText1 = "";

                    }
                }
            }
        }
    }
}