Estensioni Procedurali (stored procedure) in MySQL: Una Guida per Principianti

1. Cosa sono le Estensioni Procedurali?

Immagina di avere una serie di comandi SQL che esegui ripetutamente. Invece di digitarli ogni volta, puoi raggrupparli in un "programma memorizzato" all'interno del tuo database. Questa è un'estensione procedurale. Ti permette di aggiungere logica (come istruzioni IF e cicli) al tuo SQL.

2. Procedure Memorizzate: I Cavalli di Battaglia

    Cosa fanno:
        Una procedura memorizzata è un blocco di codice SQL che puoi salvare ed eseguire per nome.
        Possono accettare parametri di input, eseguire calcoli e restituire risultati.
        Sono ottime per attività che esegui spesso.
    Sintassi di Base:

SQL

DELIMITER // -- Cambia il delimitatore a // (perché ; è usato all'interno della procedura)

CREATE PROCEDURE mia_procedura(IN valore_input INT)
BEGIN
    -- Le istruzioni SQL vanno qui
    SELECT valore_input * 2;
END //

DELIMITER ; -- Reimposta il delimitatore a ;

-- Per chiamare la procedura:
CALL mia_procedura(10);

    Spiegazione:
        DELIMITER // dice a MySQL di usare // come marcatore di fine istruzione, in modo che non tenti di eseguire la procedura prematuramente.
        CREATE PROCEDURE mia_procedura(IN valore_input INT) crea una procedura chiamata mia_procedura che accetta un input intero. IN significa input.
        BEGIN...END racchiude il blocco di codice della procedura.
        SELECT valore_input * 2; è una semplice istruzione SQL all'interno della procedura.
        DELIMITER ; reimposta il delimitatore.
        CALL mia_procedura(10); esegue la procedura, passando il valore 10.
    Esempio con una Variabile:

SQL

DELIMITER //

CREATE PROCEDURE calcola_somma(IN a INT, IN b INT, OUT somma INT)
BEGIN
    SET somma = a + b;
END //

DELIMITER ;

-- Per chiamare la procedura e ottenere l'output:
CALL calcola_somma(5, 3, @risultato);
SELECT @risultato;

    Spiegazione:
        OUT somma INT definisce un parametro di output.
        SET somma = a + b; assegna la somma alla variabile di output.
        @risultato è una variabile definita dall'utente per memorizzare l'output.

3. Funzioni Memorizzate: Restituire Valori

    Cosa fanno:
        Simili alle procedure, ma devono necessariamente restituire un singolo valore.
        Puoi usarle nelle query SQL, come le funzioni integrate.
    Sintassi di Base:

SQL

DELIMITER //

CREATE FUNCTION raddoppia_numero(numero_input INT) RETURNS INT
BEGIN
    RETURN numero_input * 2;
END //

DELIMITER ;

-- Per usare la funzione:
SELECT raddoppia_numero(7);

    Spiegazione:
        RETURNS INT specifica il tipo di dati del valore che la funzione restituisce.
        RETURN numero_input * 2; restituisce il valore calcolato.

4. Concetti Chiave:

    DELIMITER: Necessario quando si creano procedure o funzioni, poiché contengono punti e virgola all'interno del loro codice.
    IN, OUT, INOUT: Modalità dei parametri. IN è per l'input, OUT è per l'output e INOUT è per entrambi.
    BEGIN...END: Racchiude il blocco di codice.
    SET: Usato per assegnare valori alle variabili.
    RETURN: Usato per restituire un valore da una funzione.
    CALL: usato per chiamare una procedura memorizzata.
