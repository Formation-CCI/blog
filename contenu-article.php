<?php

    //	Connexion à la base de données
	include('./php-include/database-connection.php');

    // Affichage de l'article
    $query = 'SELECT articles.id, articles.titre, articles.contenu, articles.dateParution, articles.idThemes, articles.idRedacteurs, redacteurs.pseudo, themes.libelle, images.image FROM articles INNER JOIN redacteurs ON articles.idRedacteurs = redacteurs.id INNER JOIN themes ON articles.idThemes = themes.id  WHERE articles.id = ?';
    $sth = $dbh->prepare($query);
    $sth -> bindValue(1, intval($_GET['id']), PDO::PARAM_INT);
    $sth->execute();
    $article = $sth->fetch();

    // Affichage des commentaires
    $query = 'SELECT pseudoAuteur, contenu FROM commentaires WHERE idArticle = ?';
    $sth = $dbh->prepare($query);
    $sth -> bindValue(1, intval($_GET['id']), PDO::PARAM_INT);
    $sth->execute();
    $commentaires = $sth->fetchAll();

    session_start();

    // Inclusion du PHTML
    include './php-include/contenu-article.phtml';

