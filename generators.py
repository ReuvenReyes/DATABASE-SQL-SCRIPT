LANDMARKS = ("Kamayan sa Palaisdaan",
          "Kamay ni Hesus",
          "Lucban MMG Hospital",
          "Southern Luzon State University",
          "Pamilihang Bayan ng Lucban")

bayan_to_site = ("Enverga University",
          "SM City Lucena",
          "Dumaca River",
          "STI College",
          "New Lucena City Public Market")

bayan_to_gulang_gulang = ("Lucena Diversion Road",
          "Southern Luzon Command",
          "Puregold Gulang-Gulang",
          "Quezon Medical Center")


bayan_to_calmar_landmarks = ("Lucena MMG Hospital",
          "SM City Lucena",
          "Dumaca River",
          "STI College",
          "New Lucena City Public Market")

ROUTE_ID = 'RAA0005';

for landmark in LANDMARKS:
    print(f"('{ROUTE_ID}', '{landmark}'),")