using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodOrdering.User
{
   

public class Chatbot
{
        public string ProcessMessage(string message)
        {
            // Process the user message and return a response
            string response = "I'm sorry, I didn't understand that.";
            if (message=="")
            {
                response = "";
                
            }
            else if (message==("hello"))
            {
                response = "Hello! How can I assist you today?";
            }
            else if (message==("help"))
            {
                response = "I can help you with the following tasks: task1, task2, task3.";
            }
            return response;

        }
    }
}
