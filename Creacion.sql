IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204094323_first migration')
BEGIN
    CREATE TABLE [Countries] (
        [Code] nvarchar(450) NOT NULL,
        [Name] nvarchar(max) NOT NULL,
        [Timezone] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Countries] PRIMARY KEY ([Code])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204094323_first migration')
BEGIN
    CREATE TABLE [Images] (
        [Id] int NOT NULL IDENTITY,
        [Medium] nvarchar(max) NOT NULL,
        [Original] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Images] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204094323_first migration')
BEGIN
    CREATE TABLE [Links] (
        [Id] int NOT NULL IDENTITY,
        [SelfHref] nvarchar(max) NOT NULL,
        [PreviousepisodeHref] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Links] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204094323_first migration')
BEGIN
    CREATE TABLE [Ratings] (
        [Id] int NOT NULL IDENTITY,
        [Average] float NOT NULL,
        CONSTRAINT [PK_Ratings] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204094323_first migration')
BEGIN
    CREATE TABLE [Networks] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [CountryCode] nvarchar(450) NOT NULL,
        [OfficialSite] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Networks] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Networks_Countries_CountryCode] FOREIGN KEY ([CountryCode]) REFERENCES [Countries] ([Code]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204094323_first migration')
BEGIN
    CREATE TABLE [Shows] (
        [Id] int NOT NULL IDENTITY,
        [Url] nvarchar(max) NOT NULL,
        [Name] nvarchar(max) NOT NULL,
        [Type] nvarchar(max) NOT NULL,
        [Language] nvarchar(max) NOT NULL,
        [Genres] nvarchar(max) NOT NULL,
        [Status] nvarchar(max) NOT NULL,
        [Runtime] int NOT NULL,
        [AverageRuntime] int NOT NULL,
        [Premiered] datetime2 NOT NULL,
        [Ended] datetime2 NOT NULL,
        [OfficialSite] nvarchar(max) NOT NULL,
        [ScheduleTime] nvarchar(max) NOT NULL,
        [ScheduleDays] nvarchar(max) NOT NULL,
        [RatingId] int NOT NULL,
        [Weight] int NOT NULL,
        [NetworkId] int NOT NULL,
        [ImageId] int NOT NULL,
        [Summary] nvarchar(max) NOT NULL,
        [Updated] bigint NOT NULL,
        [LinksId] int NOT NULL,
        CONSTRAINT [PK_Shows] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Shows_Images_ImageId] FOREIGN KEY ([ImageId]) REFERENCES [Images] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Shows_Links_LinksId] FOREIGN KEY ([LinksId]) REFERENCES [Links] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Shows_Networks_NetworkId] FOREIGN KEY ([NetworkId]) REFERENCES [Networks] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Shows_Ratings_RatingId] FOREIGN KEY ([RatingId]) REFERENCES [Ratings] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204094323_first migration')
