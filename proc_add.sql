create or replace PROCEDURE addAddress(
    street2 VARCHAR2,
    house_flat_num2 NUMBER,
    level_num2 NUMBER,
    town2 VARCHAR2,
    zip_code2 VARCHAR2
)
AS 
    n_count NUMBER;
BEGIN
    SELECT COUNT(1)
    INTO n_count
    FROM addresses
    WHERE street2 = street 
    and house_flat_num2 = house_flat_num 
    and town2 = town
    and zip_code2 = zip_code;
    
    IF n_count > 0 THEN      
        DBMS_OUTPUT.PUT_LINE('Record exist');
        
    ELSE
        INSERT INTO addresses 
        VALUES(ADDRESSES_SEQ.NEXTVAL, 
            street2, 
            house_flat_num2, 
            level_num2, 
            town2, 
            zip_code2);
        COMMIT;
       
    END IF;
    
END;
/


create or replace PROCEDURE addClient(
    surname2 VARCHAR2,
    forename2 VARCHAR2,
    email2 VARCHAR2,
    phone_number2 NUMBER,
    street2 VARCHAR2,
    house_flat_num2 NUMBER, 
    town2 VARCHAR2
)
AS
    n_count NUMBER;
BEGIN
    SELECT COUNT(1)
    INTO n_count
    FROM clients
    WHERE email = email2 and phone_number = phone_number2;
    IF n_count > 0 THEN      
        DBMS_OUTPUT.PUT_LINE('Record exist');
        
    ELSE
       INSERT INTO clients VALUES(CLIENTS_SEQ.NEXTVAL, surname2, forename2, email2, phone_number2,
       (SELECT address_id FROM addresses 
       WHERE street2 = street and town2 = town and house_flat_num2 = house_flat_num));
       COMMIT;
       
    END IF;
    
END;
/

create or replace PROCEDURE addCourier(
    surname2 VARCHAR2,
    forename2 VARCHAR2,
    phone_number2 NUMBER,
    vehicle_id2 NUMBER
)
AS
    n_count NUMBER;
BEGIN
    SELECT COUNT(1)
    INTO n_count
    FROM clients
    WHERE surname2 = surname and forename2 = forename and phone_number2 = phone_number;
    IF n_count > 0 THEN      
        DBMS_OUTPUT.PUT_LINE('Record exist');

    ELSE
        INSERT INTO couriers 
        VALUES(COURIERS_SEQ.NEXTVAL, surname2, forename2, phone_number2, vehicle_id2);
        COMMIT; 
    END IF;

END;
/


create or replace PROCEDURE addDeal(
    courier_id NUMBER,
    new_status VARCHAR2
)
AS BEGIN
    INSERT INTO deals VALUES(DEALS_SEQ.NEXTVAL, COURIERS_SEQ.CURRVAL, TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD HH24:MI'), new_status);
END;
/


create or replace PROCEDURE addParcels(
    p_type VARCHAR2, 
    x_dim NUMBER,
    y_dim NUMBER,
    z_dim NUMBER
)
AS BEGIN
    INSERT INTO parcels VALUES(PARCELS_SEQ.NEXTVAL, p_type, parcelSize(x_dim, y_dim, z_dim), x_dim, y_dim, z_dim);
END;
/

create or replace PROCEDURE addCourier(
    surname2 VARCHAR2,
    forename2 VARCHAR2,
    phone_number2 NUMBER
)
AS
    n_count NUMBER;
BEGIN
    SELECT COUNT(1)
    INTO n_count
    FROM clients
    WHERE surname2 = surname and forename2 = forename and phone_number2 = phone_number;
    IF n_count > 0 THEN      
        DBMS_OUTPUT.PUT_LINE('Record exist');

    ELSE
        INSERT INTO couriers 
        VALUES(COURIERS_SEQ.NEXTVAL, surname2, forename2, phone_number2, VEHICLES_SEQ.CURRVAL);
        COMMIT; 
    END IF;

END;
/

create or replace PROCEDURE addJob(
    send_email VARCHAR2,
    rec_email VARCHAR2
)
AS
BEGIN
    INSERT INTO jobs
    VALUES(
        JOBS_SEQ.NEXTVAL, 
        (SELECT client_id FROM clients WHERE send_email = email),
        (SELECT client_id FROM clients WHERE rec_email = email),
        PARCELS_SEQ.CURRVAL,
        DEALS_SEQ.CURRVAL);
    COMMIT;

END;
/

create or replace PROCEDURE addVehicle(
    registration_num2 VARCHAR2,
    v_capacity2 NUMBER,
    v_load2 NUMBER
)
AS
    n_count NUMBER;
BEGIN
    SELECT COUNT(1)
    INTO n_count
    FROM vehicles
    WHERE registration_num2 = registration_num;
    IF n_count > 0 THEN      
        DBMS_OUTPUT.PUT_LINE('Record exist');

    ELSE
        INSERT INTO vehicles 
        VALUES(vehicles_SEQ.NEXTVAL, registration_num2, v_capacity2, v_load2);
        COMMIT; 
    END IF;

END;
/
