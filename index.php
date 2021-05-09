<?php
require "connect.php";
require "helpers.php";

$stmt = $db->query("SELECT * from listearticles
                       LEFT JOIN listecategories ON listearticles.idCategorie = listecategories.idCategorie
                       INNER JOIN posseder ON listearticles.idArticle = posseder.idArticle 
                       INNER JOIN listeTags ON listetags.idTag = posseder.idTag");
                       
$articles = $stmt->fetchAll();

?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Articles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-between mt-3 mb-3">
            <h1>Liste d'articles</h1>
            <a class="btn btn-primary d-flex align-items-center" href="editors.php">Créer un article</a>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th>Titre</th>
                    <th>Date de création</th>
                    <th>Statut</th>
                    <th>Catégorie</th>
                    <th>Tags</th>
                    <th></th>
                </tr>
            </thead>
            <?php foreach($articles as $article){ ?>
                    <tr>
                        <td><?= $article["titreArticle"] ?></td>
                        <td><?= afficheDateFR($article["dateCreationArticle"]) ?></td>
                        <td><?= $article["statutArticle"] ?></td>
                        <td><?= $article["nomCategorie"] ?></td>
                        <td><?= $article["nomTag"] ?></td></td>
                        <td>
                        <a href="#">Modifier</a>
                    </td>
                </tr>
            <?php } ?>
        </table>
    </div>
</body>
</html>