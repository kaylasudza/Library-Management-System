# Library-Management-System
# SQL database system for managing multiple libraries, book collections, user interactions, and loan/hold transactions.

## Project Purpose
The main objective of this project is to design and implement a robust database for an e-library system that allows users to borrow and reserve books from multiple libraries. The database stores essential information about libraries, users, books, and transactions, ensuring data integrity and efficient management of library resources.

## Database Structure
The database consists of six main tables:

Users: Stores user information like user_id, name, and email.
Libraries: Details about each library including library_id and location.
Books: Book information such as title, author, and quantity.
Categories: Classifications of books by genre or type.
Loans: Tracks borrowing transactions, including loan_date and return_date.
Holds: Manages book reservations with hold_date and queue positions.

## Key Features
Efficiently manages multi-library collections.
Allows users to borrow and hold books across different libraries.
Implements loan policies with a two-week limit.
Enables analysis on popular books and user borrowing patterns.

## Getting Started
Setup: Install PostgreSQL and clone this repository.
Database Creation: Run SQL scripts to create tables and import sample data.
Testing: Use sample queries provided to analyze borrowing data and track user activity.

## Future Enhancements
Build a user interface for easy access.
Add notification system for loan and hold updates.
Improve search and recommendation features based on user behavior.

