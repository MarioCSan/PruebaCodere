using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PruebaCodere.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Genres",
                table: "Shows",
                newName: "GenresAsString");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "GenresAsString",
                table: "Shows",
                newName: "Genres");
        }
    }
}
