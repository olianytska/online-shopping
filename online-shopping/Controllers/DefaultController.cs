using online_shopping.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace online_shopping.Controllers
{
    public class DefaultController : Controller
    {
        private OnlineShoppingEntities db = new OnlineShoppingEntities();
        // GET: Default
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Catalog()
        {
            List<Product_Category> product_Categories = db.Product_Category.ToList();
            var products = (from p in db.Products
                            select new
                            {
                                IdCategory = p.IdCategory,
                                IdProduct = p.IdProduct,
                                Name = p.Name,
                                Price = p.Price,
                                ProductDescription = p.ProductDescription,
                                //Photo = p.Photo
                            }).Take(5).ToList();
            var items =  from product in products
                         join product_cat in product_Categories on product.IdCategory equals product_cat.IdCategory
                         select new ViewProductAsNormalno
                         {
                             Category = product_cat.Name,
                             Name = product.Name,
                             Price = product.Price,
                             Description = product.ProductDescription,
                             //Photo = product.Photo
                         };
            return View(items);
        }
    }
}