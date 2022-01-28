--Выбрать названия тех продуктов, для которых в 1991г. допускались скидки больше 25%.
SELECT DISTINCT description AS "Product Name"
FROM PRODUCT
INNER JOIN PRICE ON PRICE.product_id = PRODUCT.product_id
INNER JOIN ITEM ON PRODUCT.product_id = ITEM.product_id
INNER JOIN SALES_ORDER ON ITEM.order_id = SALES_ORDER.order_id

WHERE (1 - (actual_price/list_price)) > 0.25 AND YEAR(order_date) = 1991
GO



--Выбрать названия товаров, которые покупаются в штате 'CA' (Калифорния).
SELECT DISTINCT description AS "Product Name" 
FROM PRODUCT, CUSTOMER, SALES_ORDER, ITEM
WHERE CUSTOMER.state = 'CA' AND 
CUSTOMER.customer_id = SALES_ORDER.customer_id AND 
ITEM.order_id = SALES_ORDER.order_id AND 
ITEM.product_id = PRODUCT.product_id

GO


--Выбрать всех сторудников, которые работают в одном городе с 'DENNIS'
SELECT emp1.last_name
FROM (EMPLOYEE emp1 INNER JOIN DEPARTMENT dep1 ON emp1.department_id = dep1.department_id) INNER JOIN
((EMPLOYEE emp2 INNER JOIN DEPARTMENT dep2 ON emp2.department_id = dep2.department_id) INNER JOIN
LOCATION loc ON dep2.location_id = loc.location_id) ON dep1.location_id = dep2.location_id 
WHERE emp2.last_name = 'DENNIS' AND emp1.last_name <> emp2.last_name;

GO

--Выбрать среднюю зарплату, которая приходится на одного сотрудника, работающего в городе 'NEW YORK'.
SELECT CAST(AVG(salary) AS DECIMAL(6, 2))  AS "Average NYC salary"
FROM EMPLOYEE, LOCATION, DEPARTMENT
WHERE LOCATION.regional_group = 'NEW YORK'
AND LOCATION.location_id = DEPARTMENT.location_id
AND EMPLOYEE.department_id = DEPARTMENT.department_id;

GO

--Вывести все даты за заданный год(2020) with
--Реализовать нумерацию

DECLARE @Counter int;
SET @Counter = (select count(*) FROM PRICE);
WITH Series(a)AS

(

SELECT 1
UNION ALL


SELECT a+1 FROM Series WHERE a < @Counter
)

SELECT * FROM Series;

GO

DECLARE @Year date;
SET @Year = '2020-01-01';

WITH Dates(dat) AS
(
SELECT '01-01'

UNION ALL 
SELECT 
)