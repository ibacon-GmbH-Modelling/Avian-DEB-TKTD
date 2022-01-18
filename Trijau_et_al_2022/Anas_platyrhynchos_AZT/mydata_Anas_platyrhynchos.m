function [data, auxData, metaData, txtData, weights] = mydata_Anas_platyrhynchos

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Anas_platyrhynchos'; 
metaData.species_en = 'Mallard'; 
metaData.T_typical  = C2K(40.2); % K, body temp from Smith et al 1976
metaData.data_0     = {}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2011 11 20];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 24];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Elke Zimmer'};    
metaData.date_mod_2     = [2018 04 17];              
metaData.email_mod_2    = {'elke.zimmer@ibacon.com'};            
metaData.address_mod_2  = {'ibacon GmbH'};   

metaData.curator     = {'Starrrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 04 19]; 

%% set data
% zero-variate data

%% TOX DATA SYNGENTA - Azoxystrobin (Data 11)

% Observed average body weight(average over all replicates)
% as a function of time for different concentrations (a.i.) for females.
% Exposed via feeding. Concentration in food is reported in ppm a.i.
% Concentration mean deviation compared to nominal
% is at maximum 5%. Nominal concentration used.
% Exposure starts at age 210 dph.
% Uni-variate: Wet weight as a function of time

% Females
dat11 = [...
% Concentration (ppm)	Adult age (d)	adult body weight (g)	
0       -14 1020
0       0	1000
0       14	995
0       28	1035
0       42	1030
0       56	950
0       161	985
0       -14 1195
0       0	1165
0       14	1210
0       28	1195
0       42	1170
0       56	1105
0       161	1430
0       -14 1110
0       0	1105
0       14	1115
0       28	NaN
0       42	NaN
0       56	NaN
0       161	NaN
0       -14 1140
0       0	1070
0       14	1055
0       28	1060
0       42	1100
0       56	1070
0       161	1405
0       -14 1210
0       0	1090
0       14	1105
0       28	1155
0       42	1100
0       56	960
0       161	1205
0       -14 1040
0       0	1050
0       14	1030
0       28	1045
0       42	1035
0       56	985
0       161	1085
0       -14 1245
0       0	1215
0       14	1210
0       28	1220
0       42	1215
0       56	1135
0       161	1390
0       -14 1055
0       0	1040
0       14	1025
0       28	1065
0       42	1080
0       56	1000
0       161	1175
0       -14 1035
0       0	1095
0       14	1125
0       28	1135
0       42	1035
0       56	1055
0       161	1090
0       -14 1050
0       0	1020
0       14	1005
0       28	890
0       42	940
0       56	920
0       161	1070
0       -14 1060
0       0	1120
0       14	1120
0       28	1105
0       42	1095
0       56	1060
0       161	1200
0       -14 1115
0       0	1040
0       14	1060
0       28	1050
0       42	1075
0       56	990
0       161	1160
0       -14 1090
0       0	990
0       14	1010
0       28	965
0       42	960
0       56	905
0       161	1225
0       -14 1120
0       0	1105
0       14	1080
0       28	1095
0       42	1090
0       56	1085
0       161	1360
0       -14 1030
0       0	1015
0       14	1010
0       28	990
0       42	985
0       56	1035
0       161	1050
0       -14 1080
0       0	1040
0       14	1040
0       28	995
0       42	1005
0       56	1035
0       161	1080
0       -14 1230
0       0	1220
0       14	1190
0       28	1170
0       42	1185
0       56	1270
0       161	1490
0       -14 1035
0       0	1070
0       14	1065
0       28	1020
0       42	995
0       56	1015
0       161	1170
0       -14 1180
0       0	1220
0       14	1180
0       28	1140
0       42	1160
0       56	1110
0       161	1220
0       -14 1245
0       0	1255
0       14	1210
0       28	1180
0       42	1160
0       56	1045
0       161	NaN
0       -14 1075
0       0	1065
0       14	1060
0       28	1035
0       42	1035
0       56	960
0       161	1005
0       -14 1110
0       0	1060
0       14	1040
0       28	1020
0       42	1000
0       56	975
0       161	1125
0       -14 1230
0       0	1195
0       14	1140
0       28	1115
0       42	1120
0       56	1105
0       161	1380
0       -14 1200
0       0	1120
0       14	1150
0       28	1095
0       42	1105
0       56	1085
0       161	1190
0       -14 1075
0       0	1060
0       14	1020
0       28	1060
0       42	1070
0       56	1035
0       161	1060
0       -14 1080
0       0	1075
0       14	1075
0       28	1085
0       42	1100
0       56	1025
0       161	1235
0       -14 1195
0       0	1140
0       14	1105
0       28	1130
0       42	1090
0       56	1045
0       161	1105
0       -14 940
0       0	895
0       14	835
0       28	825
0       42	830
0       56	820
0       161	965
0       -14 1085
0       0	1045
0       14	1030
0       28	950
0       42	945
0       56	975
0       161	1100
500     -14	1195
500     0	1175
500     14  1135
500     28	1120
500     42	1110
500     56	1140
500     161	1295
500     -14	1195
500     0	1175
500     14  1095
500     28	1070
500     42	1050
500     56	1110
500     161	1100
500     -14	1075
500     0	1050
500     14  1015
500     28	1000
500     42	985
500     56	990
500     161	1310
500     -14	1250
500     0	1275
500     14  1265
500     28	1230
500     42	1190
500     56	1190
500     161	1370
500     -14	1055
500     0	1095
500     14  1135
500     28	1140
500     42	1115
500     56	1115
500     161	1240
500     -14	990
500     0	990
500     14  965
500     28	955
500     42	940
500     56	945
500     161	1055
500     -14	1155
500     0	1190
500     14  1200
500     28	1215
500     42	1245
500     56	1255
500     161	1440
500     -14	1090
500     0	1075
500     14  1080
500     28	1035
500     42	1030
500     56	995
500     161	1180
500     -14	970
500     0	975
500     14  1005
500     28	1025
500     42	1020
500     56	975
500     161	995
500     -14	1120
500     0	1115
500     14  1085
500     28	1070
500     42	1030
500     56	1010
500     161	1085
500     -14	1090
500     0	1180
500     14  1060
500     28	1075
500     42	1025
500     56	985
500     161	1240
500     -14	1100
500     0	1090
500     14  1035
500     28	1075
500     42	1030
500     56	1055
500     161	1115
500     -14	1115
500     0	1105
500     14  1130
500     28	1155
500     42	1125
500     56	1045
500     161	1045
500     -14	1240
500     0	1230
500     14  1185
500     28	1225
500     42  1215
500     56	1140
500     161	1400
500     -14	1095
500     0	1140
500     14  1165
500     28	1160
500     42	1145
500     56	1120
500     161	1210
500     -14	1105
500     0	1070
500     14  1045
500     28	1065
500     42	1050
500     56	NaN
500     161	NaN
500     -14	1050
500     0	1060
500     14  1100
500     28	1075
500     42	1085
500     56	1155
500     161	1185
500     -14	1160
500     0	1095
500     14  1070
500     28	1055
500     42	1045
500     56	1030
500     161	1175
500     -14	1215
500     0	1185
500     14  1210
500     28	1180
500     42	1175
500     56	1180
500     161	1315
500     -14	1080
500     0	1000
500     14  1040
500     28	1030
500     42	1050
500     56	1020
500     161	1205
500     -14	1040
500     0	1065
500     14  1070
500     28	1035
500     42	1035
500     56	1080
500     161	1265
500     -14	1140
500     0	1160
500     14  1170
500     28	1080
500     42	1095
500     56	1115
500     161	1310
500     -14	1230
500     0	1165
500     14  1240
500     28	1185
500     42	1210
500     56	1225
500     161	1370
500     -14	1065
500     0	1025
500     14  1020
500     28	1015
500     42	1050
500     56	1035
500     161	1180
500     -14	1215
500     0	1195
500     14  1075
500     28	1110
500     42	1110
500     56	1190
500     161	1310
500     -14	1190
500     0	1170
500     14  1115
500     28	1190
500     42	1215
500     56	1140
500     161	1265
500     -14	1165
500     0	1150
500     14  1075
500     28	1115
500     42	1100
500     56	1110
500     161	1270
500     -14	1165
500     0	1150
500     14  1075
500     28	1115
500     42	1110
500     56	1110
500     161	1270
500     -14	1065
500     0	1020
500     14  980
500     28	1020
500     42	1015
500     56	965
500     161	1330
500     -14	1225
500     0	1275
500     14  1180
500     28	1275
500     42	1295
500     56	1235
500     161	1315
1200	-14	995
1200	0	950
1200	14	960
1200	28	940
1200	42	960
1200	56	935
1200	161	1090
1200    -14	1150
1200    0	1130
1200    14  1160
1200    28	1100
1200    42	1170
1200    56	1145
1200    161	1285
1200    -14	1250
1200    0	1190
1200    14  1195
1200    28	1195
1200    42	1220
1200    56	1235
1200    161	1365
1200    -14	1080
1200    0	970
1200    14  950
1200    28	925
1200    42	950
1200    56	940
1200    161	995
1200    -14	1075
1200    0	1050
1200    14  1085
1200    28	1130
1200    42	1130
1200    56	955
1200    161	1015
1200    -14	1005
1200    0	1080
1200    14  1020
1200    28	1045
1200    42	1015
1200    56	1015
1200    161	1145
1200    -14	1095
1200    0	1090
1200    14  1075
1200    28	1120
1200    42	1125
1200    56	1085
1200    161	1225
1200    -14	1065
1200    0	1110
1200    14  1060
1200    28	1070
1200    42	1070
1200    56	1100
1200    161	1340
1200    -14	1015
1200    0	1110
1200    14  1010
1200    28	990
1200    42	1020
1200    56	1015
1200    161	1240
1200    -14	1150
1200    0	1200
1200    14  1170
1200    28	1195
1200    42	1230
1200    56	1210
1200    161	1305
1200    -14	1090
1200    0	1115
1200    14  1100
1200    28	1130
1200    42	1110
1200    56	1055
1200    161	1290
1200    -14	1060
1200    0	1050
1200    14  1005
1200    28	950
1200    42	1005
1200    56	980
1200    161	1300
1200    -14	1145
1200    0	1150
1200    14  1150
1200    28	1190
1200    42	1185
1200    56	1125
1200    161	1345
1200    -14	1215
1200    0	1185
1200    14  1180
1200    28	1240
1200    42	1190
1200    56	1095
1200    161	1240
1200    -14	1220
1200    0	1155
1200    14  1170
1200    28	1160
1200    42	1180
1200    56	1120
1200    161	1285
1200    -14	1040
1200    0	995
1200    14  985
1200    28	985
1200    42	1005
1200    56	955
1200    161	1135
1200    -14	1065
1200    0	1075
1200    14  1075
1200    28	1085
1200    42	1100
1200    56	1040
1200    161	1025
1200    -14	1270
1200    0	1215
1200    14  1250
1200    28	1225
1200    42	1265
1200    56	1230
1200    161	1345
1200    -14	1275
1200    0	1225
1200    14  1225
1200    28	1195
1200    42	1185
1200    56	1060
1200    161	1235
1200    -14	1245
1200    0	1250
1200    14  1280
1200    28	1195
1200    42	1250
1200    56	1200
1200    161	1275
1200    -14	1080
1200    0	1050
1200    14  1020
1200    28	1080
1200    42	1040
1200    56	955
1200    161	1090
1200    -14	1230
1200    0	1190
1200    14  1190
1200    28	1210
1200    42	1235
1200    56	1155
1200    161	1420
1200    -14	1215
1200    0	1210
1200    14  1125
1200    28	1095
1200    42	1070
1200    56	1050
1200    161	1230
1200    -14	1100
1200    0	1185
1200    14  1120
1200    28	NaN
1200    42	NaN
1200    56	NaN
1200    161	NaN
1200    -14	1050
1200    0	1040
1200    14  980
1200    28	1035
1200    42	1020
1200    56	1015
1200    161	1265
1200    -14	1140
1200    0	1110
1200    14  1095
1200    28	1050
1200    42	1030
1200    56	1005
1200    161	1070
1200    -14	1110
1200    0	1110
1200    14  1105
1200    28	1095
1200    42	1070
1200    56	1070
1200    161	1295
1200    -14	1180
1200    0	1140
1200    14  1150
1200    28	1130
1200    42	1110
1200    56	1075
1200    161	1210
1200    -14	1180
1200    0	1165
1200    14  1220
1200    28	1220
1200    42	1215
1200    56	1145
1200    161	1230
3000	-14	1145
3000	0	1160
3000	14	1110
3000	28	1170
3000	42	1160
3000	56	1170
3000	161	1330
3000	-14	1090
3000	0	1065
3000	14	975
3000	28	975
3000	42	985
3000	56	1030
3000	161	1135
3000	-14	1030
3000	0	990
3000	14	980
3000	28	930
3000	42	975
3000	56	1035
3000	161	1360
3000	-14	990
3000	0	1015
3000	14	980
3000	28	1025
3000	42	1000
3000	56	1005
3000	161	1015
3000	-14	1065
3000	0	1095
3000	14	1035
3000	28	1085
3000	42	1060
3000	56	1035
3000	161	1050
3000	-14	1145
3000	0	1075
3000	14	1070
3000	28	1035
3000	42	1025
3000	56	980
3000	161	1055
3000	-14	1180
3000	0	1120
3000	14	1090
3000	28	1065
3000	42	1105
3000	56	1075
3000	161	1210
3000	-14	1225
3000	0	1165
3000	14	1180
3000	28	1135
3000	42	1130
3000	56	1080
3000	161	1170
3000	-14	1160
3000	0	1110
3000	14	1055
3000	28	1075
3000	42	1070
3000	56	1100
3000	161	1125
3000	-14	1050
3000	0	990
3000	14	NaN
3000	28	NaN
3000	42	NaN
3000	56	NaN
3000	161	NaN
3000	-14	1225
3000	0	1205
3000	14	1105
3000	28	1190
3000	42	1185
3000	56	1120
3000	161	1250
3000	-14	1130
3000	0	1075
3000	14	1065
3000	28	1070
3000	42	1180
3000	56	1065
3000	161	1175
3000	-14	980
3000	0	970
3000	14	980
3000	28	1010
3000	42	1000
3000	56	945
3000	161	1175
3000	-14	1000
3000	0	915
3000	14	905
3000	28	945
3000	42	960
3000	56	885
3000	161	975
3000	-14	1145
3000	0	1165
3000	14	1095
3000	28	1130
3000	42	1115
3000	56	1035
3000	161	1240
3000	-14	1245
3000	0	1310
3000	14	1230
3000	28	1265
3000	42	1260
3000	56	1085
3000	161	1190
3000	-14	1155
3000	0	1130
3000	14	1095
3000	28	NaN
3000	42	NaN
3000	56	NaN
3000	161	NaN
3000	-14	1065
3000	0	1015
3000	14	900
3000	28	910
3000	42	980
3000	56	990
3000	161	1120
3000	-14	1045
3000	0	1025
3000	14	910
3000	28	1015
3000	42	1015
3000	56	980
3000	161	1045
3000	-14	1205
3000	0	1105
3000	14	1055
3000	28	1085
3000	42	1010
3000	56	1025
3000	161	1160
3000	-14	1060
3000	0	1070
3000	14  1055
3000	28	1095
3000	42	1085
3000	56	1015
3000	161	1025
3000	-14	1170
3000	0	1120
3000	14	1075
3000	28	1100
3000	42	1105
3000	56	1070
3000	161	1275
3000	-14	1055
3000	0	1020
3000	14	1040
3000	28	1035
3000	42	1035
3000	56	1030
3000	161	1090
3000	-14	1200
3000	0	1165
3000	14	910
3000	28	1035
3000	42	1060
3000	56	1070
3000	161	1110
3000	-14	1125
3000	0	1060
3000	14	1040
3000	28	1050
3000	42	1045
3000	56	1035
3000	161	1205
3000	-14	1140
3000	0	1100
3000	14	1100
3000	28	1090
3000	42	1075
3000	56	1060
3000	161	1240
3000	-14	1170
3000	0	1130
3000	14	1100
3000	28	1115
3000	42	1080
3000	56	1030
3000	161	1205
3000	-14	1220
3000	0	1180
3000	14	1195
3000	28	1285
3000	42	1270
3000	56	1215
3000	161	1195
3000	-14	1250
3000	0	1200
3000	14	1260
3000	28	1250
3000	42	1260
3000	56	1260
3000	161	1295

];
dat11(:,1) = dat11(:,1) / 1000; % Transform from ppm to ppm / 1000
dat11(:,2) = dat11(:,2) + 210; 

% control
tWw_fe_dat11_0 = dat11(dat11(:,1) == 0,[2 3]);
[ud,ix,iy] = unique(tWw_fe_dat11_0(:,1)); % sum by time point
data.tWw_fe_dat11_0 = [ud, accumarray(iy, tWw_fe_dat11_0(:,2),[],@(x)mean(x,'omitnan'))]; % mean by time point
units.tWw_fe_dat11_0 = {'d', 'g'};  label.tWw_fe_dat11_0 = {'time since birth','Wet weight, 0 ppm'};  bibkey.tWw_fe_dat11_0 = {'data11'};
auxData.conc.tWw_fe_dat11_0 = 0; units.conc.tWw_fe_dat11_0 = 'ppm a.i. /1000';  label.conc.tWw_fe_dat11_0 = 'Concentration';
% 500 ppm a.i.
tWw_fe_dat11_1 = dat11(dat11(:,1) == 0.5,[2 3]);
[ud,ix,iy] = unique(tWw_fe_dat11_1(:,1)); % sum by time point
data.tWw_fe_dat11_1 = [ud, accumarray(iy, tWw_fe_dat11_1(:,2),[],@(x)mean(x,'omitnan'))]; % mean by time point
units.tWw_fe_dat11_1 = {'d', 'g'};  label.tWw_fe_dat11_1 = {'time since birth','Wet weight, 500 ppm'};  bibkey.tWw_fe_dat11_1 = {'data11'};
auxData.conc.tWw_fe_dat11_1 = 0.5; units.conc.tWw_fe_dat11_1 = 'ppm a.i. /1000';  label.conc.tWw_fe_dat11_1 = 'Concentration';
% 1200 ppm a.i.
tWw_fe_dat11_2 = dat11(dat11(:,1) == 1.2,[2 3]);
[ud,ix,iy] = unique(tWw_fe_dat11_2(:,1)); % sum by time point
data.tWw_fe_dat11_2 = [ud, accumarray(iy, tWw_fe_dat11_2(:,2),[],@(x)mean(x,'omitnan'))]; % mean by time point
units.tWw_fe_dat11_2 = {'d', 'g'};  label.tWw_fe_dat11_2 = {'time since birth','Wet weight, 1200 ppm'};  bibkey.tWw_fe_dat11_2 = {'data11'};
auxData.conc.tWw_fe_dat11_2 = 1.2; units.conc.tWw_fe_dat11_2 = 'ppm a.i. /1000';  label.conc.tWw_fe_dat11_2 = 'Concentration';
% 3000 ppm a.i.
tWw_fe_dat11_3 = dat11(dat11(:,1) == 3,[2 3]);
[ud,ix,iy] = unique(tWw_fe_dat11_3(:,1)); % sum by time point
data.tWw_fe_dat11_3 = [ud, accumarray(iy, tWw_fe_dat11_3(:,2),[],@(x)mean(x,'omitnan'))]; % mean by time point
units.tWw_fe_dat11_3 = {'d', 'g'};  label.tWw_fe_dat11_3 = {'time since birth','Wet weight, 3000 ppm'};  bibkey.tWw_fe_dat11_3 = {'data11'};
auxData.conc.tWw_fe_dat11_3 = 3; units.conc.tWw_fe_dat11_3 = 'ppm a.i. /1000';  label.conc.tWw_fe_dat11_3 = 'Concentration';

% CI growth.
% control
[ud,ix,iy] = unique(tWw_fe_dat11_0(:,1)); % sum by time point
tWw_fe_dat11_0_se = [ud, accumarray(iy, tWw_fe_dat11_0(:,2),[], @(x)(std(x, 'omitnan')/sqrt(length(x))))]; % standard deviation by time point
CI.tWw_fe_dat11_0 = 2.048*tWw_fe_dat11_0_se(:,2);
% 500ppm
[ud,ix,iy] = unique(tWw_fe_dat11_1(:,1)); % sum by time point
tWw_fe_dat11_1_se = [ud, accumarray(iy, tWw_fe_dat11_1(:,2),[], @(x)(std(x, 'omitnan')/sqrt(length(x))))]; % standard deviation by time point
CI.tWw_fe_dat11_1 = 2.048*tWw_fe_dat11_1_se(:,2);
% 1200 ppm a.i.
[ud,ix,iy] = unique(tWw_fe_dat11_2(:,1)); % sum by time point
tWw_fe_dat11_2_se = [ud, accumarray(iy, tWw_fe_dat11_2(:,2),[], @(x)(std(x, 'omitnan')/sqrt(length(x))))]; % standard deviation by time point
CI.tWw_fe_dat11_2 =2.048*tWw_fe_dat11_2_se(:,2);
% 3000 ppm a.i.
[ud,ix,iy] = unique(tWw_fe_dat11_3(:,1)); % sum by time point
tWw_fe_dat11_3_se = [ud, accumarray(iy, tWw_fe_dat11_3(:,2),[], @(x)(std(x, 'omitnan')/sqrt(length(x))))]; % standard deviation by time point
CI.tWw_fe_dat11_3 = 2.048*tWw_fe_dat11_3_se(:,2);

% Survival.
% Concentration(ppm)    Replicate  Experimental_day Number_of_surviving_individuals
tS_dat11 = [...
0 1 0 5
0 1 19 4 
0 1 73 4
0 1 161 4 
0 2 0 5
0 2 19 5 
0 2 73 5
0 2 161 5 
0 3 0 5
0 3 19 5 
0 3 73 5
0 3 161 5 
0 4 0 5
0 4 19 5 
0 4 73 5
0 4 161 5 
0 5 0 5
0 5 19 5
0 5 73 4 
0 5 161 4 
0 6 0 5
0 6 19 5
0 6 73 5 
0 6 161 5
500 7 0 5
500 7 52 5
500 7 161 5 
500 8 0 5
500 8 52 5
500 8 161 5 
500 9 0 5
500 9 52 5
500 9 161 5 
500 10 0 5
500 10 52 4
500 10 161 4 
500 11 0 5 
500 11 52 5
500 11 161 5
500 12 0 5 
500 12 52 5
500 12 161 5
1200 13 0 5
1200 13 25 5
1200 13 122 5
1200 13 161 5 
1200 14 0 5
1200 14 25 5
1200 14 122 5
1200 14 161 5 
1200 15 0 5
1200 15 25 5
1200 15 122 5
1200 15 161 5 
1200 16 0 5
1200 16 25 5
1200 16 122 5
1200 16 161 5 
1200 17 0 5
1200 17 25 4
1200 17 122 4
1200 17 161 4
1200 18 0 5
1200 18 25 5
1200 18 122 4
1200 18 161 4
3000 19 0 5
3000 19 11 5
3000 19 21 5
3000 19 161 5 
3000 20 0 5
3000 20 11 4
3000 20 21 4
3000 20 161 4 
3000 21 0 5
3000 21 11 5
3000 21 21 5
3000 21 161 5 
3000 22 0 5
3000 22 11 5
3000 22 21 4
3000 22 161 4 
3000 23 0 5
3000 23 11 5
3000 23 21 5
3000 23 161 5
3000 24 0 5
3000 24 11 5
3000 24 21 5
3000 24 161 5
];
tS_dat11(:,1) = tS_dat11(:,1) / 1000; % Transform from ppm to ppm / 1000
tS_dat11(:,3) = tS_dat11(:,3) + 210; % Transform in age (d). Exposure starts at 210 dph. 
% control
tS_dat11_0 = tS_dat11(tS_dat11(:,1) == 0,[3 4]);
[ud,ix,iy] = unique(tS_dat11_0(:,1)); % sum by time point
tS_dat11_0 = [ud, accumarray(iy, tS_dat11_0(:,2),[],@sum)]; % sum by time point
%500ppm
tS_dat11_1 = tS_dat11(tS_dat11(:,1) == 0.5,[3 4]);
[ud,ix,iy] = unique(tS_dat11_1(:,1)); % sum by time point
tS_dat11_1 = [ud, accumarray(iy, tS_dat11_1(:,2),[],@sum)]; % sum by time point
%1200ppm
tS_dat11_2 = tS_dat11(tS_dat11(:,1) == 1.2,[3 4]);
[ud,ix,iy] = unique(tS_dat11_2(:,1)); % sum by time point
tS_dat11_2 = [ud, accumarray(iy, tS_dat11_2(:,2),[],@sum)]; % sum by time point
%3000ppm
tS_dat11_3 = tS_dat11(tS_dat11(:,1) == 3,[3 4]);
[ud,ix,iy] = unique(tS_dat11_3(:,1)); % sum by time point
tS_dat11_3 = [ud, accumarray(iy, tS_dat11_3(:,2),[],@sum)]; % sum by time point

% Reproduction. Two last measurements of each concentration ignored as one
% week was not measured (cumulative reproduction not calculable for these
% times)
tN_dat11 = [...
% Concentration(ppm) Replicate  Experimental_day   Eggs_layed_for_a group_of_females_(not cumulative)
0   1   77	13
0   1   84	14
0   1   91	16
0   1   98	25
0   1   105	23
0   1   112	20
0   1   119	23
0   1   126	21
0   1   133	18
0   1   140	19
0   1   147	20
0   1   161	18
0   2   77	17
0   2   84	16
0   2   91	14
0   2   98	19
0   2   105	20
0   2   112	23
0   2   119	27
0   2   126	22
0   2   133	23
0   2   140	17
0   2   147	11
0   2   161	12
0   3   77	8
0   3   84	27
0   3   91	30
0   3   98	31
0   3   105	32
0   3   112	34
0   3   119	32
0   3   126	31
0   3   133	30
0   3   140	28
0   3   147	26
0   3   161	15
0   4   77	14
0   4   84	15
0   4   91	13
0   4   98	15
0   4   105	11
0   4   112	13
0   4   119	15
0   4   126	13
0   4   133	14
0   4   140	10
0   4   147	16
0   4   161	6
0   5   77	20
0   5   84	18
0   5   91	20
0   5   98	3
0   5   105	12
0   5   112	12
0   5   119	8
0   5   126	13
0   5   133	18
0   5   140	10
0   5   147	11
0   5   161	7
0   6   77	7
0   6   84	28
0   6   91	33
0   6   98	26
0   6   105	28
0   6   112	22
0   6   119	21
0   6   126	21
0   6   133	19
0   6   140	26
0   6   147	11
0   6   161	8
500 7   77	25
500 7   84	31
500 7   91	29
500 7   98	34
500 7   105	31
500 7   112	30
500 7 	119	31
500 7 	126	30
500 7   133	26
500 7   140	26
500 7 	147	22
500 7 	161	17
500 8   77	5
500 8   84	18
500 8   91	22
500 8 	98	29
500 8   105	28
500 8 	112	27
500 8 	119	24
500 8 	126	18
500 8   133	20
500 8   140	26
500 8 	147	16
500 8 	161	13
500 9   77	15
500 9   84	18
500 9   91	22
500 9	98	34
500 9   105	27
500 9	112	26
500 9	119	27
500 9	126	29
500 9   133	27
500 9   140	20
500 9	147	19
500 9	161	0
500 10  77	18
500 10  84	19
500 10  91	20
500 10  98	20
500 10  105	20
500 10  112	24
500 10  119	26
500 10  126	14
500 10  133	16
500 10  140	8
500 10  147	7
500 10  161	5
500 11  77	20
500 11  84	29
500 11  91	23
500 11  98	23
500 11  105	25
500 11  112	23
500 11  119	20
500 11  126	16
500 11  133	22
500 11  140	20
500 11  147	26
500 11  161	12
500 12  77	18
500 12  84	23
500 12  91	31
500 12  98	31
500 12  105	32
500 12  112	34
500 12  119	28
500 12  126	25
500 12  133	30
500 12  140	16
500 12  147	24
500 12  161	6
1200 13	77	10
1200 13	84	20
1200 13	91	25
1200 13	98	34
1200 13	105	36
1200 13	112	27
1200 13	119	14
1200 13	126	25
1200 13	133	8
1200 13	140	8
1200 13	147	12
1200 13	161	5
1200 14	77	13
1200 14	84	20
1200 14	91	32
1200 14	98	24
1200 14	105	28
1200 14	112	21
1200 14	119	17
1200 14 126 31
1200 14	133	20
1200 14	140	22
1200 14	147	25
1200 14	161	6
1200 15	77	9
1200 15	84	24
1200 15	91	28
1200 15	98	24
1200 15	105	24
1200 15	112	17
1200 15	119	18
1200 15	126	21
1200 15	133	25
1200 15	140	27
1200 15	147	22
1200 15	161	12
1200 16	77	4
1200 16	84	8
1200 16	91	9
1200 16	98	17
1200 16	105	10
1200 16	112	16
1200 16	119	9
1200 16	126	10
1200 16	133	17
1200 16	140	10
1200 16	147	11
1200 16	161	0
1200 17	77	13
1200 17	84	19
1200 17	91	20
1200 17	98	25
1200 17	105	21
1200 17	112	25
1200 17	119	19
1200 17	126	23
1200 17	133	22
1200 17	140	8
1200 17	147	14
1200 17	161	12
1200 18	77	8
1200 18	84	27
1200 18	91	30
1200 18	98	32
1200 18	105	30
1200 18	112	25
1200 18	119	23
1200 18	126	18
1200 18	133	15
1200 18	140	7
1200 18	147	11
1200 18	161	11
3000 19	77	8
3000 19	84	16
3000 19	91	22
3000 19	98	21
3000 19	105	21
3000 19	112	21
3000 19	119	7
3000 19	126	16
3000 19	133	19
3000 19	140	14
3000 19	147	17
3000 19	161	12
3000 20	77	7
3000 20	84	7
3000 20	91	8
3000 20	98	6
3000 20	105	7
3000 20	112	11
3000 20	119	10
3000 20	126	12
3000 20	133	11
3000 20	140	6
3000 20	147	6
3000 20	161	3
3000 21	77	2
3000 21	84	11
3000 21	91	12
3000 21	98	11
3000 21	105	19
3000 21	112	14
3000 21	119	1
3000 21	126	1
3000 21	133	7
3000 21	140	10
3000 21	147	9
3000 21	161	7
3000 22	77	4
3000 22	84	20
3000 22	91	21
3000 22	98	24
3000 22	105	13
3000 22	112	10
3000 22	119	25
3000 22	126	19
3000 22	133	15
3000 22	140	10
3000 22	147	13
3000 22	161	5
3000 23	77	2
3000 23	84	9
3000 23	91	11
3000 23	98	6
3000 23	105	17
3000 23	112	8
3000 23	119	13
3000 23	126	0
3000 23	133	11
3000 23	140	8
3000 23	147	2
3000 23	161	0
3000 24	77	13
3000 24	84	17
3000 24	91	18
3000 24	98	19
3000 24	105	29
3000 24	112	24
3000 24	119	22
3000 24	126	16
3000 24	133	11
3000 24	140	8
3000 24	147	7
3000 24	161	0
];

tN_dat11(:,1) = tN_dat11(:,1) / 1000; % Transform from ppm to ppm / 1000
tN_dat11(:,3) = tN_dat11(:,3) + 210; % Transform in age (d). Exposure starts at 210 dph. 

% control
tN_dat11_0 = tN_dat11(tN_dat11(:,1) == 0,[2 3 4]);
tN_dat11_0_rep= [repmat(unique(tN_dat11_0(:,2))',1,6)' zeros(12*6,1)];

for n = 1:6
    tS_tmp = tS_dat11(tS_dat11(:,1)==0&tS_dat11(:,2)==n,:);
    tN_dat11_0_rep((n-1)*12+1:12*n,2)= cumsum(tN_dat11_0(tN_dat11_0(:,1)==n,3)./interp1(tS_tmp(:,3),tS_tmp(:,4),tN_dat11_0(tN_dat11_0(:,1)==n,2)))  ;
end
[ud,ix,iy] = unique( tN_dat11_0_rep(:,1)); 
data.tN_dat11_0 = [ud, accumarray(iy, tN_dat11_0_rep(:,2),[],@mean)]; % average by time point
units.tN_dat11_0 = {'d', '#'};  label.tN_dat11_0 = {'time since birth','cumulative reproduction, 0 ppm'};  bibkey.tN_dat11_0 = {'data11'};
auxData.conc.tN_dat11_0 = 0; units.conc.tN_dat11_0 = 'ppm a.i. /1000';  label.conc.tN_dat11_0 = 'Concentration';

% 500 ppm a.i.
tN_dat11_1 = tN_dat11(tN_dat11(:,1) == 0.5,[2 3 4]);
tN_dat11_1_rep= [repmat(unique(tN_dat11_1(:,2))',1,6)' zeros(12*6,1)];

for n = 1:6
    tS_tmp = tS_dat11(tS_dat11(:,1)==0.5&tS_dat11(:,2)==n+6,:);
    tN_dat11_1_rep((n-1)*12+1:12*n,2)= cumsum(tN_dat11_1(tN_dat11_1(:,1)==n+6,3)./interp1(tS_tmp(:,3),tS_tmp(:,4),tN_dat11_1(tN_dat11_1(:,1)==n+6,2)))  ;
end
[ud,ix,iy] = unique( tN_dat11_1_rep(:,1)); 
data.tN_dat11_1 = [ud, accumarray(iy, tN_dat11_1_rep(:,2),[],@mean)]; % average by time point
units.tN_dat11_1 = {'d', '#'};  label.tN_dat11_1 = {'time since birth','cumulative reproduction, 500 ppm'};  bibkey.tN_dat11_1 = {'data11'};
auxData.conc.tN_dat11_1 = 0.5; units.conc.tN_dat11_1 = 'ppm a.i. /1000';  label.conc.tN_dat11_1 = 'Concentration';

% 1200 ppm a.i.
tN_dat11_2 = tN_dat11(tN_dat11(:,1) == 1.2,[2 3 4]);
tN_dat11_2_rep= [repmat(unique(tN_dat11_2(:,2))',1,6)' zeros(12*6,1)];

for n = 1:6
    tS_tmp = tS_dat11(tS_dat11(:,1)==1.2&tS_dat11(:,2)==n+12,:);
    tN_dat11_2_rep((n-1)*12+1:12*n,2)= cumsum(tN_dat11_2(tN_dat11_2(:,1)==n+12,3)./interp1(tS_tmp(:,3),tS_tmp(:,4),tN_dat11_2(tN_dat11_2(:,1)==n+12,2)))  ;
end
[ud,ix,iy] = unique( tN_dat11_2_rep(:,1)); 
data.tN_dat11_2 = [ud, accumarray(iy, tN_dat11_2_rep(:,2),[],@mean)]; % average by time point
units.tN_dat11_2 = {'d', '#'};  label.tN_dat11_2 = {'time since birth','cumulative reproduction, 1200 ppm'};  bibkey.tN_dat11_2 = {'data11'};
auxData.conc.tN_dat11_2 = 1.2; units.conc.tN_dat11_2 = 'ppm a.i. /1000';  label.conc.tN_dat11_2 = 'Concentration';

% 3000 ppm a.i.
tN_dat11_3 = tN_dat11(tN_dat11(:,1) == 3,[2 3 4]);
tN_dat11_3_rep= [repmat(unique(tN_dat11_3(:,2))',1,6)' zeros(12*6,1)];

for n = 1:6
    tS_tmp = tS_dat11(tS_dat11(:,1)==3&tS_dat11(:,2)==n+18,:);
    tN_dat11_3_rep((n-1)*12+1:12*n,2)= cumsum(tN_dat11_3(tN_dat11_3(:,1)==n+18,3)./interp1(tS_tmp(:,3),tS_tmp(:,4),tN_dat11_3(tN_dat11_3(:,1)==n+18,2)))  ;
end
[ud,ix,iy] = unique( tN_dat11_3_rep(:,1)); 
data.tN_dat11_3 = [ud, accumarray(iy, tN_dat11_3_rep(:,2),[],@mean)]; % average by time point
units.tN_dat11_3 = {'d', '#'};  label.tN_dat11_3 = {'time since birth','cumulative reproduction, 3000 ppm'};  bibkey.tN_dat11_3 = {'data11'};
auxData.conc.tN_dat11_3 = 3; units.conc.tN_dat11_3 = 'ppm a.i. /1000';  label.conc.tN_dat11_3 = 'Concentration';

%95% confidence interval calculation for reproduction 
% control
[ud,ix,iy] = unique( tN_dat11_0_rep(:,1)); 
tN_dat11_0_std = [ud, accumarray(iy, tN_dat11_0_rep(:,2),[],@std)];% standard deviation by time point
tN_dat11_0_se = [tN_dat11_0_std(:,1) tN_dat11_0_std(:,2)./sqrt(6)];
CI.tN_dat11_0 =2.571*tN_dat11_0_se(:,2);

reproRate.tN_dat11_0 = tN_dat11_0_rep(tN_dat11_0_rep(:,1)==371,2)./91 ; %average egg laying rate per female 

%500ppm
[ud,ix,iy] = unique( tN_dat11_1_rep(:,1)); 
tN_dat11_1_std = [ud, accumarray(iy, tN_dat11_1_rep(:,2),[],@std)];% standard deviation by time point
tN_dat11_1_se = [tN_dat11_1_std(:,1) tN_dat11_1_std(:,2)./sqrt(6)];
CI.tN_dat11_1 = 2.571*tN_dat11_1_se(:,2);

reproRate.tN_dat11_1 = tN_dat11_1_rep(tN_dat11_1_rep(:,1)==371,2)./91 ; %average egg laying rate per female 

%1200ppm
[ud,ix,iy] = unique( tN_dat11_2_rep(:,1)); 
tN_dat11_2_std = [ud, accumarray(iy, tN_dat11_2_rep(:,2),[],@std)];% standard deviation by time point
tN_dat11_2_se = [tN_dat11_2_std(:,1) tN_dat11_2_std(:,2)./sqrt(6)];
CI.tN_dat11_2 =2.571*tN_dat11_2_se(:,2);

reproRate.tN_dat11_2 = tN_dat11_2_rep(tN_dat11_2_rep(:,1)==371,2)./91 ; %average egg laying rate per female 

%3000ppm
[ud,ix,iy] = unique( tN_dat11_3_rep(:,1)); 
tN_dat11_3_std = [ud, accumarray(iy, tN_dat11_3_rep(:,2),[],@std)];% standard deviation by time point
tN_dat11_3_se = [tN_dat11_3_std(:,1) tN_dat11_3_std(:,2)./sqrt(6)];
CI.tN_dat11_3 =  2.571*tN_dat11_3_se(:,2);

reproRate.tN_dat11_3 = tN_dat11_3_rep(tN_dat11_3_rep(:,1)==371,2)./91 ; %average egg laying rate per female 

%Food ingestion. 
ingestion_dat11 = [... 
% Concentration(ppm) Experimental_day feed_comsumption(g/bird/day (one-week
% average ))
0 7 137   
0 14 124	   
0 21 147	   
0 28 127	   
0 35 128	  
0 42 133   
0 49 111	 
0 56 120	  
0 63 141	   
0 70 151	  
0 77 189	   
0 84 182
0 91 192  
0 98 206	   
0 105 209	   
0 112 232	   
0 119 207	  
0 126 217   
0 133 242	 
0 140 224	  
0 147 213	   
0 154 220	  
0 161 209	
500 7 148   
500 14 125	   
500 21 132	   
500 28 122	   
500 35 139	  
500 42 141   
500 49 123	 
500 56 138	  
500 63 159	   
500 70 165	  
500 77 203	   
500 84 212
500 91 240  
500 98 236	   
500 105 233   
500 112 241   
500 119 224	  
500 126 222   
500 133 228	 
500 140 232	  
500 147 217	   
500 154 232	  
500 161 214
1200 7 144   
1200 14 126	   
1200 21 152	   
1200 28 140   
1200 35 138	  
1200 42 142   
1200 49 114 
1200 56 138	  
1200 63 158	   
1200 70 182	  
1200 77 212   
1200 84 217
1200 91 233 
1200 98 228	   
1200 105 238   
1200 112 232   
1200 119 213	  
1200 126 230  
1200 133 242	 
1200 140 235	  
1200 147 237	   
1200 154 224	  
1200 161 215
3000 7 126   
3000 14 151	   
3000 21 174	   
3000 28 158   
3000 35 149	  
3000 42 169   
3000 49 133 
3000 56 146	  
3000 63 170   
3000 70 174	  
3000 77 193   
3000 84 201
3000 91 220 
3000 98 233	   
3000 105 230   
3000 112 239   
3000 119 226	  
3000 126 243  
3000 133 237	 
3000 140 242	  
3000 147 228	   
3000 154 231	  
3000 161 216
];
ingestion_dat11(:,2) = ingestion_dat11(:,2) + 210;
% control
ingestion.tWw_fe_dat11_0 = ingestion_dat11(ingestion_dat11(:,1) == 0,[2 3]); 
units.ingestion.tWw_fe_dat11_0  = {'d', 'g Wet wt/d'};  label.ingestion.tWw_fe_dat11_0 = {'time since birth', 'ingestion'}; 
% 500 ppm a.i.
ingestion.tWw_fe_dat11_1 = ingestion_dat11(ingestion_dat11(:,1) == 500,[2 3]); 
units.ingestion.tWw_fe_dat11_1  = {'d', 'g Wet wt/d'};  label.ingestion.tWw_fe_dat11_1 = {'time since birth', 'ingestion'}; 
% 1200 ppm a.i.
ingestion.tWw_fe_dat11_2 = ingestion_dat11(ingestion_dat11(:,1) == 1200,[2 3]); 
units.ingestion.tWw_fe_dat11_2  = {'d', 'g Wet wt/d'};  label.ingestion.tWw_fe_dat11_2 = {'time since birth', 'ingestion'}; 
% 3000 ppm a.i.
ingestion.tWw_fe_dat11_3 = ingestion_dat11(ingestion_dat11(:,1) == 3000,[2 3]); 
units.ingestion.tWw_fe_dat11_3  = {'d', 'g Wet wt/d'};  label.ingestion.tWw_fe_dat11_3 = {'time since birth', 'ingestion'}; 



%% set weights for all real data
weights = setweights(data, []);

weights.tN_dat11_0 = 10 * weights.tN_dat11_0; % Give more weight to lab data
weights.tWw_fe_dat11_0 = 10 * weights.tWw_fe_dat11_0; % Give more weight to lab data
weights.tN_dat11_1 = 10 * weights.tN_dat11_1; % Give more weight to lab data
weights.tWw_fe_dat11_1 =10 * weights.tWw_fe_dat11_1; % Give more weight to lab data
weights.tN_dat11_2 =10 * weights.tN_dat11_2; % Give more weight to lab data
weights.tWw_fe_dat11_2 = 10 * weights.tWw_fe_dat11_2; % Give more weight to lab data
weights.tN_dat11_3 = 10* weights.tN_dat11_3; % Give more weight to lab data
weights.tWw_fe_dat11_3 = 10 * weights.tWw_fe_dat11_3; % Give more weight to lab data


%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.ingestion = ingestion; % addition auxData to specify ingestion 
auxData.CI=CI; % addition auxData to specify condifidence intervals (CI)
auxData.reproRate=reproRate;% addition auxData to specify egg laying rate 
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
%metaData.grp.comment = {comment1};%, comment2, comment3};

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anas_platyrhynchos}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CaldCorn1975'; type = 'Article'; bib = [ ... 
'author = {Caldwell, Patrick J. and Cornwell, George W.}, ' ... 
'year = {1975}, ' ...
'title = {Incubation Behavior and Temperatures of the Mallard Duck}, ' ...
'journal = {The Auk}, ' ...
'volume = {92 (4)}, ' ...
'pages = {706--731}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CaldSnar1974'; type = 'Article'; bib = [ ... 
'author = {Caldwell, Patrick J. and Snart, Allen E.}, ' ... 
'year = {1974}, ' ...
'title = {A Photographic Index for Aging Mallard Embryos}, ' ...
'journal = {The Journal of Wildlife Management}, ' ...
'volume = {38 (2)}, ' ...
'pages = {298--301}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MagaCost2009'; type = 'Article'; bib = [ ... 
'author = {de Magalhaes, J. P. and Costa, J.}, ' ... 
'year = {2009}, ' ...
'title = {A database of vertebrate longevity records and their relation to other life-history traits.}, ' ...
'journal = {Journal of Evolutionary Biology}, ' ...
'volume = {22}, ' ...
'pages = {1770--1774}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SnowPerr1998'; type = 'Book'; bib = [ ... 
'author = {Snow, D. W. and Perrins, C. M.}, ' ... 
'year = {1998}, ' ...
'title = {The Birds of the Western Palearctic, Concise Edition.}, ' ...
'publisher = {Oxford University Press}, ' ...
'address = {Oxford}, '...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


