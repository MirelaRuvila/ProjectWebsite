USE 
	Community
GO

CREATE TABLE [Departments](
	[DepartmentID] uniqueidentifier NOT NULL,
	[DepartmentName] nvarchar(30) NOT NULL,
	[Description] nvarchar(500) NOT NULL,
CONSTRAINT [PK_Departments] PRIMARY KEY ([DepartmentID]));
GO

CREATE TABLE [Events](
	[EventID] uniqueidentifier NOT NULL,
	[EventName] nvarchar(30) NOT NULL,
	[Description] nvarchar(500) NOT NULL,
CONSTRAINT [PK_Events] PRIMARY KEY ([EventID]));
GO

CREATE TABLE [Images](
	[ImageID] uniqueidentifier NOT NULL,
	[ImageName] nvarchar(20),
CONSTRAINT [PK_Images] PRIMARY KEY ([ImageID]));
GO

CREATE TABLE [PhotoGallery](
	[PhotoGalleryID] uniqueidentifier NOT NULL,
	[PhotoGalleryName] nvarchar(50) NOT NULL,
	[Description] nvarchar(100) NOT NULL,
CONSTRAINT [PK_PhotoGallery] PRIMARY KEY ([PhotogalleryID]));
GO

CREATE TABLE [ImgPhotoGallery](
	[ImageID] uniqueidentifier NOT NULL,
	[PhotoGalleryID] uniqueidentifier NOT NULL,
CONSTRAINT [PK_ImgPhotoGallery] PRIMARY KEY ([ImageID],[PhotogalleryID]),
CONSTRAINT [FK_ImgPhotoGallery_Photogallery] FOREIGN KEY ([PhotoGalleryID]) REFERENCES [PhotoGallery]([PhotoGalleryID]),
CONSTRAINT [FK_ImgPhotoGallery_Images] FOREIGN KEY ([ImageId]) REFERENCES [Images]([ImageID]));
GO

CREATE TABLE [Video](
	[VideoID] uniqueidentifier NOT NULL,
	[VideoTypeName] nvarchar(30) NOT NULL,
CONSTRAINT [PK_VIDEO] PRIMARY KEY ([VideoID]));
GO

CREATE TABLE [Archives](
	[ArchiveID] uniqueidentifier NOT NULL,
	[ArchiveName] nvarchar(50) NOT NULL,
	[VideoID] uniqueidentifier NOT NULL,
	[Data] nvarchar(20),
	[Description] nvarchar(50),
CONSTRAINT [PK_Archives] PRIMARY KEY ([ArchiveID]),
CONSTRAINT [FK_Archives_Video] FOREIGN KEY ([VideoID]) REFERENCES [Video]([VideoID]));
GO

CREATE PROCEDURE dbo.Departments_Create
(
	@DepartmentID uniqueidentifier,
	@DepartmentName nvarchar(30),
	@Description nvarchar(500)
)
AS
BEGIN
	INSERT INTO [Departments](DepartmentID, DepartmentName, [Description]) 
	VALUES (@DepartmentID, @DepartmentName, @Description)
END
GO

CREATE PROCEDURE dbo.Events_Create
(
	@EventID uniqueidentifier,
	@EventName nvarchar(50),
	@Description nvarchar(500)
)
AS
BEGIN
	INSERT INTO [Events](EventID, EventName, [Description])
	VALUES (@EventID, @EventName, @Description)
END
GO

CREATE PROCEDURE dbo.Images_Create
(
	@ImageID uniqueidentifier,
	@ImageName nvarchar(20)
)
AS
BEGIN
	INSERT INTO [Images](ImageID, ImageName)
	VALUES (@ImageID, @ImageName)
END
GO

CREATE PROCEDURE dbo.PhotoGallery_Create
(
	@PhotoGalleryID uniqueidentifier,
	@PhotoGalleryName nvarchar(50),
	@Description nvarchar(100)
)
AS
BEGIN
	INSERT INTO [PhotoGallery](PhotoGalleryID, PhotoGalleryName, [Description])
	VALUES (@PhotoGalleryID, @PhotoGalleryName, @Description)
END
GO

CREATE PROCEDURE dbo.ImgPhotoGallery_Create
(
	@ImageID uniqueidentifier,
	@PhotoGalleryID uniqueidentifier
)
AS
BEGIN
	INSERT INTO [ImgPhotoGallery](ImageID, PhotoGalleryID)
	VALUES (@ImageID, @PhotoGalleryID)
END
GO

CREATE PROCEDURE dbo.Video_Create
(
	@VideoID uniqueidentifier,
	@VideoTypeName nvarchar(30)
)
AS
BEGIN
	INSERT INTO [Video](VideoID, VideoTypeName)
	VALUES (@VideoID, @VideoTypeName)
END
GO

CREATE PROCEDURE dbo.Archives_Create
(
	@ArchiveID uniqueidentifier,
	@ArchiveName nvarchar(50),
	@Video uniqueidentifier,
	@Data nvarchar(20),
	@Description nvarchar(500)
)
AS
BEGIN
	INSERT INTO [Archives](ArchiveID, ArchiveName, VideoID, Data, [Description])
	VALUES (@ArchiveID, @ArchiveName, @Video, @Data, @Description)
END
GO

CREATE PROCEDURE dbo.Departments_UpdateById 
(
	@DepartmentID uniqueidentifier,
	@DepartmentName nvarchar(30),
	@Description nvarchar(100)
)
AS
BEGIN
	UPDATE [Departments]
	SET 
		DepartmentName = @DepartmentName,
	    [Description] = @Description
	WHERE DepartmentID = @DepartmentID
END
GO

