using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using Microsoft.AspNetCore.Http;
using ECommerceProject.Entities.Concrete;
using ECommerceProject.Business.Abstract;
using ECommerceProject.Core.Helpers;

namespace ECommerceProject.Business.Concrete
{
    public class CartManager : ICartService
    {
        private const string CartSessionKey = "Cart";

        public List<CartItem> GetCartFromSession(ISession session)
        {
            if (session == null) throw new ArgumentNullException(nameof(session));

            var cartJson = session.GetString(CartSessionKey);
            if (string.IsNullOrEmpty(cartJson))
            {
                return new List<CartItem>();
            }

            return JsonSerializer.Deserialize<List<CartItem>>(cartJson) ?? new List<CartItem>();
        }

        public void SaveCartToSession(ISession session, List<CartItem> cart)
        {
            if (session == null) throw new ArgumentNullException(nameof(session));
            if (cart == null) throw new ArgumentNullException(nameof(cart));

            var cartJson = JsonSerializer.Serialize(cart);
            session.SetString(CartSessionKey, cartJson);
        }

        public void AddToCart(List<CartItem> cart, Product product)
        {
            if (cart == null) throw new ArgumentNullException(nameof(cart));
            if (product == null) throw new ArgumentNullException(nameof(product));

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
            if (cart == null) throw new ArgumentNullException(nameof(cart));

            var item = cart.FirstOrDefault(x => x.ProductId == productId);
            if (item != null)
            {
                item.Quantity++;
            }
        }

        public void DecreaseQuantity(List<CartItem> cart, int productId)
        {
            if (cart == null) throw new ArgumentNullException(nameof(cart));

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

        public void ClearCart(ISession session)
        {
            if (session == null) throw new ArgumentNullException(nameof(session));
            session.Remove(CartSessionKey);
        }
    }
}
