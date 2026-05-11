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

-- Inserimento Uffici
SET IDENTITY_INSERT ufficio ON;
INSERT INTO ufficio (id, nome, luogo_id) VALUES
(1, 'IT', 20),
(2, 'Amministrazione', 12),
(3, 'Commerciale', 12),
(4, 'Logistica', 20);
SET IDENTITY_INSERT ufficio OFF;

-- Inserimento Impiegati
SET IDENTITY_INSERT impiegato ON;
INSERT INTO impiegato (id, nome, cognome, ruolo, rif_to, stipendio, ufficio_id) VALUES
(1, 'Mario', 'Rossi', 'tecnico', NULL, 2500.00, 1),
(7, 'Elena', 'Totti', 'amministrativo', NULL, 2600.00, 2),
(8, 'Paola', 'Capra', 'venditore', NULL, 2300.00, 3),
-- Inserisco prima i capi (senza rif_to) e poi i sottoposti per evitare errori di vincolo FK
(2, 'Marco', 'Bianchi', 'amministrativo', 7, 1600.00, 2),
(3, 'Paolo', 'Verdi', 'amministrativo', 7, 1600.00, 2),
(4, 'Enrico', 'Marrone', 'venditore', 8, 1300.00, 3),
(5, 'Nicola', 'Testa', 'venditore', 8, 1300.00, 3),
(6, 'Franco', 'Barba', 'tecnico', 1, 1500.00, 1),
(9, 'Mauro', 'Barba', 'venditore', 8, 1300.00, 3);
SET IDENTITY_INSERT impiegato OFF;

-- Reset dei contatori
DBCC CHECKIDENT ('ufficio', RESEED);
DBCC CHECKIDENT ('impiegato', RESEED);
