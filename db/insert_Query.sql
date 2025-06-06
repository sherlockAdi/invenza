-- U01_ROLE
INSERT INTO U01_ROLE
    (ROLE_NAME, DESCRIPTION)
VALUES
    ('Admin', 'Administrator with full access');

-- U01_USER
INSERT INTO U01_USER
    (USERNAME, PASSWORD_HASH, ROLE_ID, EMAIL, PHONE)
VALUES
    ('john_doe', 'hashed_password_here', 1, 'john@example.com', '1234567890');

-- U01_USER_SESSION
INSERT INTO U01_USER_SESSION
    (USER_ID, LOGIN_TIME, LOGOUT_TIME, IP_ADDRESS)
VALUES
    (1, GETDATE(), NULL, '192.168.1.1');

-- U01_USER_ACTIVITY
INSERT INTO U01_USER_ACTIVITY
    (USER_ID, ACTION, MODULE)
VALUES
    (1, 'Login', 'Authentication');

-- P01_CATEGORY
INSERT INTO P01_CATEGORY
    (CATEGORY_NAME, DESCRIPTION)
VALUES
    ('Electronics', 'Electronic gadgets and devices');

-- P01_PRODUCT
INSERT INTO P01_PRODUCT
    (SKU, NAME, CATEGORY_ID, BRAND, UNIT, PRICE, TAX_PERCENT)
VALUES
    ('SKU12345', 'Smartphone', 1, 'BrandX', 'pcs', 299.99, 18.00);

-- P01_PRODUCT_IMAGE
INSERT INTO P01_PRODUCT_IMAGE
    (PRODUCT_ID, IMAGE_URL)
VALUES
    (1, 'https://example.com/images/product1.jpg');

-- P01_PRODUCT_ATTRIBUTE
INSERT INTO P01_PRODUCT_ATTRIBUTE
    (PRODUCT_ID, ATTRIBUTE_NAME, ATTRIBUTE_VALUE)
VALUES
    (1, 'Color', 'Black');

-- S01_SUPPLIER
INSERT INTO S01_SUPPLIER
    (NAME, CONTACT_NAME, EMAIL, PHONE, ADDRESS, GST_NO)
VALUES
    ('Supplier Inc.', 'Alice Smith', 'supplier@example.com', '9876543210', '123 Supplier St.', 'GST1234567');

-- S01_SUPPLIER_PRODUCT
INSERT INTO S01_SUPPLIER_PRODUCT
    (SUPPLIER_ID, PRODUCT_ID, SUPPLY_PRICE)
VALUES
    (1, 1, 250.00);

-- W01_WAREHOUSE
INSERT INTO W01_WAREHOUSE
    (NAME, LOCATION)
VALUES
    ('Main Warehouse', '123 Warehouse Rd.');

-- I01_INVENTORY
INSERT INTO I01_INVENTORY
    (PRODUCT_ID, WAREHOUSE_ID, QUANTITY)
VALUES
    (1, 1, 100);

-- I01_STOCK_MOVEMENT
INSERT INTO I01_STOCK_MOVEMENT
    (PRODUCT_ID, WAREHOUSE_ID, MOVEMENT_TYPE, QUANTITY, REASON, MOVED_BY)
VALUES
    (1, 1, 'IN', 50, 'Initial Stock', 1);

-- I01_REORDER_LEVEL
INSERT INTO I01_REORDER_LEVEL
    (PRODUCT_ID, MIN_QUANTITY, MAX_QUANTITY)
VALUES
    (1, 10, 200);

-- B01_CUSTOMER
INSERT INTO B01_CUSTOMER
    (NAME, EMAIL, PHONE, ADDRESS)
VALUES
    ('Jane Doe', 'jane@example.com', '1231231234', '456 Customer Ln.');

-- B01_SALES_INVOICE
INSERT INTO B01_SALES_INVOICE
    (CUSTOMER_ID, USER_ID, TOTAL_AMOUNT, TAX_AMOUNT, DISCOUNT, NET_AMOUNT, PAYMENT_MODE, STATUS)
VALUES
    (1, 1, 350.00, 18.00, 10.00, 358.00, 'Card', 'Paid');

-- B01_SALES_ITEM
INSERT INTO B01_SALES_ITEM
    (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, TAX_AMOUNT, TOTAL_AMOUNT)
VALUES
    (1, 1, 2, 150.00, 18.00, 318.00);

-- B01_PAYMENT
INSERT INTO B01_PAYMENT
    (INVOICE_ID, AMOUNT_PAID, PAYMENT_MODE)
VALUES
    (1, 358.00, 'Card');

-- B01_PURCHASE_INVOICE
INSERT INTO B01_PURCHASE_INVOICE
    (SUPPLIER_ID, TOTAL_AMOUNT, TAX_AMOUNT, NET_AMOUNT, STATUS)
VALUES
    (1, 1000.00, 90.00, 1090.00, 'Received');

-- B01_PURCHASE_ITEM
INSERT INTO B01_PURCHASE_ITEM
    (PURCHASE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, TAX_AMOUNT, TOTAL_AMOUNT)
VALUES
    (1, 1, 20, 50.00, 9.00, 1090.00);

-- E01_ECOM_PLATFORM
INSERT INTO E01_ECOM_PLATFORM
    (NAME, API_BASE_URL, API_KEY)
VALUES
    ('Shopify', 'https://api.shopify.com', 'apikey123');

-- E01_PRODUCT_SYNC
INSERT INTO E01_PRODUCT_SYNC
    (PRODUCT_ID, PLATFORM_ID, STATUS)
VALUES
    (1, 1, 'Success');

-- E01_ORDER
INSERT INTO E01_ORDER
    (PLATFORM_ID, CUSTOMER_NAME, ORDER_TOTAL, ORDER_DATE, STATUS)
VALUES
    (1, 'Jane Doe', 299.99, GETDATE(), 'Pending');

-- E01_ORDER_ITEM
INSERT INTO E01_ORDER_ITEM
    (ORDER_ID, PRODUCT_ID, QUANTITY, PRICE)
VALUES
    (1, 1, 1, 299.99);

-- A01_AUDIT_LOG
INSERT INTO A01_AUDIT_LOG
    (USER_ID, ACTION, DETAILS)
VALUES
    (1, 'Added product', 'Product SKU12345 added to inventory');

-- N01_NOTIFICATION
INSERT INTO N01_NOTIFICATION
    (USER_ID, MESSAGE)
VALUES
    (1, 'Your order has been shipped.');

-- S01_SETTING
INSERT INTO S01_SETTING
    (SETTING_KEY, SETTING_VALUE)
VALUES
    ('site_name', 'My Inventory System');
