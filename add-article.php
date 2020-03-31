<?php

    session_start();

    // Vérifie si le rédacteur est connecté
    if(!array_key_exists('authentification', $_SESSION))
    {
        // Redirection vers la page de connexion
        header('Location: connexion.php');
        exit;
    }
    else
    {
        //	Connexion à la base de données
        include('./php-include/database-connection.php');
        
        // Si le formulaire n'est pas vide
        if(!empty($_POST))
        {
            $titre = trim($_POST['titre']);
            $contenu = trim($_POST['contenu']);
            $i = count($_FILES['fichiers']['error']); // Calcul le nombre d'image envoyer'
            $y = 0;

            // Création de l'article
            $query = 'INSERT INTO articles (titre, contenu, idRedacteurs, idThemes) VALUES(?, ?, ?, ?)';
            $sth = $dbh->prepare($query);
            $sth -> bindValue(1, $titre, PDO::PARAM_STR);
            $sth -> bindValue(2, $contenu, PDO::PARAM_STR);
            $sth -> bindValue(3, $_SESSION['authentification'], PDO::PARAM_INT);
            $sth -> bindValue(4, $_POST['theme'], PDO::PARAM_INT);
            $sth->execute();
            
            // Envoie d'image
            $idArticle = $dbh->lastInsertId(); // Récupère l'id du dernière article créer

            // Nombre de VALUES ajouter de manière dynamique
            $nombreValue = array_fill(0, $i, '(?, ?)');
            $totalNombreValue = implode(", ", $nombreValue);

            $query = 'INSERT INTO images (image, idArticles) VALUES ' . $totalNombreValue;
            $sth = $dbh->prepare($query);

            foreach($_FILES['fichiers']['error'] AS $index => $error)
            {
                if($error === 0)
                {
                    if(in_array(mime_content_type($_FILES['fichiers']['tmp_name'][$index]), ['image/png' , 'image/jpeg']))
                    {
                        if($_FILES['fichiers']['size'][$index] < 3000000)
                        {
                            $name = $_FILES['fichiers']['name'][$index];
                            $urlImage = $_SESSION['authentification'] . "-" . $idArticle . "_" . uniqid() . "." . pathinfo($name, PATHINFO_EXTENSION);
                            move_uploaded_file($_FILES['fichiers']['tmp_name'][$index], 'img/' . $urlImage);
                            
                            $sth -> bindValue(++$y, $urlImage, PDO::PARAM_STR);
                            $sth -> bindValue(++$y, $idArticle, PDO::PARAM_INT);
                        }
                    }
                }
            }

            $sth->execute(); // Envoie les images dans la table images;

            //	Redirection vers le dashboard
            header('Location: dashboard.php'); 
            exit;
        }

        // Affiche les thèmes
        $query = 'SELECT id, libelle FROM themes ORDER BY libelle ASC';
        $sth = $dbh->query($query);
        $themes = $sth->fetchAll();

        // Inclusion du PHTML
        include './php-include/add-article.phtml';
    }
