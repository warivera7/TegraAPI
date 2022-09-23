using System;
using System.Collections.Generic;

namespace TegraAPI.Models
{
    public partial class VwInvProductDetail
    {
        public string BoxCode { get; set; } = null!;
        public DateTime DetailCreationDate { get; set; }
        public int DetailQuantity { get; set; }
        public int ProductId { get; set; }
    }
}
