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
        // Sécurise le $_GET['id'] + Redirection vers la page d'édition
        $_SESSION['idArticle'] = intval($_GET['id']);
        header('Location: edit-article.php');
        exit;
    }