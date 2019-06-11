SELECT ce.entity_id, c.sku AS 'Parents', ce.sku AS 'Child', color.`value` AS 'Color', size.`value` AS 'size', CONCAT( 'https://www.shopmundo.com/media/catalog/product', product_image.value) AS 'IMG'

FROM 
	catalog_product_entity AS c
LEFT JOIN
	catalog_product_relation AS cr ON (c.entity_id = cr.parent_id)
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
       catalog_product_entity_varchar AS product_image ON (product_image.entity_id = cp.entity_id AND product_image.attribute_id = 85)

WHERE 
	ce.sku != '' AND c.sku != '' AND cp.attribute_id = 96 AND cp.value = 1

ORDER BY c.sku;



