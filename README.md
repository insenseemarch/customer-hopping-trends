# Customer Shopping Trends Indian - Data Analysis

## 📖 Overview
This project analyzes the **Customer Shopping Trends Indian** dataset to uncover insights into consumer behavior, purchasing patterns, payment preferences, and delivery satisfaction. The dataset is synthetic, designed for beginners to practice data analysis, but it closely mimics real-world retail and e-commerce constraints in India.

Dataset link:  
[Customer Shopping Trends Indian (Kaggle)](https://www.kaggle.com/datasets/rewantbhriguvanshi/customer-shopping-trends-indian?select=customer_shopping_behavior-clean.csv)

---

## 📊 Dataset Description
The dataset captures a wide range of customer attributes:
- **Demographics**: Age, Gender, Location
- **Transactions**: Purchase Date, Item, Brand, Category, Quantity, Purchase Amount (₹), Discount (%)
- **Shopping Context**: Purchase Channel (Online/Offline), Online Store, Festival/Sale Event
- **Logistics**: Shipping Charge, Delivery Speed/Time
- **Customer Behavior**: Subscription Status, Payment Method, Review Rating, Return Status, Frequency of Purchases, Previous Purchases

### Key Features
- **Brand & Category Logic**: Brands only sell what they actually produce (e.g., Nike sells footwear/activewear).
- **Platform Exclusivity**: Flagship sales tied to specific platforms and months (e.g., Flipkart’s Big Billion Days).
- **Economic Tiers**: Pricing uses a base cost × brand premium multiplier.
- **Logistical Integrity**: Delivery times and ratings reflect realistic constraints.

### Recommended Use Cases
- RFM Analysis (Recency, Frequency, Monetary value)
- Time-Series Forecasting (seasonal sales spikes)
- Logistics & Supply Chain optimization
- Demographic dashboards (age vs. product category preferences)

---

## ⚙️ Tools & Libraries
- **DuckDB**: SQL queries directly on CSV files
- **Pandas**: Data manipulation and analysis
- **Python**: For executing queries and handling results

---

## 📑 SQL Queries Implemented
1. **Best-Selling Products by Gender**  
   Identify top products purchased by male and female customers.

2. **Return Rate by Payment Method**  
   Calculate return percentages across different payment methods.

3. **Revenue by Age Group**  
   Aggregate purchase amounts by age ranges (<25, 25–35, 36–45, >46).

4. **Repeat Purchase Frequency**  
   Find customers with multiple purchases to highlight loyalty.

5. **Most Popular Payment Method by Age Group**  
   Determine dominant payment methods for each age segment.

6. **Average Review Rating by Delivery Speed**  
   Analyze how delivery speed impacts customer satisfaction.

---

## 📈 Key Insights
- **Product Preferences**: Men prefer Kurta and Running Shoes; women prefer Saree and Sneakers.
- **Return Behavior**: Cash and Debit Card have the highest return rates; Wallet payments are most reliable.
- **Revenue Drivers**: Customers over 46 generate the highest revenue; younger customers spend less.
- **Customer Loyalty**: Several customers made 10 repeat purchases, indicating strong retention potential.
- **Payment Trends**: UPI dominates across all age groups (~42% of transactions).
- **Delivery Satisfaction**: Faster delivery (Express, Same Day) yields higher ratings; Standard delivery scores lowest.

---

## 🚀 Business Applications
These insights can guide e-commerce app development:
- Personalized product recommendations by gender and age.
- Optimized checkout flow prioritizing UPI and Wallet payments.
- Loyalty programs for repeat customers.
- Age-based marketing segmentation.
- Premium delivery options to boost satisfaction and ratings.

---

## 📌 Notes
- This dataset is **synthetic** and intended for learning purposes.
- Results are illustrative but provide realistic scenarios for retail analytics.
