<?php
session_start();

error_reporting(E_ALL);
ini_set("display_errors", 1);

// Test de connexion à la base
$config = parse_ini_file("config.ini");
try {
	$pdo = new \PDO("mysql:host=".$config["host"].";dbname=".$config["database"].";charset=utf8", $config["user"], $config["password"]);
} catch(Exception $e) {
	echo "<h1>Erreur de connexion à la base de données :</h1>";
	echo $e->getMessage();
	exit;
}

// Chargement des fichiers MVC
require("control/controleur.php");
require("view/vue.php");
require("model/categorie.php");
require("model/client.php");
require("model/commande.php");
require("model/commander.php");
require("model/produit.php");
require("model/photo.php");
require("model/devis.php");

// Routes
if(isset($_GET["action"])) {
	switch($_GET["action"]) {
		case "accueil":
			(new controleur)->accueil();
			break;

		case "connexion":
			(new controleur)->connexion();
			break;

		case "inscription":
			(new controleur)->inscription();
			break;

		case "produit":
			(new controleur)->produit();
			break;

		case "panier":
			(new controleur)->panier();
			break;
		
		case "categorie":
			(new controleur)->categorie();
			break;

		case "commander":
			(new controleur)->commander();
			break;

		case "deconnexion":
			(new controleur)->deconnexion();
			break;

		case "devis":
			(new controleur)->devis();
			break;

		case "admin":
			(new controleur)->admin();
			break;

		case "refuse":
			(new controleur)->refuse();
			break;

		case "accept":
			(new controleur)->acceptDevis();
			break;
		
		case "acceptDevisAdmin":
			(new controleur)->acceptDevisAdmin();
			break;
		
		case "suiviClient":
			(new controleur)->suiviClient();
			break;

		case "acceptDevisClient":
			(new controleur)->acceptDevisClient();
			break;
			
		// Route par défaut : erreur 404
		default:
			(new controleur)->erreur404();
			break;
	}
}
else {
	// Pas d'action précisée = afficher l'accueil
	(new controleur)->accueil();
}