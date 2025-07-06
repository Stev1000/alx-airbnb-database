# Query 1: Fetching Properties by Location

## Description

This query fetches properties that match a given location.  It's used for the main search functionality.

### Initial Query

```sql
SELECT * FROM Property WHERE location LIKE '%New York%';

-- Paste the output of EXPLAIN ANALYZE here
Seq Scan on Property  (cost=0.00..12.75 rows=5 width=351) (actual time=0.016..0.061 rows=5 loops=1)
  Filter: ((location)::text LIKE '%New York%'::text)
  Rows Removed by Filter: 95
Planning Time: 0.094 ms
Execution Time: 0.079 ms

CREATE INDEX idx_property_location ON Property (location);
-- Paste the output of EXPLAIN ANALYZE here
Bitmap Heap Scan on Property  (cost=4.27..8.34 rows=5 width=351) (actual time=0.034..0.039 rows=5 loops=1)
  Recheck Filter: ((location)::text LIKE '%New York%'::text)
  ->  Bitmap Index Scan on idx_property_location  (cost=0.00..4.27 rows=5 width=0) (actual time=0.026..0.026 rows=5 loops=1)
        Index Cond: ((location)::text LIKE '%New York%'::text)
Planning Time: 0.171 ms
Execution Time: 0.054 ms
