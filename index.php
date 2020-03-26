<?php

    //	Connexion à la base de données
	include('./php-include/database-connection.php');

    $query = 'SELECT articles.id, articles.titre, articles.image, articles.dateParution, articles.idRedacteurs, articles.idThemes, redacteurs.pseudo, themes.libelle FROM articles INNER JOIN redacteurs ON articles.idRedacteurs = redacteurs.id INNER JOIN themes ON articles.idThemes = themes.id ORDER BY dateParution DESC';
    $sth = $dbh->query($query);
    $articles = $sth->fetchAll();

    session_start();

    // Inclusion du PHTML
    include './php-include/index.phtml';