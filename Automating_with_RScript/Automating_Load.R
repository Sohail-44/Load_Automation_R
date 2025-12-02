
'****Overview****' 


' 
*Background*

I started learning about pollutant load modelling taking inspiration from Metropolitan Councils work, I realized Random Forests outperforms traditional Regression 
based standard monirtoring system such as FLUX32 and MPCS as Random Forest captures non-linear and complex relationship and since it averages the decision trees it 
gives more accurate predictions and learns the "if-then" relationship.  I came across 2 research papers that explains how cutting-edge ML Models such as Random Forest
could potentially improve pollutant load modelling  : " A random forest approach to improve estimates of tributary nutrient loading", 
"Using Random Forest, a machine learning approach to predict nitrogen, phosphorus, and sediment event mean concentrations in urban runoff". 
These reseach papers are mentioned by ScienceDirect Journal. 

*Goal*
My goal is automate whole process of pollutant load modelling by fetching the data, converting into data frame, training Ramdom Forest Models,  predicting load better, 
classifying each day load as OK, Alert or Emergency based on General standards and saving output as a CSV for maintaing records and sending an email notification 
to the Manager everyday with important and necerrsay details of that day. The main purpose to build a model is that it can be tweaked to handle missing values when we do not have 
enough data and when some data is missing through imputation. 
'



'*Units of Observation*
Daily Water Quality conditions at one location'

' *Column Description*

# Flow_Rate_cms              : River discharge (m^3/s); higher = more water volume.
# Water_Temp_C               : Water temperature (°C).
# pH                         : Acidity/basicity; 7 = neutral.
# Specific_Conductance_uScm  : Dissolved ions; higher = more salts (µS/cm).
# Turbidity_NTU              : Cloudiness; higher = more suspended sediment (NTU).
# TSS_mg_L                   : Total Suspended Solids (mg/L).
# TP_mg_L                    : Total Phosphorus (mg/L).
# DOP_mg_L                   : Dissolved Organic Phosphorus (mg/L).
# Nitrate_N_mg_L             : Nitrate as N (mg/L).
# DO_mg_L                    : Dissolved Oxygen (mg/L).
# Flag_Notes                 : Status text (“OK” / “ALERT”) after comparing to standards.

'

## Using Google sheets as a database  

# Installing packages 
library(tidyverse)
library(googlesheets4)
library(dplyr)




#Authenticating 
gs4_deauth()

# reading the sheet and inserting  data
df <- read_sheet("https://docs.google.com/spreadsheets/d/1PH5RPoDfx5ONpsVGl0ixRvbsvo9PQnoyNvMhRIZkzXw/edit?usp=sharing") 
df %>% 
  head()

gs4_auth()
sheet_id = "1PH5RPoDfx5ONpsVGl0ixRvbsvo9PQnoyNvMhRIZkzXw"

# Writing to sheets file using the sheet_write() function that takes the sheet id as argument and able to write sheets and maniptale etc

 df %>% 
   sheet_write(ss = sheet_id, sheet = "Load Modelling") 
 
 # Calculating the load_concentrate and adding it to the df which'll be our reponse variable 
 
 df<- df %>% 
   mutate(
     # daily water volume in liters -- flow in cubic meters per second* number of seconds/day and converting them to liters coz 1 m³ = 1000 L
     Volume_L_day = Flow_Rate_cms * 86400 * 1000,
     # pollutant load (here using TSS) in kg/day -- concentration of pollutant (TSS milligrams/liter) * volume_L_day to get  total milligrams of pollutant moved that day 
     load_concentrate_kg_day = TSS_mg_L * Volume_L_day * 1e-6
   ) %>% 
   relocate(Volume_L_day, load_concentrate_kg_day, .before = Flag_Notes) 

 view(df)
 
 df %>% 
   sheet_write(ss = sheet_id, sheet = "Load Modelling") 


 
 
 

 

