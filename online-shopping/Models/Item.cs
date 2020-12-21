using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace online_shopping.Models
{
    public class Item
    {
        public ViewProductAsNormalno Product
        {
            get;
            set;
        }

        public int Quantity
        {
            get;
            set;
        }
    }
}