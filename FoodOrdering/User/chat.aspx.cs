using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodOrdering.User
{
    public partial class chat : System.Web.UI.Page
    {
        static int userId;
        protected void Page_Load(object sender, EventArgs e)
        {
            //// Create an instance of the chatbot class
            //Chatbot chatbot = new Chatbot();

            //if (!IsPostBack)
            //{
            //    // Get the user message from the input field
            //    string message = Request.Form["message"];

            //    // Process the message and get the response
            //    string response = chatbot.ProcessMessage(message);

            //    // Register a script block to display the response
            //    string script = "<script type='text/javascript'>displayMessage('" + response + "');</script>";
            //    ClientScript.RegisterStartupScript(this.GetType(), "displayMessage", script);
            userId = Convert.ToInt32(Session["userId"]);
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
        public static string GetResponse(String message)
        {
            Chatbot chatbot = new Chatbot();
            chatbot.getSession(userId);
            string response = chatbot.ProcessMessage(message);

            return response;
        }




        public class Chatbot
        {
            int UserId;

            string[] greetingInput = { "hello", "hi", "heyyaa", "hey", "hii", "hiii", "hey there", "hello!", "how are you", "hellooo","can you help me" };
            string[] byeInput = { "byeee", "see you", "tata", "bye", "thank you", "goodbye", "bub bye", "byee!", "thanks" };
            string[] menuInput = { "menu", "list", "categories", "category", "can you show me the menu", "please show me the menu", "food items", "provide menu" };
            string[] foodInput = { "burger", "noodles", "pizza", "veg-pizza", "pulav", "french fries", "can you show me the burger","juices", "list of burgers", "send me burger list", "send me pizza list", "send me noodles list", "send me veg pizza list", "send me pulav list", "provide menu", "send me the menu" };
            string[] orderInput = { "order", "add to cart", "cheese-pizza", "cheese-burger", "book","add" };// "tuna", "pepperoni", "margherita", "veg-crispy", "turkey-burger", "the grill thrill" };
            string[] cartInput = { "cart", "show cart", "take me to cart", "i want to see cart items", "items in my cart ", "which items is there in my cart", "no of items in my cart", "total items in my cart", "is my cart empty", "visit to cart" };
            string[] removecart = { "remove", "delete", "clear" };

            private static SqlConnection con;

            public string ProcessMessage(string message)
            {
                con = new SqlConnection(Connection.GetConnectionString());
                string response = "I'm sorry, I didn't understand that.";

                if (list(message.ToLower(), greetingInput))
                {
                    response = "Hello! what I can do for you?";
                }

                else if (list(message.ToLower(), menuInput))
                {
                    List<categoryItem> categoryItem = GetcategoryItems();
                    if (categoryItem.Count > 0)
                    {
                        response = "Here are the Category of items \n";
                        foreach (categoryItem item in categoryItem)
                        {
                            response += "<br>" + item.Name;
                        }
                    }
                    else
                    {
                        response = "Sorry, we currently do not have any items on the menu.";
                    }

                }

                else if (list(message.ToLower(), foodInput))

                {

                    List<categoryItem> categoryItem = GetcategoryItems();
                    if (categoryItem.Count > 0)
                    {

                        foreach (categoryItem item in categoryItem)
                        {
                            string catergoryName = item.Name;
                            if (message.ToLower().Contains(catergoryName.ToLower()))
                            {
                                List<MenuItem> menuItems = GetMenuItems(catergoryName);

                                if (menuItems.Count > 0)
                                {
                                    response = "Here are the items\n";
                                    foreach (MenuItem listItem in menuItems)
                                    {
                                        response += "<br>" + listItem.Name + "  - ₹" + listItem.Price;
                                    }
                                }
                                else
                                {
                                    response = "Sorry, we currently do not have any items on the menu.";
                                }
                                // break;
                            }
                        }
                    }

                }

                else if (list(message.ToLower(), orderInput))
                {
                    List<MenuItem> menuname = GetMenuItemsWithoutId();
                    if (menuname.Count > 0)
                    {

                        foreach (MenuItem item in menuname)
                        {
                            string name = item.Name;//name=burger,tuna
                            int productId = item.ProductId;//id=1,2

                            if (message.ToLower().Contains(name.ToLower()))//please show me tunna //burger//tuna
                            {
                                using (con)
                                {
                                    con.Open();

                                    string sql = "INSERT INTO Carts (UserId,ProductId,Quantity) VALUES (@userId,@productId,@quantity)";
                                    using (SqlCommand command = new SqlCommand(sql, con))
                                    {
                                        command.Parameters.AddWithValue("@userId", UserId);
                                        command.Parameters.AddWithValue("@productId", productId);
                                        command.Parameters.AddWithValue("@quantity", 1);

                                        command.ExecuteNonQuery();

                                        response = "Item added to the cart \n Visit and see your cart";
                                    }
                                }
                                break;
                            }
                            else
                            {
                                response = "Sorry, we currently do not have any items on the menu.";
                            }
                        }
                    }

                }

                else if (list(message.ToLower(), cartInput))
                {
                  
                    List<cartItem> cartItem = GetCartItems();
                    if (cartItem.Count > 0)
                    {
                        response = "Here are the itemas in your cart  \n";
                        foreach (cartItem item in cartItem)
                        {
                            response += "<br>" + item.Quantity+ " "+item.Name+ " for ₹" + item.Price ;
                            
                        }
                        response += "<br> <br>so total items in my cart is " + cartItem.Count;
                    }
                    else
                    {
                        response = "Sorry, we currently do not have any items on the menu.";
                    }
                }

                else if (list(message.ToLower(), removecart))
                {
                    List<MenuItem> menuname = GetMenuItemsWithoutId();
                    if (menuname.Count > 0)
                    {

                        foreach (MenuItem item in menuname)
                        {
                            string name = item.Name;//name=burger,tuna
                            int productId = item.ProductId;//id=1,2

                            if (message.ToLower().Contains(name.ToLower()))//please show me tunna //burger//tuna
                            {
                                using (con)
                                {
                                    con.Open();

                                    string sql = "delete from Carts where ProductId=@productId and UserId=@userId";
                                    using (SqlCommand command = new SqlCommand(sql, con))
                                    {
                                       command.Parameters.AddWithValue("@userId", UserId);
                                       command.Parameters.AddWithValue("@productId", productId);

                                       int rowsAffected= command.ExecuteNonQuery();
                                        con.Close();
                                        response = "Item Remove From The Cart \n Visit and see your cart";
                                    }
                                }
                                break;
                            }
                            else
                            {
                                response = "Item is not present in the cart";
                            }
                        }
                    }
                }

                else  if (list(message.ToLower(), byeInput))
                {
                    response = "Thanks for visiting !! <br> byee!!";
                }
                return response;
            }



            public void getSession(int userId)
            {
                UserId = userId;
            }

            private List<categoryItem> GetcategoryItems()
            {
                List<categoryItem> categoryItems = new List<categoryItem>();

                using (con)
                {
                    SqlCommand command = new SqlCommand("SELECT * FROM Categories", con);
                    command.CommandType = CommandType.Text;

                    con.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        categoryItem item = new categoryItem();
                        item.CategoryId = (int)reader["CategoryId"];
                        item.Name = reader["Name"].ToString();

                        categoryItems.Add(item);
                    }

                    reader.Close();
                    con.Close();
                }

                return categoryItems;

            }
            private List<MenuItem> GetMenuItems(String message)
            {
                //String name = message;

                //String separator = "- ";
                //int sepos = name.IndexOf(separator);
                //// String[] sp = name.Split();
                //String categoryName = name.Substring(sepos + separator.Length);
                //Console.Write(categoryName);
                String categoryName = message;
                List<MenuItem> menuItems = new List<MenuItem>();

                using (con)
                {
                    con = new SqlConnection(Connection.GetConnectionString());
                    SqlCommand command = new SqlCommand("SELECT p.*,c.Name AS CategoryName FROM dbo.Products p INNER JOIN dbo.Categories c ON c.CategoryId = p.CategoryId where c.Name = '" + categoryName + "' ", con);
                    command.CommandType = CommandType.Text;

                    con.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        MenuItem item = new MenuItem();
                        item.ProductId = (int)reader["ProductId"];
                        item.Name = reader["Name"].ToString();
                        item.Price = (Decimal)reader["Price"];

                        menuItems.Add(item);
                    }

                    reader.Close();
                    con.Close();
                }

                return menuItems;

            }

            private List<MenuItem> GetMenuItemsWithoutId()
            {
                //String name = message;

                //String separator = "- ";
                //int sepos = name.IndexOf(separator);
                //// String[] sp = name.Split();
                //String categoryName = name.Substring(sepos + separator.Length);
                //Console.Write(categoryName);
                //String categoryName = message;
                List<MenuItem> menuItems = new List<MenuItem>();

                using (con)
                {
                    con = new SqlConnection(Connection.GetConnectionString());
                    SqlCommand command = new SqlCommand("SELECT p.*,c.Name AS CategoryName FROM dbo.Products p INNER JOIN dbo.Categories c ON c.CategoryId = p.CategoryId  ", con);
                    command.CommandType = CommandType.Text;

                    con.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        MenuItem item = new MenuItem();
                        item.ProductId = (int)reader["ProductId"];
                        item.Name = reader["Name"].ToString();
                        item.Price = (Decimal)reader["Price"];

                        menuItems.Add(item);
                    }

                    reader.Close();
                    con.Close();
                }

                return menuItems;

            }

            private List<cartItem> GetCartItems()
            {
                List<cartItem> cartItems = new List<cartItem>();
                using (con)
                {
                    con = new SqlConnection(Connection.GetConnectionString());
                    SqlCommand command = new SqlCommand("SELECT c.ProductId,p.Name,p.ImageUrl,p.Price,c.Quantity,c.Quantity AS Qty,p.Quantity AS PrdQty FROM dbo.Carts c INNER JOIN dbo.Products p ON p.ProductId = c.ProductId WHERE c.UserId = '"+userId+"'", con);
                    command.CommandType = CommandType.Text;

                    con.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        cartItem item = new cartItem();
                        item.ProductId = (int)reader["ProductId"];
                        item.Name = reader["Name"].ToString();
                        item.Price = (Decimal)reader["Price"];
                        item.Quantity = (int)reader["Quantity"];

                        cartItems.Add(item);
                    }

                    reader.Close();
                    con.Close();
                }

                return cartItems;
            }
            public static bool list(String inputString, String[] items)
            {
                bool found = false;
                foreach (string item in items)
                {
                    if (inputString.Contains(item))
                    {
                        found = true;
                        break;
                    }
                }
                return found;
            }


        }
    }
}
