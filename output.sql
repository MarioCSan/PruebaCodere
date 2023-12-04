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
    VALUES (N'20231204094323_first migration', N'6.0.24');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204103111_migration show')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231204103111_migration show', N'6.0.24');
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
    VALUES (N'20231204113109_InitialCreate', N'6.0.24');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231204113200_InitialCreate2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231204113200_InitialCreate2', N'6.0.24');
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
    VALUES (N'20231204154428_InitialCreate3', N'6.0.24');
END;
GO

COMMIT;
GO

