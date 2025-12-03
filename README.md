'**** Overview ****' 


' 

*Goal*
My  current goal is to simply wrote a script to automate the  process of pollutant load modelling by fetching the data (in our case simulated data from Googlesheets), converting into data frame,  
classifying each day load as OK, Alert based on Minnesota standards and saving output as a CSV in the Google Sheet tab for maintaing records and sending an email notification 
to the suppoed Manager everyday with very simple details of that day. 

Near Future goal : Later, I do want  train and build a Random Forest model which has shown to outperfom standard Flux32 pollutant load estimation to improve load concentrate predictions 
and its especially useful as it can be imputated through KNN to handle missing values when we do not have enough data and when some data is missing.  
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
<img width="1047" height="367" alt="Screenshot 2025-12-02 at 7 59 54 PM" src="https://github.com/user-attachments/assets/3ef882e2-6fa8-46de-bd03-0feea57d26d3" />

<img width="1439" height="808" alt="Screenshot 2025-12-02 at 8 00 42 PM" src="https://github.com/user-attachments/assets/e9854098-d6f9-4a3e-811e-7c38af32c015" />

<img width="367" height="212" alt="Screenshot 2025-12-02 at 8 02 05 PM" src="https://github.com/user-attachments/assets/23d4b55f-b6de-46a2-9b4d-25ca745128ab" />



