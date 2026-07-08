# ============================
# Import Libraries
# ============================

import pandas as pd
import matplotlib.pyplot as plt

# ============================
# Load Dataset
# ============================

df = pd.read_csv("sales_dataset_5000.csv")

# View Dataset
df.head()

# ============================
# Standardize Column Names
# ============================

df.columns = df.columns.str.strip().str.lower()

# View Column Names
df.columns

# Dataset Shape
df.shape

# ============================
# Check Duplicate Records
# ============================

df[df.duplicated(subset="order_id", keep="first")]

duplicated = df.duplicated(subset="order_id", keep="first").sum()
print(duplicated)

# Dataset Information
df.info()

# ============================
# Fill Missing Values (Numeric Columns)
# ============================

num_col = df.select_dtypes(include="number").columns

for col in num_col:
    if abs(df[col].skew()) < 0.5:
        df[col] = df[col].fillna(df[col].mean())
    else:
        df[col] = df[col].fillna(df[col].median())

df.info()

# ============================
# Fill Missing Values (Object Columns)
# ============================

object_col = df.select_dtypes(include="object").columns

for col in object_col:
    if df[col].isna().sum() > 0:

        if col in ["customer_gender", "category", "city"]:
            df[col] = df[col].fillna(df[col].mode()[0])

        else:
            df[col] = df[col].fillna("unknown")

# View Random Records
df.sample(10)

# ============================
# Check Duplicates Again
# ============================

duplicated = df.duplicated(subset="order_id").sum()
print(duplicated)

# ============================
# Revenue by Category
# ============================

category = (
    df.groupby("category")[["revenue", "profit"]]
    .sum()
    .sort_values(by="revenue")
)

category

# ============================
# Revenue Split by Return Flag
# ============================

return_flag = df.groupby("return_flag")["revenue"].sum().astype(int)

plt.pie(
    return_flag.values,
    labels=return_flag.index,
    autopct="%1.1f%%"
)

plt.title("Return Flag vs Revenue Split")
plt.show()

# ============================
# Monthly Revenue Trend
# ============================

month_order = [
    "January", "February", "March",
    "April", "May", "June",
    "July", "August", "September",
    "October", "November", "December"
]

sales_trend = (
    df.groupby("month")["revenue"]
    .sum()
    .reindex(month_order)
)

plt.figure(figsize=(12,5))

plt.plot(
    sales_trend.index,
    sales_trend.values,
    color="lightgreen",
    marker="o",
    markerfacecolor="white",
    markeredgecolor="black"
)

plt.xticks(rotation=45)
plt.show()

# ============================
# Customer Gender Distribution
# ============================

gender_wise_split = df.groupby("customer_gender")["order_id"].count()

plt.pie(
    gender_wise_split.values,
    labels=gender_wise_split.index,
    autopct="%1.1f%%"
)

plt.show()

# ============================
# Units Sold by Sales Representative
# ============================

sales_rep_sold = (
    df.groupby("sales_rep")["units_sold"]
    .sum()
    .sort_values()
)

plt.bar(
    sales_rep_sold.index,
    sales_rep_sold.values,
    color="lightgreen"
)

plt.xticks(rotation=45)
plt.grid(axis="y")
plt.show()

# ============================
# Export Dataset to MySQL
# ============================

from sqlalchemy import create_engine
from sqlalchemy.engine import URL

connection_url = URL.create(
    drivername="mysql+pymysql",
    username="root",
    password="your password",
    host="localhost",
    port=3306,
    database="sales_project"
)

engine = create_engine(connection_url)

table_name = "sales_table"

df.to_sql(
    name=table_name,
    con=engine,
    if_exists="replace",
    index=False
)
