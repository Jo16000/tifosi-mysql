USE tifosi;

-- 1. Insertion des marques
INSERT INTO marque (id_marque, nom) VALUES
(1, 'Coca-cola'),
(2, 'Cristalline'),
(3, 'Monster'),
(4, 'Pepsico');

-- 2. Insertion des boissons
INSERT INTO boisson (id_boisson, nom, id_marque) VALUES
(1, 'Coca-cola zéro', 1),
(2, 'Coca-cola original', 1),
(3, 'Fanta citron', 1),
(4, 'Fanta orange', 1),
(5, 'Capri-sun', 1),
(6, 'Pepsi', 4),
(7, 'Pepsi Max Zéro', 4),
(8, 'Lipton zéro citron', 4),
(9, 'Lipton Peach', 4),
(10, 'Monster energy ultra gold', 3),
(11, 'Monster energy ultra blue', 3),
(12, 'Eau de source', 2);

-- 3. Insertion des ingrédients
INSERT INTO ingredient (id_ingredient, nom) VALUES
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base Tomate'),
(6, 'Base crème'),
(7, 'Champignon'),
(8, 'Chevre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fumé'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate cerise'),
(25, 'Mozarella');

-- 4. Insertion des foccacias
INSERT INTO foccacia (id_focaccia, nom, prix) VALUES
(1, 'Mozaccia', 9.80),
(2, 'Gorgonzollaccia', 10.80),
(3, 'Raclaccia', 8.90),
(4, 'Emmentalaccia', 9.80),
(5, 'Tradizione', 8.90),
(6, 'Hawaienne', 11.20),
(7, 'Américaine', 10.80),
(8, 'Paysanne', 12.80);

-- 5. Liens d'associations Focaccias <-> Ingrédients
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
-- Mozaccia
(1, 5, 1), (1, 25, 1), (1, 9, 1), (1, 13, 1), (1, 1, 1), (1, 3, 1), (1, 7, 1), (1, 18, 1), (1, 20, 1), (1, 16, 1),
-- Gorgonzollaccia
(2, 5, 1), (2, 11, 1), (2, 9, 1), (2, 1, 1), (2, 7, 1), (2, 18, 1), (2, 20, 1), (2, 16, 1),
-- Raclaccia
(3, 5, 1), (3, 22, 1), (3, 9, 1), (3, 1, 1), (3, 7, 1), (3, 18, 1), (3, 20, 1),
-- Emmentalaccia
(4, 6, 1), (4, 10, 1), (4, 9, 1), (4, 7, 1), (4, 18, 1), (4, 20, 1), (4, 15, 1),
-- Tradizione
(5, 5, 1), (5, 25, 1), (5, 9, 1), (5, 12, 1), (5, 7, 1), (5, 18, 1), (5, 20, 1), (5, 16, 1), (5, 17, 1),
-- Hawaienne
(6, 5, 1), (6, 25, 1), (6, 9, 1), (6, 4, 1), (6, 2, 1), (6, 19, 1), (6, 18, 1), (6, 20, 1), (6, 16, 1),
-- Américaine
(7, 5, 1), (7, 25, 1), (7, 9, 1), (7, 4, 1), (7, 21, 1), (7, 18, 1), (7, 20, 1), (7, 16, 1),
-- Paysanne
(8, 6, 1), (8, 8, 1), (8, 9, 1), (8, 21, 1), (8, 13, 1), (8, 1, 1), (8, 3, 1), (8, 7, 1), (8, 18, 1), (8, 20, 1), (8, 16, 1), (8, 14, 1);

-- 6. Données de complétion obligatoires (Menus / Clients)
INSERT INTO menu (id_menu, nom, prix) VALUES (1, 'Menu Découverte', 13.50);
INSERT INTO est_constitue (id_focaccia, id_menu) VALUES (1, 1);
INSERT INTO contient (id_menu, id_boisson) VALUES (1, 1);
INSERT INTO client (id_client, nom, email, code_postal) VALUES (1, 'Jonathan Pisseau', 'jonathan@email.com', 16000);
INSERT INTO achete (id_client, id_menu, date_achat) VALUES (1, 1, '2026-07-16');