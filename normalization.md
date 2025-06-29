# Database Normalization to 3NF

## First Normal Form (1NF)
- All tables have atomic (indivisible) values.
- Each record is uniquely identifiable via a primary key.

## Second Normal Form (2NF)
- All non-key attributes are fully functionally dependent on the entire primary key.
- No partial dependencies exist (since all tables have single-column primary keys).

## Third Normal Form (3NF)
- All attributes are only dependent on the primary key.
- No transitive dependencies exist between non-key attributes.

## Conclusion
The schema is already in 3NF.