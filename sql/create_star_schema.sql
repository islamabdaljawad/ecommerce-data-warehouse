USE [DM_Orders];
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

/* =====================================================
   DIMENSION TABLES
   ===================================================== */

/* Users Dimension */
CREATE TABLE [dbo].[Users] (
    [user_id] VARCHAR(50) NOT NULL PRIMARY KEY,
    [zip_code] VARCHAR(50) NULL,
    [city] VARCHAR(50) NULL,
    [state] VARCHAR(50) NULL
);
GO

/* Sellers Dimension */
CREATE TABLE [dbo].[Sellers] (
    [seller_id] VARCHAR(50) NOT NULL PRIMARY KEY,
    [zip_code] VARCHAR(50) NULL,
    [city] VARCHAR(50) NULL,
    [state] VARCHAR(50) NULL
);
GO

/* Products Dimension */
CREATE TABLE [dbo].[Products] (
    [product_id] VARCHAR(50) NOT NULL PRIMARY KEY,
    [product_category] VARCHAR(50) NULL,
    [product_name_length] VARCHAR(50) NULL,
    [product_description_length] VARCHAR(50) NULL,
    [product_photos_qty] VARCHAR(50) NULL,
    [product_weight_g] VARCHAR(50) NULL,
    [product_length_cm] VARCHAR(50) NULL,
    [product_height_cm] VARCHAR(50) NULL,
    [product_width_cm] VARCHAR(50) NULL
);
GO

/* Orders Dimension (or Fact Header) */
CREATE TABLE [dbo].[Orders] (
    [order_id] VARCHAR(50) NOT NULL PRIMARY KEY,
    [order_status] VARCHAR(50) NULL,
    [order_date] VARCHAR(50) NULL,
    [order_approved_date] VARCHAR(50) NULL,
    [pickup_date] VARCHAR(50) NULL,
    [delivered_date] VARCHAR(50) NULL,
    [estimated_time_delivery] VARCHAR(50) NULL,
    [feedback_score] VARCHAR(50) NULL,
    [feedback_form_sent_date] VARCHAR(50) NULL,
    [feedback_answer_date] VARCHAR(50) NULL
);
GO

/* Payments Dimension */
CREATE TABLE [dbo].[Payments] (
    [payment_id] VARCHAR(50) NOT NULL PRIMARY KEY,
    [order_id] VARCHAR(50) NULL,
    [payment_sequential] VARCHAR(50) NULL,
    [payment_type] VARCHAR(50) NULL,
    [payment_installments] VARCHAR(50) NULL,
    [payment_value] DECIMAL(28,2) NULL
);
GO

/* =====================================================
   FACT TABLES
   ===================================================== */

/* Orders Details Fact Table */
CREATE TABLE [dbo].[Fact_OrdersDetails] (
    [id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [order_item_id] INT NULL,
    [order_id] VARCHAR(50) NULL,
    [product_id] VARCHAR(50) NULL,
    [seller_id] VARCHAR(50) NULL,
    [pickup_limit_date] DATETIME NULL,
    [price] DECIMAL(28,2) NULL,
    [shipping_cost] DECIMAL(28,2) NULL,
    [user_id] VARCHAR(50) NULL
);
GO

/* =====================================================
   FOREIGN KEY CONSTRAINTS
   ===================================================== */

ALTER TABLE [dbo].[Fact_OrdersDetails]
    ADD CONSTRAINT FK_OrdersDetails_Order
    FOREIGN KEY([order_id])
    REFERENCES [dbo].[Orders]([order_id]);
GO

ALTER TABLE [dbo].[Fact_OrdersDetails]
    ADD CONSTRAINT FK_OrdersDetails_Product
    FOREIGN KEY([product_id])
    REFERENCES [dbo].[Products]([product_id]);
GO

ALTER TABLE [dbo].[Fact_OrdersDetails]
    ADD CONSTRAINT FK_OrdersDetails_Seller
    FOREIGN KEY([seller_id])
    REFERENCES [dbo].[Sellers]([seller_id]);
GO

ALTER TABLE [dbo].[Fact_OrdersDetails]
    ADD CONSTRAINT FK_OrdersDetails_User
    FOREIGN KEY([user_id])
    REFERENCES [dbo].[Users]([user_id]);
GO