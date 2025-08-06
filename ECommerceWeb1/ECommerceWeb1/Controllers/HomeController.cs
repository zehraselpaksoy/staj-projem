using ECommerceProject.Business.Abstract;
using ECommerceProject.Entities.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using ECommerceWeb1.Web.Models;
using ECommerceProject.DataAccess.Concrete;

namespace ECommerceWeb1.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly IProductService _productService;
        private readonly ICartService _cartService;
        private readonly ICategoryService _categoryService;
        private readonly DataContext _context;

        public HomeController(IProductService productService,
                              ICartService cartService,
                              ICategoryService categoryService,
                              DataContext context)
        {
            _productService = productService;
            _cartService = cartService;
            _categoryService = categoryService;
            _context = context;
        }

        public IActionResult Index(int? categoryId)
        {
            var products = categoryId.HasValue
                ? _productService.GetProductsByCategory(categoryId.Value) :
                     _productService.GetAllProductsWithCategories();

            var categories = _categoryService.GetAllWithHierarchy();

            var currentUserEmail = HttpContext.Session.GetString("CurrentUserEmail");
            User currentUser = null;
            List<int> favoriteProductIds = new();

            if (!string.IsNullOrEmpty(currentUserEmail))
            {
                currentUser = _context.Users.FirstOrDefault(u => u.Email == currentUserEmail);
                if (currentUser != null)
                {
                    favoriteProductIds = _context.Favorites
                        .Where(f => f.UserId == currentUser.Id)
                        .Select(f => f.ProductId)
                        .ToList();
                }
            }

            // Sepet verisini sessiondan alýyoruz
            var cart = _cartService.GetCartFromSession(HttpContext.Session);

            var viewModel = new ProductsViewModel
            {
                Categories = categories,
                Products = products,
                SelectedCategoryId = categoryId,
                FavoriteProductIds = favoriteProductIds,
                Cart = cart
            };

            return View(viewModel);
        }


        [HttpGet]
        public IActionResult AddToCart(int id)
        {
            var cart = _cartService.GetCartFromSession(HttpContext.Session);
            var product = _productService.GetProductById(id);
            if (product != null)
            {
                _cartService.AddToCart(cart, product);
                _cartService.SaveCartToSession(HttpContext.Session, cart);
            }

            // AJAX çaðrýsýysa sadece sepet kýsmýný döndür
            if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
            {
                return PartialView("_CartPartial", cart); // ? Doðru model gönderildi
            }

            if (Request.Headers.ContainsKey("Referer"))
                return Redirect(Request.Headers["Referer"].ToString());

            return RedirectToAction("Index");
        }



        [HttpGet]
        public IActionResult IncreaseQuantity(int id)
        {
            var cart = _cartService.GetCartFromSession(HttpContext.Session);
            _cartService.IncreaseQuantity(cart, id);
            _cartService.SaveCartToSession(HttpContext.Session, cart);

            if (IsAjaxRequest())
                return PartialView("CartPartial", cart);

            if (Request.Headers.ContainsKey("Referer"))
                return Redirect(Request.Headers["Referer"].ToString());

            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult DecreaseQuantity(int id)
        {
            var cart = _cartService.GetCartFromSession(HttpContext.Session);
            _cartService.DecreaseQuantity(cart, id);
            _cartService.SaveCartToSession(HttpContext.Session, cart);

            if (IsAjaxRequest())
                return PartialView("CartPartial", cart);

            if (Request.Headers.ContainsKey("Referer"))
                return Redirect(Request.Headers["Referer"].ToString());

            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult ClearCart()
        {
            _cartService.ClearCart(HttpContext.Session);

            if (IsAjaxRequest())
                return PartialView("CartPartial", new List<CartItem>());

            if (Request.Headers.ContainsKey("Referer"))
                return Redirect(Request.Headers["Referer"].ToString());

            return RedirectToAction("Index");
        }

        public IActionResult CartPartial()
        {
            var cart = _cartService.GetCartFromSession(HttpContext.Session);

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
        public IActionResult AddToFavorites(int productId)
        {
            var currentUserEmail = HttpContext.Session.GetString("CurrentUserEmail");

            if (string.IsNullOrEmpty(currentUserEmail))
                return RedirectToAction("Login", "Account");

            var currentUser = _context.Users.FirstOrDefault(u => u.Email == currentUserEmail);

            if (currentUser == null)
                return RedirectToAction("Login", "Account");

            var alreadyExists = _context.Favorites.Any(f => f.UserId == currentUser.Id && f.ProductId == productId);

            if (!alreadyExists)
            {
                var favorite = new Favorite
                {
                    UserId = currentUser.Id,
                    ProductId = productId,
                    CreatedAt = DateTime.UtcNow
                };

                _context.Favorites.Add(favorite);
                _context.SaveChanges();
            }

            if (Request.Headers.ContainsKey("Referer"))
                return Redirect(Request.Headers["Referer"].ToString());

            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult MyFavorites()
        {
            var currentUserEmail = HttpContext.Session.GetString("CurrentUserEmail");

            if (string.IsNullOrEmpty(currentUserEmail))
                return RedirectToAction("Login", "Account");

            var currentUser = _context.Users.FirstOrDefault(u => u.Email == currentUserEmail);

            if (currentUser == null)
                return RedirectToAction("Login", "Account");

            var favorites = _context.Favorites
                .Where(f => f.UserId == currentUser.Id)
                .Select(f => f.Product)
                .ToList();

            return View(favorites);
        }

        public IActionResult RemoveFromFavorites(int productId)
        {
            var currentUserEmail = HttpContext.Session.GetString("CurrentUserEmail");

            if (!string.IsNullOrEmpty(currentUserEmail))
            {
                var currentUser = _context.Users.FirstOrDefault(u => u.Email == currentUserEmail);

                if (currentUser != null)
                {
                    var favorite = _context.Favorites
                        .FirstOrDefault(f => f.UserId == currentUser.Id && f.ProductId == productId);

                    if (favorite != null)
                    {
                        _context.Favorites.Remove(favorite);
                        _context.SaveChanges();
                    }
                }
            }

            if (Request.Headers.ContainsKey("Referer"))
                return Redirect(Request.Headers["Referer"].ToString());

            return RedirectToAction("Index");
        }

        // Ajax isteði kontrolü için yardýmcý metod
        private bool IsAjaxRequest()
        {
            return Request.Headers["X-Requested-With"] == "XMLHttpRequest";
        }
    }
}
