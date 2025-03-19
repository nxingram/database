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

