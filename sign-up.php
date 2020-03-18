<?php

    // Si le formulaire n'est pas vide
    if(!empty($_POST))
	{
		//	Connexion à la base de données
        include('./php-include/database-connection.php');

		//	Ajout de l'utilisateur
		$query = 'INSERT INTO redacteurs (pseudo, motDePasse) VALUES (:pseudo, :passwordHash)';
		$sth = $dbh->prepare($query);
		$sth->bindValue(':pseudo', trim($_POST['pseudo']), PDO::PARAM_STR);
		$sth->bindValue(':passwordHash', password_hash(trim($_POST['password']), PASSWORD_BCRYPT, ["cost" => 12]), PDO::PARAM_STR);
        $sth->execute();

        //	Redirection vers la page de connexion
        header('Location: ./../sign-in.php');
        exit;
	}

	session_start();
	include('./php-include/sign-up.phtml');