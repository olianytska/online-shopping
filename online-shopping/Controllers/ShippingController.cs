using online_shopping.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace online_shopping.Controllers
{
    public class ShippingController : Controller
    {
        // GET: Shipping
        private OnlineShoppingEntities db = new OnlineShoppingEntities();
        // GET: Client
        [HttpGet]
        public ActionResult Create()
        {
            Shipping client = new Shipping();
            return View();
        }
        [HttpPost]
        public ActionResult Create(Shipping shipping)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Shippings.Add(shipping);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError(String.Empty, ex);
            }
            return View(shipping);
        }
    }
}