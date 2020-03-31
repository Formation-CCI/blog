<?php

    //	Connexion à la base de données
	include('./php-include/database-connection.php');

    // Si le filtre est activé 
    if(array_key_exists('titre', $_GET) && !empty($_GET['titre']))
	{
        $query = 'SELECT articles.id, articles.titre, articles.dateParution, articles.idRedacteurs, articles.idThemes, redacteurs.pseudo, themes.libelle, images.image FROM articles INNER JOIN redacteurs ON articles.idRedacteurs = redacteurs.id INNER JOIN themes ON articles.idThemes = themes.id INNER JOIN images ON articles.id = images.idArticles WHERE articles.titre LIKE :titre ORDER BY dateParution DESC';
        $sth = $dbh->prepare($query);
        $sth->bindValue(':titre', "%". trim($_GET['titre']) ."%", PDO::PARAM_STR); // WHERE titre LIKE ? OR contenu LIKE ? pour cumuller plusieur filtre
        $sth->execute(); 
        $articles = $sth->fetchAll();
    }

    // Sinon
    else
    {
        $query = 'SELECT articles.id, articles.titre, articles.dateParution, articles.idRedacteurs, articles.idThemes, redacteurs.pseudo, themes.libelle, images.image FROM articles INNER JOIN redacteurs ON articles.idRedacteurs = redacteurs.id INNER JOIN themes ON articles.idThemes = themes.id INNER JOIN images ON articles.id = images.idArticles ORDER BY dateParution DESC';
        $sth = $dbh->query($query);
        $articles = $sth->fetchAll();
    }

    session_start();
    
    // Inclusion du PHTML
    include './php-include/index.phtml';