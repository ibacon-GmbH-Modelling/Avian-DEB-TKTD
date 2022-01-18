
function [prdData, info, f_R] = predict_Anas_platyrhynchos(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

if E_Hb >= E_Hx || E_Hx >= E_Hp || f_tW > 1|| ...
         k_e < 0 || b < 0 || c_0s < 0 || c_0 < 0 || c_T < 0|| t_s < 221 
    prdData = []; info = 0; return
end

% compute temperature correction factors
TC_ab = tempcorr(temp.ab, T_ref, T_A);
% TC_tx = tempcorr(temp.tx, T_ref, T_A);
TC_tp = tempcorr(temp.tp, T_ref, T_A);
%TC_tR = tempcorr(temp.tR, T_ref, T_A);
% TC_am = tempcorr(temp.am, T_ref, T_A);
% TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
% TC_tW = tempcorr(temp.tW, T_ref, T_A);
% TC_tWwe = tempcorr(temp.tWwe, T_ref, T_A);
% TC_tLe = tempcorr(temp.tLe, T_ref, T_A);
% TC_tN = tempcorr(temp.tN, T_ref, T_A);
TC_tWw_fe_dat11 = tempcorr(C2K(40.2), T_ref, T_A); % consider typical body temperature

% zero-variate data

% life cycle
pars_tR = [g; k; l_T; v_Hb; v_Hx; v_Hp; t_N * k_M * TC_tp];  % compose parameter vector
[t_R, t_p, t_x, t_b, l_R, l_p, l_x, l_b, info] = get_tR(pars_tR, f); % -, scaled times & lengths at f

% initial
pars_UE0 = [V_Hb; g; k_J; k_M; v];
U_E0 = initial_scaled_reserve(f, pars_UE0);
E_0 = p_Am * U_E0;            % J, initial energy content
Ww_0 = w_E * E_0/ mu_E/ d_E;  % g, initial wet weight

% birth
L_b = L_m * l_b;                  % cm, structural length at birth at f

aT_b = t_0 + t_b/ k_M/ TC_ab;     % d, age at birth at f and T
Lb_i = L_b / del_M;                       % cm, length at birth at f

%Puberty
tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at fledging at f and T

               
% pack to output
prdData.ab = aT_b;
% prdData.tx = tT_x;
prdData.tp = tT_p;
%prdData.tR = tT_R;
% prdData.am = aT_m;
% prdData.Li = Lw_i;
prdData.Lb = Lb_i;
% prdData.Wwb = Ww_b;
% prdData.Ww7 = Ww_7;
% prdData.Wwi = Ww_i;
% prdData.Ri = RT_i;
prdData.Ww0 = Ww_0;

% uni-variate data

%% DATA SYNGENTA - Atrazine Control (Data 01)
% uni-variate data
TC = TC_tWw_fe_dat11;  % consider same food level as data11

f = f_dat01; % !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! DIFFERENT WAY OF DEALING WITH FOOD? USE FEEDING DATA?!!!!!!!!!!!!!!!!!!!!!!!!!!!
%f_pre = f_dat01; % Feeding before start of experiment. Assume feeding condition can be different. !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
kap_X=kap_X_dat01;
t_s = t_s_dat01;

% costs for an egg
f_mo = 1; % scaled funtional response of mother, - % assume that mother has full reserves

pars_lb = [g; k; v_Hb];                    % compose parameters
L_b = get_lb(pars_lb, f_mo) * L_m; % cm, length at birth, ultimate

%ESTIMATED!

pT_M = TC * p_M; % maintenance rate constant, J / d.cm^3
vT = TC * v;     % energy conductance, cm / d
kT_J = TC * k_J;  % maturity maintenance rate, d-1
pT_Am = p_Am * TC;  % surface-area specific maximum assimilation rate, J / d.cm^2

% Other initial conditions
L01 =  L_b; %(Wwo.tWw_fe_dat11_0 / (1 + f * w))^(1/3); % cm, initial structure; Initial weight known
E_0  = U_E0  * p_Am; %f_mo * E_m * L01^3; % J, initial energy reserve. Based on feeding until then. Not on mother's feeding
E_H0 = E_Hb; % J, initial maturity; starts at or above puberty
E0_R0 = 0; % J, initial unripe reproduction buffer
E1_R0 = 0; % J, initial ripe reproduction buffer
N_0 = 0; % #, Cumulative number of offspring
cV_0 = 0; % ppm a.s. initial internal concentration; 0 at start of test
S_0 = 1; % %, initial number of organisms

% initial conditions:
LEHRCS_0 = [L01; E_0; E_H0; E0_R0; E1_R0; N_0; cV_0; S_0]; % % pack initial conditions

par_LEHR = [pT_M, vT, kT_J, pT_Am, kap, E_G,f, E_0, E_Hb, E_Hp, kap_G, kap_R, L_b, t_s, kap_X, mu_X, d_X, w_X ]; % pack parameters


% Growth and reproduction
if length(tWw_fe_dat01_0) == 100 % For the plotting system of DEBtool...
    t = unique(sort([[0:tWw_fe_dat01_0(1,1)-1]';tWw_fe_dat01_0(:,1);tN_dat01_0(:,1)])); 
else
    t = 0:400; % All measured time points
end

t0_c = 165; % d, delay before start of exposure. Reproduction not initiated before that point either

% define options for the ODE solver
options = [];%odeset;
options = odeset(options, 'RelTol',1e-3,'AbsTol',1e-6); % specify tolerances
options = odeset(options,'InitialStep',max(t)/1000,'MaxStep',max(t)/100); % specify smaller stepsize
% options = odeset(options, 'Events', @myEvent);
% options = odeset(options,'NonNegative', 1); % specify smaller stepsize

% Control
par_CS = [k_e, c_0, c_T, c_0s, b, h_0, conc.tWw_fe_dat01_0, Fs, t0_c]; % pack tox parameters + delay exposure
[t1, LEHRCS] = call_LEHRCS([t], LEHRCS_0, options, ingestion.tWw_fe_dat01_0, par_LEHR, par_CS);
LEHRCS_Ww = LEHRCS(ismember(t1, tWw_fe_dat01_0(:,1)),:); % Extract growth time points
%EWw_fe_dat01 = LEHRCS_Ww(:,1).^3 + w_E/ mu_E/ d_E * LEHRCS_Ww(:,2); % g, wet weight over time
EWw_fe_dat01_0 = LEHRCS_Ww(:,1).^3 + w_E/ mu_E/ d_E * (LEHRCS_Ww(:,2))+ w_E/ mu_E * (LEHRCS_Ww(:,4)+LEHRCS_Ww(:,5)); % g, wet weight over time

LEHRCS_N = LEHRCS(ismember(t1, tN_dat01_0(:,1)),:);
EN_dat01_0 = LEHRCS_N(:,6); 
Ef_R_dat01_0=LEHRCS_Ww(:,9); 

%% DATA SYNGENTA - AZOXYSTROBIN control

% Chronic flow through study 11
% Weight growth and reproduction
TC = TC_tWw_fe_dat11;  % consider same food level as data11

f = f_dat11; % !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! DIFFERENT WAY OF DEALING WITH FOOD? USE FEEDING DATA?!!!!!!!!!!!!!!!!!!!!!!!!!!!
%f_pre = f_dat01; % Feeding before start of experiment. Assume feeding condition can be different. !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
kap_X=kap_X_dat11;
t_s = t_s_dat11;

% costs for an egg
f_mo = 1; % scaled funtional response of mother, - % assume that mother has full reserves

pars_lb = [g; k; v_Hb];                    % compose parameters
L_b = get_lb(pars_lb, f_mo) * L_m; % cm, length at birth, ultimate
%t_s = 221; % d, time since birth at start of reproduction stimulus -
%ESTIMATED!

pT_M = TC * p_M; % maintenance rate constant, J / d.cm^3
vT = TC * v;     % energy conductance, cm / d
kT_J = TC * k_J;  % maturity maintenance rate, d-1
pT_Am = p_Am * TC;  % surface-area specific maximum assimilation rate, J / d.cm^2

% Other initial conditions
L01 =  L_b; %(Wwo.tWw_fe_dat11_0 / (1 + f * w))^(1/3); % cm, initial structure; Initial weight known
E_0  = U_E0  * p_Am; %f_mo * E_m * L01^3; % J, initial energy reserve. Based on feeding until then. Not on mother's feeding
E_H0 = E_Hb; % J, initial maturity; starts at or above puberty
E0_R0 = 0; % J, initial unripe reproduction buffer
E1_R0 = 0; % J, initial ripe reproduction buffer
N_0 = 0; % #, Cumulative number of offspring
cV_0 = 0; % ppm a.s. initial internal concentration; 0 at start of test
S_0 = 1; % %, initial number of organisms

% initial conditions:
LEHRCS_0 = [L01; E_0; E_H0; E0_R0; E1_R0; N_0; cV_0; S_0]; % % pack initial conditions

par_LEHR = [pT_M, vT, kT_J, pT_Am, kap, E_G,f, E_0, E_Hb, E_Hp, kap_G, kap_R, L_b, t_s, kap_X, mu_X, d_X, w_X ]; % pack parameters


% Growth and reproduction
if length(tWw_fe_dat11_0) == 100 % For the plotting system of DEBtool...
    t = unique(sort([[0:tWw_fe_dat11_0(1,1)-1]';tWw_fe_dat11_0(:,1);tN_dat11_0(:,1)])); 
else
    t = 0:400; % All measured time points
end

t0_c = 210; % d, delay before start of exposure. Reproduction not initiated before that point either

% define options for the ODE solver
options = [];%odeset;
options = odeset(options, 'RelTol',1e-3,'AbsTol',1e-6); % specify tolerances
options = odeset(options,'InitialStep',max(t)/1000,'MaxStep',max(t)/100); % specify smaller stepsize
% options = odeset(options, 'Events', @myEvent);
% options = odeset(options,'NonNegative', 1); % specify smaller stepsize

% Control
par_CS = [k_e, c_0, c_T, c_0s, b, h_0, conc.tWw_fe_dat11_0, Fs, t0_c]; % pack tox parameters + delay exposure
[t1, LEHRCS] = call_LEHRCS([t], LEHRCS_0, options, ingestion.tWw_fe_dat11_0, par_LEHR, par_CS);
LEHRCS_Ww = LEHRCS(ismember(t1, tWw_fe_dat11_0(:,1)),:); % Extract growth time points
%EWw_fe_dat01 = LEHRCS_Ww(:,1).^3 + w_E/ mu_E/ d_E * LEHRCS_Ww(:,2); % g, wet weight over time
EWw_fe_dat11_0=  LEHRCS_Ww(:,1).^3 + w_E/ mu_E/ d_E * (LEHRCS_Ww(:,2))+ w_E/ mu_E * (LEHRCS_Ww(:,4)+LEHRCS_Ww(:,5)); % g, wet weight over time

LEHRCS_N = LEHRCS(ismember(t1, tN_dat11_0(:,1)),:);
EN_dat11_0= LEHRCS_N(:,6);
Ef_R_dat11_0 =LEHRCS_Ww(:,9); 


% pack to output
prdData.tWw_fe_dat01_0 = EWw_fe_dat01_0;
prdData.tN_dat01_0 = EN_dat01_0;
f_R.tf_R_dat01_0 = Ef_R_dat01_0;
prdData.tWw_fe_dat11_0 = EWw_fe_dat11_0;
prdData.tN_dat11_0 = EN_dat11_0;
f_R.tf_R_dat11_0 = Ef_R_dat11_0;

end 

function [value, isterminal, direction] = myEvent(t, y, par_LEHR, par_CS)
    E_Hp = par_LEHR(10); % J, maturity at puberty
    value      = (E_Hp - y(3));
    isterminal = ones(size(y));   % Stop the integration
    direction  = zeros(size(y));
end

function dLU = dcum_reprod(t, LU, f, g, v, kap, kJ, UHp, Lm, LT)
  % called by cum_reprod
if t>=285%t0_c
    1; % Put a breakpoint here to stop after puberty is reached
end
  L = LU(1); % unpack state variables: length & reprod buffer
  
  r = v * (f/ L - (1 + LT/ L)/ Lm)/ (f + g); % 1/d, spec growth rate
  dL = L * r/ 3;                             % cm/d, d/dt L

    SC = f * L^3 .* (g/ L + (1 + LT/ L)/ Lm)/ (f + g);
    dUR = (1 - kap) * SC - kJ * UHp;

  dLU = [dL; dUR];
end


%% ODE_DEB3tox ODE for exposed organisms based on ODE_DEB3

function [dLEHRCS,f_R_Out] = ODE_DEB3tox(t,LEHRCS,tJX, par_LEHR, par_CS) 

global glo


L = LEHRCS(1);     % cm, structural length
E = LEHRCS(2);     % J, reserve E
E_H = LEHRCS(3);   % J, maturity E_H
E0_R = LEHRCS(4);   % J, cum unriped buffer E_R
E1_R = LEHRCS(5);   % J, cum ripe buffer E_R
N = LEHRCS(6); % #/d, cum reproductive output
cV = LEHRCS(7); % ng/l, internal concentration
S = LEHRCS(8); % -, survival probability

p_M = par_LEHR(1); % J/d.cm^3, vol-spec somatic maint
v = par_LEHR(2); % cm/d, energy conductance
k_J = par_LEHR(3); % 1/d, maturity maint rate coefficient
p_Am = par_LEHR(4); % J / d.cm^2, surface-area specific maximum assimilation rate
kap = par_LEHR(5); % -, allocation fraction to soma
E_G = par_LEHR(6); % J/cm^3, spec cost for structure
f = par_LEHR(7); % -, scaled functional response
E0 = par_LEHR(8); % J, initial energy reserve
E_Hb = par_LEHR(9); % J, maturity at birth
E_Hp = par_LEHR(10); % J, maturity at puberty
kap_G = par_LEHR(11); % -, growth efficiency
kap_R = par_LEHR(12); % -, reproduction efficiency
L_b = par_LEHR(13); % cm, length at birth
t_s = par_LEHR(14); % d, time of first reproduction stimulus
%EB = par_LEHR(15); %  J/cm^3,energy density of the reproduction batch; 
%f_2 = par_LEHR(15); %  ; -,  allocation fraction to soma during reproduction
kap_X=par_LEHR(15);
mu_X= par_LEHR(16);
d_X=par_LEHR(17);
w_X=par_LEHR(18);

% if t < 196%196 % Acclimation to experimental conditions starts on day 196 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%     f = par_LEHR(14); % -, scaled functional response before start of experiment
% end

ke  = par_CS(1);  % d-1, elimination rate constant
c0  = par_CS(2);  % xg/l, no-effect concentration sub-lethal
cT  = par_CS(3);  % xg/l, tolerance concentration
c0s = par_CS(4);  % xg/l, no-effect concentration survival
b   = par_CS(5);  % d-1, killing rate
h0 = par_CS(6);  % d-1, background hazard rate

c = par_CS(7);  % xg/l, external concentration

t0_c = par_CS(9); % d, delay before start of exposure

% DEBUG
% if t>=285%t0_c
%     1; % Put a breakpoint here to stop after puberty is reached
% end
% / DEBUG

if t < t0_c
    c = 0; % exposure as not started yet
end

L_M = kap * p_Am/ p_M;  l = L/ L_M; % -, scaled structural length

if length(par_LEHR) == 18
    %% maturity switches
    if E_H < E_Hb % Before birth
        f = 0; % feeding only occurs after birth
        c = 0;  % before hatching, they are not exposed
    end
    s_M = 1;
elseif length(par_LEHR) == 20
    l_b = par_LEHR(17); % -, scaled length at birth
    E_Hj = par_LEHR(18); % J, maturity at metamorphosis
    l_j = par_LEHR(19); % -, scaled length at metamorphosis
    
    %% maturity switches
    if E_H < E_Hb % Before birth
        f = 0; % feeding only occurs after birth
        c = 0;  % before hatching, they are not exposed
        s_M = 1;
    elseif E_H >= E_Hb && E_H < E_Hj % Between birth and metamorphosis
        s_M = l/l_b;
    else % After metamorphosis
        s_M = l_j/l_b;
    end
else
    error('par_LEHR must be of length 15 (without acceleration) or 17 (with acceleration; lb, E_Hj, and lj) added)');
end


%% Stress effect
% calculate the stress factor
s  = (1/cT)*max(0,cV-c0); % stress factor

% Sublethal mode of action
switch glo.moa % stress effect according to selected mechanism
    case 1 % effect on assimilation/feeding
        f = f*max(0,1-s);
    case 2 % effect on somatic maintenance costs
        p_M = p_M *(1+s);
    case 3 % effect on growth costs
        E_G  = E_G * (1+s);
    case 4 % effect on reproduction costs
        kap_R = kap_R / (1+s); % kap_R * (1+s); % Shouldn't this be divided??? If yes, check all other equations !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    case 5 % effect on somatic and maturity maintenance costs
        p_M = p_M *(1+s);
        k_J = k_J *(1+s);
    case 6 % effect on costs for growth and reproduction
        E_G  = E_G * (1+s);
        p_M = p_M *(1+s);
        kap_R = kap_R / (1+s);
end

% Lethal
switch glo.sel
    case 1 % stochastic death
        h  = b * max(0, cV-c0s); % calculate the hazard rate
        dS = -(h + h0) * S; % change in survival probability (incl. background mort.)
    case 2 % individual tolerance
        dS = -h0 * S; % only background hazard rate
        % mortality due to the chemical is included in call_deri!
    case 3 % mixed model
        dS = -h0 * S; % only background hazard rate
        % mortality due to the chemical is included in call_deri!
end
%%
%  Shape correction function applies to surface-area specific
%  assimilation and energy conductance:
%


v_new   = v * s_M;                     % cm/d, conductance
%%
% Growth rate and mobilization rate:
%
L2    = L * L; L3 = L2 * L; L4 = L3 * L;


if t > t0_c
WwX = spline1(t,tJX);  % g Wt /d, ingestion rate at time t
WdX = d_X * WwX; % g dr wt/ d, ingestion rate at time t
JX  = WdX/ w_X; % c- mol X/ d, ingestion rate at time t
pA  = kap_X * mu_X * JX; % % J/d, assimilation rate at time t
f_tot   = pA/ p_Am/ L2; % -, scaled func. resp during reproduction

if t<t_s
    f=f_tot;
else
    f=min(1,f_tot); 
end
f_R=max(f_tot-f,0);
else 
f_tot=f; 
end


pC = E/L3 * (E_G * v_new/ L  + p_M)/ (kap * E/ L3 + E_G );   % [p_C], J/cm^3 (2.12, Kooijman 2010)

if kap * pC < p_M % allocated flux to soma cannot pay maintenance
    r = (E * v_new/ L4  - p_M/ kap)/ (E/ L3 + E_G * kap_G/ kap); % 1/d, specific growth rate
else
    r = (E * v_new/ L4 - p_M/ kap)/ (E/ L3 + E_G/ kap); % 1/d, specific growth rate
end

%%
% generate dH/da, dE/da, dL/da:
%
dE_H  = ((1 - kap) * pC * L3 - k_J * E_H)   * (E_H<E_Hp);  % E_H, J (2.18, Kooijman 2010)

Em = f * p_Am / v_new; % (Annex C p43, Augustine et al 2012)
pCm = Em * (E_G * v_new * L2  + p_M * L3) / (kap* Em + E_G );   % p_Cm, J/d (Annex B, Augustine et al 2012)

%if E1_R >= EB*L3 && floor((EB*L3)/E0)>=1 && floor((EB*L3)/E0)<2 
if t > t_s
if E1_R >= (E0/kap_R)
dN    = floor(kap_R*E1_R/E0);
dE1_R = ((1 - kap) * pCm  - k_J * E_Hp  + (f_R*p_Am*L2)- dN*E0/kap_R) *  (E0_R > 0);
else
dE1_R =  ((1 - kap) * pCm  - k_J * E_Hp + (f_R*p_Am*L2)) * (E0_R > 0) ; % Only if unripped buffer is not 0 and if the condition to produce eggs is met
dN     = 0 ;
end
else
dE1_R = 0; 
dN     = 0 ;
end

if t > t_s
dE0_R =(max(0,((1 - kap) * pC * L3 - k_J * E_Hp)) - ((1 - kap) * pCm  - k_J * E_Hp )) * (E_H>=E_Hp);% J, Cumulative unripped buffer
else
dE0_R =(max(0,((1 - kap) * pC * L3 - k_J * E_Hp))) * (E_H>=E_Hp);% J, Cumulative unripped buffer    
end 

% dE_H  = ((1 - kap) * pC * L3 - k_J * E_H)   * (E_H<E_Hp);  % E_H, J (2.18, Kooijman 2010)
% dE_R =  ((1 - kap) * pC * L3 - k_J * E_Hp) * (E_H>=E_Hp);
% dN     = kap_R * dE_R / E0; % J Cumulative energy in reproduction buffer. Divide by E0 to get cumulative egg laying

dE     = f*p_Am*L2 - pC * L3;
dL     = L * r/ 3;


% Internal concentration
dcV = ke * (L_M / L) * (c - cV) - cV *(3 / L) * dL; % change in scaled internal conc.
%%
% Pack output

% to avoid shrinking to lead to negative body size ...
if L < L_b/2   % dont shrink below half of the size at birth
    dL = 0;    % simply stop shrinking ...
end

if nargout > 1
  f_R_Out =  f_tot;
end

dLEHRCS = [dL; dE; dE_H; dE0_R; dE1_R; dN; dcV; dS];

end



function [time, LEHRCS ] = call_LEHRCS(t, LEHRCS_0, options, tJX, par_LEHR, par_CS)
%% function to get C and S dynamically over time
% taken from Oncorhynchus_mykiss_constant_calculation_mit_IT
global glo
% define options for ODE
% options = []; uncomment if want to be sure to use default options

%[t, LEHRCS] = ode15s(@ODE_DEB3tox, t, LEHRCS_0,  options, par_LEHR, par_CS);
[t, LEHRCS] = ode45(@ODE_DEB3tox, t, LEHRCS_0,  options, tJX, par_LEHR, par_CS);

f_Rout=zeros(size(t,1),1);
for i = 1:size(t,1)
[~, f_R] = ODE_DEB3tox(t(i),LEHRCS(i,:),tJX, par_LEHR, par_CS);
f_Rout(i) = f_R;
end

time = t;
% unpack
L = LEHRCS(:,1);
E = LEHRCS(:,2);
H = LEHRCS(:,3);
E0_R = LEHRCS(:,4);
E1_R = LEHRCS(:,5);
R = LEHRCS(:,6);
C = LEHRCS(:,7);
S = LEHRCS(:,8);


Fs = par_CS(8);
z = par_CS(4); % c0_s

% calculation of the survival
if glo.sel ~= 1 % for IT and the mixed model ...
    Fs    = max(1+1e-6,Fs); % fraction spread of the NEC distribution
    sd_z  = log10(Fs)/1.96;  % sd on 10log scale, calculated from Fs
    beta  = log(39)/log(Fs); % shape parameter for logistic from Fs
end

% This fast way for GUTS proper uses the ODEs to calculate the dose metric
% only (which is the same for all individuals). Survival for different NECs
% is calculated here. Note that for the mixed model, a long time vector
% will be generated in start_calc, which is needed to get an accurate
% integration here.

if glo.sel == 3 % for mixed model, rapid way ...
    n = 200; % number of slices from the NEC distribution
    if glo.dis == 1 % log-logistic distribution
        Fs2 = 999^(1/beta); % fraction spread for 99.9% of the distribution
        z_range = linspace(z/(1.5*Fs2),z*Fs2,n); % range of NECs to cover 99.9%
        prob_range = ((beta/z)*(z_range/z).^(beta-1)) ./ ((1+(z_range/z).^beta).^2); % pdf for the log-logistic (Wikipedia)
    elseif glo.dis == 2 % lognormal distribution
        logz_range = linspace(log10(z)-3*sd_z,log10(z)+3*sd_z,n); % regular range of log NECs
        z_range = 10.^logz_range; % back to normal scale
        prob_range = normpdf(logz_range,log10(z),sd_z); % with their prob densities
    end
    prob_range = prob_range / sum(prob_range); % normalise the densities to exactly one
    S = zeros(length(t),1); % initialise the survival probability over time with zeros
    DM = C; % take the correct state variable as dose metric
    for i = 1:n % run through the different NECs
        haz = kk * max(0,DM-z_range(i)); % calculate hazard for each NEC
        cumhaz = cumtrapz(t,haz); % integrate the hazard rate numerically
        surv = min(1,exp(-1*cumhaz)); % calculate survival probability
        S = S + surv * prob_range(i); % add to Stemp, weighted for this NECs prob density
    end
    S = S .* LEHRCS(:, 6); % make sure to add background hazard
end

% Note that for IT, a long time vector will be generated in start_calc,
% which is needed to catch the maximum dose metric over time during pulsed
% exposure.
if glo.sel == 2 % for individual tolerance ...
    DM = C;  % take the correct state variable as dose metric
    z = max(z,1e-20);        % make sure that the NEC is not zero ...
    maxDM = zeros(size(DM)); % intitialise a new vector for maximum DM over time
    for j = 1:length(t),     % make sure that DM does not decrease in time (dead animals dont become alive)
        maxDM(j,:) = max(DM(1:j,:)); % so look for max of DM over time
    end
    if glo.dis == 1 % use log-logistic distribution
        S = (1 ./ (1+(maxDM/z).^beta)) .* S; % survival probability
        
        % the survival due to the chemical is multiplied with the background
        % survival (calculated in derivatives), assuming logistic distrib.
    elseif glo.dis == 2 % use log-normal distribution
        S = (1-normcdf(log10(maxDM),log10(z),log10(Fs)/1.96))  .* S; % survival probability
        % the survival due to the chemical is multiplied with the background
        % survival (calculated in derivatives), assuming log-normal distrib.
        % this requires the statistics toolbox.
    end
    
end


LEHRCS = [L, E, H, E0_R, E1_R, R, C, S, f_Rout]; % collect all derivatives in one vector

end

