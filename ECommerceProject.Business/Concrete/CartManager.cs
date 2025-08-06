using ECommerceProject.Business.Abstract;
using ECommerceProject.Entities.Concrete;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerceProject.Business.Concrete
{
    public class CartManager : ICartService
    {
        private const string CartSessionKey = "Cart";

        public List<CartItem> GetCartFromSession(HttpSessionStateBase session)
        {
            return session[CartSessionKey] as List<CartItem> ?? new List<CartItem>();
        }

        public void SaveCartToSession(HttpSessionStateBase session, List<CartItem> cart)
        {
            session[CartSessionKey] = cart;
        }

        public void AddToCart(List<CartItem> cart, Product product)
        {
            var item = cart.FirstOrDefault(x => x.ProductId == product.Id);
            if (item != null)
            {
                item.Quantity++;
            }
            else
            {
                cart.Add(new CartItem
                {
                    ProductId = product.Id,
                    Product = product, 
                    Quantity = 1
                });
            }
        }




        public void IncreaseQuantity(List<CartItem> cart, int productId)
        {
            var item = cart.FirstOrDefault(x => x.ProductId == productId);
            if (item != null)
            {
                item.Quantity++;
            }
        }

        public void DecreaseQuantity(List<CartItem> cart, int productId)
        {
            var item = cart.FirstOrDefault(x => x.ProductId == productId);
            if (item != null)
            {
                item.Quantity--;
                if (item.Quantity <= 0)
                {
                    cart.Remove(item);
                }
            }
        }

        public void ClearCart(HttpSessionStateBase session)
        {
            session[CartSessionKey] = new List<CartItem>();
        }
    
    }
}
