SELECT DISTINCT ce.sku AS 'Child', sku.sku, color.`value` AS 'Color', size.`value` AS 'size', `name`.`value` AS 'name', C.`value` AS 'category' , `status`.`value` AS 'status', short.`value` AS Short, `long`.`value` AS 'Long description',kw.value AS 'Meta Keywords' ,
 `pq`.`stock_qty` AS 'Qty', `pq`.`vendor_price` AS 'price', CONCAT( 'https://www.shopmundo.com/media/catalog/product',`product_image`.value) AS 'Image', W.value AS 'Weight', model.`value` AS 'Model', brand.`value` AS 'brand',
 `vendor`.`vendor_name`, CONCAT( 'https://www.shopmundo.com/media/catalog/product', product_image_2.value) AS 'Variant Image'

FROM catalog_category_product  AS P
INNER JOIN
	catalog_category_entity_varchar AS C  ON (P.category_id = C.entity_id)
INNER JOIN
	catalog_product_entity AS sku ON (P.product_id = sku.entity_id)
INNER JOIN
	catalog_product_entity_int AS ei ON (ei.entity_id = sku.entity_id) 
INNER JOIN
	catalog_product_entity_varchar AS `name` ON (`name`.entity_id = ei.entity_id) 
INNER JOIN
	catalog_product_entity_int AS `status` ON (`status`.`entity_id` = ei.`entity_id` AND `status`.`attribute_id` = 96) 
INNER JOIN
	catalog_product_entity_text AS short ON (short.`entity_id` = ei.`entity_id`)
INNER JOIN
	catalog_product_entity_text AS `long` ON (`long`.`entity_id` = ei.`entity_id`)
INNER JOIN
	catalog_product_entity_text AS `kw` ON (`kw`.`entity_id` = ei.`entity_id`)
INNER JOIN
	`udropship_vendor_product` AS `pq` ON (`pq`.`product_id` = sku.`entity_id`)
INNER JOIN
    `catalog_product_entity_varchar` AS `product_image` ON (`product_image`.`entity_id` = ei.`entity_id`)
LEFT JOIN
	catalog_product_entity_decimal AS W ON (W.`entity_id` = ei.`entity_id`AND W.`attribute_id`= 80)
LEFT JOIN 
	catalog_product_entity_varchar AS model ON (model.`entity_id` = ei.`entity_id` AND model.`attribute_id` = 180)
LEFT JOIN
	catalog_product_entity_int AS ei_b ON (ei_b.entity_id = sku.entity_id AND ei_b.`attribute_id` =81 )
LEFT JOIN
	eav_attribute_option_value AS brand ON (brand.`option_id` = ei_b.`value` AND brand.`store_id` = 0)
LEFT JOIN
	catalog_product_relation AS cr ON (sku.entity_id = cr.parent_id)
RIGHT JOIN
	catalog_product_entity AS ce ON (ce.entity_id = cr.child_id)
INNER JOIN
	catalog_product_entity_int AS cp ON (cp.entity_id = ce.entity_id)
INNER JOIN 
	catalog_product_entity_int AS cp_color ON (cp_color.entity_id = cp.entity_id AND cp_color.`attribute_id` = 304)
LEFT JOIN
	eav_attribute_option_value AS color ON (color.`option_id` = cp_color.`value`)
INNER JOIN 
	catalog_product_entity_int AS cp_size ON (cp_size.entity_id = cp.entity_id AND cp_size.`attribute_id` = 301)
LEFT JOIN
	eav_attribute_option_value AS size ON (size.`option_id` = cp_size.`value`)
LEFT JOIN
	`udropship_vendor_product` AS `vendor_product` ON (`vendor_product`.`product_id` = sku.`entity_id`)
LEFT JOIN
	`udropship_vendor` AS `vendor` ON (`vendor`.`vendor_id` = `vendor_product`.`vendor_id`)
LEFT JOIN
       catalog_product_entity_varchar AS product_image_2 ON (product_image_2.entity_id = cp.entity_id AND product_image_2.attribute_id = 85)
		
WHERE  
C.attribute_id = 41 AND  C.store_id = '0' AND C.entity_id = 1231 AND `name`.attribute_id = 71 AND short.`attribute_id` = 73 AND `long`.`attribute_id` = 72 AND
 `kw`.`attribute_id` = 83 AND `product_image`.`attribute_id` = 85;
