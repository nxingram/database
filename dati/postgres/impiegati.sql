--- 1. CREAZIONE TABELLE ---

-- Tabella Ufficio
CREATE TABLE IF NOT EXISTS ufficio (
    id SERIAL PRIMARY KEY,
    nome varchar(30) NOT NULL,
    luogo_id int
);

-- Tabella Impiegato
CREATE TABLE IF NOT EXISTS impiegato (
    id SERIAL PRIMARY KEY,
    nome varchar(50) NOT NULL,
    cognome varchar(50) NOT NULL,
    ruolo varchar(50),
    rif_to int, -- Colonna per la Self Join
    stipendio decimal(8,2),
    ufficio_id int,
    -- Vincoli
    CONSTRAINT FK_impiegato_ufficio FOREIGN KEY (ufficio_id) 
        REFERENCES ufficio(id),
    CONSTRAINT FK_impiegato_responsabile FOREIGN KEY (rif_to) 
        REFERENCES impiegato(id)
);

--- 2. INSERIMENTO DATI ---

-- Inserimento Uffici (Postgres non richiede IDENTITY_INSERT ON)
INSERT INTO ufficio (id, nome, luogo_id) VALUES
(1, 'IT', 20),
(2, 'Amministrazione', 12),
(3, 'Commerciale', 12),
(4, 'Logistica', 20);

-- Inserimento Impiegati
INSERT INTO impiegato (id, nome, cognome, ruolo, rif_to, stipendio, ufficio_id) VALUES
(1, 'Mario', 'Rossi', 'tecnico', NULL, 2500.00, 1),
(7, 'Elena', 'Totti', 'amministrativo', NULL, 2600.00, 2),
(8, 'Paola', 'Capra', 'venditore', NULL, 2300.00, 3),
(2, 'Marco', 'Bianchi', 'amministrativo', 7, 1600.00, 2),
(3, 'Paolo', 'Verdi', 'amministrativo', 7, 1600.00, 2),
(4, 'Enrico', 'Marrone', 'venditore', 8, 1300.00, 3),
(5, 'Nicola', 'Testa', 'venditore', 8, 1300.00, 3),
(6, 'Franco', 'Barba', 'tecnico', 1, 1500.00, 1),
(9, 'Mauro', 'Barba', 'venditore', 8, 1300.00, 3);

--- 3. SINCRONIZZAZIONE SEQUENZE (RESEED) ---

-- Sincronizziamo i contatori SERIAL con l'ID massimo inserito
SELECT setval(pg_get_serial_sequence('ufficio', 'id'), coalesce(max(id), 1)) FROM ufficio;
SELECT setval(pg_get_serial_sequence('impiegato', 'id'), coalesce(max(id), 1)) FROM impiegato;
