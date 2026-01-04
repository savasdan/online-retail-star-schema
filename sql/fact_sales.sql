CREATE TABLE fact_sales (
  invoice_no  VARCHAR(20) NOT NULL,   
  date_key    INT NOT NULL,
  customer_id INT UNSIGNED NOT NULL,
  stock_code  VARCHAR(20) NOT NULL,
  quantity    INT NOT NULL,
  unit_price  DECIMAL(10,2) NOT NULL,
  revenue     DECIMAL(12,2) NOT NULL
) ENGINE=InnoDB;

INSERT INTO fact_sales (
  invoice_no, date_key, customer_id, stock_code, quantity, unit_price, revenue
)
SELECT
  c.InvoiceNo AS invoice_no,
  d.date_key  AS date_key,
  c.CustomerID AS customer_id,
  c.StockCode AS stock_code,
  c.Quantity  AS quantity,
  c.UnitPrice AS unit_price,
  c.Revenue   AS revenue
FROM clean_online_retail c
JOIN dim_date d
  ON d.date_value = DATE(c.InvoiceDT);