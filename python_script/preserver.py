import csv

input_file = 'D:/01-DATA/02-Projects/University/04-Advanced_Database/Final_project/AbcDB/data/processed_Datasets/combined_orders.csv'
output_file = 'D:/01-DATA/02-Projects/University/04-Advanced_Database/Final_project/AbcDB/data/processed_Datasets/combined_orders_preprocessed.csv'

with open(input_file, 'r', encoding='utf-8') as infile, open(output_file, 'w', newline='', encoding='utf-8') as outfile:
    reader = csv.reader(infile)
    writer = csv.writer(outfile)
    
    header = next(reader)
    writer.writerow(header)
    
    for row in reader:
        row[4] = row[4].replace(',', '')  # Remove commas from the price column
        writer.writerow(row)

print("Preprocessing complete.")