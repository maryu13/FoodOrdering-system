using IronPython.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodOrdering.User
{
    public partial class chatcode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Create a Python engine and a scope
            var engine = Python.CreateEngine();
            var scope = engine.CreateScope();

            // Load the Python script
            var script = engine.CreateScriptSourceFromFile(Server.MapPath("~/script.py"));

            // Execute the script in the scope
            script.Execute(scope);

            // Get the Python function from the scope
            dynamic intent = scope.GetVariable("predict_intent");

            // Call the Python function with an argument
            //string name = "Alice";
            dynamic result = intent("I want to order a pizza");

            // Display the result on the web page
            Response.Write(result);
        }
    }
}