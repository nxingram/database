--- INSERIMENTO AUTORI ---
INSERT INTO autore (id, nome, cognome) VALUES 
(1,'John Ronald Reuel','Tolkien'),(2,'Dan','Brown'),(3,'Paulo','Coelho'),
(4,'J. D.','Salinger'),(5,'Agatha','Christie'),(6,'J. K.','Rowling'),
(7,'Tsao','Chan'),(8,'E. L.','James'),(9,'Antoine','de Saint-Exupéry'),
(10,'Charles','Dickens'),(11,'Miguel','de Cervantes'),(12,'Clive Staples','Lewis'),
(13,'Tse-tung','Mao'),(14,'Michele','Rech, Zerocalcare'),(15,'Andrea','Camilleri'),
(16,'Ken','Follett'),(17,'Kazuo','Ishiguro'),(18,'Carlo','Fruttero'),
(19,'Franco','Lucentini'),(20,'Italo','Calvino'),(21,'Stephen','King'),
(22,'Isabel','Allende');

--- INSERIMENTO EDITORI ---
INSERT INTO editore (id, nome) VALUES 
(1,'Mondadori'),(3,'Einaudi'),(4,'Salani'),(5,'Edizioni Clandestine'),
(6,'Bao Publishing'),(7,'Sellerio'),(8,'BUR'),(9,'Sperling & Kupfer'),
(10,'Bompiani'),(11,'Adelphi');

--- INSERIMENTO LIBRI ---
INSERT INTO libro (id, titolo, prezzo, pagine, editore_id) VALUES 
(1,'Alchimista (L'')',12.00,184,10),
(2,'Cinquanta sfumature di grigio',10.20,560,1),
(3,'Dieci piccoli indiani',10.20,208,1),
(4,'Don Chisciotte della Mancha',20.40,NULL,3),
(5,'Harry Potter e la Pietra Cancellale',8.50,302,4),
(6,'Il Codice da Vinci',11.00,512,1),
(7,'Il giovane Holden',10.20,251,3),
(8,'Il leone, la strega e l''armadio',7.65,182,1),
(9,'Il libretto rosso',7.22,160,5),
(10,'Il Piccolo Principe',4.25,95,1),
(11,'Il Signore degli Anelli',25.00,1255,10),
(12,'Il sogno della camera rossa',15.30,721,3),
(13,'La colonna di fuoco',27.00,912,1),
(14,'La donna della domenica',12.00,434,1),
(15,'Lo Hobbit',9.35,417,10),
(16,'Macerie prime',14.45,192,6),
(17,'Origin',21.25,564,1),
(18,'Quel che resta del giorno',12.00,276,3),
(19,'Un mese con Montalbano',12.75,512,7),
(20,'Una storia tra due città',9.77,600,10),
(21,'Marcovaldo',10.00,120,7),
(22,'IT',25.00,550,9),
(23,'gomorra',12.59,345,1);

--- INSERIMENTO RELAZIONE AUTORE_LIBRO ---
INSERT INTO autore_libro (id, autore_id, libro_id) VALUES 
(1,1,3),(2,2,8),(3,3,5),(4,4,11),(5,5,6),(6,6,2),(7,7,4),(8,8,12),(9,9,13),
(10,10,9),(11,11,1),(12,12,7),(13,13,16),(14,14,18),(15,14,19),(16,15,1),
(17,16,14),(18,17,2),(19,18,17),(20,19,15),(21,20,10),(22,21,20),(23,22,21);

--- RESET DEI CONTATORI (L'equivalente di DBCC CHECKIDENT) ---
-- In Postgres dobbiamo dire alla sequenza di ripartire dal valore massimo attuale + 1
SELECT setval(pg_get_serial_sequence('autore', 'id'), coalesce(max(id), 1)) FROM autore;
SELECT setval(pg_get_serial_sequence('editore', 'id'), coalesce(max(id), 1)) FROM editore;
SELECT setval(pg_get_serial_sequence('libro', 'id'), coalesce(max(id), 1)) FROM libro;
SELECT setval(pg_get_serial_sequence('autore_libro', 'id'), coalesce(max(id), 1)) FROM autore_libro;
