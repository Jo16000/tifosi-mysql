USE tifosi;

-- 1. Insertion des marques
INSERT INTO marque (id_marque, nom) VALUES
(1, 'Coca-Cola'),
(2, 'Cristaline'),
(3, 'Monster'),
(4, 'Schweppes');

-- 2. Insertion des boissons
INSERT INTO boisson (id_boisson, nom, id_marque) VALUES
(1, 'Coca-Cola zéro', 1),
(2, 'Coca-Cola original', 1),
(3, 'Cristaline Eau de source', 2),
(4, 'Monster Energy Original', 3),
(5, 'Schweppes Agrum\'', 4);

-- 3. Insertion des ingrédients
INSERT INTO ingredient (id_ingredient, nom) VALUES
(1, 'Ail'),
(2, 'Champignon'),
(3, 'Tomate'),
(4, 'Mozzarella'),
(5, 'Fromage à raclette'),
(6, 'Jambon cru'),
(7, 'Oignon'),
(8, 'Olive noire'),
(9, 'Basilic'),
(10, 'Poivron'); -- Ingrédient inutilisé volontairement pour le test numéro 9

-- 4. Insertion des focccias
INSERT INTO foccacia (id_focaccia, nom, prix) VALUES
(1, 'Mozzaccia', 9.50),
(2, 'Raclaccia', 11.00),
(3, 'Tradizionale', 8.90),
(4, 'Veggie', 9.00);

-- 5. Liens Focaccias <-> Ingrédients (Table comprend)
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
-- Mozzaccia (Tomate, Mozzarella, Basilic, Ail)
(1, 3, 1), (1, 4, 1), (1, 9, 1), (1, 1, 1),
-- Raclaccia (Fromage à raclette, Jambon cru, Oignon, Ail)
(2, 5, 1), (2, 6, 1), (2, 7, 1), (2, 1, 1),
-- Tradizionale (Tomate, Mozzarella, Jambon cru, Champignon)
(3, 3, 1), (3, 4, 1), (3, 6, 1), (3, 2, 1),
-- Veggie (Tomate, Champignon, Oignon, Olive noire)
(4, 3, 1), (4, 2, 1), (4, 7, 1), (4, 8, 1);

-- 6. Données additionnelles pour faire fonctionner la structure globale (Menus & Clients)
INSERT INTO menu (id_menu, nom, prix) VALUES (1, 'Menu Gourmand', 14.00);
INSERT INTO est_constitue (id_focaccia, id_menu) VALUES (2, 1);
INSERT INTO contient (id_menu, id_boisson) VALUES (1, 1);
INSERT INTO client (id_client, nom, email, code_postal) VALUES (1, 'Jean Dupont', 'jean.dupont@email.com', 75001);
INSERT INTO achete (id_client, id_menu, date_achat) VALUES (1, 1, '2026-07-16');