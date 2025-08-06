using ECommerceProject.Entities.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using System.Linq;
using ECommerceProject.Entities.Concrete;
using ECommerceProject.DataAccess.Concrete;

namespace ECommerceWeb1.Web.Controllers
{
    public class AccountController : Controller
    {
        private readonly DataContext _context;

        public AccountController(DataContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(string email, string password)
        {
            var user = _context.Users.FirstOrDefault(u => u.Email == email && u.PasswordHash == password);

            if (user != null)
            {
                // Session'a kullanıcıyı kaydet
                HttpContext.Session.SetString("CurrentUserEmail", user.Email);
                // Eğer kullanıcı bilgilerini komple tutmak istersen, JSON serialize edip string olarak kaydedebilirsin.

                if (TempData["ReturnUrl"] != null)
                {
                    var returnUrl = TempData["ReturnUrl"].ToString();
                    if (Url.IsLocalUrl(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                }

                return RedirectToAction("Index", "Home");
            }

            ViewBag.Error = "Email veya şifre hatalı.";
            return View();
        }

        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Register(User user, string password)
        {
            var existingUser = _context.Users.FirstOrDefault(u => u.Email == user.Email);
            if (existingUser != null)
            {
                ViewBag.Error = "Bu email adresi zaten kayıtlı.";
                return View();
            }

            // Şifreyi hash'lemen önerilir, burada direkt atandı (geliştirme için)
            user.PasswordHash = password;

            _context.Users.Add(user);
            _context.SaveChanges();

            HttpContext.Session.SetString("CurrentUserEmail", user.Email);

            return RedirectToAction("Index", "Home");
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Remove("CurrentUserEmail");
            return RedirectToAction("Index", "Home");
        }
    }
}
