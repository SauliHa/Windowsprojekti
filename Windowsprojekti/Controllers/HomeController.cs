using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using windowsprojekti.Oliot;

namespace Windowsprojekti.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult tuotelisays()
        {
            return View();
        }

        public ActionResult lisaatuote(string tuote, string hinta, string varasto)
        {

            tuoteolio kanta = new tuoteolio();

            if (kanta.avaaYhteys("root", ""))
            {
                ViewBag.viesti = kanta.Lisaatuote(tuote, hinta, varasto);
               
                  
              
            }

            return View();
        }
    }
}