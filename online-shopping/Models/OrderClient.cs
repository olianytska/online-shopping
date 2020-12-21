using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace online_shopping.Models
{
    public class OrderClient
    {
        public int Id { get; set; }
        public Client Client { get; set; }
        public Order Order { get; set; }
        public Shipping Shipping { get; set; }

    }
}