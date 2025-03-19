create table if not exists  editore (
	id int primary key auto_increment,
    nome varchar(60)
);

#tabella autore
create table if not exists autore(
	id int primary key auto_increment,
    nome varchar(30),
    cognome varchar(50)
);

#tabella libro
create table if not exists libro(
	id int primary key auto_increment,
    titolo varchar(255),
    prezzo decimal(6,2),
    pagine smallint unsigned,
    editore_id int
);

#ultima tabella, relazione libro_autore
create table if not exists autore_libro(
	id int auto_increment,
    autore_id int,
    libro_id int,
    primary key(id)
);
