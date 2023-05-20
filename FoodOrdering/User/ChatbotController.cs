using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FoodOrdering.User
{
    public class ChatbotController : ApiController
    {
        [AcceptVerbs("GET")]
        public string sayhello()
        {
            return "hello from test api";
        }
        //// GET api/<controller>
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

        //// GET api/<controller>/5
        //public string Get(string ans)
        //{
        //    // Your logic to generate a response based on the user input goes here
        //    string response = "Hello, world!"+ans;

        //    return response;
        //}

        //// POST api/<controller>
        //public void Post([FromBody] string value)
        //{
        //}

        //// PUT api/<controller>/5
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        //// DELETE api/<controller>/5
        //public void Delete(int id)
        //{
        //}
    }
}