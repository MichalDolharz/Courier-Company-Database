create or replace PROCEDURE delAddress(
    street2 VARCHAR2,
    house_flat_num2 NUMBER, 
    town2 VARCHAR2
)
AS
n_count NUMBER;
BEGIN
    SELECT COUNT(1)
    INTO n_count
    FROM addresses
    WHERE street2 = street and house_flat_num2 = house_flat_num and town2 = town;
    IF n_count > 0 THEN      
        DELETE FROM addresses
        WHERE street2 = street and house_flat_num2 = house_flat_num and town2 = town;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Record from addresses has been deleted');

    ELSE
       DBMS_OUTPUT.PUT_LINE('Record dont exist');
       
    END IF;
END;
/

create or replace PROCEDURE delClient(
    surname2 VARCHAR2,
    forename2 VARCHAR2,
    email2 VARCHAR2
)
AS
    n_count NUMBER;
BEGIN
    SELECT COUNT(1)
    INTO n_count
    FROM clients
    WHERE surname2 = surname and forename2 = forename and email2 = email;
    IF n_count > 0 THEN      
        DELETE FROM clients
        WHERE surname2 = surname and forename2 = forename and email2 = email;        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Record from clients has been deleted');

    ELSE
       DBMS_OUTPUT.PUT_LINE('Record dont exist');
       
    END IF;
END;
/

create or replace PROCEDURE delCourier(
    surname2 VARCHAR2,
    forename2 VARCHAR2,
    phone_number2 NUMBER
)
AS
    n_count NUMBER;
BEGIN
    SELECT COUNT(1)
    INTO n_count
    FROM couriers
    WHERE surname2 = surname and forename2 = forename and phone_number2 = phone_number;
    IF n_count > 0 THEN      
        DELETE FROM couriers
        WHERE surname2 = surname and forename2 = forename and phone_number2 = phone_number;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Record from couriers has been deleted');

    ELSE
       DBMS_OUTPUT.PUT_LINE('Record dont exist');
       
    END IF;
END;
/

create or replace PROCEDURE addParcels(
    p_type VARCHAR2, 
    p_size VARCHAR2,
    x_dim NUMBER,
    y_dim NUMBER,
    z_dim NUMBER
)
AS BEGIN
    INSERT INTO parcels VALUES(PARCELS_SEQ.NEXTVAL, p_type, p_size, x_dim, y_dim, z_dim);
END;
/

create or replace PROCEDURE delVehicle(
    registration_num2 VARCHAR2
)
AS
    n_count NUMBER;
BEGIN
    SELECT COUNT(1)
    INTO n_count
    FROM vehicles
    WHERE registration_num2 = registration_num;
    IF n_count > 0 THEN      
        DELETE FROM vehicles
        WHERE registration_num2 = registration_num;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Record from vehicles has been deleted');
        
    ELSE
        DBMS_OUTPUT.PUT_LINE('Record dont exist');
    END IF;
    
END;
/