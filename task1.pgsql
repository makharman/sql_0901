--Создать фун-ю по подсчету кол-ва продуктов по данным поставщика

CREATE OR REPLACE FUNCTION count_products(company_name VARCHAR) RETURNS SMALLINT AS $$
    SELECT COUNT(products.units_in_stock)
    FROM products
    JOIN suppliers ON products.supplier_id = suppliers.supplier_id
    WHERE suppliers.company_name = count_products.company_name;
$$ LANGUAGE SQL;

