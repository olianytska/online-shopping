using online_shopping.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace online_shopping.Controllers
{
    public class ProductController : Controller
    {

        // GET: Product
        public ActionResult Index()
        {
            ProductModel productModel = new ProductModel();
            ViewBag.products = productModel.findAll();
            return View();
        }
    }
}