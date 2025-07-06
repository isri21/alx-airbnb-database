CREATE TABLE Bookings (
    booking_id SERIAL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

CREATE TABLE bookings_2024 PARTITION OF Bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF Bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE bookings_2026 PARTITION OF Bookings
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');