CREATE TABLE locations
(
    location_id NUMBER(10) NOT NULL,
    address     VARCHAR2( 255 ) NOT NULL,
    postal_code VARCHAR2( 20 )          ,
    city        VARCHAR2( 50 )          ,
    state       VARCHAR2( 50 )          ,
    country_id  CHAR( 2 )               , -- fk
    CONSTRAINT fk_locations_countries
        FOREIGN KEY( country_id )
            REFERENCES countries( country_id )
                ON DELETE CASCADE
);

ALTER TABLE locations ADD (
    CONSTRAINT location_pk PRIMARY KEY (location_id)
);

CREATE SEQUENCE location_seq START WITH 1;

CREATE TABLE warehouses
(
    warehouse_id NUMBER(10) NOT NULL,
    warehouse_name VARCHAR( 255 ) ,
    location_id    NUMBER( 12, 0 ), -- fk
    CONSTRAINT fk_warehouses_locations
        FOREIGN KEY( location_id )
            REFERENCES locations( location_id )
                ON DELETE CASCADE
);