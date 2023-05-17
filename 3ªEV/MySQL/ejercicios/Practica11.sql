SELECT * FROM products;

SELECT productID, productName, UnitPrice, ROUND(aplicarPVP(UnitPrice,10),2)

FROM products;