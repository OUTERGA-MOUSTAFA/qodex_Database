use qodex;

#Requête 1 : Ajouter un nouveau quiz créé par un enseignant
/*
insert into quiz  (titre_quiz,descriptionquiz,id_categorie,id_enseignant,duree_minutes)values (
'Culture Marocaine', 'Quiz sur l’histoire et la culture du Maroc', 2, 5, 20
);*/

#Requête 2 : Modifier la durée d'un quiz existant
/*
update quiz 
set duree_minutes = 20
# , titre_quiz = 'Quiz Statistique', descriptionquiz = 'Probabilités et statistiques descriptives'
where id_quiz = 1;
#where duree_quiz >25
*/

#Requête 3 : Afficher tous les utilisateurs
#select * from utilisateurs

#Requête 4 : Afficher uniquement les noms et emails des utilisateurs
#select nom, email from utilisateurs

#Requête 5 : Afficher tous les quiz
#select * from quiz

#Requête 6 : Afficher uniquement les titres des quiz
#select titre_quiz from quiz

#Requête 7 : Afficher toutes les catégories
#select * from categories

#Requête 8 : Afficher les utilisateurs qui sont enseignants
/*
select * from utilisateurs
where role like 'enseignant'
*/

#Requête 9 : Afficher les utilisateurs qui sont étudiants
/*
select * from utilisateurs
where role like 'etudiant'
*/

#Requête 10 : Afficher les quiz de durée supérieure à 30 minutes
/*
select * from quiz
where duree_minutes> 30;
*/

#Requête 11 : Afficher les quiz de durée inférieure ou égale à 45 minutes
/*
select * from quiz
where duree_minutes <= 45;
*/

#Requête 12 : Afficher les questions valant plus de 5 points
/*
select * from questions
where points > 5;
*/

#Requête 13 : Afficher les quiz de durée entre 20 et 40 minutes
/*
select * from quiz
where duree_minutes between 20 and 40;
*/

#Requête 14 : Afficher les résultats avec un score supérieur ou égal à 60
/*
select * from resultats
where score >=60;
*/

#Requête 15 : Afficher les résultats avec un score inférieur à 50
/*
select * from resultats
where score < 50;
*/

#Requête 16 : Afficher les questions valant entre 5 et 15 points
/*
select * from questions
where points between 5 and 15;
*/

#Requête 16 : Afficher les questions valant entre 5 et 15 points
/*
select * from questions
where points between 5 and 15;
*/

#Requête 17 : Afficher les quiz créés par l'enseignant avec id_enseignant = 1
/*
select * from quiz
where id_enseignant = 1;
*/

#Requête 18 : Afficher tous les quiz triés par durée (du plus court au plus long)
/*
select * from quiz
order by duree_minutes asc;# desc
*/

#Requête 19 : Afficher tous les résultats triés par score (du plus élevé au plus faible)
/*
select * from resultats
order by score desc;# asc
*/

#Requête 20 : Afficher les 5 meilleurs scores
/*
select * from resultats
order by score desc
limit 5;
*/

#Requête 21 : Afficher les questions triées par points (du plus faible au plus élevé)
/*
select * from questions
order by points asc
*/

#Requête 22 : Afficher les 3 derniers résultats (triés par date_passage décroissante)
/*
select * from resultats
order by date_passage desc # becaus date_passage=> type date || type varchar => str_to_date(date_passage,%y/%m/%d) desc
limit 3;
*/

#Requête 23 : Afficher le nom de chaque quiz avec sa catégorie
/*
select q.titre_quiz, c.nom_categorie from quiz q 
	join categories c
	where c.id_categorie = q.id_categorie
*/
/*------------------------ Bonus ------------------------- */
# 1 Ajouter une requête qui compte combien d'étudiants ont passé chaque quiz
/*
    select q.titre_quiz,
    u.nom,
    count(*) as Number_Etudiant_Pass_Quiz
    from Quiz q
    join Resultats r on r.id_quiz = q.id_quiz
    join utilisateurs u on u.id_utilisateur =  r.id_etudiant
    where role like 'etudiant'
    group by q.id_quiz, u.id_utilisateur, r.id_etudiant
*/
# 2 Créer une requête qui affiche le meilleur score pour chaque quiz
/*
select q.titre_quiz,
    r.score
    from Quiz q
    join Resultats r on r.id_quiz = q.id_quiz
    order by r.score desc
    limit 3
*/ 
    
# 3 Ajouter une colonne date_creation dans la table Quiz
/*
alter table Quiz
add column date_creation datetime
*/
#DESCRIBE utilisateurs;
#invesible modepass users
/*
ALTER TABLE utilisateurs
MODIFY COLUMN motdepasse VARCHAR(50) VISIBLE;
*/
/*
SET @key_str = 'MyStrongSecretKey123!'; -- Store securely, not in code
ALTER TABLE utilisateurs
MODIFY motdepasse VARBINARY(255);

UPDATE utilisateurs
SET motdepasse = AES_ENCRYPT(motdepasse, @key_str);
/*
#decrypted password
CAST(AES_DECRYPT(motdepasse, @key_str) AS CHAR)
*/
/*
create user 'Ayoub Ouharda'	#login
identified by 'ouherda123';		#password
grant insert, select
on utilisateurs, quiz, categories, questions, resultats
to 'Ayoub Ouharda';

create user 'Ayoub El Faqir'	#login
identified by 'Faqir123';		#password
grant delete, select
on utilisateurs, quiz, categories, questions, resultats
to 'Ayoub El Faqir';

create user 'Maroua Kourdi'	#login
identified by 'Kourdi123';		#password
grant create, select, references
on utilisateurs, quiz, categories, questions, resultats
to 'Maroua Kourdi';

*/
#******************** Admin Privilages ************************
/*
grant insert, select, update, delete, execute, create, references
on qodex
to 'admin123';

create role select_role;

grant select on quiz, categories, questions, resultats
to select_role;

grant select_role
to 'Ayoub El Faqir';
*/
#revoke select_role from 'Ayoub El Faqir'