using Microsoft.EntityFrameworkCore;
using System;

namespace PruebaCodere.Models
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options)
            : base(options)
        {
        }

        public DbSet<ShowInfo> Shows { get; set; }
        public DbSet<Genre> Genres { get; set; }
        public DbSet<Network> Networks { get; set; }
        public DbSet<Schedule> Schedules { get; set; }
        public DbSet<Image> Images { get; set; }
        public DbSet<Link> Links { get; set; }

        //protected override void OnModelCreating(ModelBuilder modelBuilder)
        //{
        //    modelBuilder.Entity<Show>()
        //        .HasMany(s => s.Genres)
        //        .WithMany(g => g.Shows)
        //        .UsingEntity(j => j.ToTable("ShowGenres"));

        //    base.OnModelCreating(modelBuilder);
        //}
    }

}
