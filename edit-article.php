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

        $query = 'SELECT articles.titre, articles.image, articles.contenu, articles.idThemes, themes.libelle FROM articles INNER JOIN themes ON articles.idThemes = themes.id WHERE articles.id = ?';
        $sth = $dbh->prepare($query);
        $sth -> bindValue(1, $_SESSION['idArticle'], PDO::PARAM_INT);
        $sth->execute();
        $article = $sth->fetch();

        // Si le formulaire n'est pas vide
        if(!empty($_POST))
        {
            $titre = trim($_POST['titre']);
            $contenu = trim($_POST['contenu']);
            $urlImage = $article['image'];

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

            // Mise à jour de l'article
            $query = 'UPDATE articles SET titre = ?, contenu = ?, image = ?, idRedacteurs = ?, idThemes = ? WHERE id = ?';
            $sth = $dbh->prepare($query);
            $sth -> bindValue(1, $titre, PDO::PARAM_STR);
            $sth -> bindValue(2, $contenu, PDO::PARAM_STR);
            $sth -> bindValue(3, $urlImage, PDO::PARAM_STR);
            $sth -> bindValue(4, $_SESSION['authentification'], PDO::PARAM_INT);
            $sth -> bindValue(5, $_POST['theme'], PDO::PARAM_INT);
            $sth -> bindValue(6, $_SESSION['idArticle'], PDO::PARAM_INT);
            $sth->execute();

            unset($_SESSION['idArticle']);

            //	Redirection vers le dashboard
            header('Location: dashboard.php'); 
            exit;
        }

        // Affiche les thèmes en supprimant le thème de l'article de la liste
        $query = 'SELECT id, libelle FROM themes WHERE id != ? ORDER BY libelle ASC';
        $sth = $dbh->prepare($query);
        $sth -> bindValue(1, $article['idThemes'], PDO::PARAM_INT);
        $sth->execute();
        $themes = $sth->fetchAll();

        // Inclusion du PHTML
        include './php-include/edit-article.phtml';
    }
    