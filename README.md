🛍️ From Raw Receipts to Retail Insights

📦 A Real-World Retail Dataset

This project breathes life into actual shopping data from a UK-based online retailer.
Every row represents a real product someone added to their cart, a checkout, or a cancelled order.

Dataset Source: UCI Machine Learning Repository – “Online Retail”
Original Format: Excel, straight from the business’s system

🔄 How the Data Evolved

We followed a layered approach, much like preparing ingredients before cooking a meal.

1️⃣ The Raw Layer

Started with an Excel file full of messy, real-world transactional data
Converted it to CSV for easier processing
Loaded everything as-is into MySQL – warts and all
2️⃣ The Cleaning Layer – Finding Signal in the Noise

Here’s where we rolled up our sleeves. Not all data was useful for analysis:

What We Filtered Out:

❌ Cancelled invoices – these represent purchases that didn’t actually happen
❌ Invalid quantities (like negative numbers that don’t make sense for sales)
❌ Missing customer info – anonymous purchases couldn’t help us understand shopping patterns
❌ Problematic prices – zero or negative prices that skew calculations
What We Created:

✅ A clean, reliable clean_online_retail table
✅ Revenue per line item – because businesses run on numbers that matter
3️⃣ The Analytics Layer – Building for Insights

We designed a star schema – a popular pattern that makes asking business questions fast and intuitive.

⭐ The Star Schema: A Business-Friendly Structure

Think of this like organizing a retail store:

📊 The Fact Table – fact_sales

The heart of our data warehouse – every sale, every item, every transaction:

Each row = one product sold in one transaction
What we measure: quantity, price, revenue (the numbers that tell the business story)
👥 The Dimension Tables – The “Who, What, When”

🗓️ dim_date – The calendar context
(When did this sale happen? Year? Month? Day?)

👤 dim_customer – The shopper context
(Who bought this? Where are they from?)

📦 dim_product – The product context
(What was sold? How was it described in the system?)

✨ The Magic: By separating “what happened” (facts) from “the context” (dimensions), business questions become simple:

“Show me monthly revenue by country”
“What products do French customers buy most in December?”
“How does weekday vs weekend shopping differ?”
📈 The Cleaning Journey – By the Numbers

Stage	Rows	What It Means
Raw Data	541,909	Every single record from the original system
Clean Data	397,884	Actual, valid sales we can analyze
Rows Removed	144,025	Data that didn’t tell a useful business story
That’s 144,025 rows of noise filtered out – cancelled orders, system errors, and incomplete transactions – leaving us with clean, trustworthy data for decision-making.

🛠️ Our Toolbox

MySQL – Our data home
SQL – The language of data transformation
Python – For the heavy lifting of data loading
MySQL Workbench – Where we visualized how everything connects
Git & GitHub – Tracking every change, like version control for ideas
🌟 The Human Impact

This isn’t just about tables and queries. This is about:

Helping a business understand its customers better
Turning chaotic data into clear stories
Building a foundation for questions like:

“Should we expand to Germany?”
“Which products should we promote in summer?”
“Are our UK customers more valuable than we thought?”
Every row in our final fact table represents a real product that a real person decided to buy. Our job was to organize those stories so they could be heard.

From messy Excel sheets to clear business insights – that’s the journey of data.
