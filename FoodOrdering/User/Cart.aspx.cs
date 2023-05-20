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
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        decimal grandTotal = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["userId"]==null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    getCartItems();
                }
            }
        }

        void getCartItems()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rcartItem.DataSource = dt;
            if (dt.Rows.Count == 0)
            {
                rcartItem.FooterTemplate = null;
                rcartItem.FooterTemplate = new CustomTemplate(ListItemType.Footer);
                
            }
            rcartItem.DataBind();
        }
        protected void rcartItem_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Utils utils = new Utils();
            int productQuantity=0;
            int cartQuantity = 0;
            if (e.CommandName == "remove")
            {
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("Cart_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
                cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    getCartItems();
                    //Cart count
                    Session["cartCount"] = utils.cartCount(Convert.ToInt32(Session["userId"]));
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error - " + ex.Message + "');</script>");
                }
            }

            if (e.CommandName == "updateCart")
            {
                bool isCartUpdated = false;
                for (int item = 0;item<rcartItem.Items.Count;item++)
                {
                    if(rcartItem.Items[item].ItemType==ListItemType.Item || rcartItem.Items[item].ItemType == ListItemType.AlternatingItem)
                    {
                        TextBox quantity = rcartItem.Items[item].FindControl("txtQuantity") as TextBox;
                        HiddenField _productId = rcartItem.Items[item].FindControl("hdnProductId") as HiddenField;
                        HiddenField _quantity = rcartItem.Items[item].FindControl("hdnQuantity") as HiddenField;
                        int quantityFromCart = Convert.ToInt32(quantity.Text);
                        int productId = Convert.ToInt32(_productId.Value);
                        int quantityFromDB = Convert.ToInt32(_quantity.Value);
                        bool isTrue = false;
                        int updatedQuantity = 1;
                        if(quantityFromCart>quantityFromDB)
                        {
                            updatedQuantity = quantityFromCart;
                            isTrue = true;
                        }
                        else if(quantityFromCart<quantityFromDB)
                        {
                            updatedQuantity = quantityFromCart;
                            isTrue = true;

                        }
                        if (isTrue)
                        {
                            //Update cart item quantity in db
                            isCartUpdated = utils.updateCartQuantity(updatedQuantity,productId,Convert.ToInt32(Session["userId"]));

                       
                        }
                    }
                }
                getCartItems();
            }

            if(e.CommandName== "checkout")
            {
                bool isTrue = false;
                string pName = string.Empty;
                //First will check item quantity 
                for (int item = 0; item < rcartItem.Items.Count; item++)
                {
                    if (rcartItem.Items[item].ItemType == ListItemType.Item || rcartItem.Items[item].ItemType == ListItemType.AlternatingItem)
                    {
                        HiddenField _productId = rcartItem.Items[item].FindControl("hdnProductId") as HiddenField;
                        HiddenField _cartquantity = rcartItem.Items[item].FindControl("hdnQuantity") as HiddenField;
                        HiddenField _productquantity = rcartItem.Items[item].FindControl("hdnPrdQuantity") as HiddenField;
                        Label productname = rcartItem.Items[item].FindControl("lblName") as Label;

                        cartQuantity = Convert.ToInt32(_cartquantity.Value);
                        int productId = Convert.ToInt32(_productId.Value);
                        productQuantity = Convert.ToInt32(_productquantity.Value);

                        if (productQuantity > cartQuantity && productQuantity>2)
                        {
                            isTrue = true;
                        }
                        else
                        {
                            isTrue = false;
                            pName = productname.Text.ToString();
                            break;

                        }
                        
                    }
                }
                if (isTrue)
                {
                    Response.Redirect(String.Format("RazorPayCheckout.aspx?Name={0}&Quantity={1}&Amount={2}&Contact={3}&Email={4}", Session["username"], cartQuantity, Session["grandTotalPrice"],"9178567432","john@gmail.com"));
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Item <b>'" + pName + "' </b> is out of stock :( ";
                    lblMsg.CssClass = "alert alert-warning";
                }
            }

        }

        protected void rcartItem_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType==ListItemType.Item||e.Item.ItemType==ListItemType.AlternatingItem)
            {
                Label totalPrice = e.Item.FindControl("lblTotalPrice") as Label;
                Label productPrice = e.Item.FindControl("lblPrice") as Label;
                TextBox quantity = e.Item.FindControl("txtQuantity") as TextBox;
                decimal calTotalPrice = Convert.ToDecimal(productPrice.Text) * Convert.ToDecimal(quantity.Text);
                totalPrice.Text = calTotalPrice.ToString();
                grandTotal += calTotalPrice;
            }
            Session["grandTotalPrice"] = grandTotal;


        }
       

        private sealed class CustomTemplate : ITemplate
        {
            private ListItemType ListItemType { get; set; }
            public CustomTemplate(ListItemType type)
            {
                ListItemType = type;
            }

            public void InstantiateIn(Control container)
            {
                if (ListItemType == ListItemType.Footer)
                {
                    var footer = new LiteralControl("<tr><td>colspan='5'<b> Your Cart is empty.</b><a href='Menu.aspx' class='badge badge-infoo ml-2'> Continue Shopping </a></td></tr></table>");
                    container.Controls.Add(footer);
                }
            }
        }

        protected void lblCheckout_Click(object sender, EventArgs e)
        {
           
        }
    }
}