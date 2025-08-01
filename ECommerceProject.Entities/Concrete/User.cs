﻿using System;
using System.Collections.Generic;

namespace ECommerceProject.Entities.Concrete
{
    public class User
    {
        public int Id { get; set; }

        public string Email { get; set; }

        public string PasswordHash { get; set; }  // Güvenlik için şifreyi hash olarak tut

        public string FullName { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;

        // Kullanıcının favori ürünleri
        public virtual ICollection<Favorite> Favorites { get; set; } = new HashSet<Favorite>();

        // Kullanıcının siparişleri
        public virtual ICollection<Order> Orders { get; set; } = new HashSet<Order>();

        // Kullanıcı sepeti (birden fazla cart item olabilir)
        public virtual ICollection<CartItem> CartItems { get; set; } = new HashSet<CartItem>();
    }
}
