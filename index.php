<?php

    //	Connexion à la base de données
	include('./php-include/database-connection.php');

    $query = 'SELECT articles.id, articles.titre, articles.image, articles.dateParution, articles.idRedacteurs, redacteurs.pseudo FROM articles INNER JOIN redacteurs ON articles.idRedacteurs = redacteurs.id ORDER BY dateParution DESC';
    $sth = $dbh->query($query);
    $articles = $sth->fetchAll();

    session_start();
    include './php-include/index.phtml';