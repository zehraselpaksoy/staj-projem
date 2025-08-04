using System;

namespace ECommerceProject.Entities.Concrete
{
    public class CartItem
    {
        public int Id { get; set; }  

        public int? UserId { get; set; }  

        public string SessionId { get; set; }  

        public int ProductId { get; set; }

        public virtual Product Product { get; set; }

        public int Quantity { get; set; }

        public decimal UnitPrice => Product?.Price ?? 0;

        public decimal TotalPrice => UnitPrice * Quantity;

        public DateTime CreatedAt { get; set; } = DateTime.Now;

        // Navigation property
        public virtual User User { get; set; }
    }
}
