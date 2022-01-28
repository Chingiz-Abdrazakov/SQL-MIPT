SELECT DISTINCT PRODUCT.description AS "Product Name"
FROM ITEM, PRODUCT, SALES_ORDER, PRICE
WHERE ITEM.product_id = PRICE.product_id AND (( list_price - actual_price) / list_price > 0.25)