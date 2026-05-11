-- Tabella Ufficio
IF OBJECT_ID('ufficio', 'U') IS NULL
BEGIN
    CREATE TABLE ufficio (
        id int IDENTITY(1,1) PRIMARY KEY,
        nome varchar(30) NOT NULL,
        luogo_id int
    );
END

-- Tabella Impiegato
IF OBJECT_ID('impiegato', 'U') IS NULL
BEGIN
    CREATE TABLE impiegato (
        id int IDENTITY(1,1) PRIMARY KEY,
        nome varchar(50) NOT NULL,
        cognome varchar(50) NOT NULL,
        ruolo varchar(50),
        rif_to int, -- Colonna per la Self Join
        stipendio decimal(8,2), -- Aumentato a 8 per sicurezza
        ufficio_id int,
        CONSTRAINT FK_impiegato_ufficio FOREIGN KEY (ufficio_id) 
            REFERENCES ufficio(id),
        CONSTRAINT FK_impiegato_responsabile FOREIGN KEY (rif_to) 
            REFERENCES impiegato(id) -- Foreign Key sulla tabella stessa
    );
END
