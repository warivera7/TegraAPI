using System;
using System.Collections.Generic;

namespace TegraAPI.Models
{
    public partial class InvBox
    {
        public InvBox()
        {
            InvBoxProductDetails = new HashSet<InvBoxProductDetail>();
        }

        public int BoxId { get; set; }
        public string BoxCode { get; set; } = null!;
        public bool BoxEnabled { get; set; }
        public DateTime BoxCreationDate { get; set; }
        public string BoxCreationUser { get; set; } = null!;
        public DateTime? BoxModifDate { get; set; }
        public string? BoxModifUser { get; set; }

        public virtual ICollection<InvBoxProductDetail> InvBoxProductDetails { get; set; }
    }
}
