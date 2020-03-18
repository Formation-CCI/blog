<?php

    session_start();
    if(!array_key_exists('authentification', $_SESSION))
    {
        header('Location: sign-in.php');
        exit;
    }
    else
    {
        unset($_SESSION['authentification']);
        header('Location: sign-in.php');
        exit;
    }
    