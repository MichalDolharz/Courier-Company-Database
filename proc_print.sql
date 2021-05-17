create or replace PROCEDURE printClient(
    client_surname VARCHAR2,
    client_name VARCHAR2,
    client_email VARCHAR2
)
AS
    idid NUMBER;
    tel_no NUMBER(9);
    add_id NUMBER;
BEGIN
    SELECT client_id, phone_number, address_id
    INTO idid, tel_no, add_id
    FROM clients
    WHERE surname = client_surname and client_name = forename and client_email = email;
    DBMS_OUTPUT.PUT_LINE(
    idid || ' | ' || 
    client_surname || ' | ' || 
    client_name || ' | ' || 
    client_email || ' | ' || 
    tel_no || ' | ' || 
    add_id || ' | '
    );
END;
/
