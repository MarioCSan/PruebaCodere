﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using PruebaCodere.Models;

#nullable disable

namespace PruebaCodere.Migrations
{
    [DbContext(typeof(DataContext))]
    [Migration("20231204163933_NombreMigracion")]
    partial class NombreMigracion
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.25")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder, 1L, 1);

            modelBuilder.Entity("PruebaCodere.Models.Country", b =>
                {
                    b.Property<string>("Code")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Timezone")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Code");

                    b.ToTable("Countries");
                });

            modelBuilder.Entity("PruebaCodere.Models.Image", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("Medium")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Original")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Images");
                });

            modelBuilder.Entity("PruebaCodere.Models.Links", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("PreviousepisodeHref")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("SelfHref")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Links");
                });

            modelBuilder.Entity("PruebaCodere.Models.Network", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("CountryCode")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("OfficialSite")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("CountryCode");

                    b.ToTable("Networks");
                });

            modelBuilder.Entity("PruebaCodere.Models.Rating", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<double>("Average")
                        .HasColumnType("float");

                    b.HasKey("Id");

                    b.ToTable("Ratings");
                });

            modelBuilder.Entity("PruebaCodere.Models.Show", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<int?>("AverageRuntime")
                        .HasColumnType("int");

                    b.Property<DateTime?>("Ended")
                        .HasColumnType("datetime2");

                    b.Property<string>("GenresAsString")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("ImageId")
                        .HasColumnType("int");

                    b.Property<string>("Language")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("LinksId")
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("NetworkId")
                        .HasColumnType("int");

                    b.Property<string>("OfficialSite")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime?>("Premiered")
                        .HasColumnType("datetime2");

                    b.Property<int?>("RatingId")
                        .HasColumnType("int");

                    b.Property<int?>("Runtime")
                        .HasColumnType("int");

                    b.Property<string>("ScheduleDays")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("ScheduleTime")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Status")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Summary")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Type")
                        .HasColumnType("nvarchar(max)");

                    b.Property<long?>("Updated")
                        .HasColumnType("bigint");

                    b.Property<string>("Url")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("Weight")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("ImageId");

                    b.HasIndex("LinksId");

                    b.HasIndex("NetworkId");

                    b.HasIndex("RatingId")
                        .IsUnique()
                        .HasFilter("[RatingId] IS NOT NULL");

                    b.ToTable("Shows");
                });

            modelBuilder.Entity("PruebaCodere.Models.Network", b =>
                {
                    b.HasOne("PruebaCodere.Models.Country", "Country")
                        .WithMany()
                        .HasForeignKey("CountryCode");

                    b.Navigation("Country");
                });

            modelBuilder.Entity("PruebaCodere.Models.Show", b =>
                {
                    b.HasOne("PruebaCodere.Models.Image", "Image")
                        .WithMany()
                        .HasForeignKey("ImageId");

                    b.HasOne("PruebaCodere.Models.Links", "Links")
                        .WithMany()
                        .HasForeignKey("LinksId");

                    b.HasOne("PruebaCodere.Models.Network", "Network")
                        .WithMany()
                        .HasForeignKey("NetworkId");

                    b.HasOne("PruebaCodere.Models.Rating", "Rating")
                        .WithOne()
                        .HasForeignKey("PruebaCodere.Models.Show", "RatingId");

                    b.Navigation("Image");

                    b.Navigation("Links");

                    b.Navigation("Network");

                    b.Navigation("Rating");
                });
#pragma warning restore 612, 618
        }
    }
}
