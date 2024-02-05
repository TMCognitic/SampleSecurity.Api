CREATE PROCEDURE [App].[TSP_Register]
	@Nom NVARCHAR(50),
	@Prenom NVARCHAR(50),
	@Email NVARCHAR(384),
	@Passwd NVARCHAR(20)
AS
BEGIN
	IF EXISTS (SELECT [Email] FROM Utilisateur WHERE [Email] = @Email)
	BEGIN
		RAISERROR (N'Email Already exists', 16, 1);
		RETURN -1;
	END

	INSERT INTO [Utilisateur] ([Nom], [Prenom], [Email], [Passwd])
	VALUES (@Nom, @Prenom, @Email, [dbo].[HashData](@Passwd));
END
