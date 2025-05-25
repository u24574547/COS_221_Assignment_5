
DROP PROCEDURE IF EXISTS populate_listings_by_category;

SET @next_lid = (SELECT IFNULL(MAX(listing_id), 0) FROM listing);

DELIMITER $$
CREATE PROCEDURE populate_listings_by_category()
BEGIN
  DECLARE pid       INT;
  DECLARE cat       VARCHAR(45);
  DECLARE vcnt      INT;
  DECLARE lower_pr  DOUBLE;
  DECLARE upper_pr  DOUBLE;
  DECLARE match_cnt INT;

  -- Only pick up products whose IDs are greater than the max we’ve already listed
  DECLARE cur CURSOR FOR
    SELECT product_id, category
      FROM products
     WHERE product_id > IFNULL((SELECT MAX(product_id) FROM listing), 0)
     ORDER BY product_id;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET pid = NULL;

  OPEN cur;
  prod_loop: LOOP
    FETCH cur INTO pid, cat;
    IF pid IS NULL THEN 
      LEAVE prod_loop; 
    END IF;

    -- pick 2–4 random vendors
    SET vcnt = FLOOR(2 + RAND()*3);

    -- set price bands by category
    CASE cat
      WHEN 'beauty'              THEN SET lower_pr=5,    upper_pr=30;
      WHEN 'fragrances'          THEN SET lower_pr=20,   upper_pr=200;
      WHEN 'womens-watches'      THEN SET lower_pr=100,  upper_pr=5000;
      WHEN 'furniture'           THEN SET lower_pr=100,  upper_pr=2000;
      WHEN 'groceries'           THEN SET lower_pr=1,    upper_pr=20;
      WHEN 'home-decoration'     THEN SET lower_pr=10,   upper_pr=200;
      WHEN 'kitchen-accessories' THEN SET lower_pr=10,   upper_pr=300;
      ELSE                           SET lower_pr=10,   upper_pr=500;
    END CASE;

    -- count how many vendors actually list this category
    SELECT COUNT(*) 
      INTO match_cnt
      FROM vendor
     WHERE FIND_IN_SET(
             cat COLLATE utf8mb4_general_ci,
             categories
           );

    IF match_cnt > 0 THEN
      -- insert from matching vendors
      INSERT INTO listing
        (listing_id, price, currency, in_stock, last_updated, product_id, vendor_id)
      SELECT
        (@next_lid := @next_lid + 1),
        ROUND(lower_pr + RAND()*(upper_pr - lower_pr), 2),
        'USD',
        1,
        NOW(),
        pid,
        v.vendor_id
      FROM (
        SELECT vendor_id
          FROM vendor
         WHERE FIND_IN_SET(
                 cat COLLATE utf8mb4_general_ci,
                 categories
               )
         ORDER BY RAND()
         LIMIT vcnt
      ) AS v;

    ELSE
      -- fallback: pick any vendors
      INSERT INTO listing
        (listing_id, price, currency, in_stock, last_updated, product_id, vendor_id)
      SELECT
        (@next_lid := @next_lid + 1),
        ROUND(lower_pr + RAND()*(upper_pr - lower_pr), 2),
        'USD',
        1,
        NOW(),
        pid,
        v.vendor_id
      FROM (
        SELECT vendor_id
          FROM vendor
         ORDER BY RAND()
         LIMIT vcnt
      ) AS v;
    END IF;

  END LOOP prod_loop;
  CLOSE cur;
END$$
DELIMITER ;

CALL populate_listings_by_category();


DROP PROCEDURE populate_listings_by_category;

SELECT COUNT(*) AS total_listings,
       MIN(product_id) AS first_pid,
       MAX(product_id) AS last_pid
  FROM listing;
