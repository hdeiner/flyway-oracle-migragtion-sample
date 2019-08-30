CREATE TABLE regions
(
    region_id NUMBER(10) NOT NULL,
    region_name VARCHAR2( 50 ) NOT NULL
);

ALTER TABLE regions ADD (
    CONSTRAINT region_pk PRIMARY KEY (region_id)
);

CREATE SEQUENCE region_seq START WITH 1;

CREATE TABLE countries
(
    country_id   CHAR( 2 ) PRIMARY KEY  ,
    country_name VARCHAR2( 40 ) NOT NULL,
    region_id    NUMBER                 , -- fk
    CONSTRAINT fk_countries_regions FOREIGN KEY( region_id )
        REFERENCES regions( region_id )
            ON DELETE CASCADE
);

