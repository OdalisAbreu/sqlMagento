SELECT   DISTINCT P.product_id, sku.sku, `name`.`value` AS 'Name', C.entity_id, C.`value` AS 'Categoria', short.`value` AS Short, `long`.`value` AS 'Long description',
kw.value AS 'Meta Keywords', brand.`value` AS 'Brand', `pq`.`stock_qty` AS 'Qty', `pq`.`vendor_price` AS 'price',
CONCAT( 'https://www.shopmundo.com/media/catalog/product',`product_image`.value) AS 'IMG', W.value AS 'Weight'
FROM 
	catalog_category_product  AS P
INNER JOIN
	catalog_category_entity_varchar AS C  ON (P.category_id = C.entity_id)
INNER JOIN
	catalog_product_entity AS sku ON (P.product_id = sku.entity_id)
INNER JOIN
	catalog_product_entity_int AS ei ON (ei.entity_id = sku.entity_id) 
INNER JOIN
	catalog_product_entity_varchar AS `name` ON (`name`.entity_id = ei.entity_id)
INNER JOIN
	catalog_product_entity_text AS short ON short.`entity_id` = ei.`entity_id`
INNER JOIN
	catalog_product_entity_text AS `long` ON `long`.`entity_id` = ei.`entity_id`
INNER JOIN
	catalog_product_entity_text AS `kw` ON `kw`.`entity_id` = ei.`entity_id`
INNER JOIN
	eav_attribute_option_value AS brand ON brand.`option_id` = ei.`value`
INNER JOIN
	`udropship_vendor_product` AS `pq` ON `pq`.`product_id` = sku.`entity_id`
LEFT JOIN
	eav_attribute_option_value AS HD ON HD.`option_id` = ei.`value` AND ei.`attribute_id` = 172
INNER JOIN
    `catalog_product_entity_varchar` AS `product_image` ON `product_image`.`entity_id` = ei.`entity_id`
INNER JOIN
	catalog_product_entity_decimal AS W ON W.`entity_id` = ei.`entity_id`
WHERE  
C.attribute_id = 41 AND  C.store_id = '0' AND C.entity_id = 1145 AND `name`.attribute_id = 71 AND short.`attribute_id` = 73 AND `long`.`attribute_id` = 72 AND ei.`attribute_id` = 81 
AND `kw`.`attribute_id` = 83 AND `product_image`.`attribute_id` = 85 AND W.`attribute_id`= 80;