CREATE TABLE dim_date (
  date_key   INT NOT NULL,
  date_value DATE NOT NULL,
  year       SMALLINT NOT NULL,
  month      TINYINT  NOT NULL,
  day        TINYINT  NOT NULL,
  PRIMARY KEY (date_key),
  UNIQUE KEY uq_dim_date_value (date_value)
) ENGINE=InnoDB;

INSERT INTO dim_date (date_key, date_value, year, month, day)
SELECT
  DATE_FORMAT(d.date_value, '%Y%m%d') + 0 AS date_key,
  d.date_value,
  YEAR(d.date_value)  AS year,
  MONTH(d.date_value) AS month,
  DAY(d.date_value)   AS day
FROM (
  SELECT DISTINCT DATE(InvoiceDT) AS date_value
  FROM clean_online_retail
) d;
