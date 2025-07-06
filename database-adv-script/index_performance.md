# Index Performance Analysis: User, Booking, and Property Tables

## Objective

This document analyzes the performance impact of adding indexes to the `User`, `Booking`, and `Property` tables in the ALX Airbnb database.  The goal is to identify and implement indexes that improve query performance for common operations.

## Database System

**Database System:** PostgreSQL

## Table Schemas

### User Table

```sql
CREATE TABLE "User" (
    user_id UUID PRIMARY KEY, -- Indexed Automatically
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    password_hash VARCHAR NOT NULL,
    phone_number VARCHAR NULL,
    role ENUM ('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP );

CREATE TABLE Property (
    property_id UUID PRIMARY KEY, -- Indexed Automatically
    host_id UUID REFERENCES "User"(user_id),
    name VARCHAR NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR NOT NULL,
    pricepernight DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP );

CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY, -- Indexed Automatically
    property_id UUID REFERENCES Property(property_id),
    user_id UUID REFERENCES "User"(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM ('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY, -- Indexed Automatically
    booking_id UUID REFERENCES Booking(booking_id),
    amount DECIMAL NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM ('credit_card', 'paypal', 'stripe') NOT NULL
);

CREATE TABLE Review (
    review_id UUID PRIMARY KEY, -- Indexed Automatically
    property_id UUID REFERENCES Property(property_id),
    user_id UUID REFERENCES "User"(user_id),
    rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Message (
    message_id UUID PRIMARY KEY, -- Indexed Automatically
    sender_id UUID REFERENCES "User"(user_id),
    recipient_id UUID REFERENCES "User"(user_id),
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Property table index
CREATE INDEX idx_property_location ON Property (location);

-- Booking table index
CREATE INDEX idx_booking_dates ON Booking (start_date, end_date);

-- Review table index
CREATE INDEX idx_review_rating ON Review (rating);

-- Description: Find all properties located in a specific location. Used for browsing properties.
SELECT * FROM Property WHERE location = 'New York, NY';  -- Replace with your location data


