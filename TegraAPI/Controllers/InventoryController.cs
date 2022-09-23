using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Xml.Linq;
using TegraAPI.Models;

namespace TegraAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class InventoryController : ControllerBase
    {
        private readonly defaultContext _context;
        private readonly IConfiguration Configuration;

        public InventoryController(defaultContext context, IConfiguration iconfig)
        {
            _context = context;
            Configuration = iconfig;
        }

        // Main products view
        [HttpGet(Name = "GetInventory")]
        public async Task<IEnumerable<VwInvAvailableReport>> GetInventory()
        {
            return await _context.VwInvAvailableReports.ToListAsync();
        }

        // Filter products view according to product code and/or no stock products
        [HttpGet("SearchProducts/{ProductCode}/{NoStock}", Name = "SearchProducts")]
        public async Task<IEnumerable<VwInvAvailableReport>> SearchProducts(string ProductCode, bool NoStock)
        {
            if (ProductCode == "-")
            {
                if (NoStock)
                    return await _context.VwInvAvailableReports.Where(x => x.Quantity > 0).ToListAsync();
                else
                    return await _context.VwInvAvailableReports.Where(x => x.Quantity >= 0).ToListAsync();
            }
            else
            {
                if (NoStock)
                    return await _context.VwInvAvailableReports.Where(x => x.Product.Contains(ProductCode) && x.Quantity > 0 ).ToListAsync();
                else
                    return await _context.VwInvAvailableReports.Where(x => x.Product.Contains(ProductCode)).ToListAsync();
            }
        }

        // Boxes detail according to product
        [HttpGet("GetBoxes/{ProductId}", Name = "GetBoxes")]
        public async Task<IEnumerable<VwInvProductDetail>> GetBoxes(int ProductId)
        {
            return await _context.VwInvProductDetails.Where(x => x.ProductId == ProductId).ToListAsync();
        }
    }
}
