CREATE PROCEDURE AddNewCustomer (
    IN inFirstName VARCHAR(50),
    IN inLastName VARCHAR(50),
    IN inEmail VARCHAR(100)
)

BEGIN
    INSERT INTO Customers (FirstName, LastName, Email) VALUES
    (inFirstName, inLastName, inEmail);
END;

CALL AddNewCustomer('Anh', 'Nguyen Duc', '21012477@st.phenikaa-uni.edu.vn')

SELECT * FROM customers