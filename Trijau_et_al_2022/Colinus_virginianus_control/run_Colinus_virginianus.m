%% Description
  % Sets options for estimation one by one
  %
  % Input
  %
  % * no input: print values to screen
  % * one input:
  %
  %    'default': sets options at default values
  %     any other key (see below): print value to screen
  %
  % * two inputs
  %
  %    'loss_function': 
  %      're': relative error (symmetric by addition);
  %      'sb': multiplicative symmetric bounded (default);
  %      'su': multiplicative symmetric unbounded;
  %
  %    'filter': 
  %      1: use filter (default); 
  %      0: do not;
  %
  %    'pars_init_method':
  %      0:  get initial estimates from automatized computation 
  %      1:  read initial estimates from .mat file (for continuation)
  %      2:  read initial estimates from pars_init file (default)
  %
  %    'results_output':
  %      0:      only saves data results to .mat, no figures, no writing to html or screen
  %      1, -1:  no saving of .mat file, prints results to html or screen 
  %      2, -2:  saves data to .mat file, prints results to html or screen 
  %      3, -3:  saves data to .mat file and graphs to .png files, writes results to html or screen
  %      4, -4:  saves data to .mat file and graphs to .png files, writes results to html or screen, writes report to .html file
  %      5, -5:  saves data to .mat file and graphs to .png files, writes results to html or screen, writes report to .html file including related species
  %
  %    'method': 
  %      'nm': use Nelder-Mead method; 
  %      'no': do not estimate; 
  %
  % Output
  %
  % * no output, but globals are set to values or values are printed to screen
  %

close all; 
global pets 

pets = {'Colinus_virginianus'}; 
check_my_pet(pets); 

estim_options('default');
estim_options('max_step_number',5e2);
estim_options('max_fun_evals',5e4);

% %% Getting initial parameter value (automatised)
% estim_options ('method', 'no');
% estim_options('pars_init_method', 0);
% estim;
% mat2pars_init;

%% Estimation procedure
estim_options('pars_init_method', 2);
estim_options('results_output', 2);
estim_options('method', 'nm');
%estim_options ('method', 'no');

estim_pars;
estim_options('pars_init_method', 1);
close all;
estim_pars; close all;
estim_pars; close all;
estim_pars; close all;
estim_pars; close all;
estim_pars; close all;
estim_pars; close all;
estim_options('max_step_number',5e4);
estim_options('results_output', 5);
estim_pars; close all;

%% Displaying results
estim_options('method', 'no');
estim_options('results_output', -2);
estim_pars;

