@'C:\Users\Komputer\Documents\OracleScripts\BD_projekt\create_db_tables.sql';
--@'C:\Users\Komputer\Documents\OracleScripts\BD_projekt\create_db_procedures.sql';

create or replace TRIGGER ADDRESSES2_TRG 
BEFORE INSERT ON ADDRESSES2 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ADDRESS_ID IS NULL THEN
      SELECT ADDRESSES2_SEQ.NEXTVAL INTO :NEW.ADDRESS_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;






INSERT INTO addresses VALUES(ADDRESSES_SEQ.NEXTVAL, 'Dupa', 45, NULL, NULL, 'Szczebrzeszyny Dolne', '12-345');
INSERT INTO clients VALUES(CLIENTS_SEQ.NEXTVAL, 'Maækowiak', 'Micha³', 'email1@gmail.com', 123456789, ADDRESSES_SEQ.CURRVAL);

CALL addAddress('Szeroka', 3, NULL, NULL, 'Wa³brzych', '58-300');
CALL addAddress('D³uga', NULL, , 2, 'Wroc³aw', '50-045');
CALL addClient('Kowalski', 'Jan', 'aaaaa@gmail.com', 111555677); -- nadawca
CALL addClient('Nowak', 'Adam', 'aaaaa@gmail.com', 111555677); -- odbiorca
CALL addVehicle('856472968', 60, 30);
CALL addCourier('Mickiewicz', 'Adam', 928573948);
CALL addParcels('Priorytet', 'L', 10, 20, 5);
CALL addDeal('Nadejœcie do magazy');

FUNKCJA
    SPRAWDZA CZY KLIENT EJST W BAZIE (CZY ADRES SIE ZGADZA, ITD)
        JEZELI NIE MA, TO TWORZYMY
        JEZELI JEST, TO POTRZEBUJEMY JEGO ID I DODAJEMY JAKO TO CO POTRZEBA


ONE BIG FUNKCJA
    
CALL addJob();

create or replace PROCEDURE addJob
AS BEGIN
    INSERT INTO jobs VALUES(
        JOBS_SEQ.NEXTVAL,
        CLIENTS_SEQ.CURRVAL-1,
        CLIENTS_SEQ.CURRVAL,  
        PARCELS_SEQ.CURRVAL, 
        DEALS_SEQ.CURRVAL
        );
END;
/

CREATE_JOB(aaaaaaaaaaaaaaaaaaaa)

    JOBS_SEQ.NEXTVAL, 
    CLIENTS_SEQ.CURRVAL-1,
    CLIENTS_SEQ.CURRVAL,
    PARCELS_SEQ.CURRVAL, DEALS_SEQ.CURRVAL

INSERT INTO addresses VALUES(1, 'Szeroka', 45, NULL, NULL, 'Szczebrzeszyny Dolne', '12-345');
INSERT INTO addresses VALUES(2, 'Dluga', 45, NULL, NULL, 'Szczebrzeszyny Gorne', '54-321');
INSERT INTO clients VALUES(1, 'Maækowiak', 'Micha³', 'email1@gmail.com', 123456789, 1); 
INSERT INTO clients VALUES(2, 'Do³harz', 'Micha³', 'email2@gmail.com', 123456789, 2); 
INSERT INTO vehicles VALUES(1, '1234567890', 90, 90);
INSERT INTO couriers VALUES(1, 'Mzyk', 'Grzegorz', 123456789, 1);
INSERT INTO deals VALUES(3, 1, TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD HH24:MI'), 'aa');
INSERT INTO parcels VALUES(1, 'Priorytet', 'M', 10, 20, 30);
INSERT INTO jobs VALUES(1, 1, 2, 1, 3);



