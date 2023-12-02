using Microsoft.EntityFrameworkCore;

namespace PruebaCodere.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }

        public DbSet<Show> Shows { get; set; }
        public DbSet<Genre> Genres { get; set; }
        // ... otras DbSet para tus entidades

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Configuraciones adicionales si es necesario
            // modelBuilder.Entity<TuEntidad>().ToTable("NombreDeLaTabla");
        }
    }
}
