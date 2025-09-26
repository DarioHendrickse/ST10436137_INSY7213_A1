-- Q5.1

SET SERVEROUTPUT ON;

DECLARE
    CURSOR curs_top_staff IS
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
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Top Staff ---');
    
    FOR r IN curs_top_staff LOOP
        DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('STAFF ID:             ' || r.staff_id);
        DBMS_OUTPUT.PUT_LINE('FIRST NAME:           ' || r.first_name);
        DBMS_OUTPUT.PUT_LINE('SURNAME:              ' || r.surname);
        DBMS_OUTPUT.PUT_LINE('DELIVERIES PROCESSED: ' || r.deliveries_processed);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
END;
/

-- END OF Q5.1
