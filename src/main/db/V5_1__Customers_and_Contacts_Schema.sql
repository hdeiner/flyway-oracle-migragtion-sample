CREATE TABLE customers
(
    customer_id NUMBER(10) UNIQUE,
    name         VARCHAR2( 255 ) NOT NULL,
    address      VARCHAR2( 255 )         ,
    website      VARCHAR2( 255 )         ,
    credit_limit NUMBER( 8, 2 )
);

CREATE SEQUENCE customer_seq START WITH 1;

CREATE TABLE contacts
(
    contact_id NUMBER(10) UNIQUE,
    first_name  VARCHAR2( 255 ) NOT NULL,
    last_name   VARCHAR2( 255 ) NOT NULL,
    email       VARCHAR2( 255 ) NOT NULL,
    phone       VARCHAR2( 20 )          ,
    customer_id NUMBER                  ,
    CONSTRAINT fk_contacts_customers
        FOREIGN KEY( customer_id )
            REFERENCES customers( customer_id )
                ON DELETE CASCADE
);

CREATE SEQUENCE contact_seq START WITH 1;