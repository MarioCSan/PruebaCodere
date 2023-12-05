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
            _httpClient.BaseAddress = new System.Uri("https://api.tvmaze.com/shows/");
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
        public async Task<IActionResult> GetShow(int id)
        {
            var show = await _dbContext.Shows
                .Include(s => s.Rating)
                .Include(s => s.Network)
                    .ThenInclude(n => n.Country)
                .Include(s => s.Image)
                .Include(s => s.Links)
                .FirstOrDefaultAsync(s => s.Id == id);

            if (show != null)
            {
                return Ok(show);
            }

            return NotFound("Show no encontrado en la base de datos");
        }

        [HttpPost]
        public async Task<IActionResult> PostShowFromApi(int id)
        {
            try
            {
                HttpResponseMessage response = await _httpClient.GetAsync("https://api.tvmaze.com/shows/"+id);

                if (response.IsSuccessStatusCode)
                {
                    string apiResponse = await response.Content.ReadAsStringAsync();
                    var showFromApi = JsonSerializer.Deserialize<Show>(apiResponse);

                    if (showFromApi != null && showFromApi.Network != null && showFromApi.Network.Country != null && showFromApi.Network.Country.Code != null)
                    {
                        // Verificar si el país ya existe en la base de datos
                        var existingCountry = await _dbContext.Countries.FindAsync(showFromApi.Network.Country.Code);

                        if (existingCountry == null)
                        {
                            _dbContext.Countries.Add(showFromApi.Network.Country);
                        }

                        // Agregar el show a la base de datos si no existe
                        var existingShow = await _dbContext.Shows.FindAsync(showFromApi.Id);

                        if (existingShow == null)
                        {
                            _dbContext.Shows.Add(showFromApi);
                        }

                        await _dbContext.SaveChangesAsync();
                        return Ok("Los datos del show se han guardado en la base de datos.");
                    }
                    else
                    {
                        return BadRequest("La respuesta de la API no tiene la estructura esperada o los datos son nulos.");
                    }
                }
                else
                {
                    return BadRequest("No se pudo obtener los datos del show de la API.");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Se produjo un error: {ex}");
            }
        }


    }
}
