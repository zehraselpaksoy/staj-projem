using ECommerceProject.Entities.Concrete;
using System.Linq;
using System.Web.Mvc;

namespace ECommerceProject.Web.Controllers
{
    public class AccountController : Controller
    {
        private readonly DataContext _context = new DataContext();

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string Email, string Password)
        {
            var user = _context.Users.FirstOrDefault(u => u.Email == Email && u.PasswordHash == Password);

            if (user != null)
            {
                Session["CurrentUser"] = user;

             
                if (TempData["ReturnUrl"] != null)
                {
                    string returnUrl = TempData["ReturnUrl"].ToString();
                    if (Url.IsLocalUrl(returnUrl)) // Güvenlik için kontrol
                    {
                        return Redirect(returnUrl);
                    }
                }

                // 🔙 Yoksa ana sayfaya yönlendir
                return RedirectToAction("Index", "Home");
            }

            // ❌ Giriş başarısızsa hata mesajı göster
            ViewBag.Error = "Email veya şifre hatalı.";
            return View();
        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(User user, string Password)
        {
            
            var existingUser = _context.Users.FirstOrDefault(u => u.Email == user.Email);
            if (existingUser != null)
            {
                ViewBag.Error = "Bu email adresi zaten kayıtlı.";
                return View();
            }

            // Şifreyi hash'le (istersen düz de bırakabilirsin)
            user.PasswordHash = Password; // Güvenlik için hash önerilir

            _context.Users.Add(user);
            _context.SaveChanges();

            // Otomatik giriş yap
            Session["CurrentUser"] = user;

            return RedirectToAction("Index", "Home");
        }


        public ActionResult Logout()
        {
            Session["CurrentUser"] = null;
            return RedirectToAction("Index", "Home"); // Ana sayfaya yönlendir
        }

    }
}
