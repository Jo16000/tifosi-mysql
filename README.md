# 🇮🇹 Tifosi - Base de Données MySQL

Ce projet a été réalisé dans le cadre d'une évaluation pour le restaurant de Street-Food italien **Tifosi**. L'objectif est de concevoir, peupler et auditer une base de données relationnelle MySQL permettant de gérer les recettes de focaccias, les ingrédients, les marques et les boissons du restaurant.

---

## 📁 Structure des Livrables

Le dépôt est structuré en trois scripts SQL principaux, à exécuter dans l'ordre chronologique :

1. **`1_schema.sql`** : 
   * Création de la base de données `tifosi` (encodage `utf8mb4`).
   * Création et attribution des privilèges de l'utilisateur dédié `tifosi`@`localhost`.
   * Définition des tables et des contraintes d'intégrité référentielle (`PRIMARY KEY`, `FOREIGN KEY`, `ON DELETE CASCADE`).

2. **`2_data.sql`** : 
   * Peuplement complet de la base de données.
   * Données extraites en stricte conformité avec les 4 fichiers Excel officiels du centre (`focaccia.xlsx`, `ingredient.xlsx`, `boisson.xlsx`, `marque.xlsx`).
   * Ajout des données complémentaires obligatoires (tables `client`, `menu`, `achete`, `contient`, `est_constitue`) pour garantir la cohérence des clés étrangères.

3. **`3_queries.sql`** : 
   * Regroupement des 10 requêtes de vérification demandées par le brief.
   * Chaque requête est documentée avec son but, son code SQL, son résultat théorique attendu et son résultat réel obtenu.

---

## 🛠️ Configuration de l'Utilisateur et Sécurité

Le script de schéma configure l'accès local suivant :
* **Utilisateur :** `tifosi`
* **Hôte :** `localhost`
* **Mot de passe :** `PasswordTifosi2026!`
* **Droits :** Privilèges complets accordés sur la base de données `tifosi`.

---

## 📊 Volume des Données Insérées

En concordance avec les tableurs fournis par le centre de formation, la base de données comprend :
* **4** Marques de boissons (*Coca-cola, Cristalline, Monster, Pepsico*).
* **12** Boissons référencées.
* **25** Ingrédients uniques.
* **8** Recettes de focaccias (*Mozaccia, Gorgonzollaccia, Raclaccia, Emmentalaccia, Tradizione, Hawaienne, Américaine, Paysanne*).

---

## 🔍 Liste des 10 Requêtes de Test Auditées

Le fichier `3_queries.sql` exécute et valide les audits suivants :
1. **Requête 1 :** Liste des focaccias par ordre alphabétique croissant (*Résultat : 8 lignes*).
2. **Requête 2 :** Nombre total d'ingrédients enregistrés (*Résultat : 25*).
3. **Requête 3 :** Prix moyen des focaccias (*Résultat : 10.25 €*).
4. **Requête 4 :** Liste des boissons associées à leur marque, triée par boisson (*Résultat : 12 lignes*).
5. **Requête 5 :** Liste des ingrédients composant la "Raclaccia" (*Résultat : 7 ingrédients*).
6. **Requête 6 :** Nom et nombre exact d'ingrédients pour chaque focaccia.
7. **Requête 7 :** Nom de la focaccia la plus riche en ingrédients (*Résultat : Paysanne avec 12 ingrédients*).
8. **Requête 8 :** Liste des focaccias contenant de l'ail (*Résultat : Mozaccia, Gorgonzollaccia, Raclaccia, Paysanne*).
9. **Requête 9 :** Liste des ingrédients de la carte qui ne sont utilisés dans aucune recette (*Résultat : Salami*).
10. **Requête 10 :** Liste des focaccias préparées sans aucun champignon (*Résultat : Hawaienne, Américaine*).

---

## 🚀 Instructions d'Installation Rapide

Pour déployer la base de données localement dans votre environnement MySQL, connectez-vous à votre invite de commande MySQL ou votre terminal, puis exécutez successivement les commandes suivantes :

```sql
-- 1. Création de la structure et de l'utilisateur
SOURCE 1_schema.sql;

-- 2. Importation des données officielles
SOURCE 2_data.sql;

-- 3. Exécution de l'audit et des tests de conformité
SOURCE 3_queries.sql;
