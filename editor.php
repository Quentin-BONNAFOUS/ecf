<?php
require "connect.php";
require "helpers.php";

if(!validGET("idArticle")){
    redirectTo("index.php");
}
$id = $_GET["idArticle"];
$errors = [];

$stmt = $db->prepare("SELECT * FROM listearticles WHERE idArticle=?");

$article = null;
if($stmt->execute([$id])){
    $article= $stmt->fetch();
}else{
    $errors[] = "L'article avec l'id $id n'a pu être trouvé";
}

if($_SERVER["REQUEST_METHOD"] === "POST"){
    if(validPOST("titreArticle") && validPOST("ContenuArticle") && validPOST("nomCategorie") && validPOST("nomTag") && validPOST("statutArticle")){
        $sql = "UPDATE listearticles SET titreArticle = :titreArticle ,statutArticle= :statutArticle, ContenuArticle = :ContenuArticle WHERE idArticle=:idArticle";
        $stmt = $db->prepare($sql);
        $res = $stmt->execute([
            ":titreArticle" => htmlspecialchars($_POST["titreArticle"]),
            ":ContenuArticle" => htmlspecialchars($_POST["ContenuArticle"]),
            ":idArticle" => htmlspecialchars($_POST["idArticle"]),
            ":statutArticle" => htmlspecialchars($_POST["statutArticle"])
        ]);  

        if($res === true){
            redirectTo("index.php");
        }else{
            $errors[] = "Erreur lors de la sauvegarde en base de données. Veuillez réessayer ultérieurement.";
        }
    }else{
        $errors[] = "Veuillez remplir tous les champs.";
    }
}


?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un article</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
</head>
<body>
    <div class="container d-flex flex-column align-items-center">
    
    <h1> Modifier un article </h1>

    
    <?php foreach($errors as $error){ ?>
            <div class="alert alert-warning">
                <?= $error ?>
            </div>
    <?php } ?>    
         
         <div class="card p-4 w-50">
            <form method="POST">
                <div class="d-flex justify-content-between">
                    <div class="form-group w-50">
                    <input type="text" id="titreArticle" name="titreArticle"
                            placeholder="" value = "<?= $article["titreArticle"] ?>">
                    </div>
                    <div class="form-group w-50">
                        <label for="input-categorie">Categorie</label><br/>
                        <select id="input-categorie" name="nomCategorie">
                            <option>Cake</option>
                            <option>Sweets</option>
                        </select>
                    </div>
                </div>
                <div class="d-flex justify-content-between">
                    <div class="form-group w-50">
                    <input type="hidden" id="idArticle" name="idArticle"
                            placeholder="" value = "<?= $id ?>">
                    <input type="text" id="ContenuArticle" name="ContenuArticle"
                            placeholder="" value = "<?= $article["ContenuArticle"] ?>">
                    </div>
                    <div class="form-group w-50">
                        <label for="input-tag">Tags</label><br/>
                        <select id="input-tag" name="nomTag">
                            <option>Jelly</option>
                            <option>Fudge</option>
                            <option>Beans</option>
                            <option>Sugar</option>
                        </select>
                    </div>
                </div>
                <div class="form-group w-50">
                        <label for="input-statutArticle">Statut Article</label><br/>
                        <select id="input-statutArticle" name="statutArticle">
                            <option>Publi</option>
                            <option>Brouillon</option>
                            <option>Corbeille</option>
                        </select>
                </div>
                <button type="submit" class="mt-3 btn btn-primary">Valider</button>
            </form>
        </div>
    </div>
</body>
</html>