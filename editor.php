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
         
         <div class="card p-4 w-50">
            <form method="POST">
                <div class="d-flex justify-content-between">
                    <div class="form-group w-50">
                    <input type="text" id="titreArticle" name="titreArticle"
                            placeholder="Titre de l'article">
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
                    <input type="text" id="ContenuArticle" name="ContenuArticle"
                            placeholder="Super contenu">
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
                <button type="submit" class="mt-3 btn btn-primary">Publier</button>
                <button type="button" class="mt-3 btn btn-primary">Sauvegarder</button>
            </form>
        </div>
    </div>
</body>
</html>