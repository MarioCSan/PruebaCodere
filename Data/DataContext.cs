using Microsoft.EntityFrameworkCore;

namespace PruebaCodere.Models
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }

        public DbSet<Show> Shows { get; set; }
        public DbSet<Network> Networks { get; set; }
        public DbSet<Image> Images { get; set; }
        public DbSet<Rating> Ratings { get; set; }
        public DbSet<Links> Links { get; set; }
        public DbSet<Country> Countries { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Show>()
                .HasOne(s => s.Rating)
                .WithOne()
                .HasForeignKey<Show>(s => s.RatingId);

            modelBuilder.Entity<Show>()
                .HasOne(s => s.Network)
                .WithMany()
                .HasForeignKey(s => s.NetworkId);

            modelBuilder.Entity<Show>()
                .HasOne(s => s.Image)
                .WithMany()
                .HasForeignKey(s => s.ImageId);

            modelBuilder.Entity<Show>()
                .HasOne(s => s.Links)
                .WithMany()
                .HasForeignKey(s => s.LinksId);
        }
    }
}
