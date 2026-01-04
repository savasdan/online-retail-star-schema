import sys
print("Python executable:", sys.executable)

import pandas as pd
from sqlalchemy import create_engine

#Reading file.
file_path = "/Users/savasdan/Downloads/online_retail_p2.xlsx"
df = pd.read_excel(file_path, sheet_name=0)

#Cleaning column.
df.columns = (
    df.columns
      .astype(str)
      .str.strip()
      .str.lower()
      .str.replace(" ", "_")
      .str.replace(r"[^a-z0-9_]", "", regex=True)
)

#Connect to mySQL.
USER = "root"
PASSWORD = "20253614"
HOST = "localhost"
PORT = 3306
DB = "star_schema"

engine = create_engine(f"mysql+pymysql://{USER}:{PASSWORD}@{HOST}:{PORT}/{DB}")
df.to_sql("online_retail_raw", con=engine, if_exists="replace", index=False)
