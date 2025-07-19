SELECT 
    no_of_rooms,
    COUNT(booking_id) AS number_of_bookings,
    ROUND(COUNT(booking_id) * 100.0 / (SELECT COUNT(*) FROM bookings), 2) AS percentage
FROM 
    bookings
GROUP BY 
    no_of_rooms
ORDER BY 
    no_of_rooms;