BEGIN
    CREATE INDEX [IX_Networks_CountryCode] ON [Networks] ([CountryCode]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204094323_first migration')
BEGIN
    CREATE INDEX [IX_Shows_ImageId] ON [Shows] ([ImageId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204094323_first migration')
BEGIN
    CREATE INDEX [IX_Shows_LinksId] ON [Shows] ([LinksId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204094323_first migration')
BEGIN
    CREATE INDEX [IX_Shows_NetworkId] ON [Shows] ([NetworkId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204094323_first migration')
BEGIN
    CREATE UNIQUE INDEX [IX_Shows_RatingId] ON [Shows] ([RatingId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204094323_first migration')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231204094323_first migration', N'6.0.25');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204103111_migration show')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231204103111_migration show', N'6.0.25');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204113109_InitialCreate')
BEGIN
    EXEC sp_rename N'[Shows].[Genres]', N'GenresAsString', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204113109_InitialCreate')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231204113109_InitialCreate', N'6.0.25');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204113200_InitialCreate2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231204113200_InitialCreate2', N'6.0.25');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204154428_InitialCreate3')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Language');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Language] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204154428_InitialCreate3')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Links]') AND [c].[name] = N'SelfHref');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Links] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [Links] ALTER COLUMN [SelfHref] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204154428_InitialCreate3')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Links]') AND [c].[name] = N'PreviousepisodeHref');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Links] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [Links] ALTER COLUMN [PreviousepisodeHref] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204154428_InitialCreate3')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231204154428_InitialCreate3', N'6.0.25');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    ALTER TABLE [Networks] DROP CONSTRAINT [FK_Networks_Countries_CountryCode];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    ALTER TABLE [Shows] DROP CONSTRAINT [FK_Shows_Images_ImageId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    ALTER TABLE [Shows] DROP CONSTRAINT [FK_Shows_Links_LinksId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    ALTER TABLE [Shows] DROP CONSTRAINT [FK_Shows_Networks_NetworkId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    ALTER TABLE [Shows] DROP CONSTRAINT [FK_Shows_Ratings_RatingId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DROP INDEX [IX_Shows_RatingId] ON [Shows];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Weight');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Weight] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var4 sysname;
    SELECT @var4 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Url');
    IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var4 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Url] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var5 sysname;
    SELECT @var5 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Updated');
    IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var5 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Updated] bigint NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var6 sysname;
    SELECT @var6 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Type');
    IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var6 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Type] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var7 sysname;
    SELECT @var7 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Summary');
    IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var7 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Summary] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var8 sysname;
    SELECT @var8 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Status');
    IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var8 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Status] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var9 sysname;
    SELECT @var9 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'ScheduleTime');
    IF @var9 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var9 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [ScheduleTime] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var10 sysname;
    SELECT @var10 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'ScheduleDays');
    IF @var10 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var10 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [ScheduleDays] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var11 sysname;
    SELECT @var11 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Runtime');
    IF @var11 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var11 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Runtime] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var12 sysname;
    SELECT @var12 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'RatingId');
    IF @var12 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var12 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [RatingId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var13 sysname;
    SELECT @var13 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Premiered');
    IF @var13 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var13 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Premiered] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var14 sysname;
    SELECT @var14 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'OfficialSite');
    IF @var14 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var14 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [OfficialSite] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var15 sysname;
    SELECT @var15 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'NetworkId');
    IF @var15 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var15 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [NetworkId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var16 sysname;
    SELECT @var16 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Name');
    IF @var16 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var16 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Name] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var17 sysname;
    SELECT @var17 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'LinksId');
    IF @var17 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var17 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [LinksId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var18 sysname;
    SELECT @var18 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'ImageId');
    IF @var18 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var18 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [ImageId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var19 sysname;
    SELECT @var19 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'GenresAsString');
    IF @var19 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var19 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [GenresAsString] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var20 sysname;
    SELECT @var20 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Ended');
    IF @var20 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var20 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Ended] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var21 sysname;
    SELECT @var21 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'AverageRuntime');
    IF @var21 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var21 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [AverageRuntime] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var22 sysname;
    SELECT @var22 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Networks]') AND [c].[name] = N'OfficialSite');
    IF @var22 IS NOT NULL EXEC(N'ALTER TABLE [Networks] DROP CONSTRAINT [' + @var22 + '];');
    ALTER TABLE [Networks] ALTER COLUMN [OfficialSite] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var23 sysname;
    SELECT @var23 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Networks]') AND [c].[name] = N'Name');
    IF @var23 IS NOT NULL EXEC(N'ALTER TABLE [Networks] DROP CONSTRAINT [' + @var23 + '];');
    ALTER TABLE [Networks] ALTER COLUMN [Name] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var24 sysname;
    SELECT @var24 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Networks]') AND [c].[name] = N'CountryCode');
    IF @var24 IS NOT NULL EXEC(N'ALTER TABLE [Networks] DROP CONSTRAINT [' + @var24 + '];');
    ALTER TABLE [Networks] ALTER COLUMN [CountryCode] nvarchar(450) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var25 sysname;
    SELECT @var25 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Images]') AND [c].[name] = N'Original');
    IF @var25 IS NOT NULL EXEC(N'ALTER TABLE [Images] DROP CONSTRAINT [' + @var25 + '];');
    ALTER TABLE [Images] ALTER COLUMN [Original] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var26 sysname;
    SELECT @var26 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Images]') AND [c].[name] = N'Medium');
    IF @var26 IS NOT NULL EXEC(N'ALTER TABLE [Images] DROP CONSTRAINT [' + @var26 + '];');
    ALTER TABLE [Images] ALTER COLUMN [Medium] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var27 sysname;
    SELECT @var27 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Countries]') AND [c].[name] = N'Timezone');
    IF @var27 IS NOT NULL EXEC(N'ALTER TABLE [Countries] DROP CONSTRAINT [' + @var27 + '];');
    ALTER TABLE [Countries] ALTER COLUMN [Timezone] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    DECLARE @var28 sysname;
    SELECT @var28 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Countries]') AND [c].[name] = N'Name');
    IF @var28 IS NOT NULL EXEC(N'ALTER TABLE [Countries] DROP CONSTRAINT [' + @var28 + '];');
    ALTER TABLE [Countries] ALTER COLUMN [Name] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [IX_Shows_RatingId] ON [Shows] ([RatingId]) WHERE [RatingId] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    ALTER TABLE [Networks] ADD CONSTRAINT [FK_Networks_Countries_CountryCode] FOREIGN KEY ([CountryCode]) REFERENCES [Countries] ([Code]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    ALTER TABLE [Shows] ADD CONSTRAINT [FK_Shows_Images_ImageId] FOREIGN KEY ([ImageId]) REFERENCES [Images] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    ALTER TABLE [Shows] ADD CONSTRAINT [FK_Shows_Links_LinksId] FOREIGN KEY ([LinksId]) REFERENCES [Links] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    ALTER TABLE [Shows] ADD CONSTRAINT [FK_Shows_Networks_NetworkId] FOREIGN KEY ([NetworkId]) REFERENCES [Networks] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    ALTER TABLE [Shows] ADD CONSTRAINT [FK_Shows_Ratings_RatingId] FOREIGN KEY ([RatingId]) REFERENCES [Ratings] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204163933_NombreMigracion')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231204163933_NombreMigracion', N'6.0.25');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204180554_NombreMigracion3')
