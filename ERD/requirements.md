# ER Diagram for Airbnb Database

## Entities and Attributes

1. **User**
   - user_id (PK), first_name, last_name, email, password_hash, phone_number, role, created_at

2. **Property**
   - property_id (PK), host_id (FK), title, description, address, city, price_per_night, created_at

3. **Booking**
   - booking_id (PK), guest_id (FK), property_id (FK), check_in_date, check_out_date, total_price, status

4. **Review**
   - review_id (PK), booking_id (FK), rating, comment, created_at

5. **Payment**
   - payment_id (PK), booking_id (FK), payment_method, amount, payment_date

## Relationships

- A User can own many Properties.
- A User (as guest) can make many Bookings.
- A Booking is made for a single Property.
- A Booking can have one Review and one Payment.
