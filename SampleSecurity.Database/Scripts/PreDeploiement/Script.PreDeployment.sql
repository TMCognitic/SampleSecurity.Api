/*
 Script de pré-déploiement							
--------------------------------------------------------------------------------------

Crée le login AppUser si ce dernier n'existe pas
*/

IF NOT EXISTS 
    (SELECT name  
     FROM master.sys.server_principals
     WHERE name = 'AppUser')
BEGIN
    CREATE LOGIN [AppUser] WITH PASSWORD = N'Test1234='
END