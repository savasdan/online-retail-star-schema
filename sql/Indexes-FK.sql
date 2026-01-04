ALTER TABLE fact_sales
  ADD INDEX idx_fact_date (date_key),
  ADD INDEX idx_fact_customer (customer_id),
  ADD INDEX idx_fact_product (stock_code),
  ADD INDEX idx_fact_invoice (invoice_no);


ALTER TABLE fact_sales
  ADD CONSTRAINT fk_fact_date
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
  ADD CONSTRAINT fk_fact_customer
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
  ADD CONSTRAINT fk_fact_product
    FOREIGN KEY (stock_code) REFERENCES dim_product(stock_code);