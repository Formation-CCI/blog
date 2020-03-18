<?php

    session_start();
    if(!array_key_exists('authentification', $_SESSION))
    {
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
        
        header('Location: dashboard.php'); 
        exit;
    }