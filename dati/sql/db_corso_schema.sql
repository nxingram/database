-- Tabella Studenti
-- Nota: L'ENUM viene gestito con un vincolo CHECK
CREATE TABLE studenti (
  id int IDENTITY(1,1) PRIMARY KEY,
  nome varchar(40) NOT NULL,
  cognome varchar(50) NOT NULL,
  genere varchar(2) DEFAULT NULL,
  indirizzo varchar(100) DEFAULT NULL,
  citta varchar(30) DEFAULT NULL,
  provincia char(2) DEFAULT 'To',
  regione varchar(30) DEFAULT 'Piemonte',
  email varchar(100) NOT NULL,
  data_nascita date DEFAULT NULL,
  ins datetime2 DEFAULT GETDATE(),
  CONSTRAINT CK_genere CHECK (genere IN ('m', 'f', 'nb')),
  CONSTRAINT UQ_email_studenti UNIQUE (email)
);

-- Tabella Docenti
IF OBJECT_ID('docenti', 'U') IS NULL
BEGIN
    CREATE TABLE docenti (
        id int IDENTITY(1,1) PRIMARY KEY,
        nome varchar(50) NOT NULL,
        cognome varchar(50) NOT NULL,
        email varchar(100) NOT NULL,
        CONSTRAINT UQ_email_docenti UNIQUE (email)
    );
END

-- Tabella Corsi
IF OBJECT_ID('corsi', 'U') IS NULL
BEGIN
    CREATE TABLE corsi (
        id int IDENTITY(1,1) PRIMARY KEY,
        titolo varchar(100) NOT NULL,
        prezzo decimal(6,2),
        docente_id int
    );
END

-- Tabella Iscrizioni
IF OBJECT_ID('iscrizioni', 'U') IS NULL
BEGIN
    CREATE TABLE iscrizioni (
        id int IDENTITY(1,1) PRIMARY KEY,
        studente_id int NOT NULL,
        corso_id int NOT NULL,
        prezzo decimal(6,2),
        data_isc datetime2 DEFAULT GETDATE()
    );
END
