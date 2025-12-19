#!/usr/bin/env python3
import zipfile
import json
from pprint import pprint

pbix_path = r"C:\Users\Marc\Desktop\Pharma Logistics.pbix"

print("📋 Fichiers dans le PBIX:\n")
with zipfile.ZipFile(pbix_path, 'r') as zip_ref:
    files = sorted(zip_ref.namelist())
    for file in files[:50]:
        print(f"  {file}")
    print(f"\nTotal: {len(files)} fichiers")

print("\n" + "="*70)
print("\n📄 Contenu du fichier Connections:\n")

try:
    with zipfile.ZipFile(pbix_path, 'r') as zip_ref:
        connections = zip_ref.read('Connections').decode('utf-8')
        print(connections)
except Exception as e:
    print(f"Erreur: {e}")

print("\n" + "="*70)
print("\n📊 Structure du PBIX\n")

with zipfile.ZipFile(pbix_path, 'r') as zip_ref:
    for file in zip_ref.namelist():
        if 'model' in file.lower() or 'dataset' in file.lower() or 'report' in file.lower():
            print(f"  ✅ {file}")
