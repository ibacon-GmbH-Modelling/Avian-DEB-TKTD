function [par, metaPar, txtPar] = pars_init_Colinus_virginianus(metaData)
global glo
metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.z = 2.157;        free.z     = 1;   units.z = '-';            label.z = 'zoom factor for females'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.02093;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.657;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 870.6;     free.p_M   =1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7318.2414;  free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 	5985;     free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp =9.91e+05; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 2.032e-11;  free.h_a   = 0;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.05;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 
%% other parameters 
par.E_Hx =  	828700; free.E_Hx  = 0;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.del_M = 0.072382;  free.del_M = 0;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.del_Me = 0.1938;  free.del_Me = 0;   units.del_Me = '-';       label.del_Me = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_tW = 1;         free.f_tW  = 0;   units.f_tW = '-';         label.f_tW = 'scaled functional response for tW data'; 
par.t_0 = 1.8372;     free.t_0   = 0;   units.t_0 = 'd';          label.t_0 = 'time at start development at T'; 
par.t_N = 182.5;      free.t_N   = 0;   units.t_N = 'd';          label.t_N = 'time between clutches at T'; 
par.t_e = 0.5453;     free.t_e   = 0;   units.t_e = 'd';          label.t_e = 'time between egg laying at T'; 
par.t_s = 202;        free.t_s  = 0;   units.t_s = 'd';          label.t_s = 'time since birth at reproduction stimulus'; 

%% TOX parameters 
% Mode of action sublethal
glo.moa = 4;
% 1 = effect on assimilation/feeding
% 2 = effect on somatic maintenance costs
% 3 = effect on growth costs
% 4 = effect on reproduction costs
% 5 = effect on somatic and maturity maintenance costs
% 6 = effect on costs for growth and reproduction


% Select death mechanism
glo.sel = 1; % 1: SD; 2: IT, 3: mixed
glo.dis = 1; % 1: log-logistic; 2: log-normal (statistic toolbox required)

%% Parameter tox (Syngenta)
par.f_dat02 = 1;        free.f_dat02  = 0;   units.f_dat02 = '-';         label.f_dat02 = 'scaled functional response for study 02'; 
par.f_dat12 = 1;        free.f_dat12  = 0;   units.f_dat12 = '-';         label.f_dat12 = 'scaled functional response for study 02'; 
par.kap_X_dat02 = 0.6579; free.kap_X_dat02 = 1;   units.kap_X_dat02 = '-';      label.kap_X_dat02 = 'digestion efficiency of food to reserve for data 01';
par.kap_X_dat12 = 0.7912; free.kap_X_dat12 = 1;   units.kap_X_dat12 = '-';      label.kap_X_dat12 = 'digestion efficiency of food to reserve for data 11';
par.t_s_dat02 = 202; free.t_s_dat02 = 0;   units.t_s_dat02 = '-';      label.t_s_dat02 = 'time since birth at reproduction stimulus for data 01';
par.t_s_dat12 = 171; free.t_s_dat12 = 0;   units.t_s_dat12 = '-';      label.t_s_dat12 = 'time since birth at reproduction stimulus for data 11';

% General
par.k_e  = 1;       free.k_e = 0;  units.k_e = 'd-1';   label.k_e ='elimination rate constant'; % 0.2692
par.c_0s = 0.633;     free.c_0s = 0;  units.c_0s  = 'ppm a.i. / 1000';label.c_0s = 'no-effect concentration survival';
par.h_0  = 0.00357;   free.h_0 = 0;  units.h_0 = 'd-1';   label.h_0 = 'background hazard rate';

% SD death mechanism
par.b    =  0.9824;       free.b = 0;    units.b = 'd-1';     label.b = 'killing rate';

% IT death mechanism
par.Fs = 3;         free.Fs = 0;   units.Fs = '-';      label.Fs = 'fraction spread of NEC distribution';

% Sublethal
par.c_0  = 0.4086;      free.c_0 = 0;  units.c_0 = 'ppm a.i. / 1000';  label.c_0 = 'no-effect concentration sub-lethal';
par.c_T  = 4.1 ;     free.c_T = 0;  units.c_T =  'ppm a.i. / 1000'; label.c_T = 'tolerance concentration'; 
%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class);

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
