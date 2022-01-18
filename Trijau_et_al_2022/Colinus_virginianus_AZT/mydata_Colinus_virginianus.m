function [data, auxData, metaData, txtData, weights] = mydata_Colinus_virginianus 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Odontophoridae';
metaData.species    = 'Colinus_virginianus'; 
metaData.species_en = 'Bobwhite quail'; 
metaData.T_typical  = C2K(38.9); % K, body temp SwanWain1997
metaData.data_0     = {}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'; 'Andre Gergs'; 'Kim Rakel'};    
metaData.date_subm = [2017 08 09];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2017 08 09]; 

%% set data
% zero-variate data
data.ab = 23;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'HernPete2007';   
temp.ab = C2K(37.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
comment.ab = 'page 6, in text, corresponds to hatch - temperature is unknown, but the temperature for incubating eggs was found on the Noah website.';
% uni-variate data
%% TOX DATA SYNGENTA - Azoxystrobin (Data 12)

% Observed average body weight(average over all replicates)
% as a function of time for different concentrations (a.i.) and both sex.
% Exposed via feeding. Concentration in food is reported in ppm a.i.
% Concentration was measured weekly and the mean deviation compared to nominal
% is at maximum 5%. Nominal concentration used.
% Exposure starts at age 119 dph.
% Uni-variate: Wet weight as a function of time

% Females
dat12 = [...
%Concentration (ppm a.i.)	Experimental day (d)	Adult body weight per individual(g)
0       0	187
0       14	181
0       28	193
0       42	191
0       56	196
0       154	223
0       0	180
0       14	168
0       28	163
0       42	167
0       56	178
0       154	224
0       0	196
0       14	199
0       28	205
0       42	208
0       56	211
0       154	239
0       0	170
0       14	177
0       28	186
0       42	188
0       56	192
0       154	213
0       0	190
0       14	187
0       28	191
0       42	195
0       56	195
0       154	231
0       0	194
0       14	189
0       28	196
0       42	195
0       56	199
0       154	233
0       0	197
0       14	193
0       28	199
0       42	202
0       56	208
0       154	230
0       0	184
0       14	180
0       28	183
0       42	187
0       56	196
0       154	224
0       0	195
0       14	187
0       28	190
0       42	197
0       56	204
0       154	222
0       0	208
0       14	209
0       28	211
0       42	214
0       56	220
0       154	264
0       0	193
0       14	192
0       28	197
0       42	197
0       56	203
0       154	234
0       0	198
0       14	202
0       28	206
0       42	212
0       56	217
0       154	198
0       0	176
0       14	187
0       28	197
0       42	200
0       56	206
0       154	163
0       0	202
0       14	200
0       28	208
0       42	211
0       56	217
0       154	221
0       0	199
0       14	203
0       28	209
0       42	214
0       56	216
0       154	223
0       0	202
0       14	205
0       28	213
0       42	214
0       56	221
0       154	236
500     0	199
500     14	199
500     28	203
500     42	198
500     56	201
500     154	228
500	    0	193
500	    14	197
500	    28	196
500	    42	198
500	    56	203
500	    154	243
500	    0	188
500	    14	186
500	    28	190
500	    42	187
500	    56	195
500	    154	197
500	    0	204
500	    14	203
500	    28	213
500	    42	217
500	    56	220
500	    154	249
500	    0	175
500	    14	177
500	    28	184
500	    42	186
500	    56	189
500	    154	NaN
500	    0	234
500	    14	207
500	    28	213
500	    42	230
500	    56  253
500	    154	NaN
500	    0	189
500	    14	190
500	    28	194
500	    42	199
500	    56	206
500	    154	231
500	    0	205
500	    14	204
500	    28	199
500	    42	209
500	    56	209
500	    154	265
500	    0	180
500	    14	180
500	    28	190
500	    42	196
500	    56	200
500	    154	211
500	    0	194
500	    14	192
500	    28	187
500	    42	193
500	    56	202
500	    154	223
500	    0	183
500	    14	185
500	    28	189
500	    42	194
500	    56	205
500	    154	262
500	    0	175
500	    14	174
500	    28	179
500	    42	193
500	    56	196
500	    154	215
500	    0	186
500	    14	188
500	    28	200
500	    42	203
500	    56	207
500	    154	232
500	    0	186
500	    14	182
500	    28	187
500	    42	186
500	    56	188
500	    154	222
500	    0	194
500	    14	200
500	    28	206
500	    42	210
500	    56	220
500	    154	245
500	    0	182
500	    14	178
500	    28	182
500	    42	184
500	    56	186
500	    154	222
1200	0	197
1200	14	205
1200	28	215
1200	42	219
1200	56	227
1200	154	224
1200	0	197
1200	14	198
1200	28	200
1200	42	202
1200	56	209
1200	154	214
1200	0	196
1200	14	196
1200	28	201
1200	42	207
1200	56	208
1200	154	173
1200	0	177
1200	14	180
1200	28	185
1200	42	185
1200	56	184
1200	154	207
1200	0	190
1200	14	188
1200	28	194
1200	42	197
1200	56	207
1200	154	242
1200	0	199
1200	14	199
1200	28	207
1200	42	219
1200	56	221
1200	154	222
1200	0	188
1200	14	185
1200	28	189
1200	42	192
1200	56	201
1200	154	240
1200	0	173
1200	14	167
1200	28	182
1200	42	186
1200	56	188
1200	154	162
1200	0	188
1200	14	181
1200	28	191
1200	42	199
1200	56	183
1200	154	216
1200	0	184
1200	14	183
1200	28	183
1200	42	186
1200	56	193
1200	154	216
1200	0	193
1200	14	198
1200	28	204
1200	42	207
1200	56	213
1200	154	233
1200	0	192
1200	14	192
1200	28	191
1200	42	194
1200	56	201
1200	154	227
1200	0	191
1200	14	184
1200	28	185
1200	42	194
1200	56	196
1200	154	NaN
1200	0	188
1200	14	190
1200	28	192
1200	42	199
1200	56	199
1200	154	230
1200	0	225
1200	14	224
1200	28	228
1200	42	237
1200	56	246
1200	154	289
1200	0	189
1200	14	190
1200	28	190
1200	42	194
1200	56	203
1200	154	233
3000	0	190
3000	14	184
3000	28	192
3000	42	196
3000	56	199
3000	154	NaN
3000	0	196
3000	14	196
3000	28	205
3000	42	199
3000	56	209
3000	154	251
3000	0	177
3000	14	177
3000	28	179
3000	42	178
3000	56	182
3000	154	209
3000	0	191
3000	14	188
3000	28	191
3000	42	194
3000	56	202
3000	154	NaN
3000	0	183
3000	14	179
3000	28	182
3000	42	184
3000	56	192
3000	154	191
3000	0	218
3000	14	216
3000	28	225
3000	42	221
3000	56	231
3000	154	288
3000	0	179
3000	14	184
3000	28	185
3000	42	192
3000	56	204
3000	154	NaN
3000	0	200
3000	14	203
3000	28	211
3000	42	214
3000	56	222
3000	154	267
3000	0	228
3000	14	231
3000	28	232
3000	42	239
3000	56	249
3000	154	286
3000	0	182
3000	14	181
3000	28	181
3000	42	185
3000	56	192
3000	154	229
3000	0	182
3000	14	178
3000	28	182
3000	42	184
3000	56	193
3000	154	191
3000	0	180
3000	14	179
3000	28	181
3000	42	180
3000	56	184
3000	154	231
3000	0	178
3000	14	174
3000	28	176
3000	42	179
3000	56	182
3000	154	202
3000	0	189
3000	14	190
3000	28	191
3000	42	200
3000	56	210
3000	154	244
3000	0	195
3000	14	194
3000	28	202
3000	42	208
3000	56	214
3000	154	255
3000	0	200
3000	14	201
3000	28	203
3000	42	207
3000	56	210
3000	154	229
];

dat12(:,2) = dat12(:,2) + 122; 
dat12(:,1) = dat12(:,1) / 1000; % Transform from ppm to ppm / 1000

% control
tWw_fe_dat12_0 = dat12(dat12(:,1) == 0,[2 3]);
[ud,ix,iy] = unique(tWw_fe_dat12_0(:,1)); % identify time point
data.tWw_fe_dat12_0 = [ud, accumarray(iy, tWw_fe_dat12_0(:,2),[],@(x)mean(x,'omitnan'))]; % mean by time point
units.tWw_fe_dat12_0 = {'d', 'g'};  label.tWw_fe_dat12_0 = {'time since birth','Wet weight, 0 ppm'};  bibkey.tWw_fe_dat12_0 = {'data12'};
auxData.conc.tWw_fe_dat12_0 = 0; units.conc.tWw_fe_dat12_0 = 'ppm a.i. /1000';  label.conc.tWw_fe_dat12_0 = 'Concentration';
% 500 ppm a.i.
tWw_fe_dat12_1 = dat12(dat12(:,1) == 0.5,[2 3]);
[ud,ix,iy] = unique(tWw_fe_dat12_1(:,1)); % sum by time point
data.tWw_fe_dat12_1 = [ud, accumarray(iy, tWw_fe_dat12_1(:,2),[],@(x)mean(x,'omitnan'))]; % mean by time point
units.tWw_fe_dat12_1 = {'d', 'g'};  label.tWw_fe_dat12_1 = {'time since birth','Wet weight,, 500 ppm'};  bibkey.tWw_fe_dat12_1 = {'data12'};
auxData.conc.tWw_fe_dat12_1 = 0.5; units.conc.tWw_fe_dat12_1 = 'ppm a.i. /1000';  label.conc.tWw_fe_dat12_1 = 'Concentration';
% 1200 ppm a.i.
tWw_fe_dat12_2 = dat12(dat12(:,1) == 1.2,[2 3]);
[ud,ix,iy] = unique(tWw_fe_dat12_2(:,1)); % sum by time point
data.tWw_fe_dat12_2 = [ud, accumarray(iy, tWw_fe_dat12_2(:,2),[],@(x)mean(x,'omitnan'))]; % mean by time point
units.tWw_fe_dat12_2 = {'d', 'g'};  label.tWw_fe_dat12_2 = {'time since birth','Wet weight, , 1200 ppm'};  bibkey.tWw_fe_dat12_2 = {'data12'};
auxData.conc.tWw_fe_dat12_2 = 1.2; units.conc.tWw_fe_dat12_2 = 'ppm a.i. /1000';  label.conc.tWw_fe_dat12_2 = 'Concentration';
% 3000 ppm a.i.
tWw_fe_dat12_3 = dat12(dat12(:,1) == 3,[2 3]);
[ud,ix,iy] = unique(tWw_fe_dat12_3(:,1)); % sum by time point
data.tWw_fe_dat12_3 = [ud, accumarray(iy, tWw_fe_dat12_3(:,2),[],@(x)mean(x,'omitnan'))]; % mean by time point
units.tWw_fe_dat12_3 = {'d', 'g'};  label.tWw_fe_dat12_3 = {'time since birth','Wet weight, , 3000 ppm'};  bibkey.tWw_fe_dat12_3 = {'data12'};
auxData.conc.tWw_fe_dat12_3 = 3; units.conc.tWw_fe_dat12_3 = 'ppm a.i. /1000';  label.conc.tWw_fe_dat12_3 = 'Concentration';

% CI growth.
% control
[ud,ix,iy] = unique(tWw_fe_dat12_0(:,1)); % sum by time point
tWw_fe_dat12_0_se = [ud, accumarray(iy, tWw_fe_dat12_0(:,2),[], @(x)(std(x, 'omitnan')/sqrt(length(x))))]; % standard deviation by time point
CI.tWw_fe_dat12_0 = 2.131*tWw_fe_dat12_0_se(:,2);
% 500ppm
[ud,ix,iy] = unique(tWw_fe_dat12_1(:,1)); % sum by time point
tWw_fe_dat12_1_se = [ud, accumarray(iy, tWw_fe_dat12_1(:,2),[], @(x)(std(x, 'omitnan')/sqrt(length(x))))]; % standard deviation by time point
CI.tWw_fe_dat12_1 = 2.131*tWw_fe_dat12_1_se(:,2);
% 1200 ppm
[ud,ix,iy] = unique(tWw_fe_dat12_2(:,1)); % sum by time point
tWw_fe_dat12_2_se = [ud, accumarray(iy, tWw_fe_dat12_2(:,2),[], @(x)(std(x, 'omitnan')/sqrt(length(x))))]; % standard deviation by time point
CI.tWw_fe_dat12_2 =2.131*tWw_fe_dat12_2_se(:,2);
% 3000 ppm
[ud,ix,iy] = unique(tWw_fe_dat12_3(:,1)); % sum by time point
tWw_fe_dat12_3_se = [ud, accumarray(iy, tWw_fe_dat12_3(:,2),[], @(x)(std(x, 'omitnan')/sqrt(length(x))))]; % standard deviation by time point
CI.tWw_fe_dat12_3 = 2.131*tWw_fe_dat12_3_se(:,2);


% Observed average egg-layed per female
% as a function of time (two time points) for different concentrations (a.i.)
% Exposed via feeding. Concentration in food is reported in ppm a.i.
% Concentration was measured weekly and the mean deviation compared to nominal
% is at maximum 5%. Nominal concentration used.
% Exposure starts at age 119 dph. (day experimental 0)
% Number of laying pair used to calculate average: control 16, 500 ppm: 15,
% 1200 ppm: 15, 3000 ppm: 13 (Table 3).
% Uni-variate: Cumulative reproduction as a function of time


tN_dat12 = [...
% % Concentration (ppm)	replicate Experimental_day	Eggs_layed_per_female
0 1401 84 1
0 1401  91 4
0 1401  98 4
0 1401  105 6
0 1401  112 1
0 1401  119 1
0 1401  126 3
0 1401  133 6
0 1401  140 7
0 1401  147 6
0 1401  154 6
0 1402  84 0
0 1402   91 0
0 1402   98 1
0 1402   105 3
0 1402   112 4
0 1402   119 5
0 1402   126 5
0 1402   133 5
0 1402   140 4
0 1402   147 3
0 1402   154 2
0 1403   84 0
0 1403    91 0
0 1403    98 4
0 1403    105 7
0 1403    112 6
0 1403    119 8
0 1403    126 6
0 1403    133 6
0 1403    140 6
0 1403    147 8
0 1403    154 7
0 1404    84 0
0 1404     91 4
0 1404     98 5
0 1404     105 0
0 1404     112 0
0 1404     119 0
0 1404     126 0
0 1404     133 0
0 1404     140 0
0 1404     147 0
0 1404     154 0
0 1405     84 3
0 1405      91 6
0 1405      98 7
0 1405      105 7
0 1405      112 7
0 1405      119 6
0 1405      126 7
0 1405      133 8
0 1405      140 6
0 1405      147 6
0 1405      154 7
0 1406      84 3
0 1406       91 4
0 1406       98 0
0 1406       105 0
0 1406       112 0
0 1406       119 0
0 1406       126 0
0 1406       133 0
0 1406       140 1
0 1406       147 0
0 1406       154 0
0 1407       84 0
0 1407       91 2
0 1407       98 5
0 1407       105 6
0 1407       112 6
0 1407       119 7
0 1407       126 7
0 1407       133 7
0 1407       140 6
0 1407       147 7
0 1407       154 6
0 1408       84 2
0 1408      91 6
0 1408      98 7
0 1408      105 7
0 1408      112 7
0 1408      119 7
0 1408      126 7
0 1408      133 7
0 1408      140 7
0 1408      147 7
0 1408      154 7
0 1409      84 0
0 1409      91 0
0 1409      98 0
0 1409      105 3
0 1409      112 3
0 1409      119 5
0 1409      126 6
0 1409      133 8
0 1409      140 7
0 1409      147 6
0 1409      154 8
0 1410      84 0
0 1410      91 3
0 1410      98 5
0 1410      105 7
0 1410      112 7
0 1410      119 7
0 1410      126 7
0 1410      133 7
0 1410      140 7
0 1410      147 7
0 1410      154 7
0 1411      84 0
0 1411      91 0
0 1411      98 1
0 1411      105 7
0 1411      112 7
0 1411      119 7
0 1411      126 7
0 1411      133 7
0 1411      140 7
0 1411      147 6
0 1411      154 7
0 1412      84 0
0 1412      91 0
0 1412      98 4
0 1412      105 4
0 1412      112 5
0 1412      119 7
0 1412      126 7
0 1412      133 7
0 1412      140 7
0 1412      147 6
0 1412      154 5
0 1413      84 2
0 1413      91 5
0 1413      98 7
0 1413      105 7
0 1413      112 7
0 1413      119 7
0 1413      126 6
0 1413      133 0
0 1413      140 2
0 1413      147 0
0 1413      154 0
0 1414      84 0
0 1414      91 0
0 1414      98 5
0 1414      105 7
0 1414      112 7
0 1414      119 7
0 1414      126 7
0 1414      133 7
0 1414      140 7
0 1414      147 7
0 1414      154 7
0 1415      84 7
0 1415      91 1
0 1415      98 0
0 1415      105 0
0 1415      112 4
0 1415      119 5
0 1415      126 7
0 1415      133 7
0 1415      140 7
0 1415      147 7
0 1415      154 7
0 1416      84 0
0 1416      91 0
0 1416      98 2
0 1416      105 5
0 1416      112 7
0 1416      119 7
0 1416      126 7
0 1416      133 7
0 1416      140 7
0 1416      147 7
0 1416      154 6
500 1417    84 5
500 1417    91 7
500 1417    98 6
500 1417    105 7
500 1417    112 7
500 1417    119 7
500 1417    126 6
500 1417    133 7
500 1417    140 7
500 1417    147 4
500 1417    154 6
500 1418    84 0
500 1418    91 0
500 1418    98 0
500 1418    105 0
500 1418    112 2
500 1418    119 5
500 1418    126 8
500 1418    133 6
500 1418    140 7
500 1418    147 6
500 1418    154 6
500 1419    84 0
500 1419    91 0
500 1419    98 1
500 1419    105 5
500 1419    112 5
500 1419    119 6
500 1419    126 7
500 1419    133 7
500 1419    140 7
500 1419    147 5
500 1419    154 3
500 1420    84 0
500 1420    91 0
500 1420    98 4
500 1420    105 4
500 1420    112 7
500 1420    119 7
500 1420    126 8
500 1420    133 6
500 1420    140 7
500 1420    147 7
500 1420    154 6
500 1421    84 NaN
500 1421     91 NaN
500 1421     98 NaN
500 1421     105 NaN
500 1421     112 NaN
500 1421     119 NaN
500 1421     126 NaN
500 1421     133 NaN
500 1421     140 NaN
500 1421     147 NaN
500 1421     154 NaN
500 1422     84 1
500 1422     91 4
500 1422     98 0
500 1422     105 0
500 1422     112 0
500 1422     119 0
500 1422     126 0
500 1422     133 0
500 1422     140 0
500 1422     147 0
500 1422     154 0
500 1423     84 0
500 1423     91 6
500 1423     98 7
500 1423     105 8
500 1423     112 6
500 1423     119 7
500 1423     126 8
500 1423     133 7
500 1423     140 7
500 1423     147 6
500 1423     154 6
500 1424     84 1
500 1424     91 4
500 1424     98 6
500 1424     105 7
500 1424     112 6
500 1424     119 7
500 1424     126 6
500 1424     133 7
500 1424     140 7
500 1424     147 7
500 1424     154 8
500 1425     84 0
500 1425     91 0
500 1425     98 4
500 1425     105 5
500 1425     112 5
500 1425     119 7
500 1425     126 6
500 1425     133 6
500 1425     140 6
500 1425     147 5
500 1425     154 6
500 1426     84 0
500 1426     91 0
500 1426     98 3
500 1426     105 4
500 1426     112 6
500 1426     119 6
500 1426     126 6
500 1426     133 6
500 1426     140 6
500 1426     147 6
500 1426     154 6
500 1427     84 0
500 1427     91 0
500 1427     98 4
500 1427     105 7
500 1427     112 7
500 1427     119 7
500 1427     126 7
500 1427     133 7
500 1427     140 7
500 1427     147 7
500 1427     154 7
500 1428     84 0
500 1428     91 4
500 1428     98 0
500 1428     105 6
500 1428     112 5
500 1428     119 7
500 1428     126 7
500 1428     133 7
500 1428     140 5
500 1428     147 5
500 1428     154 5
500 1429     84 0
500 1429     91 0
500 1429     98 2
500 1429     105 4
500 1429     112 6
500 1429     119 6
500 1429     126 7
500 1429     133 7
500 1429     140 7
500 1429     147 7
500 1429     154 7
500 1430     84 0
500 1430     91 3
500 1430     98 7
500 1430     105 9
500 1430     112 7
500 1430     119 8
500 1430     126 8
500 1430     133 7
500 1430     140 6
500 1430     147 7
500 1430     154 7
500 1431     84 3
500 1431     91 6
500 1431     98 6
500 1431     105 7
500 1431     112 7
500 1431     119 7
500 1431     126 7
500 1431     133 8
500 1431     140 6
500 1431     147 7
500 1431     154 7
500 1432     84 0
500 1432     91 2
500 1432     98 4
500 1432     105 5
500 1432     112 6
500 1432     119 3
500 1432     126 7
500 1432     133 7
500 1432     140 7
500 1432     147 7
500 1432     154 7
1200 1433    84 0
1200 1433    91 0
1200 1433    98 1
1200 1433    105 5
1200 1433    112 7
1200 1433    119 7
1200 1433    126 7
1200 1433    133 3
1200 1433    140 1
1200 1433    147 0
1200 1433    154 0
1200 1434    84 0
1200 1434    91 0
1200 1434    98 0
1200 1434    105 1
1200 1434    112 4
1200 1434    119 0
1200 1434    126 0
1200 1434    133 0
1200 1434    140 0
1200 1434    147 0
1200 1434    154 1
1200 1435    84 0
1200 1435    91 0
1200 1435    98 0
1200 1435    105 1
1200 1435    112 1
1200 1435    119 0
1200 1435    126 0
1200 1435    133 0
1200 1435    140 1
1200 1435    147 0
1200 1435    154 0
1200 1436    84 0
1200 1436    91 0
1200 1436    98 0
1200 1436    105 3
1200 1436    112 4
1200 1436    119 3
1200 1436    126 6
1200 1436    133 6
1200 1436    140 6
1200 1436    147 5
1200 1436    154 6
1200 1437    84 0
1200 1437    91 2
1200 1437    98 1
1200 1437    105 0
1200 1437    112 0
1200 1437    119 0
1200 1437    126 0
1200 1437    133 0
1200 1437    140 0
1200 1437    147 0
1200 1437    154 0
1200 1438    84 0
1200 1438    91 3
1200 1438    98 5
1200 1438    105 5
1200 1438    112 6
1200 1438    119 6
1200 1438    126 7
1200 1438    133 7
1200 1438    140 7
1200 1438    147 3
1200 1438    154 2
1200 1439    84 0
1200 1439    91 0
1200 1439    98 0
1200 1439    105 2
1200 1439    112 6
1200 1439    119 7
1200 1439    126 7
1200 1439    133 7
1200 1439    140 7
1200 1439    147 6
1200 1439    154 7
1200 1440    84 0
1200 1440    91 0
1200 1440    98 0
1200 1440    105 7
1200 1440    112 6
1200 1440    119 6
1200 1440    126 7
1200 1440    133 7
1200 1440    140 6
1200 1440    147 5
1200 1440    154 2
1200 1441    84 0
1200 1441    91 0
1200 1441    98 2
1200 1441    105 1
1200 1441    112 9
1200 1441    119 6
1200 1441    126 8
1200 1441    133 6
1200 1441    140 8
1200 1441    147 7
1200 1441    154 6
1200 1442    84 0
1200 1442    91 0
1200 1442    98 0
1200 1442    105 0
1200 1442    112 1
1200 1442    119 3
1200 1442    126 6
1200 1442    133 7
1200 1442    140 7
1200 1442    147 5
1200 1442    154 5
1200 1443    84 5
1200 1443    91 6
1200 1443    98 7
1200 1443    105 7
1200 1443    112 7
1200 1443    119 7
1200 1443    126 7
1200 1443    133 7
1200 1443    140 7
1200 1443    147 7
1200 1443    154 6
1200 1444    84 0
1200 1444    91 0
1200 1444    98 1
1200 1444    105 5
1200 1444    112 5
1200 1444    119 2
1200 1444    126 3
1200 1444    133 7
1200 1444    140 7
1200 1444    147 7
1200 1444    154 6
1200 1445    84 NaN
1200 1445     91 NaN
1200 1445     98 NaN
1200 1445     105 NaN
1200 1445     112 NaN
1200 1445     119 NaN
1200 1445     126 NaN
1200 1445     133 NaN
1200 1445     140 NaN
1200 1445     147 NaN
1200 1445     154 NaN
1200 1446     84 0
1200 1446     91 2
1200 1446     98 6
1200 1446     105 7
1200 1446     112 7
1200 1446     119 7
1200 1446     126 7
1200 1446     133 7
1200 1446     140 7
1200 1446     147 7
1200 1446     154 7
1200 1447     84 0
1200 1447     91 5
1200 1447     98 2
1200 1447     105 0
1200 1447     112 1
1200 1447     119 3
1200 1447     126 0
1200 1447     133 0
1200 1447     140 0
1200 1447     147 0
1200 1447     154 0
1200 1448     84 0
1200 1448     91 1
1200 1448     98 0
1200 1448     105 4
1200 1448     112 6
1200 1448     119 7
1200 1448     126 7
1200 1448     133 7
1200 1448     140 7
1200 1448     147 7
1200 1448     154 7
3000 1449     84 NaN
3000 1449     91 NaN
3000 1449     98 NaN
3000 1449     105 NaN
3000 1449     112 NaN
3000 1449     119 NaN
3000 1449     126 NaN
3000 1449     133 NaN
3000 1449     140 NaN
3000 1449     147 NaN
3000 1449     154 NaN
3000 1450     84 2
3000 1450     91 0
3000 1450     98 0
3000 1450     105 0
3000 1450     112 0
3000 1450     119 0
3000 1450     126 0
3000 1450     133 0
3000 1450     140 0
3000 1450     147 0
3000 1450     154 0
3000 1451     84 0
3000 1451     91 0
3000 1451     98 0
3000 1451     105 0
3000 1451     112 0
3000 1451     119 2
3000 1451     126 3
3000 1451     133 5
3000 1451     140 3
3000 1451     147 1
3000 1451     154 4
3000 1452     84 NaN
3000 1452     91 NaN
3000 1452     98 NaN
3000 1452     105 NaN
3000 1452     112 NaN
3000 1452     119 NaN
3000 1452     126 NaN
3000 1452     133 NaN
3000 1452     140 NaN
3000 1452     147 NaN
3000 1452     154 NaN
3000 1453     84 0
3000 1453     91 0
3000 1453     98 1
3000 1453     105 3
3000 1453     112 6
3000 1453     119 7
3000 1453     126 7
3000 1453     133 7
3000 1453     140 6
3000 1453     147 3
3000 1453     154 3
3000 1454     84 0
3000 1454     91 0
3000 1454     98 6
3000 1454     105 7
3000 1454     112 7
3000 1454     119 7
3000 1454     126 6
3000 1454     133 6
3000 1454     140 7
3000 1454     147 7
3000 1454     154 7
3000 1455     84 NaN
3000 1455     91 NaN
3000 1455     98 NaN
3000 1455     105 NaN
3000 1455     112 NaN
3000 1455     119 NaN
3000 1455     126 NaN
3000 1455     133 NaN
3000 1455     140 NaN
3000 1455     147 NaN
3000 1455     154 NaN
3000 1456     84 0
3000 1456     91 3
3000 1456     98 4
3000 1456     105 0
3000 1456     112 0
3000 1456     119 0
3000 1456     126 0
3000 1456     133 0
3000 1456     140 0
3000 1456     147 0
3000 1456     154 0
3000 1457     84 0
3000 1457     91 0
3000 1457     98 0
3000 1457     105 0
3000 1457     112 3
3000 1457     119 4
3000 1457     126 6
3000 1457     133 6
3000 1457     140 6
3000 1457     147 6
3000 1457     154 7
3000 1458     84 0
3000 1458     91 0
3000 1458     98 2
3000 1458     105 0
3000 1458     112 3
3000 1458     119 5
3000 1458     126 6
3000 1458     133 7
3000 1458     140 7
3000 1458     147 6
3000 1458     154 6
3000 1459     84 0
3000 1459     91 0
3000 1459     98 2
3000 1459     105 4
3000 1459     112 0
3000 1459     119 0
3000 1459     126 0
3000 1459     133 0
3000 1459     140 0
3000 1459     147 0
3000 1459     154 0
3000 1460     84 2
3000 1460     91 6
3000 1460     98 6
3000 1460     105 7
3000 1460     112 3
3000 1460     119 0
3000 1460     126 0
3000 1460     133 0
3000 1460    140 0
3000 1460     147 0
3000 1460     154 0
3000 1461     84 0
3000 1461     91 1
3000 1461     98 3
3000 1461     105 4
3000 1461     112 6
3000 1461     119 4
3000 1461     126 5
3000 1461     133 6
3000 1461     140 5
3000 1461     147 5
3000 1461     154 5
3000 1462     84 0
3000 1462     91 1
3000 1462     98 5
3000 1462     105 7
3000 1462     112 5
3000 1462     119 8
3000 1462     126 7
3000 1462     133 7
3000 1462     140 7
3000 1462     147 6
3000 1462     154 6
3000 1463     84 0
3000 1463     91 6
3000 1463     98 7
3000 1463     105 6
3000 1463     112 7
3000 1463     119 6
3000 1463     126 7
3000 1463     133 6
3000 1463     140 7
3000 1463     147 7
3000 1463     154 7
3000 1464     84 0
3000 1464     91 0
3000 1464     98 4
3000 1464     105 6
3000 1464     112 0
3000 1464     119 0
3000 1464     126 0
3000 1464     133 0
3000 1464     140 1
3000 1464     147 0
3000 1464     154 2
];

tN_dat12(:,1) = tN_dat12(:,1) / 1000; % Transform from ppm to ppm / 1000
tN_dat12(:,3) = tN_dat12(:,3) + 119; % Exposure starts at 119 dph
% control
tN_dat12_0 = tN_dat12(tN_dat12(:,1) == 0,[2 3 4]);
[ud,ix,iy] = unique(tN_dat12_0(:,1)); % unique replicates 
tN_dat12_0_cum = [tN_dat12_0(:,2)  cell2mat(accumarray(iy, tN_dat12_0(:,3),[],@(x){cumsum(x,'omitnan')}))]; % mean by replicate
[ud,ix,iy] = unique(tN_dat12_0_cum(:,1)); % unique time points
data.tN_dat12_0 = [ud, accumarray(iy, tN_dat12_0_cum(:,2),[],@(x) mean(x,'omitnan'))]; % average by time point
units.tN_dat12_0 = {'d', '#'};  label.tN_dat12_0 = {'time since birth','cumulative reproduction, 0 ppm'};  bibkey.tN_dat12_0 = {'data12'};
auxData.conc.tN_dat12_0 = 0; units.conc.tN_dat12_0 = 'ppm a.i. /1000';  label.conc.tN_dat12_0 = 'Concentration';
% 500 ppm a.i.
tN_dat12_1 = tN_dat12(tN_dat12(:,1) == 0.5,[2 3 4]);
[ud,ix,iy] = unique(tN_dat12_1(:,1)); % unique replicates 
tN_dat12_1_cum = [tN_dat12_1(:,2)  cell2mat(accumarray(iy, tN_dat12_1(:,3),[],@(x){cumsum(x,'omitnan')}))]; % mean by replicate
[ud,ix,iy] = unique(tN_dat12_1_cum(:,1)); % unique time points
data.tN_dat12_1 = [ud, accumarray(iy, tN_dat12_1_cum(:,2),[],@(x) mean(x,'omitnan'))]; % average  by time point
units.tN_dat12_1 ={'d', '#'};  label.tN_dat12_1 = {'time since birth','cumulative reproduction, 500 ppm'};  bibkey.tN_dat12_1 = {'data12'};
auxData.conc.tN_dat12_1 = 0.5; units.conc.tN_dat12_1 = 'ppm a.i. /1000';  label.conc.tN_dat12_1 = 'Concentration';
% 1200 ppm a.i.
tN_dat12_2 = tN_dat12(tN_dat12(:,1) == 1.2,[2 3 4]);
[ud,ix,iy] = unique(tN_dat12_2(:,1)); % unique replicates 
tN_dat12_2_cum = [tN_dat12_2(:,2)  cell2mat(accumarray(iy, tN_dat12_2(:,3),[],@(x){cumsum(x,'omitnan')}))]; % mean by replicate
[ud,ix,iy] = unique(tN_dat12_2_cum(:,1)); % unique time points
data.tN_dat12_2 = [ud, accumarray(iy, tN_dat12_2_cum(:,2),[],@(x) mean(x,'omitnan'))]; % average  by time point
units.tN_dat12_2 = {'d', '#'};  label.tN_dat12_2 = {'time since birth','cumulative reproduction, 1200 ppm'};  bibkey.tN_dat12_2 = {'data12'};
auxData.conc.tN_dat12_2 = 1.2; units.conc.tN_dat12_2 = 'ppm a.i. /1000';  label.conc.tN_dat12_2 = 'Concentration';
% 3000 ppm a.i.
tN_dat12_3 = tN_dat12(tN_dat12(:,1) == 3,[2 3 4]);
[ud,ix,iy] = unique(tN_dat12_3(:,1)); % unique replicates 
tN_dat12_3_cum = [tN_dat12_3(:,2)  cell2mat(accumarray(iy, tN_dat12_3(:,3),[],@(x){cumsum(x,'omitnan')}))]; % mean by replicate
[ud,ix,iy] = unique(tN_dat12_3_cum(:,1)); % unique time points
data.tN_dat12_3 = [ud, accumarray(iy, tN_dat12_3_cum(:,2),[],@(x) mean(x,'omitnan'))]; % average by time point
units.tN_dat12_3 = {'d', '#'};  label.tN_dat12_3 = {'time since birth','cumulative reproduction, 3000 ppm'};  bibkey.tN_dat12_3 = {'data12'};
auxData.conc.tN_dat12_3 = 3; units.conc.tN_dat12_3 = 'ppm a.i. /1000';  label.conc.tN_dat12_3 = 'Concentration';

%95% confidence interval calculation for reproduction 
% control
[ud,ix,iy] = unique(tN_dat12_0_cum(:,1)); % unique time points
tN_dat12_0_std = [ud, accumarray(iy, tN_dat12_0_cum(:,2),[],@(x) std(x,'omitnan'))];% standard deviation by time point
tN_dat12_0_se = [tN_dat12_0_std(:,1) tN_dat12_0_std(:,2)./sqrt(16)];
CI.tN_dat12_0 = 2.131*tN_dat12_0_se(:,2);

reproRate.tN_dat12_0 = tN_dat12_0_cum(tN_dat12_0_cum(:,1)==273,2)./77 ; %average egg laying rate per female 

% 500 ppm
[ud,ix,iy] = unique(tN_dat12_1_cum(:,1)); % unique time points
tN_dat12_1_std = [ud, accumarray(iy, tN_dat12_1_cum(:,2),[],@(x) std(x,'omitnan'))];% standard deviation by time point
tN_dat12_1_se = [tN_dat12_1_std(:,1) tN_dat12_1_std(:,2)./sqrt(16)];
CI.tN_dat12_1 = 2.131*tN_dat12_1_se(:,2);
reproRate.tN_dat12_1 = tN_dat12_1_cum(tN_dat12_1_cum(:,1)==273,2)./77; %average egg laying rate per female

% 1200 ppm
[ud,ix,iy] = unique(tN_dat12_2_cum(:,1)); % unique time points
tN_dat12_2_std = [ud, accumarray(iy, tN_dat12_2_cum(:,2),[],@(x) std(x,'omitnan'))];% standard deviation by time point
tN_dat12_2_se = [tN_dat12_2_std(:,1) tN_dat12_2_std(:,2)./sqrt(16)];
CI.tN_dat12_2 = 2.131*tN_dat12_2_se(:,2);

reproRate.tN_dat12_2 = tN_dat12_2_cum(tN_dat12_2_cum(:,1)==273,2)./77; %average egg laying rate per female

% 3000 ppm
[ud,ix,iy] = unique(tN_dat12_3_cum(:,1)); % unique time points
tN_dat12_3_std = [ud, accumarray(iy, tN_dat12_3_cum(:,2),[],@(x) std(x,'omitnan'))];% standard deviation by time point
tN_dat12_3_se = [tN_dat12_3_std(:,1) tN_dat12_3_std(:,2)./sqrt(16)];
CI.tN_dat12_3 = 2.131*tN_dat12_3_se(:,2);

reproRate.tN_dat12_3 = tN_dat12_3_cum(tN_dat12_3_cum(:,1)==273,2)./77; %average egg laying rate per female

%Food ingestion
ingestion_tWw_fe_dat12 = [... 
% Concentration(ppm a.i.) Experimental_day(d) feed_comsumption(g/bird/day)(mean on two weeks) 
0   7	17
0   14	18
0   21	16
0   28	17
0   35	16
0   42  15
0   49  15
0   56  17 
0   63  16
0   70  17
0   77  17   
0   84  18    
0   91  19    
0   98  20   
0   105 21   
0   112 23   
0   119 25   
0   126 23   
0   133 24   
0   140 22   
0   147 24   
0   154 24
500 7	16
500 14	18
500 21	16
500 28	17
500 35	17
500 42  15
500 49  15
500 56  17 
500 63  16
500 70  17
500 77  17   
500 84  18    
500 91  19    
500 98  20   
500 105 22   
500 112 21   
500 119 24   
500 126 24   
500 133 25   
500 140 21   
500 147 23   
500 154 25
1200 7	16
1200 14	18
1200 21	16
1200 28	17
1200 35	17
1200 42  15
1200 49  15
1200 56  16 
1200 63  16
1200 70  17
1200 77  16   
1200 84  18    
1200 91  17    
1200 98  18   
1200 105 21   
1200 112 20   
1200 119 23   
1200 126 23   
1200 133 23   
1200 140 21   
1200 147 21   
1200 154 23
3000 7	16
3000 14	18
3000 21	16
3000 28	17
3000 35	16
3000 42  15
3000 49  15
3000 56  16 
3000 63  16
3000 70  17
3000 77  16   
3000 84  17    
3000 91  19    
3000 98  19   
3000 105 20   
3000 112 20   
3000 119 23   
3000 126 22   
3000 133 23   
3000 140 21   
3000 147 22   
3000 154 23
];

ingestion_tWw_fe_dat12(:,2) = ingestion_tWw_fe_dat12(:,2)+122;
ingestion_tWw_fe_dat12(:,1) = ingestion_tWw_fe_dat12(:,1)/1000;
% Control 
ingestion.tWw_fe_dat12_0 =ingestion_tWw_fe_dat12(ingestion_tWw_fe_dat12(:,1) == 0,[2 3]);
units.ingestion.tWw_fe_dat12_0  = {'d', 'g Wet wt/d'};  label.ingestion.tWw_fe_dat12_0 = {'time since birth', 'ingestion'}; 
% 500 ppm
ingestion.tWw_fe_dat12_1 =ingestion_tWw_fe_dat12(ingestion_tWw_fe_dat12(:,1) == 0.5,[2 3]);
units.ingestion.tWw_fe_dat12_1  = {'d', 'g Wet wt/d'};  label.ingestion.tWw_fe_dat12_1 = {'time since birth', 'ingestion'}; 
%1200 ppm 
ingestion.tWw_fe_dat12_2 =ingestion_tWw_fe_dat12(ingestion_tWw_fe_dat12(:,1) == 1.2,[2 3]);
units.ingestion.tWw_fe_dat12_2  = {'d', 'g Wet wt/d'};  label.ingestion.tWw_fe_dat12_2 = {'time since birth', 'ingestion'}; 
% 3000 ppm 
ingestion.tWw_fe_dat12_3 =ingestion_tWw_fe_dat12(ingestion_tWw_fe_dat12(:,1) == 3,[2 3]);
units.ingestion.tWw_fe_dat12_3  = {'d', 'g Wet wt/d'};  label.ingestion.tWw_fe_dat12_3 = {'time since birth', 'ingestion'}; 

%% set weights for all real data
weights = setweights(data, []);

weights.tWw_fe_dat12_0 = 10 * weights.tWw_fe_dat12_0;
weights.tN_dat12_0 = 10 * weights.tN_dat12_0; 
weights.tWw_fe_dat12_1 = 10 * weights.tWw_fe_dat12_1;
weights.tN_dat12_1 = 10 * weights.tN_dat12_1; 
weights.tWw_fe_dat12_2 = 10 * weights.tWw_fe_dat12_2;
weights.tN_dat12_2 = 10 * weights.tN_dat12_2; 
weights.tWw_fe_dat12_3 = 10 * weights.tWw_fe_dat12_3;
weights.tN_dat12_3 = 10 * weights.tN_dat12_3; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 10 * weights.psd.p_M; 
%% pack auxData and txtData for output
auxData.temp = temp;
auxData.ingestion = ingestion; % addition auxData to specify ingestion 
auxData.CI=CI; % addition auxData to specify condifidence intervals (CI)
auxData.reproRate=reproRate;% addition auxData to specify egg laying rate 
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; comment1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.comment = {comment1};
% 
%% Discussion points
D1 = 'The entries assumes all data are performed in the thermoneutral zone. Data from SwanWein1997 which are outside of the thermoneutral zone are not included.';
D2 = 't-N dataset: egg ripening assumed to be around 0.7 d^-1, and that material accumulated in the reproduction buffer for 182.5 days prior to experiment - this number is based on the fact that they have on average 1.5 clutches per year.';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'There are many natural strains of bobwhite; few domesticated strains have been intentionally developed';
metaData.bibkey.F1 = 'oecd2006'; 
F2 = 'The bobwhite is distributed from southeastern Ontario (Canada) to Guatemala and in Cuba but reaches its highest density in the eastern United States and Mexico';
metaData.bibkey.F2 = 'oecd2006';
F3 = 'Body size also increases from south to north in its native range with birds in Chiapas, Mexico, averaging 129 g, whereas those in the eastern United States weigh about 172 g.';
metaData.bibkey.F3 = 'oecd2006';
F4 = 'Bobwhite nest in the spring with clutch sizes of 10 to 15 eggs.';
metaData.bibkey.F4 = 'oecd2006';
F5 = 'Body temperature of 38.9 in summer and 37.7 in winter - we use the summer temperature in this entry';
metaData.bibkey.F5 = 'SwanWein1997';
metaData.facts = struct('F1',F1, 'F2', F2, 'F3', F3, 'F4', F4, 'F5', F5);

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Northern_bobwhite}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Colinus_virginianus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Noah'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.noahsnet.com/guide-to-incubating-quail-eggs/}}';
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
bibkey = 'HernPete2007'; type = 'incollection'; bib = [ ... 
'author = {F. Hernandez and M. J. Peterson}, ' ... 
'year = {2007}, ' ...
'title = {Northern Bobwhite Ecology and Life History}, '...
'Booktitle = {Texas Quails Book}, ' ...
'editor = {L. A. Brennan}, ' ...
'publisher = {Texas A \& M University Press}, '...
'pages = {40--64}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'oecd2006'; type = 'techreport'; bib = [ ... 
'institution = {OECD Environment, Health and Safety Publications Series on Testing and Assessment}, ' ... 
'year = {2006}, ' ...
'author = {OECD}, '...
'title = {DETAILED REVIEW PAPER FOR AVIAN TWO-GENERATION TOXICITY TEST}']; % ...
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shan1994'; type = 'Book'; bib = [ ... 
'author = {Shanaway, Page}, ' ... 
'year = {1994}, ' ...
'title = {Quail production systems: a review}, ' ...
'publisher = {FAO (January 30, 1994)}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GentSurl2005'; type = 'Article'; bib = [ ... 
'author = {A. Gentles and J. Surles and E. E. Smith}, ' ... 
'year = {2005}, ' ...
'title = {EVALUATION OF ADULT QUAIL AND EGG PRODUCTION FOLLOWING EXPOSURE TO PERCHLORATE-TREATED WATER}, ' ...
'journal = {Environmental Toxicology and Chemistry}, ' ...
'volume = {24}, ' ...
'number = {8}, '...
'pages = {1930--1934}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NewsBeac2008'; type = 'Article'; bib = [ ... 
'author = {J. L. Newsted and Susan A. Beach and S. P. Gallagher and J. P. Giesy}, ' ... 
'year = {2008}, ' ...
'title = {Acute and Chronic Effects of Perfluorobutane Sulfonate ({P}{F}{B}{S}) on the Mallard and Northern Bobwhite Quail}, ' ...
'journal = {Arch Environ Contam Toxicol}, ' ...
'volume = {54}, ' ...
'doi = {10.1007/s00244-007-9039-8}, '...
'pages = {535--545}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RobeLind1966'; type = 'Article'; bib = [ ... 
'author = {R. J. Robel and S. A. Linderman}, ' ... 
'year = {1966}, ' ...
'title = {Weight Dynamics of Unconfined Bobwhite Quail in {K}ansas}, ' ...
'journal = {Transactions of the Kansas Academy of Science}, ' ...
'volume = {69}, ' ...
'number = {2}, '...
'pages = {132--138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NelsMart1953'; type = 'Article'; bib = [ ... 
'author = {A. L. Nelson and A. C. Martin }, ' ... 
'year = {1953}, ' ...
'title = {Gamebird Weights}, ' ...
'journal = {The Journal of Wildlife Management}, ' ...
'volume = {17}, ' ...
'number = {1}, '...
'doi = {10.2307/3796802 }, '...
'pages = {36--42 }'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hans1954'; type = 'Article'; bib = [ ... 
'author = {H. C. Hanson}, ' ... 
'year = {1954}, ' ...
'title = {Criteria of Age of Incubated Mallard, Wood Duck, and Bob-White Quail Eggs}, ' ...
'journal = {The Auk}, ' ...
'volume = {71}, ' ...
'number = {3}, '...
'pages = {267--272}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SwanWein1997'; type = 'Article'; bib = [ ... 
'author = {D. L. Swanson and D. P. Weinacht}, ' ... 
'year = {1997}, ' ...
'title = {SEASONAL EFFECTS ON METABOLISM  AND THERMOREGULATION  IN NORTHERN  BOBWHITE}, ' ...
'journal = {The Condor}, ' ...
'volume = {99}, ' ...
'pages = {478--489}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SpieAdam1985'; type = 'Article'; bib = [ ... 
'author = {D. E. Spiers and T. Adams and R. K. Ringer}, ' ... 
'year = {1985}, ' ...
'title = {HOMEOTHERMIC  DEVELOPMENT  IN  THE  BOBWHITE (\emph{Colinus virginianus})}, ' ...
'journal = {Comp. Biochem. Physiol. Vol. 81A, No.4, pp. ,}, ' ...
'volume = {81A}, ' ...
'number = {4}, '...
'pages = {921--927}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lyon1962'; type = 'Article'; bib = [ ... 
'author = {Lyon, D. L.}, ' ... 
'year = {1962}, ' ...
'title = {COMPARATIVE GROWTH AND PLUMAGE DEVELOPMENT IN \emph{Coturnix} AND BOBWHITE}, ' ...
'journal = {The Wislon Bulletin}, ' ...
'volume = {74}, ' ...
'number = {1}, '...
'pages = {5--27}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoneHugh1978'; type = 'Article'; bib = [ ... 
'author = {Jones, J. E. and Hughes, B. L.}, ' ... 
'year = {1978}, ' ...
'title = {Comparison of Growth Rate, Body Weight, and Feed Conversion Between \emph{Coturnix} D1 Quail and Bobwhite Quail}, ' ...
'journal = {Poultry Science}, ' ...
'volume = {57}, ' ...
'number = {5}, '...
'doi = {10.3382/ps.0571471}, ' ...
'pages = {1471--1472}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

% 
bibkey = 'Zamm1986'; type = 'Article'; bib = [ ... 
'author = {R. M. Zammuto}, ' ... 
'year = {1986}, ' ...
'title = {Life histories of birds: clutch size, longevity, and body mass among {N}orth {A}merican game birds}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {64}, ' ...
'number = {12}, '...
'doi = {10.1139/z86-398}, '...
'pages = {2739--2749}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
