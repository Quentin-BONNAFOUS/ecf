#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: creerArticle
#------------------------------------------------------------

CREATE TABLE creerArticle(
        id                  Int NOT NULL ,
        titreArticle        Varchar (255) NOT NULL ,
        nomCategorie        Varchar (255) NOT NULL ,
        nomTags             Varchar (255) NOT NULL ,
        contenuArticle      Text NOT NULL ,
        dateCreationArticle Date NOT NULL
	,CONSTRAINT creerArticle_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: listesArticles
#------------------------------------------------------------

CREATE TABLE listesArticles(
        idArticle                  Int NOT NULL ,
        titreArticle               Varchar (255) NOT NULL ,
        datePublicationtionArticle Date NOT NULL ,
        statutArticle              Enum ("Publié","Corbeille","Brouillon") NOT NULL ,
        nomCategorie               Varchar (255) NOT NULL ,
        nomTags                    Varchar (255) NOT NULL
	,CONSTRAINT listesArticles_PK PRIMARY KEY (idArticle)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Créer
#------------------------------------------------------------

CREATE TABLE Creer(
        idArticle Int NOT NULL ,
        id        Int NOT NULL
	,CONSTRAINT Creer_PK PRIMARY KEY (idArticle,id)

	,CONSTRAINT Creer_listesArticles_FK FOREIGN KEY (idArticle) REFERENCES listesArticles(idArticle)
	,CONSTRAINT Creer_creerArticle0_FK FOREIGN KEY (id) REFERENCES creerArticle(id)
)ENGINE=InnoDB;

