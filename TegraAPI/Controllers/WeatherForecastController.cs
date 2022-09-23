using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TegraAPI.Models;

namespace TegraAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
        "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
    };

        private readonly ILogger<WeatherForecastController> _logger;
        private readonly defaultContext _context;

        public WeatherForecastController(ILogger<WeatherForecastController> logger, defaultContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet(Name = "GetWeatherForecast")]
        public IEnumerable<WeatherForecast> Get()
        {
            return Enumerable.Range(1, 5).Select(index => new WeatherForecast
            {
                Date = DateTime.Now.AddDays(index),
                TemperatureC = Random.Shared.Next(-20, 55),
                Summary = Summaries[Random.Shared.Next(Summaries.Length)]
            })
            .ToArray();
        }

        [HttpPost(Name = "GetProducts")]
        public async Task<IEnumerable<InvProduct>> GetProducts()
        {
            return await _context.InvProducts.ToListAsync();
        }
    }
}