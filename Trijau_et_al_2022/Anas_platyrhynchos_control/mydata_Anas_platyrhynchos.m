function [data, auxData, metaData, txtData, weights] = mydata_Anas_platyrhynchos

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Anas_platyrhynchos'; 
metaData.species_en = 'Mallard'; 
metaData.T_typical  = C2K(40.2); % K, body temp from Smith et al 1976
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Lb'; 'Li'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-N'; 't-Le'; 't-Wwe'}; 

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

data.ab = 25.5;   units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'CaldCorn1975';   
  temp.ab = C2K(36.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'they argue T_emb was 38';
  auxData.t0.ab = 5;  units.t0.ab = 'd';  label.t0.ab = 'lag time until fully incubated'; 
 data.tp =  198.25;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tx = 'Kear2005';   
 temp.tp = C2K(41.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
 comment.tp = 'Sexual maturity sometimes reached as early as 6–7 months in both sexes';
%   data.tx = 55;     units.tx = 'd';    label.tx = 'time since birth at fledching'; bibkey.tx = 'SnowPerr1998';   
%   temp.tx = C2K(41.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
%data.tR = 287;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'data11'; % Was 365 CramSimm1977. Changed to 287: birds of 210 days old. Reproduction induced after 77 days. Do we need 1 per dataset?
%  temp.tR = C2K(41.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
% data.am = 29.1 * 365;  units.am = 'd';    label.am = 'life span';                     bibkey.am = 'MagaCost2009';   
%   temp.am = C2K(41.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 12.0; units.Lb = 'cm'; label.Lb = 'length at birth'; bibkey.Lb = 'CaldSnar1974'; 

% data.Li  = 57.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'SnowPerr1998';
% comment.Li = 'value chosen as it is the highest maximal length value encountered in the literature';
% 
% data.Wwb = 35;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'data11';
% data.Ww7 = 66;  units.Ww7 = 'g';   label.Ww7 = 'wet weight at 7 days';          bibkey.Wwb = 'South1953';
% data.Wwi = 1241; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight female';       bibkey.Wwi = 'data01';

% data.Ri  = 55.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'data01';   
%  temp.Ri = C2K(41.2);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
%  comment.Ri = 'Temp from Rahm1991';
% 
data.Ww0 = 50.6; units.Ww0  = 'g'; label.Ww0  = 'fresh egg weight ';  bibkey.Ww0  = 'CaldCorn1975';

% uni-variate data
%% DATA SYNGENTA - Atrazine Control (Data 01)

% Observed individual body weight
% as a function of time 
% Uni-variate: Wet weight as a function of time
% Females
tWw_fe_dat01 = [...
% Concentration(ppm) Experimental day (d)	individual adult body weight (g)	
0 0 928
0 0 1152
0 0 1019
0 0 948
0 0 1044
0 0 1259
0 0 1059
0 0 1104
0 0 920
0 0 1094
0 0 996
0 0 890
0 0 1016
0 0 1071
0 0 1122
0 0 1166
0 14 1001
0 14 1175
0 14 1002
0 14 1013
0 14 1142
0 14 1336
0 14 1236
0 14 1144
0 14 1077
0 14 1195
0 14 1053
0 14 913
0 14 1020
0 14 1137
0 14 1203
0 14 1217
0 28 1008
0 28 1184
0 28 1112
0 28 1050
0 28 1105
0 28 1301
0 28 1103
0 28 1179
0 28 961
0 28 1157
0 28 1045
0 28 904
0 28 1049
0 28 1137
0 28 1216
0 28 1226
0 42 991
0 42 1147
0 42 1085
0 42 1052
0 42 1140
0 42 1232
0 42 1236
0 42 1085
0 42 950
0 42 1105
0 42 1006
0 42 897
0 42 1194
0 42 1176
0 42 1112
0 42 1219
0 140 1207
0 140 1157
0 140 1242
0 140 1240
0 140 1023
0 140 1354
0 140 1024
0 140 1436
0 140 1218
0 140 1185
0 140 1044
0 140 1095
0 140 1233
0 140 1023
0 140 1217
0 140 1158
0 161 1255
0 161 1283
0 161 1208
0 161 1283
0 161 1219
0 161 1335
0 161 1304
0 161 1402
0 161 1157
0 161 1326
0 161 1154
0 161 1081
0 161 1169
0 161 1172
0 161 1334
0 161 1180
];

tWw_fe_dat01(:,2) = tWw_fe_dat01(:,2) + 165; % Transform in age (d). Exposure starts at 165 dph. 

%control
tWw_fe_dat01_0 = tWw_fe_dat01(tWw_fe_dat01(:,1) == 0,[2 3]);
[ud,ix,iy] = unique(tWw_fe_dat01_0(:,1)); % identify time point
data.tWw_fe_dat01_0 = [ud, accumarray(iy, tWw_fe_dat01_0(:,2),[],@(x)mean(x,'omitnan'))]; % mean by time point
units.tWw_fe_dat01_0 = {'d', 'g'};  label.tWw_fe_dat01_0 = {'time since birth','Wet weight'};  bibkey.tWw_fe_dat01_0 = {'data01'};
auxData.conc.tWw_fe_dat01_0 = 0; units.conc.tWw_fe_dat01_0 = 'ppm a.i. /1000';  label.conc.tWw_fe_dat01_0 = 'Concentration';

% CI growth.
% control
[ud,ix,iy] = unique(tWw_fe_dat01_0(:,1)); % sum by time point
tWw_fe_dat01_0_se = [ud, accumarray(iy, tWw_fe_dat01_0(:,2),[], @(x)(std(x, 'omitnan')/sqrt(length(x))))]; % standard deviation by time point
CI.tWw_fe_dat01_0 = 2.131*tWw_fe_dat01_0_se(:,2);

% Reproduction. 

tN_dat01 = [...
% Concentration replicate Experimental_day	Eggs_layed_per_female(not cumulative)

% Pen 7 and 13 in controls, as well as pen 7 in 75ppm treatment, are considered as outliers because they started to lay eggs
% before the light stimulus started. Their contribution to the total number
% of eggs was removed below. 

0 1 49 0
0 1 56 0
0 1 63 0
0 1 70 2
0 1 77 7
0 1 84 8
0 1 91 7
0 1 98 7
0 1 105 7
0 1 112 6
0 1 119 5
0 1 126 8
0 1 133 3
0 1 140 7
0 1 147 3
0 1 154 0
0 1 161 0
0 1 168 0
0 2 49 0
0 2 56 0
0 2 63 0
0 2 70 0
0 2 77 0
0 2 84 3
0 2 91 1
0 2 98 4
0 2 105 2
0 2 112 1
0 2 119 2
0 2 126 3
0 2 133 0
0 2 140 0
0 2 147 0
0 2 154 0
0 2 161 0
0 2 168 0
0 3 49 0
0 3 56 0
0 3 63 0
0 3 70 4
0 3 77 7
0 3 84 7
0 3 91 7
0 3 98 6
0 3 105 6
0 3 112 7
0 3 119 7
0 3 126 6
0 3 133 6
0 3 140 5
0 3 147 0
0 3 154 0
0 3 161 0
0 3 168 0
0 4 49 0
0 4 56 0
0 4 63 0
0 4 70 0
0 4 77 2
0 4 84 7
0 4 91 5
0 4 98 4
0 4 105 7
0 4 112 3
0 4 119 7
0 4 126 3
0 4 133 7
0 4 140 6
0 4 147 5
0 4 154 6
0 4 161 5
0 4 168 1
0 5 49 0
0 5 49 0
0 5 56 0
0 5 63 0
0 5 70 0
0 5 77 0
0 5 84 7
0 5 91 5
0 5 98 7
0 5 105 6
0 5 112 7
0 5 119 6
0 5 126 6
0 5 133 2
0 5 140 6
0 5 147 0
0 5 154 0
0 5 161 0
0 5 168 0
0 6 56 0
0 6 63 0
0 6 70 0
0 6 77 0
0 6 84 4
0 6 91 6
0 6 98 7
0 6 105 7
0 6 112 7
0 6 119 6
0 6 126 5
0 6 133 7
0 6 140 6
0 6 147 1
0 6 154 7
0 6 161 3
0 6 168 0
0 7 49 3
0 7 56 6
0 7 63 7
0 7 70 6
0 7 77 7
0 7 84 8
0 7 91 5
0 7 98 5
0 7 105 8
0 7 112 4
0 7 119 4
0 7 126 8
0 7 133 2
0 7 140 0
0 7 147 1
0 7 154 5
0 7 161 8
0 7 168 1
0 8 49 0
0 8 56 0
0 8 63 0
0 8 70 0
0 8 77 5
0 8 84 7
0 8 91 5
0 8 98 7
0 8 105 5
0 8 112 5
0 8 119 8
0 8 126 5
0 8 133 1
0 8 140 6
0 8 147 4
0 8 154 4
0 8 161 3
0 8 168 1
0 9 49 0
0 9 56 0
0 9 63 0
0 9 70 1
0 9 77 7
0 9 84 7
0 9 91 7
0 9 98 3
0 9 105 7
0 9 112 7
0 9 119 1
0 9 126 7
0 9 133 1
0 9 140 5
0 9 147 5
0 9 154 0
0 9 161 0
0 9 168 0
0 10 49 0
0 10 56 0
0 10 63 0
0 10 70 0
0 10 77 0
0 10 84 7
0 10 91 7
0 10 98 0
0 10 105 5
0 10 112 6
0 10 119 8
0 10 126 7
0 10 133 7
0 10 140 7
0 10 147 3
0 10 154 0
0 10 161 0
0 10 168 0
0 11 49 0
0 11 56 0
0 11 63 0
0 11 70 0
0 11 77 3
0 11 84 6
0 11 91 7
0 11 98 6
0 11 105 7
0 11 112 7
0 11 119 7
0 11 126 7
0 11 133 5
0 11 140 7
0 11 147 5
0 11 154 7
0 11 161 6
0 11 168 1
0 12 49 0
0 12 56 0
0 12 63 0
0 12 70 0
0 12 77 0
0 12 84 0
0 12 91 0
0 12 98 2
0 12 105 1
0 12 112 3
0 12 119 0
0 12 126 2
0 12 133 0
0 12 140 0
0 12 147 0
0 12 154 0
0 12 161 0
0 12 168 0
0 13 49 3
0 13 56 6
0 13 63 6
0 13 70 8
0 13 77 7
0 13 84 7
0 13 91 7
0 13 98 7
0 13 105 2
0 13 112 7
0 13 119 4
0 13 126 5
0 13 133 6
0 13 140 4
0 13 147 0
0 13 154 0
0 13 161 0
0 13 168 0
0 14 49 0
0 14 56 0
0 14 63 0
0 14 70 4
0 14 77 7
0 14 84 7
0 14 91 5
0 14 98 6
0 14 105 2
0 14 112 5
0 14 119 6
0 14 126 3
0 14 133 5
0 14 140 4
0 14 147 0
0 14 154 4
0 14 161 5
0 14 168 1
0 15 49 0
0 15 56 0
0 15 63 0
0 15 70 2
0 15 77 7
0 15 84 6
0 15 91 6
0 15 98 6
0 15 105 1
0 15 112 7
0 15 119 5
0 15 126 3
0 15 133 6
0 15 140 1
0 15 147 0
0 15 154 0
0 15 161 0
0 15 168 0
0 16 49 0
0 16 56 0
0 16 63 0
0 16 70 0
0 16 77 7
0 16 84 6
0 16 91 7
0 16 98 7
0 16 105 7
0 16 112 6
0 16 119 7
0 16 126 5
0 16 133 4
0 16 140 1
0 16 147 0
0 16 154 0
0 16 161 0
0 16 168 0

];

tN_dat01(:,3) = tN_dat01(:,3) + 165; % Transform in age (d). Exposure starts at 165 dph. 

% control
tN_dat01_0 = tN_dat01(tN_dat01(:,1) == 0,[2 3 4]);
tN_dat01_0(tN_dat01_0(1,:)==7,:)=[];% removal of pen 7 
tN_dat01_0(tN_dat01_0(1,:)==13,:)=[];% removal of pen 13 
[ud,ix,iy] = unique(tN_dat01_0(:,1)); % unique replicates 
tN_dat01_0_cum = [tN_dat01_0(:,2)  cell2mat(accumarray(iy, tN_dat01_0(:,3),[],@(x){cumsum(x,'omitnan')}))]; % mean by replicate
[ud,ix,iy] = unique(tN_dat01_0_cum(:,1)); % unique time points
data.tN_dat01_0 = [ud, accumarray(iy, tN_dat01_0_cum(:,2),[],@(x) mean(x,'omitnan'))]; % average by time point
units.tN_dat01_0 = {'d', '#'};  label.tN_dat01_0 = {'time since birth','cumulative reproduction'};  bibkey.tN_dat01_0 = {'data01'};


%95% confidence interval calculation for reproduction 
% control
[ud,ix,iy] = unique(tN_dat01_0_cum(:,1)); % unique time points
tN_dat01_0_std = [ud, accumarray(iy, tN_dat01_0_cum(:,2),[],@(x) std(x,'omitnan'))];% standard deviation by time point
tN_dat01_0_se = [tN_dat01_0_std(:,1) tN_dat01_0_std(:,2)./sqrt(16)];
CI.tN_dat01_0 = 2.131*tN_dat01_0_se(:,2);


%Food ingestion data 

ingestion_tWw_fe_dat01 = [... 
% Concentration Experimental_day feed comsumption_(g/bird/day) (mean on two weeks) 
0 14 96.1   
0 28 93.9	   
0 42 98.1	   
0 56 107.5	   
0 70 117.7	  
0 84 146.4   
0 98 142.1	 
0 112 152.5	  
0 126 154.3	   
0 140 154.9	  
0 154 139.9	   
0 161 131.9 
];

ingestion_tWw_fe_dat01(:,2) = ingestion_tWw_fe_dat01(:,2)+165 ;

%control 
ingestion.tWw_fe_dat01_0 = ingestion_tWw_fe_dat01(ingestion_tWw_fe_dat01(:,1) == 0,[2 3]);
units.ingestion.tWw_fe_dat01_0  = {'d', 'g Wet wt/d'};  label.ingestion.tWw_fe_dat01_0 = {'time since birth', 'ingestion'}; 

%% Control DATA SYNGENTA - Azoxystrobin (Data 11)

% Observed average body weight(average over all replicates)
% as a function of time for non-exposed individuals (controls). 

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

];
dat11(:,1) = dat11(:,1) / 1000; % Transform from ppm to ppm / 1000
dat11(:,2) = dat11(:,2) + 210; 

% control
tWw_fe_dat11_0 = dat11(dat11(:,1) == 0,[2 3]);
[ud,ix,iy] = unique(tWw_fe_dat11_0(:,1)); % sum by time point
data.tWw_fe_dat11_0 = [ud, accumarray(iy, tWw_fe_dat11_0(:,2),[],@(x)mean(x,'omitnan'))]; % mean by time point
units.tWw_fe_dat11_0 = {'d', 'g'};  label.tWw_fe_dat11_0 = {'time since birth','Wet weight, 0 ppm'};  bibkey.tWw_fe_dat11_0 = {'data11'};
auxData.conc.tWw_fe_dat11_0 = 0; units.conc.tWw_fe_dat11_0 = 'ppm a.i. /1000';  label.conc.tWw_fe_dat11_0 = 'Concentration';

% CI growth.
% control
[ud,ix,iy] = unique(tWw_fe_dat11_0(:,1)); % sum by time point
tWw_fe_dat11_0_se = [ud, accumarray(iy, tWw_fe_dat11_0(:,2),[], @(x)(std(x, 'omitnan')/sqrt(length(x))))]; % standard deviation by time point
CI.tWw_fe_dat11_0 = 2.048*tWw_fe_dat11_0_se(:,2);


% Survival.
% Concentration (ppm)	Replicate  Experimental_day Number of surviving individuals
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
];
tS_dat11(:,1) = tS_dat11(:,1) / 1000; % Transform from ppm to ppm / 1000
tS_dat11(:,3) = tS_dat11(:,3) + 210; % Transform in age (d). Exposure starts at 210 dph. 
% control
tS_dat11_0 = tS_dat11(tS_dat11(:,1) == 0,[3 4]);
[ud,ix,iy] = unique(tS_dat11_0(:,1)); % sum by time point
tS_dat11_0 = [ud, accumarray(iy, tS_dat11_0(:,2),[],@sum)]; % sum by time point


% Reproduction. Two last measurements of each concentration ignored as one
% week was not measured (cumulative reproduction not calculable for these
% times)
tN_dat11 = [...
% Concentration (ppm) Replicate  Experimental_day   Eggs_layed_for_a group_of_females_(not cumulative)
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


%95% confidence interval calculation for reproduction 
% control
[ud,ix,iy] = unique( tN_dat11_0_rep(:,1)); 
tN_dat11_0_std = [ud, accumarray(iy, tN_dat11_0_rep(:,2),[],@std)];% standard deviation by time point
tN_dat11_0_se = [tN_dat11_0_std(:,1) tN_dat11_0_std(:,2)./sqrt(6)];
CI.tN_dat11_0 =2.571*tN_dat11_0_se(:,2);


ingestion_dat11 = [... 
% feed comsumption data in g/bird/day (one-week average ) 
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
];
ingestion_dat11(:,2) = ingestion_dat11(:,2) + 210;
% control
ingestion.tWw_fe_dat11_0 = ingestion_dat11(ingestion_dat11(:,1) == 0,[2 3]); 
units.ingestion.tWw_fe_dat11_0  = {'d', 'g Wet wt/d'};  label.ingestion.tWw_fe_dat11_0 = {'time since birth', 'ingestion'}; 

%% set weights for all real data
weights = setweights(data, []);

weights.tN_dat01_0 = 5 * weights.tN_dat01_0; % Give more weight to lab data
weights.tWw_fe_dat01_0 = 5 * weights.tWw_fe_dat01_0; % Give more weight to lab data

weights.tN_dat11_0 = 5 * weights.tN_dat11_0; % Give more weight to lab data
weights.tWw_fe_dat11_0 = 5 * weights.tWw_fe_dat11_0; % Give more weight to lab data

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.ingestion = ingestion; % addition auxData to specify ingestion 
auxData.CI=CI; % addition auxData to specify condifidence intervals (CI) 
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots

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
bibkey = 'CramSimm1977'; type = 'Book'; bib = [ ... 
'author = {Cramp, S. and Simmons, K. E. L.}, ' ... 
'year = {1977}, ' ...
'title = {Ostrich to Ducks.}, ' ...
'sereis = {Handbook of the Birds of Europe, the Middle East and North Africa, The Birds of the Western Palearctic}, ' ...
'publisher = {Oxford University Press} ,' ...
'address = {Oxford} , ' ...
'volume = {I}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kear2005'; type = 'Book'; bib = [ ... 
'author = {Kear, J.}, ' ... 
'year = {2005}, ' ...
'title = {Ducks, Geese, and Swans}, ' ...
'publisher = {Oxford University Press} ,' ...
'address = {Oxford} , '];
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
bibkey = 'LokeJohn1990'; type = 'Article'; bib = [ ... 
'author = {Lokemoen, J. T. and Johnson, D. H. and Sharp, D. E.}, ' ... 
'year = {1990}, ' ...
'title = {Weights of wild mallard Anas platyrhynchos, gadwall A. strepera, and blue-winged teal A. discors during the breeding season.}, ' ...
'journal = {Wildfowl}, ' ...
'volume = {41}, ' ...
'pages = {122--130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Prin1969'; type = 'Article'; bib = [ ... 
'author = {Prince, Harold H.  and Siegel, P. B. and Cornwell, George W.}, ' ... 
'year = {1969}, ' ...
'title = {Incubation Environment and the Development of Mallard Embryos}, ' ...
'journal = {The Journal of Wildlife Management}, ' ...
'volume = {33 (3)}, ' ...
'pages = {589--595}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rudo1978'; type = 'Book'; bib = [ ... 
'author = {Rudolph, W.}, ' ... 
'year = {1978}, ' ...
'title = {Die Hausenten}, ' ...
'publisher = {A. Ziemsen-Verlag}, ' ...
'address = {Wittenberg Lutherstadt}'];
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
%
bibkey = 'KrapDoty1979'; type = 'Article'; bib = [ ... 
'author = {Krapu, Gary L. and Doty, Harold A.}, ' ... 
'year = {1979}, ' ...
'title = {Age-related aspects of Mallard reproduction}, ' ...ru
'journal = {Wildfowl}, ' ...
'volume = {30}, ' ...
'pages = {35--39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'South1953'; type = 'Article'; bib = [ ... 
'author = {Southwick, C.}, ' ... 
'year = {1953}, ' ...
'title = { A system of age classification for field studies of waterfowl broods}, ' ...ru
'journal = {Journal of Wildlife Management}, ' ...
'volume = {17}, ' ...
'pages = {1-8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
