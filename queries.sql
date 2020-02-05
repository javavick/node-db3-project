-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT ProductName, CategoryName FROM Product
JOIN Category
ON Product.CategoryId = Category.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT O.id, CompanyName
FROM [Order] AS O
JOIN Shipper AS S
ON O.ShipVia = S.Id
WHERE O.OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT Quantity, ProductName 
FROM OrderDetail
JOIN Product 
ON OrderDetail.ProductId = Product.Id
WHERE OrderId = 10251

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT O.id AS OrderId, CompanyName AS CustomerCompany, LastName AS EmployeeLastName
FROM [Order] AS O
JOIN Customer AS C
ON O.CustomerId = C.Id
JOIN Employee AS E
ON O.EmployeeId = E.Id