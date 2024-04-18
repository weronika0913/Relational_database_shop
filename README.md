SQL Database Schema for shop
This repository contains the SQL schema script for an Employee Management System database. The script includes the definition of tables for managing employees, contracts, addresses, products, suppliers, orders, and online shopping carts.

Description
The SQL script defines the following tables:

employees: Stores information about employees, including their names, surnames, contact details, and addresses.
employees_positions: Contains a list of employee positions or roles within the organization.
contracts_employees: Manages employment contracts for employees, including salary details, hire dates, and end dates.
adresses: Stores addresses information, such as city, street, house number, and postal code.
products: Manages product information, including product names, sizes, prices, quantities, and categories.
suppliers: Stores information about suppliers, including their names, contact persons, phone numbers, email addresses, and addresses.
supplies: Manages supply transactions, including supplier details, unit prices, total prices, and supply dates.
types_delivery_status: Defines various types of delivery statuses for supply transactions.
supplies_details: Tracks details of supplies, such as the quantity of each product in a supply transaction.
orders_stationary_shops: Manages orders placed at stationary shops, including customer details, order dates, payment methods, total prices, and confirmation status.
payment_methods: Defines different payment methods available for orders.
orders_details: Tracks details of orders, such as the quantity of each product in an order.
users: Stores information about users of an online shopping platform, including their names, surnames, contact details, login credentials, and addresses.
user_card: Manages user loyalty cards for online shopping customers.
online_carts: Tracks online shopping carts for registered users.
elements_carts: Stores details of products in online shopping carts.
orders_online_shops: Manages orders placed on an online shopping platform, including order dates, total prices, payment details, and order statuses.
orders_status: Defines various types of order statuses for online shopping orders.
online_payments: Tracks online payments made by users.
