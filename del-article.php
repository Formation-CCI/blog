<?php

    session_start();
    
    // Vérifie si le rédacteur est connecté
    if(!array_key_exists('authentification', $_SESSION))
    {
        // Redirection vers la page de connexion
        header('Location: sign-in.php');
        exit;
    }
    else
    {
        if(array_key_exists('id', $_GET) AND intval($_GET['id']) > 0)
        {
            //	Connexion à la base de données
            include('./php-include/database-connection.php');

            $query = 'DELETE FROM articles WHERE id = ?';
            $sth = $dbh->prepare($query);
            $sth -> bindValue(1, $_GET['id'], PDO::PARAM_INT);
            $sth->execute();
        }
        
        //	Redirection vers le dashboard
        header('Location: dashboard.php'); 
        exit;
    }