import pandas as pd
from faker import Faker
import hashlib
import os

# Initialize Faker
fake = Faker()

# Define base path relative to the script file
base_path = os.path.join(os.path.dirname(__file__), '../data/unprocessed_Datasets')

# Define file paths
superstore_data_path = os.path.join(base_path, 'SuperstoreDataset.csv')
retail_data_path = os.path.join(base_path, 'Online Retail.xlsx')
online_retail_data_path = os.path.join(base_path, 'online_retail_II.csv')
dmart_data_path = os.path.join(base_path, 'DMart.csv')
myntra_data_path = os.path.join(base_path, 'myntra_products_catalog.csv')
bigbasket_data_path = os.path.join(base_path, 'BigBasket.csv')
sales_export_data_path = os.path.join(base_path, 'Sales-Export_2019-2020.csv')
data_csv_path = os.path.join(base_path, 'data.csv')

# Load datasets with appropriate encoding
superstore_data = pd.read_csv(superstore_data_path)
retail_data = pd.read_excel(retail_data_path)
online_retail_data = pd.read_csv(online_retail_data_path, encoding='ISO-8859-1')
dmart_data = pd.read_csv(dmart_data_path)
myntra_data = pd.read_csv(myntra_data_path)
bigbasket_data = pd.read_csv(bigbasket_data_path)
sales_export_data = pd.read_csv(sales_export_data_path)
data_csv = pd.read_csv(data_csv_path, encoding='ISO-8859-1')

# Clean up column names by stripping extra spaces
sales_export_data.columns = sales_export_data.columns.str.strip()

# Print column names to identify correct columns
print("Columns in online_retail_data:", online_retail_data.columns)

# Generate synthetic data for missing fields in Superstore dataset
superstore_data['email'] = superstore_data['Customer ID'].apply(lambda x: fake.email())
superstore_data['lastLogin'] = superstore_data['Customer ID'].apply(lambda x: fake.date_time_this_year())
superstore_data['password'] = superstore_data['Customer ID'].apply(lambda x: hashlib.md5(fake.password().encode()).hexdigest())
superstore_data['phone'] = superstore_data['Customer ID'].apply(lambda x: fake.phone_number())
superstore_data['supplier'] = superstore_data['Product ID'].apply(lambda x: fake.company())

# Use brand names as suppliers in Myntra, DMart, and BigBasket datasets
myntra_data['supplier'] = myntra_data['ProductBrand']
dmart_data['supplier'] = dmart_data['Brand']
bigbasket_data['supplier'] = bigbasket_data['Brand']

# Prepare data for combined dataset
customers = superstore_data[['Customer ID', 'Customer Name', 'email', 'lastLogin', 'password', 'City', 'State', 'Country', 'Postal Code', 'phone']].drop_duplicates(subset=['Customer ID']).dropna()
products = pd.concat([
    superstore_data[['Product ID', 'Product Name', 'supplier', 'Sales', 'Category', 'Sub-Category']].rename(columns={
        'Product ID': 'productId',
        'Product Name': 'name',
        'Sales': 'price',
        'Category': 'category',
        'Sub-Category': 'tags'
    }),
    myntra_data[['ProductID', 'ProductName', 'supplier', 'Price (INR)', 'Gender']].rename(columns={
        'ProductID': 'productId',
        'ProductName': 'name',
        'Price (INR)': 'price',
        'Gender': 'category'
    }),
    dmart_data[['Name', 'supplier', 'Price', 'Category']].rename(columns={
        'Name': 'name',
        'Price': 'price',
        'Category': 'category'
    }),
    bigbasket_data[['ProductName', 'supplier', 'Price', 'Category', 'SubCategory']].rename(columns={
        'ProductName': 'name',
        'Price': 'price',
        'Category': 'category',
        'SubCategory': 'tags'
    })
], ignore_index=True).drop_duplicates()

orders = pd.concat([
    data_csv[['InvoiceNo', 'CustomerID', 'StockCode', 'Quantity', 'UnitPrice', 'InvoiceDate']].rename(columns={
        'InvoiceNo': 'orderId',
        'CustomerID': 'customerId',
        'StockCode': 'productId',
        'Quantity': 'quantity',
        'UnitPrice': 'price',
        'InvoiceDate': 'date'
    }),
    sales_export_data.rename(columns={
        'order_id': 'orderId',
        'customer_name': 'customerId',
        'order_value_EUR': 'price',
        'date': 'date'
    })[['orderId', 'customerId', 'price', 'date']],
    online_retail_data.rename(columns={
        'Invoice': 'orderId',
        'StockCode': 'productId',
        'Quantity': 'quantity',
        'Price': 'price',
        'InvoiceDate': 'date'
    })[['orderId', 'productId', 'quantity', 'price', 'date']]
], ignore_index=True).drop_duplicates()

# Rename columns for consistency in customers
customers.columns = ['customerId', 'fullName', 'email', 'lastLogin', 'password', 'city', 'state', 'country', 'postalCode', 'phone']

# Save combined data to CSV
output_path = os.path.join(os.path.dirname(__file__), '../data/processed_Datasets')
os.makedirs(output_path, exist_ok=True)

customers.to_csv(os.path.join(output_path, 'combined_customers.csv'), index=False)
products.to_csv(os.path.join(output_path, 'combined_products.csv'), index=False)
orders.to_csv(os.path.join(output_path, 'combined_orders.csv'), index=False)

# Display the first few rows of each combined dataset
print("Combined Customers:\n", customers.head())
print("Combined Products:\n", products.head())
print("Combined Orders:\n", orders.head())
