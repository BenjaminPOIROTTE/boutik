<?php

class devis {
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

    public function setDevis($idClient, $idProduit, $desc) {
		$sql = "INSERT INTO `devis`(`idClient`, `idArticle`, `description`) VALUES (:cli,:art,:descr)";

		$req = $this->pdo->prepare($sql);
		$req->bindParam(':cli', $idClient, PDO::PARAM_INT);
		$req->bindParam(':art', $idProduit, PDO::PARAM_INT);
		$req->bindParam(':descr', $desc, PDO::PARAM_STR);
		$req->execute();
	}

	public function getDevisAdmin() {
		$sql = "SELECT idDevis, nomClient, prenomClient, designationProduit, `description` FROM devis
		INNER JOIN client ON client.idClient = devis.idClient
		INNER JOIN produit ON codeProduit = idArticle
		WHERE prixAdmin is NULL && `isAcceptClient` is NULL";

		$req = $this->pdo->prepare($sql);
		$req->execute();

		return $req->fetchAll();
	}

	public function refuseDevis($idDevis) {
		$sql = "UPDATE `devis` SET `isAcceptAdmin`=0 WHERE `idDevis`=?";

		$req = $this->pdo->prepare($sql);
		$req->bindParam(1, $idDevis, PDO::PARAM_INT);

		$req->execute();
	}

	public function deleteDevis($idDevis) {
		$sql = "DELETE FROM `devis` WHERE `idDevis`=?";

		$req = $this->pdo->prepare($sql);
		$req->bindParam(1, $idDevis, PDO::PARAM_INT);

		$req->execute();
	}

	public function acceptDevis($idDevis, $com, $prix) {
		$sql = "UPDATE `devis` SET `commentaireAdmin`=?, `prixAdmin` = ?, `isAcceptClient`=1 WHERE `idDevis`=?";

		$req = $this->pdo->prepare($sql);
		$req->bindParam(1, $com);
		$req->bindParam(2, $prix);
		$req->bindParam(3, $idDevis);

		$req->execute();
	}

	public function viewDevisClient($idClient) {
		$sql = "SELECT * FROM `devis` inner join produit on produit.codeProduit=devis.idArticle WHERE `idClient`=? and `verifAdmin` = 0";

		$req = $this->pdo->prepare($sql);
		$req->bindParam(1, $idClient, PDO::PARAM_INT);

		$req->execute();

		return $req->fetchAll();
	}

	public function choixClient($idDevis, $choix) {
		$sql = "UPDATE `devis` SET `isAcceptClient`=? WHERE `idDevis`=?";

		$req = $this->pdo->prepare($sql);
		$req->bindParam(1, $idDevis);
		$req->bindParam(2, $choix);

		$req->execute();
	}

	public function acceptDevisClient($idDevis)
	{
		$sql = "UPDATE `devis` SET `verifAdmin`=1 WHERE `idDevis`=?";
		$req = $this->pdo->prepare($sql);
		$req->bindParam(1, $idDevis);

		$req->execute();
	}
}