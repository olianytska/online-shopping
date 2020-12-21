using online_shopping.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace online_shopping.Controllers
{
    public class ClientController : Controller
    {
        private OnlineShoppingEntities db = new OnlineShoppingEntities();
        // GET: Client
        [HttpGet]
        public ActionResult Create()
        {
            Client client = new Client(); 
            return View();
        }
        [HttpPost]
        public ActionResult Create(Client client)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Clients.Add(client);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError(String.Empty, ex);
            }
            return View(client);
        }
    }
}