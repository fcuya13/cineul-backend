-- Insertar en la tabla actor
INSERT INTO "actor" ("id", "nombre") VALUES 
(1, 'Andrea Riseborough'),
(2, 'Demián Bichir'),
(3, 'John Cho'),
(4, 'Betty Gilpin'),
(5, 'Lin Shaye'),
(6, 'Jacki Weaver'),
(7, 'Kristen Stewart'),
(8, 'Vincent Cassel'),
(9, 'Jessica Henwick'),
(10, 'John Gallagher Jr.'),
(11, 'Mamoudou Athie'),
(12, 'T.J. Miller'),
(13, 'Tiffany Haddish'),
(14, 'Rose Byrne'),
(15, 'Salma Hayek'),
(16, 'Jennifer Coolidge'),
(17, 'Billy Porter'),
(18, 'Richard Gere'),
(19, 'Peter Dinklage'),
(20, 'Walton Goggins'),
(21, 'Bradley Whitford'),
(22, 'Josh Hartnett'),
(23, 'Margarita Levieva'),
(24, 'Chandler Riggs'),
(25, 'Bruce Dern'),
(26, 'Owen Teague'),
(27, 'Freya Tingley'),
(28, 'Simon Abkarian'),
(29, 'Rutger Hauer'),
(30, 'James Faulkner');

-- Insertar en la tabla genero
INSERT INTO "genero" ("id", "nombre") VALUES 
(1, 'Horror'),
(2, 'Supernatural'),
(3, 'Action'),
(4, 'Science Fiction'),
(5, 'Comedy'),
(6, 'Drama'),
(7, 'Crime'),
(8, 'Mystery'),
(9, 'Thriller');

-- Insertar en la tabla peliculas
INSERT INTO "peliculas" ("id", "titulo", "sinopsis", "imagen_url", "trailer_url") VALUES 
(1, 'The Grudge', 'The Grudge is a 2020 American psychological supernatural horror film written and directed by Nicolas Pesce. Originally announced as a reboot of the 2004 American remake and the original 2002 Japanese horror film Ju-On: The Grudge, the film ended up taking place before and during the events of the 2004 film and its two direct sequels, and is the fourth installment in the American The Grudge film series. The film stars Andrea Riseborough, Demián Bichir, John Cho, Betty Gilpin, Lin Shaye, and Jacki Weaver, and follows a police officer who investigates several murders that are seemingly connected to a single house.', 'the_grudge.jpg', 'SxcDo12DvNY'),
(2, 'Underwater', 'Underwater is a 2020 American science fiction action horror film directed by William Eubank. The film stars Kristen Stewart, Vincent Cassel, Jessica Henwick, John Gallagher Jr., Mamoudou Athie, and T.J. Miller.', 'underwater.jpg', 'acDsd8iX4x4'),
(3, 'Like a Boss', 'Like a Boss is a 2020 American comedy film directed by Miguel Arteta, written by Sam Pitman and Adam Cole-Kelly, and starring Tiffany Haddish, Rose Byrne, and Salma Hayek. The plot follows two friends who attempt to take back control of their cosmetics company from an industry titan.', 'likeaboss.jpg', '9ESkyRFEso4'),
(4, 'Three Christs', 'Three Christs, also known as State of Mind, is a 2017 American drama film directed, co-produced, and co-written by Jon Avnet and based on Milton Rokeachs nonfiction book The Three Christs of Ypsilanti. It screened in the Gala Presentations section at the 2017 Toronto International Film Festival. The film is also known as: Three Christs of Ypsilanti, The Three Christs of Ypsilanti, Three Christs of Santa Monica, and The Three Christs of Santa Monica.', 'three_christs.jpg', '09zYzvKkCOA'),
(5, 'Inherit the Viper', 'Inherit the Viper is a 2019 American crime drama film directed by Anthony Jerjen, in his feature directorial debut, from a screenplay by Andrew Crabtree. It stars Josh Hartnett, Margarita Levieva, Chandler Riggs, Bruce Dern, Valorie Curry, Owen Teague, and Dash Mihok.', 'inherit_the_viper.jpg', 'b47kShWP3Kc'),
(6, 'The Sonata', 'The Sonata is a 2018 mystery thriller film, directed by Andrew Desmond, from a screenplay by Desmond and Arthur Morin. It stars Freya Tingley, Simon Abkarian, James Faulkner, Rutger Hauer, Matt Barber and James Kermack. It was released in the United States on January 10, 2020, by Screen Media Films. It grossed $146,595 at the box office and received mixed reviews from critics.', 'the_sonata.jpg', 'afdy7scrYgk');

