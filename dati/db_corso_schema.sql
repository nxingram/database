CREATE TABLE `studenti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `genere` enum('m','f','nb') DEFAULT NULL,
  `indirizzo` varchar(100) DEFAULT NULL,
  `citta` varchar(30) DEFAULT NULL,
  `provincia` char(2) DEFAULT 'To',
  `regione` varchar(30) DEFAULT 'Piemonte',
  `email` varchar(100) NOT NULL,
  `data_nascita` date DEFAULT NULL,
  `ins` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
)

create table if not exists corsi(
	id int auto_increment,
    titolo varchar(100) not null,
    prezzo decimal(6,2),
    docente_id int,
    primary key(id)
);

drop table docenti;
create table if not exists docenti(
	id int auto_increment primary key,
	nome varchar(50) not null,
    cognome varchar(50) not null,
    email varchar(100) not null,
    unique key email (email)
);

create table if not exists iscrizioni(
	id int auto_increment primary key,
	studente_id int not null,
    corso_id int not null,
    prezzo decimal(6,2),
    data_isc timestamp null default current_timestamp
);

