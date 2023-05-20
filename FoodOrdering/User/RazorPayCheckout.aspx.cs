using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodOrdering.User
{
    public partial class RazorPayCheckout : System.Web.UI.Page
    {
        public string orderId;
        public string amount;
        public string name;
        public string contact;
        public string email;
        public string product;
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
            name = Request.QueryString["Name"].ToString();
            contact = Request.QueryString["Contact"].ToString();
            email = Request.QueryString["Email"].ToString();
            product = Request.QueryString["Quantity"].ToString();
            amount = Request.QueryString["Amount"].ToString();
            int amount1 = (int)(Convert.ToDouble(amount));
            Dictionary<string, object> input = new Dictionary<string, object>();
            input.Add("amount", amount1*100);
            input.Add("currency", "INR"); 
            input.Add("payment_capture", 1);

            string key = "rzp_test_bcBVhXxp6bNmSR";
            string secret = "PuUElO9hmdrChbrNCeC2TshQ";

            RazorpayClient client = new RazorpayClient(key, secret);
            Razorpay.Api.Order order = client.Order.Create(input);
            orderId = order["id"].ToString();
        }
    }
}