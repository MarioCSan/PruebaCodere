using Microsoft.AspNetCore.Mvc;
using NombreDeTuProyecto.Models;
using System;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace PruebaCodere.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ShowsController : ControllerBase
    {
        private readonly HttpClient _httpClient;

        public ShowsController()
        {
            _httpClient = new HttpClient();
            _httpClient.BaseAddress = new Uri("http://www.tvmaze.com/api/");
        }

        [HttpGet("shows-main-information")]
        public async Task<IActionResult> GetShowsMainInformation()
        {
            try
            {
                var response = await _httpClient.GetAsync("shows");
                if (response.IsSuccessStatusCode)
                {
                    var showInfo = await response.Content.ReadFromJsonAsync<ShowInfo>();
                    return Ok(showInfo);
                }
                return StatusCode((int)response.StatusCode, "Error retrieving data from TVMaze API");
            }
            catch (Exception ex)
            {
                return BadRequest($"Exception: {ex.Message}");
            }
        }
    }
}
