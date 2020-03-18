<?php

    session_start();
    if(!array_key_exists('authentification', $_SESSION))
    {
        header('Location: sign-in.php');
        exit;
    }
    else
    {
		//	Connexion à la base de données
		include('./php-include/database-connection.php');

		$query = 'SELECT * FROM articles WHERE idRedacteurs = ?';
		$sth = $dbh->prepare($query);
		$sth -> bindValue(1, $_SESSION['authentification'], PDO::PARAM_INT);
		$sth->execute();
		$articles = $sth->fetchAll();

		include './php-include/dashboard.phtml';
	}