-- Insertar en la tabla salas con capacidad
INSERT INTO "salas" ("id", "nombre", "direccion", "imagen_url", "capacidad") VALUES 
(1, 'Pabellón F1', 'Av. Club Golf los Incas 148, Surco', 'f1.jpg', 50),
(2, 'Pabellón L2', 'Jirón Cruz del Sur 15023, Surco', 'l2.jpg', 50),
(3, 'Pabellón N', 'Av. Club Golf los Incas 148, Surco', 'n.jpg', 50),
(4, 'Pabellón I1', 'Av. Club Golf los Incas 148, Surco', 'i1.jpg', 50),
(5, 'Pabellón C', 'Manuel Olguin 125, Surco', 'c.jpg', 50),
(6, 'Pabellón O1', 'Av. Club Golf los Incas 148, Surco', 'o1.jpg', 50),
(7, 'Pre de Lima', 'Las Palmas 199, La Molina', 'pre.jpg', 50);

-- Insertar en la tabla usuario
INSERT INTO "usuario" ("id", "nombre", "apellido", "dni", "correo", "password", "foto_perfil") VALUES 
(1, 'Franco', 'Cuya', '75995741', 'francocuya13@gmail.com', 'admin', '/profile_photos/usuario_1.jpg'),
(2, 'Juan', 'Perez', '12345678', 'aa@aa.com', '23NcjODrMvnqEz0', '/profile_photos/usuario_2.jpg'),
(3, 'Alex', 'Cruz', '72924493', 'admin@gmail.com', '123', '');

-- Insertar en la tabla pelicula_actor
INSERT INTO "pelicula_actor" ("id", "pelicula_id", "actor_id") VALUES 
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 2, 7),
(8, 2, 8),
(9, 2, 9),
(10, 2, 10),
(11, 2, 11),
(12, 2, 12),
(13, 3, 13),
(14, 3, 14),
(15, 3, 15),
(16, 3, 16),
(17, 3, 17),
(18, 4, 18),
(19, 4, 19),
(20, 4, 20),
(21, 4, 21),
(22, 5, 22),
(23, 5, 23),
(24, 5, 24),
(25, 5, 25),
(26, 5, 26),
(27, 6, 27),
(28, 6, 28),
(29, 6, 29),
(30, 6, 30);

-- Insertar en la tabla pelicula_genero
INSERT INTO "pelicula_genero" ("id", "pelicula_id", "genero_id") VALUES 
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 1),
(5, 2, 4),
(6, 3, 5),
(7, 4, 6),
(8, 5, 7),
(9, 5, 6),
(10, 6, 8),
(11, 6, 9);

