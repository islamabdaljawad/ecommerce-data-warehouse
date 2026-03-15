/* =====================================================
   E-Commerce Data Warehouse Schema
   ===================================================== */


/* =====================================================
   DIMENSION TABLES
   ===================================================== */


/* -------------------------------
   Users Dimension
--------------------------------*/
CREATE TABLE Users (
    user_id VARCHAR(50) PRIMARY KEY,
    zip_code VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50)
);



/* -------------------------------
   Sellers Dimension
--------------------------------*/
CREATE TABLE Sellers (
    seller_id VARCHAR(50) PRIMARY KEY,
    zip_code VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50)
);



/* -------------------------------
   Products Dimension
--------------------------------*/
CREATE TABLE Products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category VARCHAR(50),
    product_name_lenght VARCHAR(50),
    product_description_lenght VARCHAR(50),
    product_photos_qty VARCHAR(50),
    product_weight_g VARCHAR(50),
    product_length_cm VARCHAR(50),
    product_height_cm VARCHAR(50),
    product_width_cm VARCHAR(50)
);



/* -------------------------------
   Payments Dimension
--------------------------------*/
CREATE TABLE Payments (
    order_id VARCHAR(50) PRIMARY KEY,
    payment_sequential VARCHAR(50),
    payment_type VARCHAR(50),
    payment_installments VARCHAR(50),
    payment_value VARCHAR(50)
);



/* =====================================================
   FACT TABLES
   ===================================================== */


/* -------------------------------
   Orders Fact Table
   Delivery Status & Feedback
--------------------------------*/
CREATE TABLE Orders (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_id VARCHAR(50),
    user_id VARCHAR(50),
    seller_id VARCHAR(50),
    order_status VARCHAR(50),
    order_date VARCHAR(50),
    order_approved_date VARCHAR(50),
    pickup_date VARCHAR(50),
    delivered_date VARCHAR(50),
    estimated_time_delivery VARCHAR(50),
    feedback_score VARCHAR(50),
    feedback_form_sent_date VARCHAR(50),
    feedback_answer_date VARCHAR(50),

    CONSTRAINT FK_Orders_Users
        FOREIGN KEY (user_id) REFERENCES Users(user_id),

    CONSTRAINT FK_Orders_Payments
        FOREIGN KEY (order_id) REFERENCES Payments(order_id),

    CONSTRAINT FK_Orders_Sellers
        FOREIGN KEY (seller_id) REFERENCES Sellers(seller_id)
);



/* -------------------------------
   Order Details Fact Table
   Product Sales & Pricing
--------------------------------*/
CREATE TABLE orders_details (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id VARCHAR(50),
    seller_id VARCHAR(50),
    order_id VARCHAR(50),
    order_item_id VARCHAR(50),
    product_id VARCHAR(50),
    pickup_limit_date VARCHAR(50),
    price VARCHAR(50),
    shipping_cost VARCHAR(50),

    CONSTRAINT FK_OrdersDetails_Users
        FOREIGN KEY (user_id) REFERENCES Users(user_id),

    CONSTRAINT FK_OrdersDetails_Products
        FOREIGN KEY (product_id) REFERENCES Products(product_id),

    CONSTRAINT FK_OrdersDetails_Payments
        FOREIGN KEY (order_id) REFERENCES Payments(order_id),

    CONSTRAINT FK_OrdersDetails_Sellers
        FOREIGN KEY (seller_id) REFERENCES Sellers(seller_id)
);