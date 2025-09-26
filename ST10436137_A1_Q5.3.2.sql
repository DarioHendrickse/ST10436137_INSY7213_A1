-- Q5.3.2

CREATE OR REPLACE VIEW View_TopStaff AS -- Creating the view with the desired name (virtual table)
-- Select query that will be saved to the view and be used every time its accessed
SELECT 
    s.Staff_ID AS staff_id,
    s.First_Name AS first_name,
    s.Surname AS surname,
    COUNT(s.Staff_ID) AS deliveries_processed
FROM Staff s
JOIN Delivery_Items di ON di.Staff_ID = s.Staff_ID
JOIN Driver_Deliveries dd ON dd.Delivery_Item_ID = di.Delivery_Item
GROUP BY s.Staff_ID, s.First_Name, s.Surname
ORDER BY COUNT(s.Staff_ID) DESC
FETCH FIRST 1 ROWS ONLY;

-- calling the saved query to access display the data
SELECT * FROM View_TopStaff;

-- END OF Q5.3.2