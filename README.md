Amazon India Sales Performance Analytics & Dashboard:
An end-to-end Data Analytics project analyzing 1.2 Lakh+ (128,976) transactions of an Amazon India seller (April - June 2022).
This project demonstrates database design, data cleaning, advanced querying, and interactive visualization using MS SQL Server and Power BI.
In the highly competitive e-commerce sector, managing inventory efficiency, fulfillment speeds, and cancellation losses is critical for profitability.
This project analyzes the transactional sales performance of an Amazon India merchant selling apparel across various categories (T-shirts, Shirts, Blazers, Trousers) during Q2 2022.

Project Execution:
Database & Schema Design: Setup and configured AmazonSalesDB in MS SQL Server (SSMS), resolved column size/overflow boundaries to handle over 1.2 Lakh rows, and defined proper indexing.
SQL Data Cleaning & Transformation: Handled missing/NULL data points in geography fields, standardized date strings, and cleaned column headers to standard SQL conventions (converting spaces/hyphens to underscores).
Advanced SQL Querying: Written 11 comprehensive business logic queries using Common Table Expressions (CTEs), Window Functions (ROW_NUMBER() OVER (PARTITION BY...)), Case Statements, and multi-level Aggregations.
Power BI Integration & DAX: Connected the SQL database to Power BI Desktop, constructing advanced DAX measures to calculate dynamic metrics such as Cancellation Rate (%) and Average Order Value (AOV).
Executive Dashboarding: Developed an interactive business dashboard featuring geographical mapping, monthly sales trend charts, category breakdowns, and order status summaries controlled by live slicer parameters.

key business Insight:
Product Performance: T-shirts are the primary revenue driver, bringing in INR 34.38 Million (nearly 50% of total revenue), followed by Shirts at INR 18.78 Million.
Geographic Sales Clusters: Southern and Western metros generate the highest revenue, led by Bengaluru (INR 6.18 Million) and Hyderabad (INR 4.33 Million), indicating ideal locations for inventory storage hubs.
Monthly Sales Trends: Sales peaked significantly in April (INR 25.66 Million) and remained steady in May (INR 23.46 Million) before experiencing a minor seasonal decline in June (INR 19.75 Million).
Logistics Operations: Amazon FBA (Fulfilled by Amazon) handles 69.56% of total shipments, while Merchant shipping handles 30.44%. Moving high-demand items fully to FBA is recommended to increase delivery success rates.
