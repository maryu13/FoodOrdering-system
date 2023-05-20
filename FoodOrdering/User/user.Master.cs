using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodOrdering.User
{
    public partial class user : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.Url.AbsoluteUri.ToString().Contains("Default.aspx"))
            {
                form1.Attributes.Add("class", "sub_page");
            }
            else
            {
                form1.Attributes.Remove("class");
                //load the control
                Control SliderUserControl = (Control)Page.LoadControl("SliderWebUserControl.ascx");
                //add the control
                pnlSlider.Controls.Add(SliderUserControl);
            }

            if (Session["userId"] != null)
            {

                lblLogout.Text = "Logout";
                Utils utils =new Utils();
                Session["cartCount"] = utils.cartCount(Convert.ToInt32(Session["userId"])).ToString();
            }
            else
            {
                lblLogout.Text = "Login";
                Session["cartCount"] = "0";
            }
        }

        protected void lblLogout_Click(object sender, EventArgs e)
        {
            if (Session["userId"] == null){

                Response.Redirect("Login.aspx");
            }
            else
            {
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }


        }
    }
}