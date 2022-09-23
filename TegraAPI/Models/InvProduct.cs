using System;
using System.Collections.Generic;

namespace TegraAPI.Models
{
    public partial class InvProduct
    {
        public InvProduct()
        {
            InvBoxProductDetails = new HashSet<InvBoxProductDetail>();
        }

        public int ProductId { get; set; }
        public string ProductCode { get; set; } = null!;
        public string ProductName { get; set; } = null!;
        public bool ProductEnabled { get; set; }
        public DateTime ProductCreationDate { get; set; }
        public string ProductCreationUser { get; set; } = null!;
        public DateTime? ProductModifDate { get; set; }
        public string? ProductModifUser { get; set; }

        public virtual ICollection<InvBoxProductDetail> InvBoxProductDetails { get; set; }
    }
}
