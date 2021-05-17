DROP TABLE jobs;
DROP TABLE parcels;
DROP TABLE deals;
DROP TABLE clients;
DROP TABLE addresses;
DROP TABLE couriers;
DROP TABLE vehicles;

CREATE TABLE addresses (
    address_id NUMBER NOT NULL,
    street VARCHAR2(40 CHAR) NOT NULL,
    house_flat_num NUMBER NOT NULL, 
    level_num NUMBER,
    town VARCHAR2(30 CHAR) NOT NULL,
    zip_code VARCHAR2(6 CHAR) NOT NULL,
    CONSTRAINT adressess_pk PRIMARY KEY(address_id)
);

CREATE TABLE clients (
    client_id NUMBER NOT NULL,
    surname VARCHAR2(30 CHAR) NOT NULL,
    forename VARCHAR2(20 CHAR) NOT NULL,
    email VARCHAR2(50 CHAR) NOT NULL UNIQUE,
    phone_number NUMBER(9) NOT NULL UNIQUE,
    address_id NUMBER NOT NULL,
    CONSTRAINT clients_pk PRIMARY KEY(client_id),
    CONSTRAINT clients_address_fk FOREIGN KEY(address_id) REFERENCES addresses(address_id)
);

CREATE TABLE vehicles (
    vehicle_id NUMBER NOT NULL,
    registration_num VARCHAR2(10 CHAR) NOT NULL UNIQUE,
    v_capacity NUMBER NOT NULL,
    v_load NUMBER NOT NULL,
    CONSTRAINT vehicles_pk PRIMARY KEY(vehicle_id)
);

CREATE TABLE couriers (
    courier_id NUMBER NOT NULL,
    surname VARCHAR2(30 CHAR) NOT NULL,
    forename VARCHAR2(20 CHAR) NOT NULL,
    phone_number NUMBER(9) NOT NULL UNIQUE,
    vehicle_id NUMBER NOT NULL,
    CONSTRAINT couriers_pk PRIMARY KEY(courier_id),
    CONSTRAINT couriers_vehicle_fk FOREIGN KEY(vehicle_id) REFERENCES vehicles(vehicle_id)
);

CREATE TABLE parcels (
    parcel_id NUMBER NOT NULL,
    p_type VARCHAR2(9 CHAR) NOT NULL, 
    p_size VARCHAR2(2 CHAR) NOT NULL,
    x_dim NUMBER,
    y_dim NUMBER,
    z_dim NUMBER,
    CONSTRAINT parcels_pk PRIMARY KEY(parcel_id)
);


CREATE TABLE deals (
    deal_id NUMBER NOT NULL,
    courier_id NUMBER NOT NULL,
    t_date VARCHAR2(16 CHAR) NOT NULL,
    new_status VARCHAR2(30 CHAR),
    CONSTRAINT deals_pk PRIMARY KEY(deal_id),
    CONSTRAINT deals_courier_fk FOREIGN KEY(courier_id) REFERENCES couriers(courier_id)
);

CREATE TABLE jobs (
    job_id NUMBER NOT NULL, 
    sender_id NUMBER NOT NULL,
    recipient_id NUMBER NOT NULL,
    parcel_id NUMBER NOT NULL,
    deal_id NUMBER NOT NULL,
    CONSTRAINT job_pk PRIMARY KEY (job_id),
    CONSTRAINT jobs_sender_fk FOREIGN KEY(sender_id) REFERENCES clients(client_id),
    CONSTRAINT jobs_recipient_fk FOREIGN KEY(recipient_id) REFERENCES clients(client_id),
    CONSTRAINT jobs_parcel_fk FOREIGN KEY(parcel_id) REFERENCES parcels(parcel_id),
    CONSTRAINT jobs_deal_fk FOREIGN KEY(deal_id) REFERENCES deals(deal_id)
);

