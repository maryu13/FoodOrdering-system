using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodOrdering.User
{
    public class cartItem
    {
        public int ProductId { get; set; }
        public string Name { get; set; }
        public Decimal Price { get; set; }
        public int Quantity { get; set; }
    }
}