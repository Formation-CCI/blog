<?php

    session_start();
    if(!array_key_exists('authentification', $_SESSION))
    {
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

            // Envoie d'image
            if(array_key_exists('fichier', $_FILES))
            {
                if($_FILES['fichier']['error'] === 0)
                {
                    if(in_array(mime_content_type($_FILES['fichier']['tmp_name']), ['image/png' , 'image/jpeg']))
                    {
                        if($_FILES['fichier']['size'] < 3000000)
                        {
                            $urlImage = $_SESSION['authentification'] . "-" . uniqid() . "." . pathinfo($_FILES['fichier']['name'], PATHINFO_EXTENSION);
                            move_uploaded_file($_FILES['fichier']['tmp_name'], 'img/' . $urlImage);
                        }
                    }
                }
            }

            // Création de l'article
            $query = 'INSERT INTO articles (titre, contenu, image, idRedacteurs) VALUES(?, ?, ?, ?)';
            $sth = $dbh->prepare($query);
            $sth -> bindValue(1, $titre, PDO::PARAM_STR);
            $sth -> bindValue(2, $contenu, PDO::PARAM_STR);
            $sth -> bindValue(3, $urlImage, PDO::PARAM_STR);
            $sth -> bindValue(4, $_SESSION['authentification'], PDO::PARAM_INT);
            $sth->execute();

            header('Location: dashboard.php'); 
            exit;
        }
        include './php-include/add-article.phtml';
    }
