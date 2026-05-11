-- 1. Tabella Studenti (Nessuna dipendenza)
IF OBJECT_ID('studenti', 'U') IS NULL
BEGIN
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
END

-- 2. Tabella Docenti (Nessuna dipendenza)
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

-- 3. Tabella Corsi (Dipende da Docenti)
IF OBJECT_ID('corsi', 'U') IS NULL
BEGIN
    CREATE TABLE corsi (
        id int IDENTITY(1,1) PRIMARY KEY,
        titolo varchar(100) NOT NULL,
        prezzo decimal(6,2),
        docente_id int,
        -- Relazione: Se un docente viene eliminato, il corso rimane ma docente_id diventa NULL
        CONSTRAINT FK_corsi_docenti FOREIGN KEY (docente_id) 
            REFERENCES docenti(id) ON DELETE SET NULL
    );
END

-- 4. Tabella Iscrizioni (Dipende da Studenti e Corsi)
IF OBJECT_ID('iscrizioni', 'U') IS NULL
BEGIN
    CREATE TABLE iscrizioni (
        id int IDENTITY(1,1) PRIMARY KEY,
        studente_id int NOT NULL,
        corso_id int NOT NULL,
        prezzo decimal(6,2),
        data_isc datetime2 NOT NULL DEFAULT GETDATE(),
        -- Relazioni: Se elimino uno studente o un corso, elimino anche l'iscrizione (CASCADE)
        CONSTRAINT FK_iscrizioni_studenti FOREIGN KEY (studente_id) 
            REFERENCES studenti(id) ON DELETE CASCADE,
        CONSTRAINT FK_iscrizioni_corsi FOREIGN KEY (corso_id) 
            REFERENCES corsi(id) ON DELETE CASCADE
    );
END