-- Insertar en la tabla funciones
INSERT INTO "funciones" ("id", "pelicula_id", "sala_id", "fecha_hora") VALUES 
(1, 1, 1, '2024-04-23 15:30:00'),
(2, 2, 2, '2024-04-23 19:30:00'),
(3, 3, 3, '2024-04-23 16:00:00'),
(4, 1, 4, '2024-04-23 17:30:00'),
(5, 2, 5, '2024-04-23 18:20:00'),
(6, 3, 6, '2024-04-23 20:30:00'),
(7, 2, 1, '2024-04-23 21:30:00'),
(8, 3, 2, '2024-04-23 22:30:00'),
(9, 2, 1, '2024-04-24 15:30:00'),
(10, 3, 2, '2024-04-24 19:30:00'),
(11, 1, 3, '2024-04-24 16:00:00'),
(12, 2, 1, '2024-04-25 14:30:00'),
(13, 3, 2, '2024-04-25 16:45:00'),
(14, 1, 3, '2024-04-25 21:25:00'),
(15, 2, 1, '2024-04-23 14:00:00'),
(16, 2, 1, '2024-04-23 15:01:00'),
(17, 4, 1, '2024-04-23 13:30:00'),
(18, 5, 2, '2024-04-23 14:30:00'),
(19, 6, 3, '2024-04-23 15:30:00'),
(20, 4, 4, '2024-04-23 16:30:00'),
(21, 5, 5, '2024-04-23 17:30:00'),
(22, 6, 6, '2024-04-23 18:30:00'),
(23, 4, 1, '2024-04-23 19:30:00'),
(24, 5, 2, '2024-04-23 20:30:00'),
(25, 6, 3, '2024-04-23 21:30:00'),
(26, 4, 4, '2024-04-24 10:30:00'),
(27, 5, 5, '2024-04-24 11:30:00'),
(28, 6, 6, '2024-04-24 12:30:00'),
(29, 4, 1, '2024-04-24 13:30:00'),
(30, 5, 2, '2024-04-24 14:30:00'),
(31, 6, 3, '2024-04-24 15:30:00'),
(32, 4, 4, '2024-04-24 16:30:00'),
(33, 5, 5, '2024-04-24 17:30:00'),
(34, 6, 6, '2024-04-24 18:30:00'),
(35, 4, 1, '2024-04-24 19:30:00'),
(36, 5, 2, '2024-04-24 20:30:00'),
(37, 6, 3, '2024-04-24 21:30:00'),
(38, 4, 4, '2024-04-25 10:30:00'),
(39, 5, 5, '2024-04-25 11:30:00'),
(40, 6, 6, '2024-04-25 12:30:00'),
(41, 4, 1, '2024-04-25 13:30:00'),
(42, 5, 2, '2024-04-25 14:30:00'),
(43, 6, 3, '2024-04-25 15:30:00'),
(44, 4, 4, '2024-04-25 16:30:00'),
(45, 5, 5, '2024-04-25 17:30:00'),
(46, 6, 6, '2024-04-25 18:30:00'),
(47, 4, 1, '2024-04-25 19:30:00'),
(48, 5, 2, '2024-04-25 20:30:00'),
(49, 6, 3, '2024-04-25 21:30:00');

INSERT INTO "productos" ("nombre", "precio", "cantidad") VALUES
('Canchita Grande', 15.00, 100),
('Canchita Mediana', 10.00, 100),
('Canchita Pequeña', 7.00, 100),
('Gaseosa Grande', 12.00, 100),
('Gaseosa Mediana', 9.00, 100),
('Gaseosa Pequeña', 6.00, 100),
('Nachos', 18.00, 50),
('Hot Dog', 10.00, 50),
('Chocolate', 5.00, 100),
('Dulces', 3.00, 200),
('Agua', 4.00, 100);

INSERT INTO "asiento" ("fila", "columna") VALUES
('A', 1), ('A', 2), ('A', 3), ('A', 4), ('A', 5), ('A', 6), ('A', 7), ('A', 8), ('A', 9), ('A', 10),
('B', 1), ('B', 2), ('B', 3), ('B', 4), ('B', 5), ('B', 6), ('B', 7), ('B', 8), ('B', 9), ('B', 10),
('C', 1), ('C', 2), ('C', 3), ('C', 4), ('C', 5), ('C', 6), ('C', 7), ('C', 8), ('C', 9), ('C', 10),
('D', 1), ('D', 2), ('D', 3), ('D', 4), ('D', 5), ('D', 6), ('D', 7), ('D', 8), ('D', 9), ('D', 10),
('E', 1), ('E', 2), ('E', 3), ('E', 4), ('E', 5), ('E', 6), ('E', 7), ('E', 8), ('E', 9), ('E', 10);

INSERT INTO "reserva" ("userid") VALUES
(1), (2), (3);

INSERT INTO "funcion_asiento" ("asientoid", "funcionid") VALUES
-- Función 1
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (10, 1),
(11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1), (17, 1), (18, 1), (19, 1), (20, 1),
(21, 1), (22, 1), (23, 1), (24, 1), (25, 1), (26, 1), (27, 1), (28, 1), (29, 1), (30, 1),
(31, 1), (32, 1), (33, 1), (34, 1), (35, 1), (36, 1), (37, 1), (38, 1), (39, 1), (40, 1),
(41, 1), (42, 1), (43, 1), (44, 1), (45, 1), (46, 1), (47, 1), (48, 1), (49, 1), (50, 1),

