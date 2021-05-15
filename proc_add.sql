create or replace PROCEDURE addAddress(
    street VARCHAR2,
    house_num NUMBER, 
    flat_num NUMBER,
    level_num NUMBER,
    town VARCHAR2,
    zip_code VARCHAR2
)
AS BEGIN
    INSERT INTO addresses VALUES(ADDRESSES_SEQ.NEXTVAL, street, house_num, flat_num, level_num, town, zip_code);
END;
/


create or replace PROCEDURE addClient(
    surname VARCHAR2,
    forename VARCHAR2,
    email VARCHAR2,
    phone_number NUMBER
)
AS BEGIN
    INSERT INTO clients VALUES(CLIENTS_SEQ.NEXTVAL, surname, forename, email, phone_number, ADDRESSES_SEQ.CURRVAL);
END;
/

create or replace PROCEDURE addCourier(
    surname VARCHAR2,
    forename VARCHAR2,
    phone_number NUMBER
)
AS BEGIN
    INSERT INTO couriers VALUES(COURIERS_SEQ.NEXTVAL, surname, forename, phone_number, VEHICLES_SEQ.CURRVAL);
END;
/


create or replace PROCEDURE addDeal(
    courier_id NUMBER,
    new_status VARCHAR2
)
AS BEGIN
    INSERT INTO deals VALUES(DEALS_SEQ.NEXTVAL, courier_id, TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD HH24:MI'), new_status);
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

create or replace PROCEDURE addVehicle(
    registration_num VARCHAR2,
    v_capacity NUMBER,
    v_load NUMBER
)
AS BEGIN
    INSERT INTO vehicles VALUES(vehicles_SEQ.NEXTVAL, registration_num, v_capacity, v_load);
END;
/