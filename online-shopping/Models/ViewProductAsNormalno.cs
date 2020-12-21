using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace online_shopping.Models
{
    public class ViewProductAsNormalno
    {
        public int IdProduct { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int IdCategory { get; set; }
        public string Description { get; set; }
        public int IdStorage { get; set; }
        public string Photo { get; set; }
        public string Category { get; set; }
    }
}