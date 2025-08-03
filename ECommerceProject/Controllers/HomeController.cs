using ECommerceProject.Business.Abstract;
using ECommerceProject.Business.Concrete;
using ECommerceProject.Business.Concrete; 
using ECommerceProject.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace ECommerceProject.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly IProductService _productService;
        private readonly ICartService _cartService;
        private readonly ICategoryService _categoryService;
        public HomeController()
        {
            _categoryService = new CategoryManager();
            _productService = new ProductManager();
            _cartService = new CartManager();
        }

        public ActionResult Index(int? categoryId)
        {
            var products = categoryId.HasValue
                ? _productService.GetProductsByCategory(categoryId.Value)
                : _productService.GetAllProductsWithCategories();

            var categories = _categoryService.GetAllWithHierarchy();

            // ✅ Favori ürün ID’lerini çek
            var currentUser = Session["CurrentUser"] as User;
            var favoriteProductIds = new List<int>();

            if (currentUser != null)
            {
                using (var context = new DataContext())
                {
                    favoriteProductIds = context.Favorites
                        .Where(f => f.UserId == currentUser.Id)
                        .Select(f => f.ProductId)
                        .ToList();
                }
            }

            var viewModel = new ProductsViewModel
            {
                Categories = categories,
                Products = products,
                SelectedCategoryId = categoryId,

                // ✅ Favori ürün ID’lerini ViewModel’e ekle
                FavoriteProductIds = favoriteProductIds
            };

            return View(viewModel);
        }
        [HttpGet]
        public ActionResult AddToCart(int id)
        {
            var cart = _cartService.GetCartFromSession(Session);
            var product = _productService.GetProductById(id);
            if (product != null)    
            {
                _cartService.AddToCart(cart, product);
                _cartService.SaveCartToSession(Session, cart);
            }

            // AJAX ile geldiyse sadece cart kısmını döndür
            if (Request.IsAjaxRequest())
                return PartialView("CartPartial", cart);

            // Normal istekse: Geldiği sayfaya geri dön
            if (Request.UrlReferrer != null)
                return Redirect(Request.UrlReferrer.ToString());

            // Olmazsa Index'e fallback
            return RedirectToAction("Index");
        }


        [HttpGet]
        public ActionResult IncreaseQuantity(int id)
        {
            var cart = _cartService.GetCartFromSession(Session);
            _cartService.IncreaseQuantity(cart, id);
            _cartService.SaveCartToSession(Session, cart);

            if (Request.IsAjaxRequest())
                return PartialView("CartPartial", cart);

            // Ajax değilse geldiği sayfaya dön
            if (Request.UrlReferrer != null)
                return Redirect(Request.UrlReferrer.ToString());

            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult DecreaseQuantity(int id)
        {
            var cart = _cartService.GetCartFromSession(Session);
            _cartService.DecreaseQuantity(cart, id);
            _cartService.SaveCartToSession(Session, cart);

            if (Request.IsAjaxRequest())
                return PartialView("CartPartial", cart);

            // Ajax değilse geldiği sayfaya dön
            if (Request.UrlReferrer != null)
                return Redirect(Request.UrlReferrer.ToString());

            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult ClearCart()
        {
            _cartService.ClearCart(Session);

            if (Request.IsAjaxRequest())
                return PartialView("CartPartial", new List<CartItem>());

            return RedirectToAction("Index");
        }

        public ActionResult CartPartial()
        {
            var cart = _cartService.GetCartFromSession(Session);

            foreach (var item in cart)
            {
                if (item.Product == null)
                {
                    item.Product = _productService.GetProductById(item.ProductId);
                }
            }

            return PartialView(cart);
        }
        public PartialViewResult CategoryMenu()
        {
            var categories = _categoryService.GetAllWithHierarchy();
            return PartialView("_CategoryMenu", categories);
        }

        [HttpGet]
        public ActionResult AddToFavorites(int productId)
        {
            var currentUser = Session["CurrentUser"] as User;

            if (currentUser == null)
            {
                // Giriş yapılmamışsa login sayfasına yönlendir
                return RedirectToAction("Login", "Account");
            }

            using (var context = new DataContext())
            {
                // Aynı ürün zaten favorilere eklenmiş mi?
                var alreadyExists = context.Favorites
                    .Any(f => f.UserId == currentUser.Id && f.ProductId == productId);

                if (!alreadyExists)
                {
                    var favorite = new Favorite
                    {
                        UserId = currentUser.Id,
                        ProductId = productId,
                        CreatedAt = DateTime.Now
                    };

                    context.Favorites.Add(favorite);
                    context.SaveChanges();
                }
            }

            // Kullanıcının geldiği sayfaya geri dön
            if (Request.UrlReferrer != null)
            {
                return Redirect(Request.UrlReferrer.ToString());
            }

            // Referrer yoksa varsayılan olarak anasayfa
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult MyFavorites()
        {
            var currentUser = Session["CurrentUser"] as User;

            if (currentUser == null)
            {
                return RedirectToAction("Login", "Account");
            }

            using (var context = new DataContext())
            {
                var favorites = context.Favorites
                    .Where(f => f.UserId == currentUser.Id)
                    .Select(f => f.Product)
                    .ToList();

                return View(favorites);
            }
        }
        public ActionResult RemoveFromFavorites(int productId)
        {
            var currentUser = Session["CurrentUser"] as User;

            if (currentUser != null)
            {
                using (var context = new DataContext())
                {
                    var favorite = context.Favorites
                        .FirstOrDefault(f => f.UserId == currentUser.Id && f.ProductId == productId);

                    if (favorite != null)
                    {
                        context.Favorites.Remove(favorite);
                        context.SaveChanges();
                    }
                }
            }

            // Kullanıcının geldiği sayfaya geri dön
            if (Request.UrlReferrer != null)
            {
                return Redirect(Request.UrlReferrer.ToString());
            }

            // URL gelmezse yedek olarak ana sayfaya dön
            return RedirectToAction("Index");
        }



    }
}
