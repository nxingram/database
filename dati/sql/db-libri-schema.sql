-- Tabella Editore
IF OBJECT_ID('editore', 'U') IS NULL
BEGIN
    CREATE TABLE editore (
        id int IDENTITY(1,1) PRIMARY KEY,
        nome varchar(60) NOT NULL
    );
END

-- Tabella Autore
IF OBJECT_ID('autore', 'U') IS NULL
BEGIN
    CREATE TABLE autore (
        id int IDENTITY(1,1) PRIMARY KEY,
        nome varchar(30) NOT NULL,
        cognome varchar(50) NOT NULL
    );
END

-- Tabella Libro
IF OBJECT_ID('libro', 'U') IS NULL
BEGIN
    CREATE TABLE libro (
        id int IDENTITY(1,1) PRIMARY KEY,
        titolo varchar(255) NOT NULL,
        prezzo decimal(6,2),
        -- smallint unsigned non esiste, usiamo un vincolo CHECK
        pagine smallint CHECK (pagine > 0), 
        editore_id int,
        CONSTRAINT FK_libro_editore FOREIGN KEY (editore_id) 
            REFERENCES editore(id) ON DELETE SET NULL
    );
END

-- Tabella di relazione autore_libro (Molti-a-Molti)
IF OBJECT_ID('autore_libro', 'U') IS NULL
BEGIN
    CREATE TABLE autore_libro (
        id int IDENTITY(1,1) PRIMARY KEY,
        autore_id int NOT NULL,
        libro_id int NOT NULL,
        CONSTRAINT FK_rel_autore FOREIGN KEY (autore_id) 
            REFERENCES autore(id) ON DELETE CASCADE,
        CONSTRAINT FK_rel_libro FOREIGN KEY (libro_id) 
            REFERENCES libro(id) ON DELETE CASCADE
    );
END
