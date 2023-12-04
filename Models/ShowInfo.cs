using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PruebaCodere.Models
{
    public class Schedule
    {
        public string Time { get; set; }
        public List<string> Days { get; set; }
    }

    public class Country
    {
        [Key]
        public string Code { get; set; }

        public string Name { get; set; }
        public string Timezone { get; set; }
    }

    public class Network
    {
        [Key]
        public int Id { get; set; }

        public string Name { get; set; }

        [ForeignKey("Country")]
        public string CountryCode { get; set; }
        public virtual Country Country { get; set; }

        public string OfficialSite { get; set; }
    }

    public class Image
    {
        [Key]
        public int Id { get; set; }

        public string Medium { get; set; }
        public string Original { get; set; }
    }

    public class Rating
    {
        [Key]
        public int Id { get; set; }

        public double Average { get; set; }
    }

    public class Show
    {
        [Key]
        public int Id { get; set; }

        public string Url { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public string Language { get; set; }

        [NotMapped]
        public List<string> Genres { get; set; }

        public string GenresAsString { get; set; }

        public string Status { get; set; }
        public int Runtime { get; set; }
        public int AverageRuntime { get; set; }
        public DateTime Premiered { get; set; }
        public DateTime Ended { get; set; }
        public string OfficialSite { get; set; }
        public string ScheduleTime { get; set; }
        public string ScheduleDays { get; set; }
        public int RatingId { get; set; }
        public virtual Rating Rating { get; set; }
        public int Weight { get; set; }
        public int NetworkId { get; set; }
        public virtual Network Network { get; set; }
        public int ImageId { get; set; }
        public virtual Image Image { get; set; }
        public string Summary { get; set; }
        public long Updated { get; set; }
        public int LinksId { get; set; }
        public virtual Links Links { get; set; }
    }

    public class Links
    {
        [Key]
        public int Id { get; set; }

        public string SelfHref { get; set; }
        public string PreviousepisodeHref { get; set; }
    }
}