CREATE PROCEDURE dbo.Events_UpdateById 
(
	@EventID uniqueidentifier,
	@EventName nvarchar(30),
	@Description nvarchar(500)
)
AS
BEGIN
	UPDATE [Events]
	SET 
		EventName = @EventName,
		[Description] = @Description
	WHERE EventID = @EventID
END
GO

CREATE PROCEDURE dbo.Images_UpdateById 
(
	@ImageID uniqueidentifier,
	@ImageName nvarchar(20)
)
AS
BEGIN
	UPDATE [Images]
	SET 
		ImageName = @ImageName
	WHERE ImageID = @ImageID
END
GO

CREATE PROCEDURE dbo.PhotoGallery_UpdateById 
(
	@PhotoGalleryID uniqueidentifier,
	@PhotoGalleryName nvarchar(30),
	@Description nvarchar(100)
)
AS
BEGIN
	UPDATE [PhotoGallery]
	SET 
		PhotoGalleryName = @PhotoGalleryName,
		[Description] = @Description
	WHERE PhotoGalleryID = @PhotoGalleryID
END
GO

CREATE PROCEDURE dbo.Video_UpdateById 
(
	@VideoID uniqueidentifier,
	@VideoTypeName nvarchar(50)
)
AS
BEGIN
	UPDATE [Video]
	SET 
		VideoTypeName = @VideoTypeName
	WHERE VideoID = @VideoID
END
GO

CREATE PROCEDURE dbo.Archives_UpdateById 
(
	@ArchiveID uniqueidentifier,
	@ArchiveName nvarchar(50)
)
AS
BEGIN
	UPDATE [Archives]
	SET 
		ArchiveName = @ArchiveName
	WHERE ArchiveID = @ArchiveID
END
GO

CREATE PROCEDURE dbo.Departments_DeleteById
     @DepartmentID uniqueidentifier       
AS 
BEGIN 
     SET NOCOUNT ON 
     DELETE FROM Departments
     WHERE DepartmentID = @DepartmentID
END
GO

CREATE PROCEDURE dbo.Events_DeleteById
     @EventID uniqueidentifier       
AS 
BEGIN 
     SET NOCOUNT ON 
     DELETE FROM [Events]
     WHERE EventID = @EventID
END
GO

CREATE PROCEDURE dbo.Images_DeleteById
     @ImageID uniqueidentifier       
AS 
BEGIN 
     SET NOCOUNT ON 
     DELETE FROM Images
     WHERE ImageID = @ImageID
END
GO

CREATE PROCEDURE dbo.PhotoGallery_DeleteById
     @PhotoGalleryID uniqueidentifier       
AS 
BEGIN 
     SET NOCOUNT ON 
     DELETE FROM PhotoGallery
     WHERE PhotoGalleryID = @PhotoGalleryID
END
GO

CREATE PROCEDURE dbo.Video_DeleteById
     @VideoID uniqueidentifier       
AS 
BEGIN 
     SET NOCOUNT ON 
     DELETE FROM Video
     WHERE VideoID = @VideoID
END
GO

CREATE PROCEDURE dbo.Archives_DeleteById
     @ArchiveID uniqueidentifier       
AS 
BEGIN 
     SET NOCOUNT ON 
     DELETE FROM Archives
     WHERE ArchiveID = @ArchiveID
END
GO

CREATE PROCEDURE dbo.Departments_ReadById 
	@DepartmentID uniqueidentifier
AS
BEGIN
	SELECT d.DepartmentID,
		   d.DepartmentName,
		   d.[Description]
	FROM Departments d
	WHERE d.DepartmentID = @DepartmentID
END
GO

CREATE PROCEDURE dbo.Events_ReadById 
	@EventID uniqueidentifier
AS
BEGIN
	SELECT e.EventID,
		   e.EventName,
		   e.[Description]
	FROM [Events] e
	WHERE e.EventID = @EventID
END
GO

CREATE PROCEDURE dbo.Images_ReadById 
	@ImageID uniqueidentifier
AS
BEGIN
	SELECT i.ImageID,
		   i.ImageName
	FROM Images i
	WHERE i.ImageID = @ImageID
END
GO

CREATE PROCEDURE dbo.PhotoGallery_ReadById 
	@PhotoGalleryID uniqueidentifier
AS
BEGIN
	SELECT ph.PhotoGalleryID,
		   ph.PhotoGalleryName,
		   ph.[Description]
	FROM PhotoGallery ph
	WHERE ph.PhotoGalleryID = @PhotoGalleryID
END
GO

CREATE PROCEDURE dbo.Video_ReadById 
	@VideoID uniqueidentifier
AS
BEGIN
	SELECT v.VideoID,
		   v.VideoTypeName
	FROM Video v
	WHERE v.VideoID = @VideoID
END
GO

CREATE PROCEDURE dbo.Archives_ReadById 
	@ArchiveID uniqueidentifier
AS
BEGIN
	SELECT ar.ArchiveID,
	       ar.ArchiveName,
		   ar.Data,
		   ar.[Description],
		   ar.VideoID
	FROM Archives ar
	WHERE ar.ArchiveID = @ArchiveID
END
GO

CREATE VIEW [dbo].[ImagesAndPhotoGallery]
AS
SELECT ph.PhotoGalleryID,
	   ph.PhotoGalleryName,
		COUNT(ph.PhotogalleryID) as NoOFImages
FROM PhotoGallery ph
	LEFT JOIN ImgPhotoGallery imph ON imph.ImageID = ph.PhotoGalleryID
	LEFT JOIN Images i ON i.ImageID = imph.ImageID
GROUP BY ph.PhotoGalleryID, ph.PhotoGalleryName
GO