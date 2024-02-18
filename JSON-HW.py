import json
import pandas as pd

#Part 1
with open('JSON-HW.json') as file:
  data = json.load(file)
  teams_data = data['teams']

#---------------------------------------------------------------------------------------------------------------------------------------

#Part 2
column_names = ['tid', 'cid', 'did', 'region', 'name', 'abbrev', 'pop', 'city', 'state', 'latitude', 'longitude']

pandas_file = pd.DataFrame(data=teams_data, columns=column_names)

#---------------------------------------------------------------------------------------------------------------------------------------

#Part 3
print(pandas_file.head(100))

#---------------------------------------------------------------------------------------------------------------------------------------

#Part 4A
print("There are", str(len(pandas_file)), "teams")

#---------------------------------------------------------------------------------------------------------------------------------------

#Part 4B
teams_in_virginia = pandas_file[pandas_file['state'] == 'VA']
print("There are", len(teams_in_virginia), "teams in Virginia")

#---------------------------------------------------------------------------------------------------------------------------------------

#Part 4C
printed_mascots = set()

for index, row in pandas_file.iterrows():
  team_mascot = row['name']
  if team_mascot not in printed_mascots:
    duplicate_mascot_count = pandas_file[pandas_file['name'] == team_mascot].shape[0]
    if duplicate_mascot_count > 1:
      printed_mascots.add(team_mascot)
      print(f'{team_mascot: <13} {duplicate_mascot_count}')
