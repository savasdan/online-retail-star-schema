CREATE TABLE dim_customer (
  customer_id INT UNSIGNED NOT NULL,
  country     VARCHAR(60) NULL,
  PRIMARY KEY (customer_id)
) ENGINE=InnoDB;

INSERT INTO dim_customer (customer_id, country)
SELECT x.customer_id, MIN(x.country) AS country
FROM (
  SELECT
    CustomerID AS customer_id,
    TRIM(Country) AS country,
    COUNT(*) AS cnt
  FROM clean_online_retail
  GROUP BY CustomerID, TRIM(Country)
) x
JOIN (
  SELECT customer_id, MAX(cnt) AS max_cnt
  FROM (
    SELECT
      CustomerID AS customer_id,
      TRIM(Country) AS country,
      COUNT(*) AS cnt
    FROM clean_online_retail
    GROUP BY CustomerID, TRIM(Country)
  ) t
  GROUP BY customer_id
) m
  ON x.customer_id = m.customer_id
 AND x.cnt = m.max_cnt
GROUP BY x.customer_id;