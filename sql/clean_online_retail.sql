CREATE TABLE clean_online_retail (
  InvoiceNo   VARCHAR(20)  NOT NULL,
  StockCode   VARCHAR(20)  NOT NULL,
  Description VARCHAR(255) NULL,
  Quantity    INT          NOT NULL,
  InvoiceDT   DATETIME     NOT NULL,
  UnitPrice   DECIMAL(10,2) NOT NULL,
  CustomerID  INT UNSIGNED NOT NULL,
  Country     VARCHAR(60)  NULL,
  Revenue     DECIMAL(12,2) NOT NULL
) ENGINE=InnoDB;

INSERT INTO clean_online_retail (
  InvoiceNo, StockCode, Description, Quantity, InvoiceDT, UnitPrice, CustomerID, Country, Revenue
)
SELECT
  InvoiceNo,
  CAST(StockCode AS CHAR(20)) AS StockCode,
  NULLIF(TRIM(Description), '') AS Description,
  Quantity,
  InvoiceDate AS InvoiceDT,                 -- ήδη DATETIME
  UnitPrice,
  CAST(CustomerID AS UNSIGNED) AS CustomerID,
  NULLIF(TRIM(Country), '') AS Country,
  ROUND(Quantity * UnitPrice, 2) AS Revenue
FROM online_retail_raw
WHERE InvoiceNo IS NOT NULL
  AND StockCode IS NOT NULL
  AND InvoiceDate IS NOT NULL
  AND CustomerID IS NOT NULL
  AND Quantity > 0
  AND UnitPrice > 0
  AND InvoiceNo NOT LIKE 'C%';