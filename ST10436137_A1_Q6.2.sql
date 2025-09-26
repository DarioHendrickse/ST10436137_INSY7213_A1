-- Q6.2

CREATE SEQUENCE seq_bill START WITH 821 INCREMENT BY 1;

INSERT INTO Billing (Bill_ID, Customer_ID, Staff_ID, Bill_Date)
VALUES (seq_bill.NEXTVAL, 11011, 51013, TO_DATE('09-Dec-22', 'DD-Mon-YY'));

-- querying new insert
SELECT * FROM Billing WHERE Bill_ID=821;

-- END OF Q6.2