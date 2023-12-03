using Microsoft.EntityFrameworkCore;

namespace PruebaCodere.Models
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }

        public DbSet<ShowInfo> Shows { get; set; }
        public DbSet<Genre> Genres { get; set; }
        public DbSet<Network> Networks { get; set; }
        public DbSet<Schedule> Schedules { get; set; }
        public DbSet<ScheduleDay> ScheduleDays { get; set; }
        public DbSet<Image> Images { get; set; }
        public DbSet<Link> Links { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Configuraciones y relaciones aquí

            modelBuilder.Entity<Schedule>()
                .HasMany(s => s.Days)
                .WithOne(sd => sd.Schedule)
                .HasForeignKey(sd => sd.ScheduleId);

            modelBuilder.Entity<ScheduleDay>()
                .HasOne(sd => sd.Schedule)
                .WithMany(sc => sc.Days)
                .HasForeignKey(sd => sd.ScheduleId);

            modelBuilder.Entity<ScheduleDay>()
                .HasOne(sd => sd.Show)
                .WithMany()
                .HasForeignKey(sd => sd.ShowId);

            base.OnModelCreating(modelBuilder);
        }
    }
}
