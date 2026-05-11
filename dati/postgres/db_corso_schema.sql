-- 1. Tabella Studenti
CREATE TABLE IF NOT EXISTS studenti (
    id SERIAL PRIMARY KEY,
    nome varchar(40) NOT NULL,
    cognome varchar(50) NOT NULL,
    genere varchar(2) DEFAULT NULL,
    indirizzo varchar(100) DEFAULT NULL,
    citta varchar(30) DEFAULT NULL,
    provincia char(2) DEFAULT 'To',
    regione varchar(30) DEFAULT 'Piemonte',
    email varchar(100) NOT NULL,
    data_nascita date DEFAULT NULL,
    -- In Postgres usiamo timestamp o timestamptz al posto di datetime2
    -- CURRENT_TIMESTAMP è lo standard SQL equivalente a GETDATE()
    ins timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT CK_genere CHECK (genere IN ('m', 'f', 'nb')),
    CONSTRAINT UQ_email_studenti UNIQUE (email)
);

-- 2. Tabella Docenti
CREATE TABLE IF NOT EXISTS docenti (
    id SERIAL PRIMARY KEY,
    nome varchar(50) NOT NULL,
    cognome varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    CONSTRAINT UQ_email_docenti UNIQUE (email)
);

-- 3. Tabella Corsi
CREATE TABLE IF NOT EXISTS corsi (
    id SERIAL PRIMARY KEY,
    titolo varchar(100) NOT NULL,
    prezzo decimal(6,2),
    docente_id int,
    CONSTRAINT FK_corsi_docenti FOREIGN KEY (docente_id) 
        REFERENCES docenti(id) ON DELETE SET NULL
);

-- 4. Tabella Iscrizioni
CREATE TABLE IF NOT EXISTS iscrizioni (
    id SERIAL PRIMARY KEY,
    studente_id int NOT NULL,
    corso_id int NOT NULL,
    prezzo decimal(6,2),
    data_isc timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_iscrizioni_studenti FOREIGN KEY (studente_id) 
        REFERENCES studenti(id) ON DELETE CASCADE,
    CONSTRAINT FK_iscrizioni_corsi FOREIGN KEY (corso_id) 
        REFERENCES corsi(id) ON DELETE CASCADE
);
