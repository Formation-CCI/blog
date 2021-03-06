<?php

    //	Connexion à la base de données
	include('./php-include/database-connection.php');

    //	Affiche les articles du rédacteur en question
    $query = 'SELECT articles.id, articles.titre, articles.image, articles.dateParution, articles.idRedacteurs, articles.idThemes, themes.libelle FROM articles INNER JOIN themes ON articles.idThemes = themes.id WHERE articles.idRedacteurs = ?';
    $sth = $dbh->prepare($query);
    $sth -> bindValue(1, intval($_GET['id']), PDO::PARAM_INT);
    $sth->execute();
    $articles = $sth->fetchAll();
    session_start();

    //	Affiche le nom du rédacteur
    $query = 'SELECT pseudo FROM redacteurs WHERE id = ?';
    $sth = $dbh->prepare($query);
    $sth -> bindValue(1, intval($_GET['id']), PDO::PARAM_INT);
    $sth->execute();
    $redacteur = $sth->fetch();

    // Inclusion du PHTML
    include './php-include/redacteur-article.phtml';
?>