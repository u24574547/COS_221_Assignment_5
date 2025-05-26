-- 1. Wipe existing listings
TRUNCATE TABLE listing;

-- 2. Initialize listing_id counter
SET @next_lid = 0;

-- 3. Create a stored procedure that respects vendor→category mapping
DELIMITER $$
CREATE PROCEDURE populate_listings_by_category()
BEGIN
  DECLARE pid INT;
  DECLARE cat VARCHAR(45);
  DECLARE vcnt INT;
  DECLARE lower_price DOUBLE;
  DECLARE upper_price DOUBLE;

  -- Cursor over products
  DECLARE cur CURSOR FOR
    SELECT product_id, category
      FROM products;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET pid = NULL;

  OPEN cur;
  prod_loop: LOOP
    FETCH cur INTO pid, cat;
    IF pid IS NULL THEN
      LEAVE prod_loop;
    END IF;

    -- Determine how many vendors (2–4)
    SET vcnt = FLOOR(2 + RAND()*3);

    -- Determine price range by product category
    CASE
      WHEN cat = 'beauty'           THEN SET lower_price=5,    upper_price=30;
      WHEN cat = 'fragrances'       THEN SET lower_price=20,   upper_price=200;
      WHEN cat = 'womens-watches'   THEN SET lower_price=100,  upper_price=5000;
      WHEN cat = 'furniture'        THEN SET lower_price=100,  upper_price=2000;
      WHEN cat = 'groceries'        THEN SET lower_price=1,    upper_price=20;
      WHEN cat = 'home-decoration'  THEN SET lower_price=10,   upper_price=200;
      WHEN cat = 'kitchen-accessories' THEN SET lower_price=10, upper_price=300;
      ELSE                            SET lower_price=10,   upper_price=500;
    END CASE;

    -- Insert vcnt listings for this product, choosing only matching vendors
    INSERT INTO listing 
      (listing_id, price, currency, in_stock, last_updated, product_id, vendor_id)
    SELECT
      (@next_lid := @next_lid + 1) AS listing_id,
      ROUND(lower_price + RAND()*(upper_price - lower_price), 2) AS price,
      'USD' AS currency,
      1 AS in_stock,
      NOW() AS last_updated,
      pid AS product_id,
      v.vendor_id
    FROM (
      -- pick vcnt random vendors who carry this category
      SELECT vendor_id
        FROM vendor
       WHERE FIND_IN_SET(cat, categories)
       ORDER BY RAND()
       LIMIT vcnt
    ) AS v;

  END LOOP prod_loop;
  CLOSE cur;
END$$
DELIMITER ;

-- 4. Run it
CALL populate_listings_by_category();

-- 5. Clean up
DROP PROCEDURE populate_listings_by_category;

-- 6. Confirm how many listings were created
SELECT COUNT(*) AS total_listings FROM listing;
