create table if not exists ufficio(
    id int auto_increment,
    nome varchar(30),
    luogo_id int,
    primary key(id)
);

create table if not exists impiegato(
    id int auto_increment,
    nome varchar(50),
    cognome varchar(50),
    ruolo varchar(50),
    rif_to int,
    stipendio decimal(6,2),
    ufficio_id int,
    primary key(id)
);



INSERT INTO ufficio (id, nome, luogo_id) VALUES
(1, 'IT', 20),
(2, 'Amministrazione', 12),
(3, 'Commerciale', 12),
(4, 'Logistica', 20);

INSERT INTO impiegato (id, nome, cognome, ruolo, rif_to, stipendio, ufficio_id) VALUES
(1, 'Mario', 'Rossi', 'tecnico', NULL, '2500.00', 1),
(2, 'Marco', 'Bianchi', 'amministrativo', 7, '1600.00', 2),
(3, 'Paolo', 'Verdi', 'amministrativo', 7, '1600.00', 2),
(4, 'Enrico', 'Marrone', 'venditore', 8, '1300.00', 3),
(5, 'Nicola', 'Testa', 'venditore', 8, '1300.00', 3),
(6, 'Franco', 'Barba', 'tecnico', 1, '1500.00', 1),
(7, 'Elena', 'Totti', 'amministrativo', NULL, '2600.00', 2),
(8, 'Paola', 'Capra', 'venditore', NULL, '2300.00', 3),
(9, 'Mauro', 'Barba', 'venditore', 8, '1300.00', 3);
