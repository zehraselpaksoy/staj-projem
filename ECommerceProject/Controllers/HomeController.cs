using ECommerceProject.Business.Abstract;
using ECommerceProject.Business.Concrete;
using ECommerceProject.Business.Concrete; // ProductDto burada
using ECommerceProject.Entities.Concrete;
using System.Collections.Generic;
using System.Web.Mvc;

namespace ECommerceProject.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly IProductService _productService;
        private readonly ICartService _cartService;

        public HomeController()
        {
            _productService = new ProductManager();
            _cartService = new CartManager();
        }

        public ActionResult Index()
        {
            // Eğer GetAllProductsWithCategories DTO dönüyorsa, View da DTO beklemeli
            List<ProductDto> urunler = _productService.GetAllProductsWithCategories();
            return View(urunler);
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

            if (Request.IsAjaxRequest())
                return PartialView("CartPartial", cart);

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

    }
}
