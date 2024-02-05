/*
Modèle de script de post-déploiement							
--------------------------------------------------------------------------------------

Ajoute l'utilisateur si ce dernier n'existe pas
Et lui donne les droits d'exécution sur le schéma APP
*/


IF NOT EXISTS (SELECT [name]
                FROM [sys].[database_principals]
                WHERE [type] = N'S' AND [name] = N'AppUser')
Begin
    CREATE USER [AppUser] 
    FOR LOGIN [AppUser];

    GRANT EXECUTE ON SCHEMA::App TO AppUser;
end