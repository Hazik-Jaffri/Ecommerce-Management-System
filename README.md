Ecommerce Store Database Project
A comprehensive and well-structured SQL database schema for a fully functional e-commerce platform. This project demonstrates core database design principles, including table creation, relationship mapping (foreign keys), and the insertion of realistic dummy data for a complete online store.

🗄️ Project Overview
This project models the backend of an e-commerce system. It includes all essential entities like customers, products, orders, payments, and shipping, providing a solid foundation for building an online shopping application. The SQL scripts are ready to be executed to create a populated database for development, testing, or learning purposes.

✨ Key Features
Complete Schema: Defines all necessary tables for a modern e-commerce site.

Relational Integrity: Implements primary and foreign keys to enforce data consistency and model real-world relationships.

Sample Data: Pre-populated with realistic dummy data for customers, products, orders, and more, allowing for immediate testing and querying.

Example Queries: Includes practical SQL SELECT and UPDATE statements showcasing common operations like joining tables and aggregating data.

📊 Database Schema
The database consists of the following core tables:

Customer: Stores user account information.

Address: Manages customer shipping addresses.

Category & Product: Organizes the product catalog.

Cart & CartItem: Handles the user shopping cart functionality.

Order & OrderItem: Manages customer orders and line items.

Payment: Tracks payment details and statuses.

Shipping: Manages shipping information and delivery status.

🚀 Getting Started
Prerequisites
A MySQL or MariaDB server instance.

Installation & Setup
Clone this repository.

Open your MySQL client (e.g., MySQL Workbench, command line).

Execute the entire Ecommerc Store Database Project.sql script.

The database Ecommerce_Store will be created, all tables will be built, and sample data will be inserted automatically.

🔍 Example Queries Included
The script includes sample queries to:

Retrieve all orders with customer names and totals.

Get shipping information with joined customer and address details.

Count the total number of orders per customer using GROUP BY.

Update the status of an existing order.

🛠️ Potential Use Cases
Learning SQL: Perfect for students and beginners to practice writing queries on a complex, real-world dataset.

Project Backend: Serve as the starting database schema for a web development project (e.g., using Node.js, PHP, Python/Django).

Database Design Study: An excellent example of normalizing data and establishing relationships for an efficient e-commerce model.

📝 License
This project is open source and available under the MIT License.