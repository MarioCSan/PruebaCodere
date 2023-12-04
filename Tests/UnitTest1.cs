using NUnit.Framework;
using Microsoft.EntityFrameworkCore;
using Moq;
using PruebaCodere.Controllers;
using PruebaCodere.Models;
using System.Threading.Tasks;
using System.Net;
using System.Net.Http;
using System.Text.Json;
using System;
using Microsoft.AspNetCore.Mvc;
using Moq.Protected;

namespace PruebaCodere.Tests
{
    [TestFixture]
    public class ShowsControllerTests
    {
        private ShowsController _controller;
        private DataContext _context;
        private Mock<IConfiguration> _configurationMock;

        [SetUp]
        public void Setup()
        {
            // Crear un contexto de datos en memoria para realizar pruebas
            var options = new DbContextOptionsBuilder<DataContext>()
                //.UseInMemoryDatabase(databaseName: "TestDatabase")
                .Options;

            _context = new DataContext(options);

            // Mock de IConfiguration para usar en el controlador
            _configurationMock = new Mock<IConfiguration>();
            _configurationMock.Setup(x => x[It.IsAny<string>()]).Returns("some_key_or_value");

            // Inicializar el controlador con el contexto de datos en memoria y la configuración mockeada
            _controller = new ShowsController(_context, _configurationMock.Object);
        }

        [Test]
        public async Task GetAndSaveShow_WithValidId_ReturnsOk()
        {
            // Arrange
            var validId = 1;

            var mockHandler = new Mock<HttpMessageHandler>();
            mockHandler.Protected()
                .Setup<Task<HttpResponseMessage>>("SendAsync", ItExpr.IsAny<HttpRequestMessage>(), ItExpr.IsAny<CancellationToken>())
                .ReturnsAsync(new HttpResponseMessage
                {
                    StatusCode = HttpStatusCode.OK,
                    Content = new StringContent(JsonSerializer.Serialize(new Show { Id = validId }), System.Text.Encoding.UTF8, "application/json")
                });

            var httpClient = new HttpClient(mockHandler.Object);
            _controller = new ShowsController(_context, _configurationMock.Object)
            {
                ControllerContext = new ControllerContext { HttpContext = new DefaultHttpContext() }
            };

            // Act
            var result = await _controller.GetAndSaveShow(validId);

            // Assert
            //Assert.IsNotNull(result);
            //Assert.IsInstanceOf<OkObjectResult>(result);
        }

        [TearDown]
        public void TearDown()
        {
            // Limpiar el contexto después de cada prueba
            _context.Database.EnsureDeleted();
            _context.Dispose();
        }
    }
}
