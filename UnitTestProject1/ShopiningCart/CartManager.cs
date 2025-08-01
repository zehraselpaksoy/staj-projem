using ShopiningCart;
using ShoppingCart;
using System.Collections.Generic;
using System.Linq;

public class CartManager
{
    private readonly List<CartItem> _cartItems;

    public CartManager()
    {
        _cartItems = new List<CartItem>();
    }

    public void Add(CartItem cartItem)
    {
        var addedCartItem = _cartItems.SingleOrDefault(t =>
            t.Product.ProductId == cartItem.Product.ProductId);
        if (addedCartItem == null)
        {
            _cartItems.Add(cartItem);
        }
        else
        {
            addedCartItem.Quantity += cartItem.Quantity;
        }
    }

    public void Remove(int productId)
    {
        var product = _cartItems.FirstOrDefault(t => t.Product.ProductId == productId);
        if (product != null)
        {
            _cartItems.Remove(product);
        }
    }

    public void Clear()
    {
        _cartItems.Clear();
    }

    public IReadOnlyList<CartItem> CartItems => _cartItems.AsReadOnly();

    public decimal TotalPrice => _cartItems.Sum(t => t.Quantity * t.Product.UnitPrice);

    public int TotalQuantity => _cartItems.Sum(t => t.Quantity);

    public int TotalItems => _cartItems.Count;
}
