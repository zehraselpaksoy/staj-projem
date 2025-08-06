using ECommerceProject.Entities.Concrete;
using System.Collections.Generic;
using System.Web;

namespace ECommerceProject.Business.Abstract
{
    public interface ICartService
    {
        List<CartItem> GetCartFromSession(HttpSessionStateBase session);
        void SaveCartToSession(HttpSessionStateBase session, List<CartItem> cart);
        void AddToCart(List<CartItem> cart, Product product);
        void IncreaseQuantity(List<CartItem> cart, int productId);
        void DecreaseQuantity(List<CartItem> cart, int productId);
        void ClearCart(HttpSessionStateBase session);
    }
}
