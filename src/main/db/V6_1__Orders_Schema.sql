CREATE TABLE orders
(
    order_id NUMBER(10) UNIQUE,
    customer_id NUMBER( 6, 0 ) NOT NULL, -- fk
    status      VARCHAR( 20 ) NOT NULL ,
    salesman_id NUMBER( 6, 0 )         , -- fk
    order_date  DATE NOT NULL          ,
    CONSTRAINT fk_orders_customers
        FOREIGN KEY( customer_id )
            REFERENCES customers( customer_id )
                ON DELETE CASCADE,
    CONSTRAINT fk_orders_employees
        FOREIGN KEY( salesman_id )
            REFERENCES employees( employee_id )
                ON DELETE SET NULL
);

CREATE SEQUENCE order_seq START WITH 100;

CREATE TABLE order_items
(
    order_item_id NUMBER(10) UNIQUE,
    order_id   NUMBER( 12, 0 )                                , -- fk
    item_id    NUMBER( 12, 0 )                                ,
    product_id NUMBER( 12, 0 ) NOT NULL                       , -- fk
    quantity   NUMBER( 8, 2 ) NOT NULL                        ,
    unit_price NUMBER( 8, 2 ) NOT NULL                        ,
    CONSTRAINT pk_order_items
        PRIMARY KEY( order_id, item_id ),
    CONSTRAINT fk_order_items_products
        FOREIGN KEY( product_id )
            REFERENCES products( product_id )
                ON DELETE CASCADE,
    CONSTRAINT fk_order_items_orders
        FOREIGN KEY( order_id )
            REFERENCES orders( order_id )
                ON DELETE CASCADE
);

CREATE SEQUENCE order_item_seq START WITH 1;