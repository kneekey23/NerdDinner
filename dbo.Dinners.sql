CREATE TABLE [dbo].[Dinners]
(
	[DinnerID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Title] NVARCHAR(50) NOT NULL, 
    [EventDate] DATETIME NOT NULL, 
    [Description] NVARCHAR(256) NOT NULL, 
    [HostedBy] NVARCHAR(20) NOT NULL,
	[ContactPhone] NVARCHAR(20) NOT NULL,
	[Address] NVARCHAR(50) NOT NULL,
	[Country] NVARCHAR(30) NOT NULL,
	[Latitude] FLOAT NOT NULL,
	[Latitude] FLOAT NOT NULL
	
)
