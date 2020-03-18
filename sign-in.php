<?php

	session_start();

	// Si le formulaire n'est pas vide
	if(!empty($_POST))
	{
		//	Connexion à la base de données
		include('./php-include/database-connection.php');

		//	Récupération de l'utilisateur
		$query = 'SELECT id, motDePasse FROM redacteurs WHERE pseudo = :pseudo';
		$sth = $dbh->prepare($query);
		$sth->bindValue(':pseudo', trim($_POST['pseudo']), PDO::PARAM_STR);
		$sth->execute();
		$redacteur = $sth->fetch();

		//	S'il l'authentification est réussie…
		if($redacteur !== false AND password_verify(trim($_POST['password']), $redacteur['motDePasse']))
		{

			$_SESSION['authentification'] = intval($redacteur['id']);

			//	Redirection vers la page privée
			header('Location: ./dashboard.php');
			exit; 
		}
		//	Sinon…
		else
		{
			//	Redirection vers la page d'authentification
			$erreur = "Identifiants incorrects";
		}
	}
	include './php-include/sign-in.phtml';