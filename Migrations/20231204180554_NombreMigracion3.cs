using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PruebaCodere.Migrations
{
    public partial class NombreMigracion3 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Networks_Countries_CountryCode",
                table: "Networks");

            migrationBuilder.AlterColumn<string>(
                name: "CountryCode",
                table: "Networks",
                type: "nvarchar(450)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(450)",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Networks_Countries_CountryCode",
                table: "Networks",
                column: "CountryCode",
                principalTable: "Countries",
                principalColumn: "Code",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Networks_Countries_CountryCode",
                table: "Networks");

            migrationBuilder.AlterColumn<string>(
                name: "CountryCode",
                table: "Networks",
                type: "nvarchar(450)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)");

            migrationBuilder.AddForeignKey(
                name: "FK_Networks_Countries_CountryCode",
                table: "Networks",
                column: "CountryCode",
                principalTable: "Countries",
                principalColumn: "Code");
        }
    }
}
