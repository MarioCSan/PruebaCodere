using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;

namespace PruebaCodere.Models
{

    public class ShowInfo
    {
        public int Id { get; set; }
        public string Url { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public string Language { get; set; }
        public string Status { get; set; }
        public int Runtime { get; set; }
        public int AverageRuntime { get; set; }
        public DateTime Premiered { get; set; }
        public DateTime Ended { get; set; }
        public string OfficialSite { get; set; }
        public string Summary { get; set; }
        public double AverageRating { get; set; }
        public int Weight { get; set; }
        public int NetworkId { get; set; }
        public int ImageId { get; set; }
        public int ScheduleId { get; set; }
        public int LinksId { get; set; }

        public List<Genre> Genres { get; set; }
        public Network Network { get; set; }
        public Image Image { get; set; }
        public Schedule Schedule { get; set; }
        public Link Links { get; set; }
    }

    public class Genre
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public List<ShowInfo> Shows { get; set; }
    }

    public class Network
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string CountryName { get; set; }
        public string CountryCode { get; set; }
        public string TimeZone { get; set; }
        public string OfficialSite { get; set; }
    }

    [Keyless]
    public class ScheduleDay
    {
        public string Day { get; set; }
        public int ScheduleId { get; set; }
        public Schedule Schedule { get; set; }
    }

    public class Schedule
    {
        public int Id { get; set; }
        public string Time { get; set; }
        public List<ScheduleDay> Days { get; set; }
    }

    public class Image
    {
        public int Id { get; set; }
        public string Medium { get; set; }
        public string Original { get; set; }
    }

    public class Link
    {
        public int Id { get; set; }
        public string SelfHref { get; set; }
        public string PreviousEpisodeHref { get; set; }
    }


}
