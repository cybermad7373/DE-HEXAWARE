WITH booking_lead_time AS (
    SELECT 
        booking_id,
        DATEDIFF(day, date_of_booking, check_in) AS days_prior_to_checkin
    FROM 
        bookings
)
SELECT 
    CASE 
        WHEN days_prior_to_checkin = 0 THEN 'Same day'
        WHEN days_prior_to_checkin BETWEEN 1 AND 3 THEN '1-3 days prior'
        WHEN days_prior_to_checkin BETWEEN 4 AND 7 THEN '4-7 days prior'
        WHEN days_prior_to_checkin BETWEEN 8 AND 30 THEN '8-30 days prior'
        ELSE 'More than 30 days prior'
    END AS booking_time_frame,
    COUNT(booking_id) AS number_of_bookings,
    ROUND(COUNT(booking_id) * 100.0 / (SELECT COUNT(*) FROM bookings), 2) AS percentage
FROM 
    booking_lead_time
GROUP BY 
    CASE 
        WHEN days_prior_to_checkin = 0 THEN 'Same day'
        WHEN days_prior_to_checkin BETWEEN 1 AND 3 THEN '1-3 days prior'
        WHEN days_prior_to_checkin BETWEEN 4 AND 7 THEN '4-7 days prior'
        WHEN days_prior_to_checkin BETWEEN 8 AND 30 THEN '8-30 days prior'
        ELSE 'More than 30 days prior'
    END
ORDER BY 
    number_of_bookings DESC;