BEGIN
    ALTER TABLE [Networks] DROP CONSTRAINT [FK_Networks_Countries_CountryCode];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204180554_NombreMigracion3')
BEGIN
    DROP INDEX [IX_Networks_CountryCode] ON [Networks];
    DECLARE @var29 sysname;
    SELECT @var29 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Networks]') AND [c].[name] = N'CountryCode');
    IF @var29 IS NOT NULL EXEC(N'ALTER TABLE [Networks] DROP CONSTRAINT [' + @var29 + '];');
    ALTER TABLE [Networks] ALTER COLUMN [CountryCode] nvarchar(450) NOT NULL;
    ALTER TABLE [Networks] ADD DEFAULT N'' FOR [CountryCode];
    CREATE INDEX [IX_Networks_CountryCode] ON [Networks] ([CountryCode]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204180554_NombreMigracion3')
BEGIN
    ALTER TABLE [Networks] ADD CONSTRAINT [FK_Networks_Countries_CountryCode] FOREIGN KEY ([CountryCode]) REFERENCES [Countries] ([Code]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204180554_NombreMigracion3')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231204180554_NombreMigracion3', N'6.0.25');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    ALTER TABLE [Shows] DROP CONSTRAINT [FK_Shows_Images_ImageId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    ALTER TABLE [Shows] DROP CONSTRAINT [FK_Shows_Links_LinksId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    ALTER TABLE [Shows] DROP CONSTRAINT [FK_Shows_Networks_NetworkId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    ALTER TABLE [Shows] DROP CONSTRAINT [FK_Shows_Ratings_RatingId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DROP INDEX [IX_Shows_RatingId] ON [Shows];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var30 sysname;
    SELECT @var30 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Weight');
    IF @var30 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var30 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Weight] int NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT 0 FOR [Weight];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var31 sysname;
    SELECT @var31 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Url');
    IF @var31 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var31 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Url] nvarchar(max) NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT N'' FOR [Url];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var32 sysname;
    SELECT @var32 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Updated');
    IF @var32 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var32 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Updated] bigint NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT CAST(0 AS bigint) FOR [Updated];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var33 sysname;
    SELECT @var33 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Type');
    IF @var33 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var33 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Type] nvarchar(max) NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT N'' FOR [Type];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var34 sysname;
    SELECT @var34 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Summary');
    IF @var34 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var34 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Summary] nvarchar(max) NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT N'' FOR [Summary];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var35 sysname;
    SELECT @var35 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Status');
    IF @var35 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var35 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Status] nvarchar(max) NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT N'' FOR [Status];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var36 sysname;
    SELECT @var36 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'ScheduleTime');
    IF @var36 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var36 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [ScheduleTime] nvarchar(max) NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT N'' FOR [ScheduleTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var37 sysname;
    SELECT @var37 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'ScheduleDays');
    IF @var37 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var37 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [ScheduleDays] nvarchar(max) NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT N'' FOR [ScheduleDays];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var38 sysname;
    SELECT @var38 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Runtime');
    IF @var38 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var38 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Runtime] int NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT 0 FOR [Runtime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var39 sysname;
    SELECT @var39 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'RatingId');
    IF @var39 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var39 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [RatingId] int NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT 0 FOR [RatingId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var40 sysname;
    SELECT @var40 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Premiered');
    IF @var40 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var40 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Premiered] datetime2 NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT '0001-01-01T00:00:00.0000000' FOR [Premiered];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var41 sysname;
    SELECT @var41 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'OfficialSite');
    IF @var41 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var41 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [OfficialSite] nvarchar(max) NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT N'' FOR [OfficialSite];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DROP INDEX [IX_Shows_NetworkId] ON [Shows];
    DECLARE @var42 sysname;
    SELECT @var42 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'NetworkId');
    IF @var42 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var42 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [NetworkId] int NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT 0 FOR [NetworkId];
    CREATE INDEX [IX_Shows_NetworkId] ON [Shows] ([NetworkId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var43 sysname;
    SELECT @var43 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Name');
    IF @var43 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var43 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Name] nvarchar(max) NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT N'' FOR [Name];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DROP INDEX [IX_Shows_LinksId] ON [Shows];
    DECLARE @var44 sysname;
    SELECT @var44 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'LinksId');
    IF @var44 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var44 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [LinksId] int NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT 0 FOR [LinksId];
    CREATE INDEX [IX_Shows_LinksId] ON [Shows] ([LinksId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var45 sysname;
    SELECT @var45 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Language');
    IF @var45 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var45 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Language] nvarchar(max) NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT N'' FOR [Language];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DROP INDEX [IX_Shows_ImageId] ON [Shows];
    DECLARE @var46 sysname;
    SELECT @var46 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'ImageId');
    IF @var46 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var46 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [ImageId] int NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT 0 FOR [ImageId];
    CREATE INDEX [IX_Shows_ImageId] ON [Shows] ([ImageId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var47 sysname;
    SELECT @var47 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'GenresAsString');
    IF @var47 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var47 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [GenresAsString] nvarchar(max) NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT N'' FOR [GenresAsString];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var48 sysname;
    SELECT @var48 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'Ended');
    IF @var48 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var48 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [Ended] datetime2 NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT '0001-01-01T00:00:00.0000000' FOR [Ended];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var49 sysname;
    SELECT @var49 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Shows]') AND [c].[name] = N'AverageRuntime');
    IF @var49 IS NOT NULL EXEC(N'ALTER TABLE [Shows] DROP CONSTRAINT [' + @var49 + '];');
    ALTER TABLE [Shows] ALTER COLUMN [AverageRuntime] int NOT NULL;
    ALTER TABLE [Shows] ADD DEFAULT 0 FOR [AverageRuntime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var50 sysname;
    SELECT @var50 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Networks]') AND [c].[name] = N'OfficialSite');
    IF @var50 IS NOT NULL EXEC(N'ALTER TABLE [Networks] DROP CONSTRAINT [' + @var50 + '];');
    ALTER TABLE [Networks] ALTER COLUMN [OfficialSite] nvarchar(max) NOT NULL;
    ALTER TABLE [Networks] ADD DEFAULT N'' FOR [OfficialSite];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var51 sysname;
    SELECT @var51 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Networks]') AND [c].[name] = N'Name');
    IF @var51 IS NOT NULL EXEC(N'ALTER TABLE [Networks] DROP CONSTRAINT [' + @var51 + '];');
    ALTER TABLE [Networks] ALTER COLUMN [Name] nvarchar(max) NOT NULL;
    ALTER TABLE [Networks] ADD DEFAULT N'' FOR [Name];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var52 sysname;
    SELECT @var52 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Links]') AND [c].[name] = N'SelfHref');
    IF @var52 IS NOT NULL EXEC(N'ALTER TABLE [Links] DROP CONSTRAINT [' + @var52 + '];');
    ALTER TABLE [Links] ALTER COLUMN [SelfHref] nvarchar(max) NOT NULL;
    ALTER TABLE [Links] ADD DEFAULT N'' FOR [SelfHref];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var53 sysname;
    SELECT @var53 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Links]') AND [c].[name] = N'PreviousepisodeHref');
    IF @var53 IS NOT NULL EXEC(N'ALTER TABLE [Links] DROP CONSTRAINT [' + @var53 + '];');
    ALTER TABLE [Links] ALTER COLUMN [PreviousepisodeHref] nvarchar(max) NOT NULL;
    ALTER TABLE [Links] ADD DEFAULT N'' FOR [PreviousepisodeHref];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var54 sysname;
    SELECT @var54 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Images]') AND [c].[name] = N'Original');
    IF @var54 IS NOT NULL EXEC(N'ALTER TABLE [Images] DROP CONSTRAINT [' + @var54 + '];');
    ALTER TABLE [Images] ALTER COLUMN [Original] nvarchar(max) NOT NULL;
    ALTER TABLE [Images] ADD DEFAULT N'' FOR [Original];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var55 sysname;
    SELECT @var55 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Images]') AND [c].[name] = N'Medium');
    IF @var55 IS NOT NULL EXEC(N'ALTER TABLE [Images] DROP CONSTRAINT [' + @var55 + '];');
    ALTER TABLE [Images] ALTER COLUMN [Medium] nvarchar(max) NOT NULL;
    ALTER TABLE [Images] ADD DEFAULT N'' FOR [Medium];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var56 sysname;
    SELECT @var56 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Countries]') AND [c].[name] = N'Timezone');
    IF @var56 IS NOT NULL EXEC(N'ALTER TABLE [Countries] DROP CONSTRAINT [' + @var56 + '];');
    ALTER TABLE [Countries] ALTER COLUMN [Timezone] nvarchar(max) NOT NULL;
    ALTER TABLE [Countries] ADD DEFAULT N'' FOR [Timezone];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    DECLARE @var57 sysname;
    SELECT @var57 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Countries]') AND [c].[name] = N'Name');
    IF @var57 IS NOT NULL EXEC(N'ALTER TABLE [Countries] DROP CONSTRAINT [' + @var57 + '];');
    ALTER TABLE [Countries] ALTER COLUMN [Name] nvarchar(max) NOT NULL;
    ALTER TABLE [Countries] ADD DEFAULT N'' FOR [Name];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    CREATE UNIQUE INDEX [IX_Shows_RatingId] ON [Shows] ([RatingId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    ALTER TABLE [Shows] ADD CONSTRAINT [FK_Shows_Images_ImageId] FOREIGN KEY ([ImageId]) REFERENCES [Images] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    ALTER TABLE [Shows] ADD CONSTRAINT [FK_Shows_Links_LinksId] FOREIGN KEY ([LinksId]) REFERENCES [Links] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    ALTER TABLE [Shows] ADD CONSTRAINT [FK_Shows_Networks_NetworkId] FOREIGN KEY ([NetworkId]) REFERENCES [Networks] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    ALTER TABLE [Shows] ADD CONSTRAINT [FK_Shows_Ratings_RatingId] FOREIGN KEY ([RatingId]) REFERENCES [Ratings] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204184315_NombreMigracion35')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231204184315_NombreMigracion35', N'6.0.25');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204185158_NombreMigracion31')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231204185158_NombreMigracion31', N'6.0.25');
END;
GO

COMMIT;
GO

