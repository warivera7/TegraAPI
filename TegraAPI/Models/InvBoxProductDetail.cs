using System;
using System.Collections.Generic;

namespace TegraAPI.Models
{
    public partial class InvBoxProductDetail
    {
        public int DetailId { get; set; }
        public int BoxId { get; set; }
        public int ProductId { get; set; }
        public int DetailQuantity { get; set; }
        public bool DetailEnabled { get; set; }
        public DateTime DetailCreationDate { get; set; }
        public string DetailCreationUser { get; set; } = null!;
        public DateTime? DetailModifDate { get; set; }
        public string? DetailModifUser { get; set; }

        public virtual InvBox Box { get; set; } = null!;
        public virtual InvProduct Product { get; set; } = null!;
    }
}
