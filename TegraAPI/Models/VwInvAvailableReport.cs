using System;
using System.Collections.Generic;

namespace TegraAPI.Models
{
    public partial class VwInvAvailableReport
    {
        public string Product { get; set; } = null!;
        public string? LastOperationDate { get; set; }
        public int? Quantity { get; set; }
        public int ProductId { get; set; }
    }
}
