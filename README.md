# qodex_Database

# Le Diagramme Entité-Relation (ERD).

# Les scripts SQL complets.

## Contexte du projet
    Qodex est une plateforme web dédiée à l'organisation et la participation aux hackathons. Elle met en relation les organisateurs d'événements, les participants (développeurs, designers, entrepreneurs), les       mentors, et les sponsors. La plateforme permet de gérer l'inscription aux hackathons, la formation d'équipes, la soumission de projets, l'évaluation par des jurys, et la distribution de récompenses.

## Objectif :

    Concevoir et implémenter une base de données relationnelle robuste et évolutive pour supporter toutes les fonctionnalités de Qodex, en garantissant l'intégrité des données et des performances optimales.

    Schéma de la Base de Données :

### Utilisateurs
  id_utilisateur
  nom
  email
  motdepasse
  role (enseignant ou etudiant)

### Categories
  id_categorie
  nom_categorie (Mathématiques, Histoire, Informatique, etc.)

### Quiz
  id_quiz (PK)
  titre_quiz
  description
  id_categorie
  id_enseignant
  duree_minutes

### Questions
  id_question
  texte_question
  reponse_correcte
  points
  id_quiz

### Resultats
  id_resultat
  score
  date_passage
  id_etudiant
  id_quiz

## Relations Simples
  Un enseignant crée plusieurs quiz
  Un quiz appartient à une catégorie
  Un quiz contient plusieurs questions
  Un étudiant passe plusieurs quiz et obtient des résultats
  
## Requêtes SQL à Faire
  ### Requête 1 : Ajouter un nouveau quiz créé par un enseignant
  
  ### Requête 2 : Modifier la durée d'un quiz existant
  
  ### Requête 3 : Afficher tous les utilisateurs
  
  ### Requête 4 : Afficher uniquement les noms et emails des utilisateurs
  
  ### Requête 5 : Afficher tous les quiz
  
  ### Requête 6 : Afficher uniquement les titres des quiz
  
  ### Requête 7 : Afficher toutes les catégories
  
  ### Requête 8 : Afficher les utilisateurs qui sont enseignants
  
  ### Requête 9 : Afficher les utilisateurs qui sont étudiants
  
  ### Requête 10 : Afficher les quiz de durée supérieure à 30 minutes
  
  ### Requête 11 : Afficher les quiz de durée inférieure ou égale à 45 minutes
  
  ### Requête 12 : Afficher les questions valant plus de 5 points
  
  ### Requête 13 : Afficher les quiz de durée entre 20 et 40 minutes
  
  ### Requête 14 : Afficher les résultats avec un score supérieur ou égal à 60
  
  ### Requête 15 : Afficher les résultats avec un score inférieur à 50
  
  ### Requête 16 : Afficher les questions valant entre 5 et 15 points
  
  ### Requête 17 : Afficher les quiz créés par l'enseignant avec id_enseignant = 1
  
  ### Requête 18 : Afficher tous les quiz triés par durée (du plus court au plus long)
  
  ### Requête 19 : Afficher tous les résultats triés par score (du plus élevé au plus faible)
  
  ### Requête 20 : Afficher les 5 meilleurs scores
  
  ### Requête 21 : Afficher les questions triées par points (du plus faible au plus élevé)
  
  ### Requête 22 : Afficher les 3 derniers résultats (triés par date_passage décroissante)
  
  ### Requête 23 : Afficher le nom de chaque quiz avec sa catégorie


## Bonus (Facultatif)

  ### Ajouter une requête qui compte combien d'étudiants ont passé chaque quiz
  ### Créer une requête qui affiche le meilleur score pour chaque quiz
  ### Ajouter une colonne date_creation dans la table Quiz


## Recommandations:
  Optimisation des Performances :
  Utiliser des index sur les colonnes souvent requêtées (ex. : ID Médecin, ID Patient).
  Optimiser les requêtes de recherche.
  Qualité des Données :
  #### Appliquer des contraintes d’intégrité (ex. : UNIQUE pour l’email, CHECK pour les types de données).

## Maintenance:
  Effectuer des tests de performance réguliers avec des charges simulées.
## Sécurité:
  ### Crypter les données sensibles (ex. : e-mails, mots de passe).
  ### Contrôler l’accès à la base de données via des rôles utilisateurs
