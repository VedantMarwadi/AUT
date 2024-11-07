-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

--  Product Category Dimension (linked to Product_Dimension)
CREATE TABLE Product_Category_Dimension (
    CATEGORY_ID VARCHAR2(4) PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(30),
    CATEGORY_DESCRIPTION VARCHAR2(100)
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Supplier Type Dimension (linked to Supplier_Dimension)
CREATE TABLE Supplier_Type_Dimension (
    SUPPLIER_TYPE_ID VARCHAR2(3) PRIMARY KEY,
    SUPPLIER_TYPE_NAME VARCHAR2(20)
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Supplier Dimension (linked to Supplier_Type_Dimension, Product_Dimension )
CREATE TABLE Supplier_Dimension (
    SUPPLIER_ID VARCHAR2(5) PRIMARY KEY,
    SUPPLIER_NAME VARCHAR2(30),
    SUPPLIER_TYPE_ID VARCHAR2(3),
    FOREIGN KEY (SUPPLIER_TYPE_ID) REFERENCES Supplier_Type_Dimension(SUPPLIER_TYPE_ID)
);


-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Brand Dimension (linked to Product_Dimension)
CREATE TABLE Brand_Dimension (
    BRAND_ID VARCHAR2(4) PRIMARY KEY,
    BRAND_NAME VARCHAR2(30),
    BRAND_DESCRIPTION VARCHAR2(100)
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Product_Dimension (linked to Product_Category_Dimension, Supplier_Dimension, Brand_Dimension)
CREATE TABLE Product_Dimension (
    PRODUCT_ID VARCHAR2(6) PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(30),
    CATEGORY_ID VARCHAR2(4),
    SUPPLIER_ID VARCHAR2(5),
    BRAND_ID VARCHAR2(4),
    FOREIGN KEY (CATEGORY_ID) REFERENCES Product_Category_Dimension(CATEGORY_ID),
    FOREIGN KEY (SUPPLIER_ID) REFERENCES Supplier_Dimension(SUPPLIER_ID),
    FOREIGN KEY (BRAND_ID) REFERENCES Brand_Dimension(BRAND_ID)
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Client Segment Dimension (linked to Client_Dimension)
CREATE TABLE Client_Segment_Dimension (
    CLIENT_SEGMENT_ID VARCHAR2(3) PRIMARY KEY,
    SEGMENT_NAME VARCHAR2(30),
    SEGMENT_DESCRIPTION VARCHAR2(100)
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Client Region Dimension (linked to Client_Dimension)
CREATE TABLE Client_Region_Dimension (
    CLIENT_REGION_ID VARCHAR2(3) PRIMARY KEY,
    REGION_NAME VARCHAR2(30),
    REGION_DESCRIPTION VARCHAR2(100)
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Client Dimension (linked to Client_Segment_Dimension and Client_Region_Dimension)
CREATE TABLE Client_Dimension (
    CLIENT_ID VARCHAR2(4) PRIMARY KEY,
    CLIENT_NAME VARCHAR2(30),
    CLIENT_SEGMENT_ID VARCHAR2(3),
    CLIENT_REGION_ID VARCHAR2(3),
    FOREIGN KEY (CLIENT_SEGMENT_ID) REFERENCES Client_Segment_Dimension(CLIENT_SEGMENT_ID),
    FOREIGN KEY (CLIENT_REGION_ID) REFERENCES Client_Region_Dimension(CLIENT_REGION_ID)
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Channel Type Dimension (linked to Channel_Dimension)
CREATE TABLE Channel_Type_Dimension (
    CHANNEL_TYPE_ID VARCHAR2(3) PRIMARY KEY,
    CHANNEL_TYPE_NAME VARCHAR2(20),
    CHANNEL_TYPE_DESCRIPTION VARCHAR2(100)
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Channel Region Dimension (linked to Channel_Dimension)
CREATE TABLE Channel_Region_Dimension (
    CHANNEL_REGION_ID VARCHAR2(3) PRIMARY KEY,
    CHANNEL_REGION_NAME VARCHAR2(30),
    REGION_DESCRIPTION VARCHAR2(100)
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Channel Dimension (linked to Channel_Type_Dimension and Channel_Region_Dimension)
CREATE TABLE Channel_Dimension (
    CHANNEL_ID VARCHAR2(3) PRIMARY KEY,
    CHANNEL_DESC VARCHAR2(30),
    CHANNEL_TYPE_ID VARCHAR2(3),
    CHANNEL_REGION_ID VARCHAR2(3),
    FOREIGN KEY (CHANNEL_TYPE_ID) REFERENCES Channel_Type_Dimension(CHANNEL_TYPE_ID),
    FOREIGN KEY (CHANNEL_REGION_ID) REFERENCES Channel_Region_Dimension(CHANNEL_REGION_ID)
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Date Dimension
CREATE TABLE Date_Dimension (
    DATE_KEY NUMBER(8) PRIMARY KEY,
    DATE_COLUMN TIMESTAMP,
    DAY NUMBER(2),
    MONTH NUMBER(2),
    QUARTER NUMBER(1),
    YEAR NUMBER(4),
    FISCAL_YEAR NUMBER(4), 
    FISCAL_QUARTER NUMBER(1), 
    WEEK_OF_YEAR NUMBER(2),
    SEASON VARCHAR2(10) 
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Sales Fact Table (linked to Product_Dimension, Client_Dimension, Channel_Dimension, and Date_Dimension)
CREATE TABLE Sales_Fact (
    TRANSACTION_ID VARCHAR2(8) PRIMARY KEY,
    PRODUCT_ID VARCHAR2(6),
    CLIENT_ID VARCHAR2(4),
    CHANNEL_ID VARCHAR2(3),
    DATE_KEY NUMBER(8),
    QUANTITY NUMBER(3,0),
    PRICE NUMBER(5,2),
    TOTAL_SALES_VALUE NUMBER(10,2),
    FOREIGN KEY (PRODUCT_ID) REFERENCES Product_Dimension(PRODUCT_ID),
    FOREIGN KEY (CLIENT_ID) REFERENCES Client_Dimension(CLIENT_ID),
    FOREIGN KEY (CHANNEL_ID) REFERENCES Channel_Dimension(CHANNEL_ID),
    FOREIGN KEY (DATE_KEY) REFERENCES Date_Dimension(DATE_KEY)
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------