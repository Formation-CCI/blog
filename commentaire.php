<?php
    if(!empty($_POST))
    {
        //	Connexion à la base de données
        include('./php-include/database-connection.php');
        
        $pseudoAuteur = trim($_POST['pseudoAuteur']);
        $contenu = trim($_POST['contenu']);

        // Envoie du commentaire
        $query = 'INSERT INTO commentaires (pseudoAuteur, contenu, idArticle) VALUES(?, ?, ?)';
        $sth = $dbh->prepare($query);
        $sth -> bindValue(1, $pseudoAuteur, PDO::PARAM_STR);
        $sth -> bindValue(2, $contenu, PDO::PARAM_STR);
        $sth -> bindValue(3, $_POST['idPost'], PDO::PARAM_INT);
        $sth->execute();

        // Redirection vers la page PHTML
        header('Location: index.php'); 
        exit;
    }