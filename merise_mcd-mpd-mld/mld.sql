#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: listeCategories
#------------------------------------------------------------

CREATE TABLE listeCategories(
        idCategorie          Int  Auto_increment  NOT NULL ,
        nomCategorie         Varchar (255) NOT NULL ,
        descriptionCategorie Text NOT NULL
	,CONSTRAINT listeCategories_PK PRIMARY KEY (idCategorie)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: listeArticles
#------------------------------------------------------------

CREATE TABLE listeArticles(
        idArticle                  Int  Auto_increment  NOT NULL ,
        titreArticle               Varchar (255) NOT NULL ,
        statutArticle              Enum ("Publié","Corbeille","Brouillon") NOT NULL ,
        dateCreationArticle        Date NOT NULL ,
        datePublicationtionArticle Date NOT NULL ,
        ContenuArticle             Text NOT NULL ,
        idCategorie                Int
	,CONSTRAINT listeArticles_PK PRIMARY KEY (idArticle)

	,CONSTRAINT listeArticles_listeCategories_FK FOREIGN KEY (idCategorie) REFERENCES listeCategories(idCategorie)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: listeTags
#------------------------------------------------------------

CREATE TABLE listeTags(
        idTag          Int  Auto_increment  NOT NULL ,
        nomTag         Varchar (255) NOT NULL ,
        descriptionTag Varchar (255) NOT NULL
	,CONSTRAINT listeTags_PK PRIMARY KEY (idTag)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Posseder
#------------------------------------------------------------

CREATE TABLE Posseder(
        idTag     Int NOT NULL ,
        idArticle Int NOT NULL
	,CONSTRAINT Posseder_PK PRIMARY KEY (idTag,idArticle)

	,CONSTRAINT Posseder_listeTags_FK FOREIGN KEY (idTag) REFERENCES listeTags(idTag)
	,CONSTRAINT Posseder_listeArticles0_FK FOREIGN KEY (idArticle) REFERENCES listeArticles(idArticle)
)ENGINE=InnoDB;

