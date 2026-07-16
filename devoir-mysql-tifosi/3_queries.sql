USE tifosi;

-- =============================================================================
-- REQUÊTE 1
-- But : Afficher la liste des noms des focaccias par ordre alphabétique croissant
-- =============================================================================
-- Code SQL :
SELECT nom FROM foccacia ORDER BY nom ASC;
-- Résultat attendu : Mozzaccia, Raclaccia, Tradizionale, Veggie
-- Résultat obtenu : Conforme au résultat attendu. No écart.

-- =============================================================================
-- REQUÊTE 2
-- But : Afficher le nombre total d'ingrédients
-- =============================================================================
-- Code SQL :
SELECT COUNT(*) AS total_ingredients FROM ingredient;
-- Résultat attendu : 10
-- Résultat obtenu : Conforme au résultat attendu. No écart.

-- =============================================================================
-- REQUÊTE 3
-- But : Afficher le prix moyen des focaccias
-- =============================================================================
-- Code SQL :
SELECT AVG(prix) AS prix_moyen FROM foccacia;
-- Résultat attendu : 9.60
-- Résultat obtenu : Conforme au résultat attendu. No écart.

-- =============================================================================
-- REQUÊTE 4
-- But : Afficher la liste des boissons avec leur marque, triée par nom de boisson
-- =============================================================================
-- Code SQL :
SELECT b.nom AS boisson, m.nom AS marque 
FROM boisson b 
JOIN marque m ON b.id_marque = m.id_marque 
ORDER BY b.nom ASC;
-- Résultat attendu : Liste des 5 boissons triées avec leur marque correspondante
-- Résultat obtenu : Conforme au résultat attendu. No écart.

-- =============================================================================
-- REQUÊTE 5
-- But : Afficher la liste des ingrédients pour une Raclaccia
-- =============================================================================
-- Code SQL :
SELECT i.nom FROM ingredient i
JOIN comprend c ON i.id_ingredient = c.id_ingredient
JOIN foccacia f ON c.id_focaccia = f.id_focaccia
WHERE f.nom = 'Raclaccia';
-- Résultat attendu : Ail, Fromage à raclette, Jambon cru, Oignon
-- Résultat obtenu : Conforme au résultat attendu. No écart.

-- =============================================================================
-- REQUÊTE 6
-- But : Afficher le nom et le nombre d'ingrédients pour chaque foccacia
-- =============================================================================
-- Code SQL :
SELECT f.nom, COUNT(c.id_ingredient) AS nombre_ingredients
FROM foccacia f
LEFT JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia;
-- Résultat attendu : Chaque focaccia répertoriée avec le nombre "4"
-- Résultat obtenu : Conforme au résultat attendu. No écart.

-- =============================================================================
-- REQUÊTE 7
-- But : Afficher le nom de la focaccia qui a le plus d'ingrédients
-- =============================================================================
-- Code SQL :
SELECT f.nom FROM foccacia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia
ORDER BY COUNT(c.id_ingredient) DESC 
LIMIT 1;
-- Résultat attendu : Une des focaccias ayant le maximum d'ingrédients (ici elles en ont toutes 4)
-- Résultat obtenu : Conforme au résultat attendu. No écart.

-- =============================================================================
-- REQUÊTE 8
-- But : Afficher la liste des focaccia qui contiennent de l'ail
-- =============================================================================
-- Code SQL :
SELECT f.nom FROM foccacia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE i.nom = 'Ail';
-- Résultat attendu : Mozzaccia, Raclaccia
-- Résultat obtenu : Conforme au résultat attendu. No écart.

-- =============================================================================
-- REQUÊTE 9
-- But : Afficher la liste des ingrédients inutilisés
-- =============================================================================
-- Code SQL :
SELECT i.nom FROM ingredient i
LEFT JOIN comprend c ON i.id_ingredient = c.id_ingredient
WHERE c.id_focaccia IS NULL;
-- Résultat attendu : Poivron
-- Résultat obtenu : Conforme au résultat attendu. No écart.

-- =============================================================================
-- REQUÊTE 10
-- But : Afficher la liste des focaccia qui n'ont pas de champignons
-- =============================================================================
-- Code SQL :
SELECT nom FROM foccacia 
WHERE id_focaccia NOT IN (
    SELECT id_focaccia FROM comprend c
    JOIN ingredient i ON c.id_ingredient = i.id_ingredient
    WHERE i.nom = 'Champignon'
);
-- Résultat attendu : Mozzaccia, Raclaccia
-- Résultat obtenu : Conforme au résultat attendu. No écart.