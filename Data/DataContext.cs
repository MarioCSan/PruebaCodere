using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;

namespace PruebaCodere.Models
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }

        public DbSet<ShowInfo> Shows { get; set; }
        public DbSet<Genre> Genres { get; set; }
        public DbSet<Network> Networks { get; set; }
        public DbSet<Image> Images { get; set; }
        public DbSet<Schedule> Schedules { get; set; }
        public DbSet<Link> Links { get; set; }
        public DbSet<ScheduleDay> ScheduleDays { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ShowInfo>()
                .HasMany(s => s.Genres)
                .WithMany(g => g.Shows)
                .UsingEntity<Dictionary<string, object>>(
                       "ShowGenre",
                       j => j
                        .HasOne<Genre>()
                        .WithMany()
                        .HasForeignKey("GenreId"),
                       j => j
                         .HasOne<ShowInfo>()
                         .WithMany()
                         .HasForeignKey("ShowInfoId"),
                       j =>
                       {
                         j.HasKey("ShowInfoId", "GenreId");
                         j.ToTable("ShowGenres");
                       }
                );


            modelBuilder.Entity<ShowInfo>()
                .HasOne(s => s.Network)
                .WithMany()
                .HasForeignKey(s => s.NetworkId);

            modelBuilder.Entity<ShowInfo>()
                .HasOne(s => s.Image)
                .WithMany()
                .HasForeignKey(s => s.ImageId);

            modelBuilder.Entity<ShowInfo>()
                .HasOne(s => s.Schedule)
                .WithMany()
                .HasForeignKey(s => s.ScheduleId);

            modelBuilder.Entity<ShowInfo>()
                .HasOne(s => s.Links)
                .WithMany()
                .HasForeignKey(s => s.LinksId);

            modelBuilder.Entity<Schedule>()
                .HasMany(s => s.Days)
                .WithOne(sd => sd.Schedule)
                .HasForeignKey(sd => sd.ScheduleId);

            modelBuilder.Entity<ScheduleDay>()
                .HasKey(sd => new { sd.ScheduleId, sd.Day });
        }
    }
}
