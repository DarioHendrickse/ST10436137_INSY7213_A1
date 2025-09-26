-- Q6.1

-- Implicit Cursor
SET SERVEROUTPUT ON;

DECLARE var_rows NUMBER(5);

BEGIN
    UPDATE Vehicle
    SET Mileage = Mileage + 100;
    
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No vehicle mileage updated');
    ELSE var_rows := SQL%ROWCOUNT;
        DBMS_OUTPUT.PUT_LINE('Mileage for ' || var_rows || ' vehicles updated');
    END IF;
END;
/


-- Explicit Cursor
-- This cursor will show each staff member that processed an order and how many total orders have been processed at each iteration
SET SERVEROUTPUT ON;

DECLARE
    CURSOR curs_staff IS
        SELECT s.Staff_ID, s.First_Name, s.Surname
        FROM Staff s
        JOIN Delivery_Items di ON di.Staff_ID = s.Staff_ID;

    v_staff curs_staff%ROWTYPE;
BEGIN
    OPEN curs_staff;
    DBMS_OUTPUT.PUT_LINE('--- Staff Deliveries Processed ---');
    LOOP
        FETCH curs_staff INTO v_staff;
        EXIT WHEN curs_staff%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Staff: ' || v_staff.First_Name || ' ' || v_staff.Surname);
        DBMS_OUTPUT.PUT_LINE('Rows fetched so far: ' || curs_staff%ROWCOUNT);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
    CLOSE curs_staff;
END;
/



