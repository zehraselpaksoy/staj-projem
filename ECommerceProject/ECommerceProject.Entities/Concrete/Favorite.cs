﻿using ECommerceProject.Entities.Concrete;
using System;

public class Favorite
{
    public int Id { get; set; }

    public int UserId { get; set; }
    public virtual User User { get; set; }

    public int ProductId { get; set; }
    public virtual Product Product { get; set; }

    public DateTime CreatedAt { get; set; }
}
