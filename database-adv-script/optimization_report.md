# **Example `optimization_report.md` snippet:**

```markdown

## Initial Query

```sql
-- (Paste your initial query here)
SELECT ... FROM ...
```

## Initial Query EXPLAIN Output

```,
-- (Paste the EXPLAIN output here)
```

**Execution Time:** 123.45 ms

## Refactored Query

```sql
-- (Paste your refactored query here)
SELECT ... FROM ...
```

## Refactored Query EXPLAIN Output

```,
-- (Paste the EXPLAIN output here)
```

**Execution Time:** 67.89 ms

## Analysis

The refactored query improved performance by reducing the number of columns selected from the `User` and `Property` tables. This reduced the amount of data that had to be transferred and processed.  The execution time decreased from 123.45 ms to 67.89 ms. The EXPLAIN output shows that the refactored query is now using an index on the `Booking.user_id` column, which was not used in the initial query.

```.
