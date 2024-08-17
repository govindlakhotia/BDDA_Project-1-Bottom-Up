Shopper's Stop Database Design and Implementation
Project Overview

This project involves the design and implementation of a relational database for Shopper's Stop, a leading retail store chain in India. The database is designed using a bottom-up approach, ensuring that all essential aspects of the business operations are captured and managed effectively. The project includes the creation of 10 key tables with relevant relationships and the insertion of sample data for testing and analysis.
Database Schema
Tables Created

The following 10 tables are created as part of the database:

    Customers: Stores information about customers.
    Products: Stores details of products available for sale.
    Orders: Captures customer orders.
    OrderDetails: Contains details of each order item.
    Stores: Stores information about physical store locations.
    Inventory: Tracks product stock levels at different stores.
    Suppliers: Stores information about product suppliers.
    Categories: Categorizes products into different groups.
    Employees: Stores information about store employees.
    Transactions: Tracks financial transactions related to orders.

Relationships

The database schema includes the following relationships:

    Customers to Orders: One-to-Many
    Orders to OrderDetails: One-to-Many
    Products to OrderDetails: One-to-Many
    Stores to Orders: One-to-Many
    Stores to Inventory: One-to-Many
    Products to Inventory: One-to-Many
    Suppliers to Products: One-to-Many
    Categories to Products: One-to-Many
    Stores to Employees: One-to-Many
    Orders to Transactions: One-to-Many
