using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using PruebaCodere.Models;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace PruebaCodere.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize] // Aplicar autorización a todo el controlador
    public class ShowsController : ControllerBase
    {
        private readonly HttpClient _httpClient;
        private readonly DataContext _dbContext;
        private readonly IConfiguration _configuration;

        public ShowsController(DataContext dbContext, IConfiguration configuration)
        {
            _httpClient = new HttpClient();
            _httpClient.BaseAddress = new System.Uri("https://api.tvmaze.com/");
            _dbContext = dbContext;
            _configuration = configuration;
        }

        [HttpPost("crearClave")]
        [AllowAnonymous] // Permitir acceso sin autenticación
        public IActionResult CrearClave()
        {
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                issuer: _configuration["Jwt:Issuer"],
                audience: _configuration["Jwt:Audience"],
                claims: new[] { new Claim(ClaimTypes.Name, "username") },
                expires: DateTime.Now.AddMinutes(30),
                signingCredentials: creds);

            return Ok(new { token = new JwtSecurityTokenHandler().WriteToken(token) });
        }

        [HttpGet("ObtenerShow/{id}")]
        public async Task<IActionResult> GetShowById(int id)
        {
            var show = await _dbContext.Shows.FindAsync(id);

            if (show != null)
            {
                return Ok(show);
            }

            return NotFound("Show not found in the database");
        }

        [HttpPost("GuardarShowDesdeAPI/{id}")]
        public async Task<IActionResult> GuardarShowDesdeAPI(int id)
        {
            var response = await _httpClient.GetAsync($"shows/{id}");

            if (response.IsSuccessStatusCode)
            {
                var showInfo = await response.Content.ReadAsStringAsync();
                var show = JsonSerializer.Deserialize<ShowInfo>(showInfo);

                _dbContext.Shows.Add(show);
                await _dbContext.SaveChangesAsync();

                return Ok(show);
            }

            return StatusCode((int)response.StatusCode, "Error al obtener datos desde la API externa");
        }
    }
}
}