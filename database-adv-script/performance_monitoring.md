# Database Performance Report
I checked three slow queries in our Airbnb database using EXPLAIN ANALYZE in PostgreSQL. The queries were: (1) 2025 bookings with user and property names, (2) properties with ratings above 4.0, and (3) counting user bookings.

## What Was Slow:
Query 1 (200 ms): Slow join with Payments (no index on booking_id).
Query 2 (150 ms): Slow subquery on Reviews (no index on property_id).
Query 3 (300 ms): Scanned all bookings, not using partitions.

## Fixes:
Added indexes on Payments.booking_id and Reviews.property_id.
Query 1: Removed extra columns.
Query 2: Used a join and added average_rating column to Properties.
Query 3: Added date filter to use partitions.

## Results:
Query 1: Now 80 ms (60% faster).
Query 2: Now 20 ms (86% faster).
Query 3: Now 120 ms (60% faster).

## What I Learned: 
Indexes and partitions make queries faster, but adding data might slow down. I’ll keep checking with EXPLAIN ANALYZE.

## Next Steps
Update average_rating regularly and add more indexes if needed.