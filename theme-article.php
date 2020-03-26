<?php

    //	Connexion à la base de données
	include('./php-include/database-connection.php');

    //	Affiche les articles du rédacteur en question
    $query = 'SELECT articles.id, articles.titre, articles.image, articles.dateParution, articles.idRedacteurs, articles.idThemes, redacteurs.pseudo FROM articles INNER JOIN redacteurs ON articles.idRedacteurs = redacteurs.id WHERE articles.idThemes = ?';
    $sth = $dbh->prepare($query);
    $sth -> bindValue(1, intval($_GET['id']), PDO::PARAM_INT);
    $sth->execute();
    $articles = $sth->fetchAll();

    //	Affiche le nom de la catégorie
    $query = 'SELECT libelle FROM themes WHERE id = ?';
    $sth = $dbh->prepare($query);
    $sth -> bindValue(1, intval($_GET['id']), PDO::PARAM_INT);
    $sth->execute();
    $theme = $sth->fetch();

    session_start();

    // Inclusion du PHTML
    include './php-include/theme-article.phtml';
?>