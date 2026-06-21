
 use AmazonSalesDB
--Total Revnue
select 
Sum(Amount) as Total_Revenue_INR
from amazon_sales
where Status = 'Shipped - Delivered to Buyer';


--Top 5 Best-Selling Categories

select 
TOP 5
Category,
count(Order_ID) as Total_orders,
sum(Amount) as Total_revenue
from amazon_sales
where status = 'Shipped - Delivered to Buyer'
Group BY Category
Order BY Total_orders desc;


select * from amazon_sales

--Order Status Breakdown 

select 
Status,
Count(Order_ID) as Total_Orders,
Round((Count(Order_ID)*100) / (select count(*) from amazon_sales),2) as
Percentage
from amazon_sales
group by Status
Order By Total_Orders desc

-- Top 5 Cities by Revenue
select 
TOP 5
[ship_city] as City,
[ship_state] as State,
Count(Order_ID) as Total_Orders,
Sum(Amount) as Total_Revenue
from amazon_sales
where Status = 'Shipped - Delivered to Buyer'
       AND [ship_city] is not null
Group by [ship_city],[ship_state]
order by Total_Revenue Desc;

--Fulfillment Method Analysis 

Select 
Fulfilment as Fulfilled_by,
Count(Order_ID) as Total_Orders,
Sum(Amount) as Total_Revenue_Generated,
Round((Count(Order_Id) * 100.0)/(Select Count(*) from amazon_sales), 2) as
Percentage_of_Total_Orders
from amazon_sales
where Status = 'Shipped - Delivered to Buyer'
Group by Fulfilment


-- B2B vs B2C Customer Analysis

select 
  case 
    when B2B = 'True' Then 'B2B (Businesses)'
    else 'B2C (Normal Customers)'
end as Customer_Type,
Count(Order_ID) as Total_Orders,
Sum(Amount) as Total_Revenue,
Round((Sum(Amount)/(Select Sum(Amount) from amazon_sales where Status = 'Shipped - Delivered to Buyer')) * 100,2)
as Revenue_Percentage
from amazon_sales
where Status = 'Shipped - Delivered to Buyer'
Group By B2B
Order by Total_Revenue


-- Average Order Value by Category 

select 
Category,
Count(Order_ID) as Total_Orders,
Sum(Amount) as Total_Revenue,
Round(Avg(Amount),2) as Average_Order_Valuee_INR
from amazon_sales
where Status = 'Shipped - Delivered to Buyer' And Amount is not null
Group By Category
Order By Average_Order_Valuee_INR Desc;


-- Size Popularity Analysis 
select 
Size,
Count(order_id) as total_units_sold,
Round((Count(Order_id)*100)/(Select count(*) from amazon_sales where
Status = 'Shipped - Delivered to Buyer'),2) as percentage_Demand
from amazon_sales
where status = 'Shipped - Delivered to Buyer'
group by Size
Order by total_units_sold desc;


--Month-wise Sales Trend
select 
   left([Date],2) as Month_Number,
   count(Order_ID) as Total_orders,
   sum(amount) as Total_Revenue_INR
from amazon_sales
where Status = 'Shipped - Delivered to Buyer ' And [Date] is not null
group by Left([Date],2)
order by Month_Number asc;

--Shipping Speed Preferences
select 
[Ship_service_level] as Shipping_Method,
count(order_id) as Total_Orders,
Round((Count(order_id) * 100) / (select count(*) from amazon_sales where
Status = 'Shipped - Delivered to buyer'),2) as Percentage_of_orders
from amazon_sales
where status = 'Shipped - Delivered to Buyer'
group by [ship_service_level]
Order by Total_Orders desc;

--Top Product Per City

with CityCategorySales as (
select 
[ship_city] as city,
Category,
count(Order_ID) as Total_Orders,
ROW_NUMBER() over(partition by [ship_city] order by count(Order_id) desc) as
Rank_In_city
from amazon_sales
where Status = 'Shipped - Delivered to Buyer'
and [ship_city] IN ('Bengaluru','Hyderabad','Mumbai')
group by [ship_city],Category
)
select City,
Category as Top_Selling_category,
Total_Orders
from CityCategorySales
where Rank_In_city = 1;