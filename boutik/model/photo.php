<?php
class photo {
    // Objet PDO servant à la connexion à la base
	private $pdo;

	// Connexion à la base de données
	public function __construct() {
		$config = parse_ini_file("config.ini");
		
		try {
			$this->pdo = new \PDO("mysql:host=".$config["host"].";dbname=".$config["database"].";charset=utf8", $config["user"], $config["password"]);
		} catch(Exception $e) {
			echo $e->getMessage();
		}
	}

    public function getPhotoProduit($prod) {
        $sql = "SELECT `url` FROM `image` WHERE `id_produit` =  :code";
		
		$req = $this->pdo->prepare($sql);
		$req->bindParam(':code', $prod, PDO::PARAM_INT);
		$req->execute();
		
		return $req->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getPhotoProduitForCategories($categorie) {
        $sql = "SELECT `id_produit`, `url` FROM `image` INNER JOIN produit ON id_produit = produit.codeProduit WHERE produit.idCategorie = :code;";
		
		$req = $this->pdo->prepare($sql);
		$req->bindParam(':code', $categorie, PDO::PARAM_INT);
		$req->execute();
		
		return $req->fetchAll(PDO::FETCH_ASSOC);
    }
}