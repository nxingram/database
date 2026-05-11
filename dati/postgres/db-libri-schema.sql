-- Tabella Editore
-- In Postgres usiamo SERIAL per l'auto-incremento e IF NOT EXISTS per il controllo
CREATE TABLE IF NOT EXISTS editore (
    id SERIAL PRIMARY KEY,
    nome varchar(60) NOT NULL
);

-- Tabella Autore
CREATE TABLE IF NOT EXISTS autore (
    id SERIAL PRIMARY KEY,
    nome varchar(30) NOT NULL,
    cognome varchar(50) NOT NULL
);

-- Tabella Libro
CREATE TABLE IF NOT EXISTS libro (
    id SERIAL PRIMARY KEY,
    titolo varchar(255) NOT NULL,
    prezzo decimal(6,2),
    -- Postgres gestisce i vincoli CHECK in modo molto pulito
    pagine smallint CHECK (pagine > 0), 
    editore_id int,
    CONSTRAINT FK_libro_editore FOREIGN KEY (editore_id) 
        REFERENCES editore(id) ON DELETE SET NULL
);

-- Tabella di relazione autore_libro (Molti-a-Molti)
CREATE TABLE IF NOT EXISTS autore_libro (
    id SERIAL PRIMARY KEY,
    autore_id int NOT NULL,
    libro_id int NOT NULL,
    CONSTRAINT FK_rel_autore FOREIGN KEY (autore_id) 
        REFERENCES autore(id) ON DELETE CASCADE,
    CONSTRAINT FK_rel_libro FOREIGN KEY (libro_id) 
        REFERENCES libro(id) ON DELETE CASCADE
);
