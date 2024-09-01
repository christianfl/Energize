#!/usr/bin/env python3

# cd scripts/update_sfcd_data
# python3 -m venv .venv
# source .venv/bin/activate
# pip install -r requirements.txt

import requests
import pandas

from io import BytesIO

# Set variables

## URLs of Swiss Food Composition Database (2023-08)
sfcd_url_en = 'https://naehrwertdaten.ch/wp-content/uploads/2023/08/Swiss_food_composition_database.xlsx'
sfcd_url_de = 'https://naehrwertdaten.ch/wp-content/uploads/2023/08/Schweizer_Nahrwertdatenbank.xlsx'
sfcd_url_it = 'https://naehrwertdaten.ch/wp-content/uploads/2023/08/Banca_dati_svizzera_dei_valori_nutritivi.xlsx'
sfcd_url_fr = 'https://naehrwertdaten.ch/wp-content/uploads/2023/08/Base_de_donnees_suisse_des_valeurs_nutritives.xlsx'

## Sheet names for generic food
sfcd_sheet_en = 'Generic Foods'
sfcd_sheet_de = 'Generische Lebensmittel'
sfcd_sheet_it = 'Alimenti generici'
sfcd_sheet_fr = 'Aliments génériques'

## Output file name
sfcd_file_name_en = 'sfcd'

# Download and convert databases

## Download databases
response_get_en = requests.get(sfcd_url_en)
response_get_de = requests.get(sfcd_url_de)
response_get_it = requests.get(sfcd_url_it)
response_get_fr = requests.get(sfcd_url_fr)

## Read databases into pandas dataframe
df_en = pandas.read_excel(BytesIO(response_get_en.content), sheet_name=sfcd_sheet_en, header=2)
df_de = pandas.read_excel(BytesIO(response_get_de.content), sheet_name=sfcd_sheet_de, header=2)
df_it = pandas.read_excel(BytesIO(response_get_it.content), sheet_name=sfcd_sheet_it, header=2)
df_fr = pandas.read_excel(BytesIO(response_get_fr.content), sheet_name=sfcd_sheet_fr, header=2)

## Merge dataframes
df_all = pandas.merge_ordered(df_en,df_de[['ID','Name', 'Synonyme']],on='ID', how='left', suffixes=['_EN', '_DE'])
df_all = pandas.merge_ordered(df_all,df_it[['ID','Nome', 'Sinonimi']],on='ID', how='left', suffixes=['_EN', '_IT'])
df_all = pandas.merge_ordered(df_all,df_fr[['ID','Nom', 'Synonymes']],on='ID', how='left', suffixes=['_EN', '_FR'])

## Drop specific columns to save space
droplist = [col for col in df_all.columns if col.startswith('Derivation') or col.startswith('Source')]
df_all = df_all.drop(columns=droplist)
df_all = df_all.drop(columns=['ID V 4.0', 'ID SwissFIR', 'Category', 'Density', 'Matrix unit', 'Energy, kilojoules (kJ)', 'Record has changed'])

## Rename columns
df_all = df_all.rename(columns={'Synonyms': 'Synonyms_EN', 'Synonyme': 'Synonyms_DE', 'Nome': 'Name_IT', 'Sinonimi': 'Synonyms_IT', 'Nom': 'Name_FR', 'Synonymes': 'Synonyms_FR'})

## Save merged into CSV
df_all.to_csv('sfcd.csv', index=False, sep='§')
