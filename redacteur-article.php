<?php

    //	Connexion à la base de données
	include('./php-include/database-connection.php');

    //	Affiche les articles du rédacteur en question
    $query = 'SELECT articles.id, articles.titre, articles.image, articles.contenu, articles.dateParution, articles.idRedacteurs, redacteurs.pseudo FROM articles INNER JOIN redacteurs ON articles.idRedacteurs = redacteurs.id WHERE articles.idRedacteurs = ?';
    $sth = $dbh->prepare($query);
    $sth -> bindValue(1, intval($_GET['id']), PDO::PARAM_INT);
    $sth->execute();
    $articles = $sth->fetchAll();
    session_start();

    // Inclusion du PHTML
    include './php-include/redacteur-article.phtml';
?>