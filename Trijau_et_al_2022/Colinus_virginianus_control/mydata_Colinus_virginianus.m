function [data, auxData, metaData, txtData, weights] = mydata_Colinus_virginianus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Odontophoridae';
metaData.species    = 'Colinus_virginianus'; 
metaData.species_en = 'Bobwhite quail Laboratory'; 
metaData.T_typical  = C2K(38.9); % K, body temp SwanWain1997
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Ww0'; 'Wwb'; 'Wwx'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Le'; 't-N'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'; 'Andre Gergs'; 'Kim Rakel'};    
metaData.date_subm = [2017 08 09];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.author   = {'Benoit Goussen'};    
metaData.date_subm = [2020 01 28];              
metaData.email    = {'benoit.goussen@ibacon.com'};            
metaData.address  = {'ibacon GmbH, Roﬂdorf, Germany'};  

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2017 08 09]; 

%% set data
% zero-variate data

data.ab = 23;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'HernPete2007';   
temp.ab = C2K(37.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
comment.ab = 'page 6, in text, corresponds to hatch - temperature is unknown, but the temperature for incubating eggs was found on the Noah website.';

% uni-variate data

%% DATA SYNGENTA - Atrazine Control (Data 02)

% Observed individual body weight
% as a function of time 
% Uni-variate: Individual Wet weight as a function of time
% Females
tWw_fe_dat02 = [...
% Concentration(ppm) Experimental day(d)	Average adult body weight (g)	
0 0 243
0 0 234
0 0 212
0 0 212
0 0 198
0 0 237
0 0 208
0 0 209
0 0 249
0 0 194
0 0 218
0 0 234
0 0 203
0 0 285
0 0 214
0 0 222
0 0 231
0 0 201
0 0 221
0 0 161
0 0 249
0 0 214
0 0 210
0 0 229
0 14 250
0 14 236
0 14 214
0 14 210
0 14 201
0 14 241
0 14 214
0 14 218
0 14 255
0 14 196
0 14 228
0 14 242
0 14 199
0 14 290
0 14 222
0 14 225
0 14 233
0 14 203
0 14 227
0 14 162
0 14 250
0 14 216
0 14 213
0 14 236
0 28 254
0 28 232
0 28 212
0 28 205
0 28 203
0 28 239
0 28 214
0 28 221
0 28 255
0 28 218
0 28 229
0 28 232
0 28 202
0 28 301
0 28 227
0 28 226
0 28 234
0 28 204
0 28 231
0 28 164
0 28 254
0 28 217
0 28 212
0 28 239
0 42 253
0 42 230
0 42 212
0 42 196
0 42 204
0 42 248
0 42 212
0 42 215
0 42 258
0 42 216
0 42 223
0 42 239
0 42 207
0 42 298
0 42 227
0 42 222
0 42 232
0 42 203
0 42 228
0 42 164
0 42 250
0 42 217
0 42 216
0 42 242
0 140 313
0 140 188
0 140 249
0 140 218
0 140 239
0 140 302
0 140 210
0 140 243
0 140 274
0 140 252
0 140 250
0 140 289
0 140 197
0 140 340
0 140 262
0 140 252
0 140 302
0 140 233
0 140 241
0 140 NaN
0 140 295
0 140 251
0 140 275
0 140 294
0 161 313
0 161 189
0 161 256
0 161 168
0 161 246
0 161 289
0 161 224
0 161 244
0 161 281
0 161 224
0 161 259
0 161 297
0 161 202
0 161 350
0 161 264
0 161 259
0 161 295
0 161 233
0 161 265
0 161 NaN
0 161 300
0 161 249
0 161 280
0 161 290
];

tWw_fe_dat02(:,2) = tWw_fe_dat02(:,2) + 146; % Transform in age (d). Exposure starts at 146 dph. 

% control
tWw_fe_dat02_0 = tWw_fe_dat02(tWw_fe_dat02(:,1) == 0,[2 3]);
[ud,ix,iy] = unique(tWw_fe_dat02_0(:,1)); % identify time point
data.tWw_fe_dat02_0 = [ud, accumarray(iy, tWw_fe_dat02_0(:,2),[],@(x)mean(x,'omitnan'))]; % mean by time point
units.tWw_fe_dat02_0 = {'d', 'g'};  label.tWw_fe_dat02_0 = {'time since birth','Wet weight, 0 ppm'};  bibkey.tWw_fe_dat02_0 = {'dat02'};
auxData.conc.tWw_fe_dat02_0 = 0; units.conc.tWw_fe_dat02_0 = 'ppm a.i.';  label.conc.tWw_fe_dat02_0 = 'Concentration';


% CI growth.
% control
[ud,ix,iy] = unique(tWw_fe_dat02_0(:,1)); % sum by time point
tWw_fe_dat02_0_se = [ud, accumarray(iy, tWw_fe_dat02_0(:,2),[], @(x)(std(x, 'omitnan')/sqrt(length(x))))]; % standard deviation by time point
CI.tWw_fe_dat02_0 = 2.069*tWw_fe_dat02_0_se(:,2); 

% Survival.
% Concentration (ppm)	Replicate  Experimental_day Number of surviving individuals
tS_dat02 = [...
0 1 0   2
0 1 168 2
0 2 0   2
0 2 168 2
0 3 0   2
0 3 168 2
0 4 0   2
0 4 168 2
0 5 0   2
0 5 168 2
0 6 0   2
0 6 168 2
0 7 0   2
0 7 168 2
0 8 0   2
0 8 168 2
0 9 0   2
0 9 168 2
0 10 0  2
0 10 97 1
0 10 168 1
0 11 0   2
0 11 168 2
0 12 0   2
0 12 168 2
];

tS_dat02(:,3) = tS_dat02(:,3) + 146; % Transform in age (d). Exposure starts at 210 dph. 


% Reproduction. 

tN_dat02 = [...
% % Concentration (ppm)	replicate Experimental day	Eggs layed per female

0 1 77 6
0 1 84 9
0 1 91 12
0 1 98 11
0 1 105 7
0 1 112 8
0 1 119 9
0 1 126 8
0 1 133 8
0 1 140 7
0 1 147 7
0 1 154 10
0 1 161 9
0 1 168 1
0 2 77 0
0 2 84 2
0 2 91 5
0 2 98 6
0 2 105 7
0 2 112 10
0 2 119 11
0 2 126 11
0 2 133 11
0 2 140 11
0 2 147 11
0 2 154 11
0 2 161 9
0 2 168 1
0 3 77 0
0 3 84 0
0 3 91 1
0 3 98 4
0 3 105 1
0 3 112 2
0 3 119 4
0 3 126 6
0 3 133 3
0 3 140 5
0 3 147 6
0 3 154 4
0 3 161 4
0 3 168 1
0 4 77 0
0 4 84 0
0 4 91 3
0 4 98 4
0 4 105 4
0 4 112 5
0 4 119 8
0 4 126 9
0 4 133 9
0 4 140 0
0 4 147 5
0 4 154 11
0 4 161 5
0 4 168 1
0 5 77 0
0 5 84 6
0 5 91 9
0 5 98 10
0 5 105 11
0 5 112 10
0 5 119 14
0 5 126 13
0 5 133 13
0 5 140 12
0 5 147 14
0 5 154 12
0 5 161 10
0 5 168 1
0 6 77 0
0 6 84 2
0 6 91 3
0 6 98 7
0 6 105 11
0 6 112 11
0 6 119 12
0 6 126 13
0 6 133 12
0 6 140 13
0 6 147 13
0 6 154 12
0 6 161 11
0 6 168 2
0 7 77 0
0 7 84 0
0 7 91 0
0 7 98 0
0 7 105 0
0 7 112 4
0 7 119 6
0 7 126 7
0 7 133 7
0 7 140 5
0 7 147 7
0 7 154 6
0 7 161 6
0 7 168 0
0 8 77 0
0 8 84 0
0 8 91 6
0 8 98 4
0 8 105 9
0 8 112 4
0 8 119 6
0 8 126 7
0 8 133 6
0 8 140 7
0 8 147 6
0 8 154 6
0 8 161 6
0 8 168 1
0 9 77 0
0 9 84 2
0 9 91 6
0 9 98 7
0 9 105 8
0 9 112 5
0 9 119 9
0 9 126 7
0 9 133 9
0 9 140 11
0 9 147 14
0 9 154 13
0 9 161 12
0 9 168 1
0 10 77 4
0 10 84 4
0 10 91 8
0 10 98 9
0 10 105 4
0 10 112 4
0 10 119 4
0 10 126 2
0 10 133 0
0 10 140 6
0 10 147 3
0 10 154 7
0 10 161 5
0 10 168 1
0 11 77 0
0 11 84 0
0 11 91 0
0 11 98 0
0 11 105 0
0 11 112 2
0 11 119 2
0 11 126 7
0 11 133 10
0 11 140 11
0 11 147 11
0 11 154 12
0 11 161 5
0 11 168 2
0 12 77 0
0 12 84 2
0 12 91 7
0 12 98 10
0 12 105 11
0 12 112 12
0 12 119 14
0 12 126 14
0 12 133 13
0 12 140 13
0 12 147 13
0 12 154 13
0 12 161 14
0 12 168 2
];

tN_dat02(:,3) = tN_dat02(:,3) + 146; % Transform in age (d). Exposure starts at 146 dph. 

% control
tN_dat02_0 = tN_dat02(tN_dat02(:,1) == 0,[2 3 4]);
tN_dat02_0_rep= [repmat(unique(tN_dat02_0(:,2))',1,12)' zeros(14*12,1)];

for n = 1:12
    tS_tmp = tS_dat02(tS_dat02(:,1)==0&tS_dat02(:,2)==n,:);
    tN_dat02_0_rep((n-1)*14+1:14*n,2)= cumsum(tN_dat02_0(tN_dat02_0(:,1)==n,3)./interp1(tS_tmp(:,3),tS_tmp(:,4),tN_dat02_0(tN_dat02_0(:,1)==n,2)))  ;
end
[ud,ix,iy] = unique( tN_dat02_0_rep(:,1)); 
data.tN_dat02_0 = [ud, accumarray(iy, tN_dat02_0_rep(:,2),[],@mean)]; % average by time point
units.tN_dat02_0 = {'d', '#'};  label.tN_dat02_0 = {'time since birth','cumulative reproduction, 0 ppm'};  bibkey.tN_dat02_0 = {'dat02'};
auxData.conc.tN_dat02_0 = 0; units.conc.tN_dat02_0 = 'ppm a.i.';  label.conc.tN_dat02_0 = 'Concentration';


%95% confidence interval calculation for reproduction 
% control
[ud,ix,iy] = unique(tN_dat02_0_rep(:,1)); % unique time points
tN_dat02_0_std = [ud, accumarray(iy, tN_dat02_0_rep(:,2),[],@(x) std(x,'omitnan'))];% standard deviation by time point
tN_dat02_0_se = [tN_dat02_0_std(:,1) tN_dat02_0_std(:,2)./sqrt(12)];
CI.tN_dat02_0 = 2.179*tN_dat02_0_se(:,2);

reproRate.tN_dat02_0 = tN_dat02_0_rep(tN_dat02_0_rep(:,1)==314,2)./98 ; %average egg laying rate per female 


%food ingestion data
ingestion_tWw_fe_dat02 = [... 
% Concentration (ppm a.i.) Experimental_day(d) feed_comsumption(g/bird/day)(mean on two weeks)
0   14 16.0   
0   28 15.7	   
0   42 16.7	   
0   56 16.3	   
0   70 20.4	  
0   84 20.8   
0   98 23.1	 
0   112 24.8	  
0   126 26.4	   
0   140 25.5	  
0   154 26.1	   
0   161 25.7
];

ingestion_tWw_fe_dat02(:,2) = ingestion_tWw_fe_dat02(:,2)+146;

% Control 
ingestion.tWw_fe_dat02_0 =ingestion_tWw_fe_dat02(ingestion_tWw_fe_dat02(:,1) == 0,[2 3]);
units.ingestion.tWw_fe_dat02_0  = {'d', 'g Wet wt/d'};  label.ingestion.tWw_fe_dat02_0 = {'time since birth', 'ingestion'}; 

%% TOX DATA SYNGENTA - control Azoxystrobin (Data 12)

% Observed average body weight(average over all replicates)
% as a function of time for different concentrations (a.i.) and both sex.
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

];

dat12(:,2) = dat12(:,2) + 122; 
dat12(:,1) = dat12(:,1) / 1000; % Transform from ppm to ppm / 1000

% control
tWw_fe_dat12_0 = dat12(dat12(:,1) == 0,[2 3]);
[ud,ix,iy] = unique(tWw_fe_dat12_0(:,1)); % identify time point
data.tWw_fe_dat12_0 = [ud, accumarray(iy, tWw_fe_dat12_0(:,2),[],@(x)mean(x,'omitnan'))]; % mean by time point
units.tWw_fe_dat12_0 = {'d', 'g'};  label.tWw_fe_dat12_0 = {'time since birth','Wet weight, 0 ppm'};  bibkey.tWw_fe_dat12_0 = {'data12'};
auxData.conc.tWw_fe_dat12_0 = 0; units.conc.tWw_fe_dat12_0 = 'ppm a.i. /1000';  label.conc.tWw_fe_dat12_0 = 'Concentration';


% CI growth.
% control
[ud,ix,iy] = unique(tWw_fe_dat12_0(:,1)); % sum by time point
tWw_fe_dat12_0_se = [ud, accumarray(iy, tWw_fe_dat12_0(:,2),[], @(x)(std(x, 'omitnan')/sqrt(length(x))))]; % standard deviation by time point
CI.tWw_fe_dat12_0 = 2.131*tWw_fe_dat12_0_se(:,2);



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


%95% confidence interval calculation for reproduction 
% control
[ud,ix,iy] = unique(tN_dat12_0_cum(:,1)); % unique time points
tN_dat12_0_std = [ud, accumarray(iy, tN_dat12_0_cum(:,2),[],@(x) std(x,'omitnan'))];% standard deviation by time point
tN_dat12_0_se = [tN_dat12_0_std(:,1) tN_dat12_0_std(:,2)./sqrt(16)];
CI.tN_dat12_0 = 2.131*tN_dat12_0_se(:,2);

reproRate.tN_dat12_0 = tN_dat12_0_cum(tN_dat12_0_cum(:,1)==273,2)./77 ; %average egg laying rate per female 

%food ingestion data

ingestion_tWw_fe_dat12 = [... 
% Concentration (ppm a.i.) Experimental_day(d) feed_comsumption(g/bird/day)(mean on two weeks) 
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
];
ingestion_tWw_fe_dat12(:,2) = ingestion_tWw_fe_dat12(:,2)+122;
ingestion_tWw_fe_dat12(:,1) = ingestion_tWw_fe_dat12(:,1)/1000;
% Control 
ingestion.tWw_fe_dat12_0 =ingestion_tWw_fe_dat12(ingestion_tWw_fe_dat12(:,1) == 0,[2 3]);
units.ingestion.tWw_fe_dat12_0  = {'d', 'g Wet wt/d'};  label.ingestion.tWw_fe_dat12_0 = {'time since birth', 'ingestion'}; 
 

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

weights.tWw_fe_dat02_0 = 24 * weights.tWw_fe_dat02_0;
weights.tN_dat02_0 = 12 * weights.tN_dat02_0;
weights.tWw_fe_dat12_0 = 14 * weights.tWw_fe_dat12_0;
weights.tN_dat12_0 = 16 * weights.tN_dat12_0;

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
