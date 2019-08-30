CREATE TABLE product_categories
(
    category_id NUMBER(10) UNIQUE,
    category_name VARCHAR2( 255 ) NOT NULL
);

CREATE SEQUENCE product_categories_seq START WITH 6;

CREATE TABLE products
(
    product_id NUMBER(10) UNIQUE,
    product_name  VARCHAR2( 255 ) NOT NULL,
    description   VARCHAR2( 2000 )        ,
    standard_cost NUMBER( 9, 2 )          ,
    list_price    NUMBER( 9, 2 )          ,
    category_id   NUMBER NOT NULL         ,
    CONSTRAINT fk_products_categories
        FOREIGN KEY( category_id )
            REFERENCES product_categories( category_id )
                ON DELETE CASCADE
);

CREATE SEQUENCE product_seq START WITH 289;