USE tifosi;

-- =============================================================================
-- REQUÊTE 1 : Afficher la liste des noms des focaccias par ordre alphabétique croissant
-- =============================================================================
SELECT nom FROM foccacia ORDER BY nom ASC;
-- Résultat attendu : Américaine, Emmentalaccia, Gorgonzollaccia, Hawaienne, Mozaccia, Paysanne, Raclaccia, Tradizione
-- Résultat obtenu : Conforme au résultat attendu. Aucun écart.

-- =============================================================================
-- REQUÊTE 2 : Afficher le nombre total d'ingrédients
-- =============================================================================
SELECT COUNT(*) AS total_ingredients FROM ingredient;
-- Résultat attendu : 25
-- Résultat obtenu : Conforme au résultat attendu. Aucun écart.

-- =============================================================================
-- REQUÊTE 3 : Afficher le prix moyen des focaccias
-- =============================================================================
SELECT AVG(prix) AS prix_moyen FROM foccacia;
-- Résultat attendu : 10.25
-- Résultat obtenu : Conforme au résultat attendu. Aucun écart.

-- =============================================================================
-- REQUÊTE 4 : Afficher la liste des boissons avec leur marque, triée par nom de boisson
-- =============================================================================
SELECT b.nom AS boisson, m.nom AS marque 
FROM boisson b 
JOIN marque m ON b.id_marque = m.id_marque 
ORDER BY b.nom ASC;
-- Résultat attendu : Liste des 12 boissons réelles triées par ordre alphabétique avec leur marque respective
-- Résultat obtenu : Conforme au résultat attendu. Aucun écart.

-- =============================================================================
-- REQUÊTE 5 : Afficher la liste des ingrédients pour une Raclaccia
-- =============================================================================
SELECT i.nom FROM ingredient i
JOIN comprend c ON i.id_ingredient = c.id_ingredient
JOIN foccacia f ON c.id_focaccia = f.id_focaccia
WHERE f.nom = 'Raclaccia';
-- Résultat attendu : Ail, Base Tomate, Champignon, Cresson, Parmesan, Poivre, Raclette
-- Résultat obtenu : Conforme au résultat attendu. Aucun écart.

-- =============================================================================
-- REQUÊTE 6 : Afficher le nom et le nombre d'ingrédients pour chaque foccacia
-- =============================================================================
SELECT f.nom, COUNT(c.id_ingredient) AS nombre_ingredients
FROM foccacia f
LEFT JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia;
-- Résultat attendu : Mozaccia(10), Gorgonzollaccia(8), Raclaccia(7), Emmentalaccia(7), Tradizione(9), Hawaienne(9), Américaine(8), Paysanne(12)
-- Résultat obtenu : Conforme au résultat attendu. Aucun écart.

-- =============================================================================
-- REQUÊTE 7 : Afficher le nom de la focaccia qui a le plus d'ingrédients
-- =============================================================================
SELECT f.nom FROM foccacia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia
ORDER BY COUNT(c.id_ingredient) DESC 
LIMIT 1;
-- Résultat attendu : Paysanne
-- Résultat obtenu : Conforme au résultat attendu. Aucun écart.

-- =============================================================================
-- REQUÊTE 8 : Afficher la liste des focaccia qui contiennent de l'ail
-- =============================================================================
SELECT f.nom FROM foccacia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE i.nom = 'Ail';
-- Résultat attendu : Mozaccia, Gorgonzollaccia, Raclaccia, Paysanne
-- Résultat obtenu : Conforme au résultat attendu. Aucun écart.

-- =============================================================================
-- REQUÊTE 9 : Afficher la liste des ingrédients inutilisés
-- =============================================================================
SELECT i.nom FROM ingredient i
LEFT JOIN comprend c ON i.id_ingredient = c.id_ingredient
WHERE c.id_focaccia IS NULL;
-- Résultat attendu : Salami
-- Résultat obtenu : Conforme au résultat attendu. Aucun écart.

-- =============================================================================
-- REQUÊTE 10 : Afficher la liste des focaccia qui n'ont pas de champignons
-- =============================================================================
SELECT nom FROM foccacia 
WHERE id_focaccia NOT IN (
    SELECT id_focaccia FROM comprend c
    JOIN ingredient i ON c.id_ingredient = i.id_ingredient
    WHERE i.nom = 'Champignon'
);
-- Résultat attendu : Hawaienne, Américaine
-- Résultat obtenu : Conforme au résultat attendu. Aucun écart.