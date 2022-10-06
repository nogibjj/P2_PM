
import pandas as pd
import sys

df = pd.read_csv(sys.argv[1])
df = df.reset_index()

print(df)
print(df.shape)
print(df.describe())
