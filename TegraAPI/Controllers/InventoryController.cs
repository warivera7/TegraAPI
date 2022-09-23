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
        private readonly ILogger<WeatherForecastController> _logger;
        private readonly IConfiguration Configuration;

        public InventoryController(ILogger<WeatherForecastController> logger, defaultContext context, IConfiguration iconfig)
        {
            _logger = logger;
            _context = context;
            Configuration = iconfig;
        }

        [HttpGet(Name = "GetInventory")]
        public async Task<IEnumerable<VwInvAvailableReport>> GetInventory()
        {
            return await _context.VwInvAvailableReports.ToListAsync();
        }

        [HttpGet("GetBoxes/{ProductId}", Name = "GetBoxes")]
        public async Task<IEnumerable<VwInvProductDetail>> GetBoxes(int ProductId)
        {
            return await _context.VwInvProductDetails.Where(x => x.ProductId == ProductId).ToListAsync();
        }

        [HttpGet("SearchProducts/{ProductName}/{NoStock}", Name = "SearchProducts")]
        public async Task<IEnumerable<VwInvAvailableReport>> SearchProducts(string ProductName, bool NoStock)
        {
            if (ProductName == "-")
            {
                if (NoStock)
                    return await _context.VwInvAvailableReports.Where(x => x.Quantity > 0).ToListAsync();
                else
                    return await _context.VwInvAvailableReports.Where(x => x.Quantity >= 0).ToListAsync();
            }
            else
            {
                if (NoStock)
                    return await _context.VwInvAvailableReports.Where(x => x.Product.Contains(ProductName) && x.Quantity > 0 ).ToListAsync();
                else
                    return await _context.VwInvAvailableReports.Where(x => x.Product.Contains(ProductName)).ToListAsync();
            }
        }
    }
}
