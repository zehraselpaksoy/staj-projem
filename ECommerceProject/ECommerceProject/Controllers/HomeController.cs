using ECommerceProject.DataAccess.Concrete;
using System.Linq;
using System.Web.Mvc;
using System.Data.Entity;

namespace ECommerceProject.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly DataContext db = new DataContext(); // context'i sınıf seviyesinde tanımla

        public HomeController()
        {
            db.Configuration.ProxyCreationEnabled = false;
            db.Configuration.LazyLoadingEnabled = false;
        }

        public ActionResult Index()
        {
            db.Configuration.ProxyCreationEnabled = false; // Proxy’leri kapat

            var urunler = db.Products
                            .Include(p => p.Category)
                            .ToList();

            return View(urunler);
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);

            var product = db.Products
                .Include(p => p.Category)
                .FirstOrDefault(p => p.Id == id.Value);

            if (product == null)
                return HttpNotFound();

            if (product.Category == null)
            {
                // Debug için ya da logla
                System.Diagnostics.Debug.WriteLine("Kategori boş!");
            }

            return View(product);
        }
    }
}