-- Función 2
(1, 2), (2, 2), (3, 2), (4, 2), (5, 2), (6, 2), (7, 2), (8, 2), (9, 2), (10, 2),
(11, 2), (12, 2), (13, 2), (14, 2), (15, 2), (16, 2), (17, 2), (18, 2), (19, 2), (20, 2),
(21, 2), (22, 2), (23, 2), (24, 2), (25, 2), (26, 2), (27, 2), (28, 2), (29, 2), (30, 2),
(31, 2), (32, 2), (33, 2), (34, 2), (35, 2), (36, 2), (37, 2), (38, 2), (39, 2), (40, 2),
(41, 2), (42, 2), (43, 2), (44, 2), (45, 2), (46, 2), (47, 2), (48, 2), (49, 2), (50, 2),

-- Función 3
(1, 3), (2, 3), (3, 3), (4, 3), (5, 3), (6, 3), (7, 3), (8, 3), (9, 3), (10, 3),
(11, 3), (12, 3), (13, 3), (14, 3), (15, 3), (16, 3), (17, 3), (18, 3), (19, 3), (20, 3),
(21, 3), (22, 3), (23, 3), (24, 3), (25, 3), (26, 3), (27, 3), (28, 3), (29, 3), (30, 3),
(31, 3), (32, 3), (33, 3), (34, 3), (35, 3), (36, 3), (37, 3), (38, 3), (39, 3), (40, 3),
(41, 3), (42, 3), (43, 3), (44, 3), (45, 3), (46, 3), (47, 3), (48, 3), (49, 3), (50, 3),

-- Función 4
(1, 4), (2, 4), (3, 4), (4, 4), (5, 4), (6, 4), (7, 4), (8, 4), (9, 4), (10, 4),
(11, 4), (12, 4), (13, 4), (14, 4), (15, 4), (16, 4), (17, 4), (18, 4), (19, 4), (20, 4),
(21, 4), (22, 4), (23, 4), (24, 4), (25, 4), (26, 4), (27, 4), (28, 4), (29, 4), (30, 4),
(31, 4), (32, 4), (33, 4), (34, 4), (35, 4), (36, 4), (37, 4), (38, 4), (39, 4), (40, 4),
(41, 4), (42, 4), (43, 4), (44, 4), (45, 4), (46, 4), (47, 4), (48, 4), (49, 4), (50, 4),

-- Función 5
(1, 5), (2, 5), (3, 5), (4, 5), (5, 5), (6, 5), (7, 5), (8, 5), (9, 5), (10, 5),
(11, 5), (12, 5), (13, 5), (14, 5), (15, 5), (16, 5), (17, 5), (18, 5), (19, 5), (20, 5),
(21, 5), (22, 5), (23, 5), (24, 5), (25, 5), (26, 5), (27, 5), (28, 5), (29, 5), (30, 5),
(31, 5), (32, 5), (33, 5), (34, 5), (35, 5), (36, 5), (37, 5), (38, 5), (39, 5), (40, 5),
(41, 5), (42, 5), (43, 5), (44, 5), (45, 5), (46, 5), (47, 5), (48, 5), (49, 5), (50, 5),

-- Función 6
(1, 6), (2, 6), (3, 6), (4, 6), (5, 6), (6, 6), (7, 6), (8, 6), (9, 6), (10, 6),
(11, 6), (12, 6), (13, 6), (14, 6), (15, 6), (16, 6), (17, 6), (18, 6), (19, 6), (20, 6),
(21, 6), (22, 6), (23, 6), (24, 6), (25, 6), (26, 6), (27, 6), (28, 6), (29, 6), (30, 6),
(31, 6), (32, 6), (33, 6), (34, 6), (35, 6), (36, 6), (37, 6), (38, 6), (39, 6), (40, 6),
(41, 6), (42, 6), (43, 6), (44, 6), (45, 6), (46, 6), (47, 6), (48, 6), (49, 6), (50, 6),

