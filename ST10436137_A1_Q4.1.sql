-- Q4

SET SERVEROUTPUT ON;

DECLARE
    CURSOR curs_driver IS
        SELECT d.First_name, d.Surname, d.Driver_Code, dd.VIN_Number, v.Mileage
        FROM Driver_Deliveries dd
        JOIN Driver d ON dd.Driver_ID = d.Driver_ID
        JOIN Vehicle v ON dd.VIN_Number = v.VIN_Number
        WHERE v.Mileage < 80000;

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Driver Report ---');
    DBMS_OUTPUT.PUT_LINE('------------------------------------');
    
    for r in curs_driver LOOP
        DBMS_OUTPUT.PUT_LINE('DRIVER:       ' || r.First_Name || ', ' || r.Surname);
        DBMS_OUTPUT.PUT_LINE('CODE:         ' || r.Driver_Code);
        DBMS_OUTPUT.PUT_LINE('VIN NUMBER:   ' || r.VIN_Number);
        DBMS_OUTPUT.PUT_LINE('Mileage:      ' || r.Mileage);
        DBMS_OUTPUT.PUT_LINE('------------------------------------');
    END LOOP;

END;
/

-- END OF Q4