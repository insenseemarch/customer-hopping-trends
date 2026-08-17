import duckdb
import pandas as pd

csv_file = "../customer_shopping_behavior-clean.csv"  # chỉnh đường dẫn nếu cần

# 1. Phân tích sản phẩm bán chạy theo giới tính
query1 = f"""
SELECT Gender, "Item Purchased", COUNT(*) AS total_orders
FROM read_csv_auto('{csv_file}')
GROUP BY Gender, "Item Purchased"
ORDER BY total_orders DESC;
"""
print("1. Sản phẩm bán chạy theo giới tính:")
print(duckdb.query(query1).to_df().head(), "\n")

# 2. Tỷ lệ đơn hàng bị trả lại theo phương thức thanh toán
query2 = f"""
SELECT "Payment Method",
       COUNT(CASE WHEN "Return Status" = 'Returned' THEN 1 END) AS returned_orders,
       COUNT(CASE WHEN "Return Status" = 'Not Returned' THEN 1 END) AS successful_orders,
       ROUND(100.0 * COUNT(CASE WHEN "Return Status" = 'Returned' THEN 1 END) / COUNT(*), 2) AS return_rate
FROM read_csv_auto('{csv_file}')
GROUP BY "Payment Method";
"""
print("2. Tỷ lệ đơn hàng bị trả lại theo phương thức thanh toán:")
print(duckdb.query(query2).to_df().head(), "\n")

query3 = f"""
SELECT 
    CASE 
        WHEN Age < 25 THEN '<25'
        WHEN Age BETWEEN 25 AND 35 THEN '25-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        ELSE '>46'
    END AS AgeGroup,
    SUM("Purchase Amount (₹)") AS revenue
FROM read_csv_auto('{csv_file}')
GROUP BY AgeGroup
ORDER BY revenue DESC;
"""
print("3. Doanh thu theo nhóm tuổi:")
print(duckdb.query(query3).to_df(), "\n")

 
# 4. Tần suất mua lại theo khách hàng
query4 = f"""
SELECT "Customer ID", COUNT(*) AS purchase_count
FROM read_csv_auto('{csv_file}')
GROUP BY "Customer ID"
HAVING COUNT(*) > 1
ORDER BY purchase_count DESC;
"""
print("4. Tần suất mua lại theo khách hàng:")
print(duckdb.query(query4).to_df().head(), "\n")

# 5. Phương thức thanh toán ưa chuộng theo nhóm tuổi
query5 = f"""
WITH PaymentStats AS (
    SELECT 
        CASE 
            WHEN Age < 25 THEN '<25'
            WHEN Age BETWEEN 25 AND 35 THEN '25-35'
            WHEN Age BETWEEN 36 AND 45 THEN '36-45'
            ELSE '>46'
        END AS AgeGroup,
        "Payment Method",
        COUNT(*) AS total_orders,
        ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (
            PARTITION BY 
                CASE 
                    WHEN Age < 25 THEN '<25'
                    WHEN Age BETWEEN 25 AND 35 THEN '25-35'
                    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
                    ELSE '>46'
                END
        ), 2) AS percentage
    FROM read_csv_auto('{csv_file}')
    GROUP BY AgeGroup, "Payment Method"
)
SELECT AgeGroup, "Payment Method", total_orders, percentage
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY AgeGroup ORDER BY total_orders DESC) AS rn
    FROM PaymentStats
) t
WHERE rn = 1
ORDER BY AgeGroup;
"""
print("5. Phương thức thanh toán phổ biến nhất theo nhóm tuổi:")
print(duckdb.query(query5).to_df(), "\n")


# 6. Điểm đánh giá theo thời gian giao hàng
query6 = f"""
SELECT "Delivery Speed", AVG("Review Rating") AS avg_rating,
       COUNT(*) AS total_orders
FROM read_csv_auto('{csv_file}')
GROUP BY "Delivery Speed"
ORDER BY avg_rating DESC;
"""
print("6. Điểm đánh giá theo thời gian giao hàng:")
print(duckdb.query(query6).to_df().head(), "\n")