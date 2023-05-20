using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace FoodOrdering.User
{
    public partial class ConvertTextToSpeech : System.Web.UI.Page
    {
        private static SqlConnection con;
        static string recognizedText1="";

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static void ProcessRecognizedText(string recognizedText)
        {
            recognizedText1 = recognizedText;

        }

        public  void blog_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(Connection.GetConnectionString());
            Response.Write(recognizedText1);
            using (con)
            {
                con.Open();
                string sql = "INSERT INTO trial (Text, Date) VALUES (@text, @date)";
                using (SqlCommand command = new SqlCommand(sql, con))
                {
                    command.Parameters.AddWithValue("@text", recognizedText1);
                    command.Parameters.AddWithValue("@date", DateTime.Now);
                    command.ExecuteNonQuery();
                    recognizedText1 = "";

                }
            }
        }
    }
}
