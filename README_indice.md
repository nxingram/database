# Database
Corso base database dialetto MySQL<br>

### Indice
1. [Database introduzione](https://github.com/nxingram/database/blob/main/1.0%20Database%20introduzione.md#database-introduzione)
   - [definizione](https://github.com/nxingram/database/blob/main/1.0%20Database%20introduzione.md#definizione)
   - [file-server vs. client-server](https://github.com/nxingram/database/blob/main/1.0%20Database%20introduzione.md#db-client-server)
   - RDBMS, ORDBMS, NoSQL
2. [DBMS: database management system](https://github.com/nxingram/database/blob/main/2.0%20DBMS.md#dbms-database-management-system)
   - [RDBMS](https://github.com/nxingram/database/blob/main/2.0%20DBMS.md#rdbms-relational-database-management-system)
   - [storage engine](https://github.com/nxingram/database/blob/main/2.0%20DBMS.md#storage-engine-o-db-engine)
   - [charset](https://github.com/nxingram/database/blob/main/2.0%20DBMS.md#charset)
3. [Modello Relazionale](https://github.com/nxingram/database/blob/main/3.0%20Modello%20Relazionale.md#il-modello-relazionale)
   - [simboli diagramma E-R](https://github.com/nxingram/database/blob/main/3.0%20Modello%20Relazionale.md#simboli-diagramma-e-r)
      - entità
      - attributi
         - PRIMARY KEY (PK)
      - relazioni 
         - cardinalità delle relazioni
   - esempi
      - modello concettuale
      - modello logico
   - esercizio diagramma e-r libro-autore-editore
4. Normalizzazione
5. Tipi di dato
6. Installazione MySQL e Workbench
    - video link
7. Accesso al DBMS
   - admin
   - user
8. SQL
   - DDL: data definition language
      - creazione databse
         - cancellare 
      - creazione tabelle
         - modificare tabelle
      - esercizio ddl
   - DCL: data control language
      - controllo accessi e permessi
         - CREATE USER
         - GRANT
   - DML: data manipulatiuon language (CRUD)
      - INSERT INTO
      - SELECT
         - insert into select
         - create table select
         - duplicare tabelle e contenuti
      - UPDATE
      - commenti
      - esercizio dml
   - Query: query language
      - esercizio query studenti
      - esercizio creazione database corsi
9. Integrità referenziale
10. Union e Join
   - esercizio query corsi
   - esercizio query corsi join
11. Funzioni
   - Aggregazione (avg, count, min-max, sum)
   - Matematiche (floor, ceiling, round, length, concat, concat_ws, substring, left-right)
       - funzioni combinate
       - funzioni informative
       - aggiornamento o sostituzione (replace)
       - data e ora (now, curadate, curtime, year, month, day, hour, minute, second, dayname, monthname, localization)
          - formattazione (date_format, time_format, str_to_date)
          - calcoli date e orari (adddate, addtime, subdate, datediff, timestampadd, timestampdiff)
             - calcolare l'età 
   - Control flow function
   - esercizio funzioni
12. Raggruppamenti
   - esercizio group by
13. TODO: Windows Function (funzioni finestra)
14. Viste
   - esercizio viste
15. TODO: Subquery
16. Backup e ripristino
17. TODO: Indici

## Insatallazione (Windows)
- [MySQL Server Community e Workbench](https://youtu.be/uRw5oNBLW6E)

## Link utili
- [Guida MySQL HTML.it](https://www.html.it/guide/guida-mysql/)

