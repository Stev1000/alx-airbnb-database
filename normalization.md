# Airbnb Database Normalization

## Step 1: First Normal Form (1NF)

- All tables have **atomic** columns (e.g., no multiple values in one column).
- No repeating groups.
- Each table has a **primary key**.
  
✅ Example:

- `User` table: each user has **one** first_name, last_name, email, etc.
- `Booking` table: each row represents **one unique booking** with scalar values.

## Step 2: Second Normal Form (2NF)

- All non-key attributes are **fully dependent on the entire primary key**.
- Since we are using surrogate primary keys (like `booking_id`), all other columns are fully dependent on it.

✅ Example:

- In `Booking`, `total_price`, `status`, etc. are dependent on `booking_id`, not just part of it.

## Step 3: Third Normal Form (3NF)

- No transitive dependencies — non-key attributes do **not depend on other non-key attributes**.

✅ Example:

- In `User`, email is dependent only on `user_id` (PK), not on `first_name` or `role`.
- In `Payment`, `amount`, `method`, and `payment_date` depend directly on `payment_id`.

---

## Final Tables After Normalization

### 1. **User**

| Column         | Type    | Notes            |
|----------------|---------|------------------|
| user_id        | UUID    | PK               |
| first_name     | String  |                  |
| last_name      | String  |                  |
| email          | String  | UNIQUE           |
| password_hash  | String  |                  |
| phone_number   | String  | Nullable         |
| role           | Enum    | guest, host, admin |
| created_at     | Timestamp |                |

### 2. **Property**

| Column         | Type    | Notes            |
|----------------|---------|------------------|
| property_id    | UUID    | PK               |
| host_id        | UUID    | FK → User        |
| title          | String  |                  |
| description    | Text    |                  |
| address        | String  |                  |
| city           | String  |                  |
| price_per_night| Decimal |                  |
| created_at     | Timestamp |                |

### 3. **Booking**

| Column         | Type    | Notes            |
|----------------|---------|------------------|
| booking_id     | UUID    | PK               |
| guest_id       | UUID    | FK → User        |
| property_id    | UUID    | FK → Property    |
| check_in_date  | Date    |                  |
| check_out_date | Date    |                  |
| total_price    | Decimal |                  |
| status         | Enum    | pending, confirmed, cancelled |

### 4. **Review**

| Column         | Type    | Notes            |
|----------------|---------|------------------|
| review_id      | UUID    | PK               |
| booking_id     | UUID    | FK → Booking     |
| rating         | Integer | 1-5              |
| comment        | Text    |                  |
| created_at     | Timestamp |                |

### 5. **Payment**

| Column         | Type    | Notes            |
|----------------|---------|------------------|
| payment_id     | UUID    | PK               |
| booking_id     | UUID    | UNIQUE FK → Booking |
| payment_method | String  |                  |
| amount         | Decimal |                  |
| payment_date   | Date    |                  |

---

## ✅ Summary

- All entities are in **3NF**.
- No partial or transitive dependencies exist.
- Each table represents a **single entity** with clean, related data.
  