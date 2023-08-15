CREATE DATABASE ReactivitiesDb;
GO
USE ReactivitiesDb;
GO
CREATE TABLE [Activities]
(
  [Id] UNIQUEIDENTIFIER NOT NULL,
  [Title] TEXT NULL,
  [Date] TEXT NOT NULL,
  [Description] TEXT NULL,
  [Category] TEXT NULL,
  [City] TEXT NULL,
  [Venue] TEXT NULL,
  CONSTRAINT [PK_Activities] PRIMARY KEY ([Id])
);