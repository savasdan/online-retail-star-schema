CREATE TABLE dim_product (
  stock_code  VARCHAR(20) NOT NULL,
  description VARCHAR(255) NULL,
  PRIMARY KEY (stock_code)
) ENGINE=InnoDB;

INSERT INTO dim_product (stock_code, description)
SELECT
  CAST(StockCode AS CHAR(20)) AS stock_code,
  MAX(NULLIF(TRIM(Description), '')) AS description
FROM clean_online_retail
GROUP BY CAST(StockCode AS CHAR(20));