-- Función 7
(1, 7), (2, 7), (3, 7), (4, 7), (5, 7), (6, 7), (7, 7), (8, 7), (9, 7), (10, 7),
(11, 7), (12, 7), (13, 7), (14, 7), (15, 7), (16, 7), (17, 7), (18, 7), (19, 7), (20, 7),
(21, 7), (22, 7), (23, 7), (24, 7), (25, 7), (26, 7), (27, 7), (28, 7), (29, 7), (30, 7),
(31, 7), (32, 7), (33, 7), (34, 7), (35, 7), (36, 7), (37, 7), (38, 7), (39, 7), (40, 7),
(41, 7), (42, 7), (43, 7), (44, 7), (45, 7), (46, 7), (47, 7), (48, 7), (49, 7), (50, 7),

-- Función 8
(1, 8), (2, 8), (3, 8), (4, 8), (5, 8), (6, 8), (7, 8), (8, 8), (9, 8), (10, 8),
(11, 8), (12, 8), (13, 8), (14, 8), (15, 8), (16, 8), (17, 8), (18, 8), (19, 8), (20, 8),
(21, 8), (22, 8), (23, 8), (24, 8), (25, 8), (26, 8), (27, 8), (28, 8), (29, 8), (30, 8),
(31, 8), (32, 8), (33, 8), (34, 8), (35, 8), (36, 8), (37, 8), (38, 8), (39, 8), (40, 8),
(41, 8), (42, 8), (43, 8), (44, 8), (45, 8), (46, 8), (47, 8), (48, 8), (49, 8), (50, 8),

-- Función 9
(1, 9), (2, 9), (3, 9), (4, 9), (5, 9), (6, 9), (7, 9), (8, 9), (9, 9), (10, 9),
(11, 9), (12, 9), (13, 9), (14, 9), (15, 9), (16, 9), (17, 9), (18, 9), (19, 9), (20, 9),
(21, 9), (22, 9), (23, 9), (24, 9), (25, 9), (26, 9), (27, 9), (28, 9), (29, 9), (30, 9),
(31, 9), (32, 9), (33, 9), (34, 9), (35, 9), (36, 9), (37, 9), (38, 9), (39, 9), (40, 9),
(41, 9), (42, 9), (43, 9), (44, 9), (45, 9), (46, 9), (47, 9), (48, 9), (49, 9), (50, 9),

-- Función 10
(1, 10), (2, 10), (3, 10), (4, 10), (5, 10), (6, 10), (7, 10), (8, 10), (9, 10), (10, 10),
(11, 10), (12, 10), (13, 10), (14, 10), (15, 10), (16, 10), (17, 10), (18, 10), (19, 10), (20, 10),
(21, 10), (22, 10), (23, 10), (24, 10), (25, 10), (26, 10), (27, 10), (28, 10), (29, 10), (30, 10),
(31, 10), (32, 10), (33, 10), (34, 10), (35, 10), (36, 10), (37, 10), (38, 10), (39, 10), (40, 10),
(41, 10), (42, 10), (43, 10), (44, 10), (45, 10), (46, 10), (47, 10), (48, 10), (49, 10), (50, 10);

INSERT INTO "entrada" ("idreserva", "asientofuncionid") VALUES
(1, 1), (1, 2), (1, 3), -- Usuario 1 reservando asientos para la función 1
(2, 51), (2, 52), (2, 53), -- Usuario 2 reservando asientos para la función 2
(3, 101), (3, 102), (3, 103); -- Usuario 3 reservando asientos para la función 3

INSERT INTO "compra_productos" ("reserva_id", "producto_id", "cantidad") VALUES
(1, 1, 2), -- Usuario 1 comprando 2 Canchita Grande
(1, 2, 1), -- Usuario 1 comprando 1 Canchita Mediana
(2, 4, 3), -- Usuario 2 comprando 3 Gaseosa Grande
(2, 7, 1), -- Usuario 2 comprando 1 Nachos
(3, 5, 2), -- Usuario 3 comprando 2 Gaseosa Mediana
(3, 9, 4); -- Usuario 3 comprando 4 Chocolates
