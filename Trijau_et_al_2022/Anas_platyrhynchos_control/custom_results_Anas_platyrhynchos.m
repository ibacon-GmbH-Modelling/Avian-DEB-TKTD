%% custom_results_Anas_platyrhynchos
% presents results of univariate data graphically in a customized way

%%
function custom_results_Anas_platyrhynchos(par, metaPar, data, txtData, auxData)
%par, metaPar, txtPar, data, auxData, metaData, txtData, weights
  % created by Starrlight Augustine, Dina Lika, Bas Kooijman, Goncalo Marques and Laure Pecquerie 2015/04/12
  % modified 2015/08/25
  % modified 2018/09/06 by Nina Marn
  
  %% Syntax
  % <../custom_results_template.m *custom_results_my_pet*>(par, metaPar, txtData, data, auxData)
  
  %% Description
  % present customized results of univariate data
  %
  % Inputs:
  %
  % * par: structure with parameters (see below)
  % * metaPar: structure with field T_ref for reference temperature
  % * txt_data: text vector for the presentation of results
  % * data: structure with data
  % * auxData: structure with temperature data and potential food data
  
  %% Remarks
  % * A template named 'custom_results_template' is available in 'pet' folder of DEBtool_M:  
  % Replace '_template' in the function name with 'my_pet' to use with my_pet templates 
  % * Modify to select and plot uni-variate data for your entry: copy to  folder of your species, 
  %     replacing 'template' (or 'my_pet') with the Latin name of your species,
  %     and template data with the entry-specific data you wish to plot
  % * Once named appropriately, this function will be called automatically by 
  %     <results_pets.html *results_pets*> function of DEBtool_M when running the <run_my_pet.html *run*> file
  
  % get predictions
  data2plot = data;              % copy data to Prd_data
  t1 = linspace(0, 333, 100)';   % set independent variable
  t2 = linspace(214, 333, 100)';

  
  data2plot.tWw_fe_dat01_0 = t1; % overwrite independent variable in tWw
  data2plot.tN_dat01_0 = t2; % overwrite independent variable in tN

  
  [prdData, info, f_R] = predict_Anas_platyrhynchos(par, data2plot, auxData);
  
  [stat, txt_stat]  = feval('statistics_st', metaPar.model, par, C2K(20), par.f);
 
  if strcmp(metaPar.model, 'abj')
    fprintf(['\n acceleration factor s_M is ', num2str(stat.s_M), ' \n'])
  end

  % unpack data & predictions
  tWw_fe_dat01_0  = data.tWw_fe_dat01_0;    
       
  
  tN_dat01_0  = data.tN_dat01_0;   

  
  EWw_fe_dat01_0     = prdData.tWw_fe_dat01_0; % predictions (dependent variable) first set

  
  EN_dat01_0  = prdData.tN_dat01_0; % predictions (dependent variable) first set
  
  
  Ef_R_dat01_0 =  f_R.tf_R_dat01_0; 
 
 
  CI_tN_dat01_0 = auxData.CI.tN_dat01_0;
 

  CI_tWw_fe_dat01_0 = auxData.CI.tWw_fe_dat01_0;
 


  %Calculate NRMSE 
  
  % get predictions
  data2plot = data;              % copy data to Prd_data
  
  data2plot.tWw_fe_dat01_0 = data.tWw_fe_dat01_0(:,1); 
  
  data2plot.tN_dat01_0 = data.tN_dat01_0(:,1);
  
  
  [prdData, info] = predict_Anas_platyrhynchos(par, data2plot, auxData);
  
  EWw_fe_dat01_0_NRMSE = prdData.tWw_fe_dat01_0; % predictions (dependent variable) first set
  EN_dat01_0_NRMSE = prdData.tN_dat01_0; % predictions (dependent variable) first set
 
  NRMSE_tWw_fe_dat01_0 = sqrt(sum((data.tWw_fe_dat01_0(:,2)- EWw_fe_dat01_0_NRMSE).^2)/size(data.tWw_fe_dat01_0(:,2),1))/mean(data.tWw_fe_dat01_0(:,2))*100 ;
  NRMSE_tN_dat01_0 = sqrt(sum((data.tN_dat01_0(:,2)- EN_dat01_0_NRMSE).^2)/size(data.tN_dat01_0(:,2),1))/mean(data.tN_dat01_0(:,2))*100 ;
 
  close all % remove existing figures, else you get more and more if you retry
  
%dat01_0
  figure % figure to show results of uni-variate data
  set(gca,'Fontsize',12, 'Box', 'on')
  set(gcf,'PaperPositionMode','manual');
  set(gcf,'PaperUnits','points'); 
  set(gcf,'PaperPosition',[0 0 350 200]);%left bottom width height
        
  plot(t1, EWw_fe_dat01_0, 'g', tWw_fe_dat01_0(:,1), tWw_fe_dat01_0(:,2), '.r', 'markersize', 20, 'linewidth', 2)
  xlabel([txtData.label.tWw_fe_dat01_0{1}, ', ', txtData.units.tWw_fe_dat01_0{1}])
  ylabel([txtData.label.tWw_fe_dat01_0{2}, ', ', txtData.units.tWw_fe_dat01_0{2}])
  xlim([0 340])
  ylim([0 1500])
  title([char(txtData.bibkey.tWw_fe_dat01_0) ', NRMSE: '  num2str(round(NRMSE_tWw_fe_dat01_0,1)) '%' ])
  
  print -dpng results_Anas_platyrhynchos_01_custom.png
  saveas(gcf,'results_Anas_platyrhynchos_01_custom.png')
  
 figure % figure to show results of uni-variate data
  set(gca,'Fontsize',12, 'Box', 'on')
  set(gcf,'PaperPositionMode','manual');
  set(gcf,'PaperUnits','points'); 
  set(gcf,'PaperPosition',[0 0 350 200]);%left bottom width height
        
  plot(t2, EN_dat01_0, 'g', tN_dat01_0(:,1), tN_dat01_0(:,2), '.r', 'markersize', 20, 'linewidth', 2)
  xlabel([txtData.label.tN_dat01_0{1}, ', ', txtData.units.tN_dat01_0{1}])
  ylabel([txtData.label.tN_dat01_0{2}, ', ', txtData.units.tN_dat01_0{2}])
  xlim([220 340])
  ylim([0 70])
  title([char(txtData.bibkey.tN_dat01_0) ', NRMSE: ' num2str(round(NRMSE_tN_dat01_0,1)) '%' ])

  print -dpng results_Anas_platyrhynchos_02_custom.png
  saveas(gcf,'results_Anas_platyrhynchos_02_custom.png') 
  
   figure % figure to show results of uni-variate data
  set(gca,'Fontsize',12, 'Box', 'on')
  set(gcf,'PaperPositionMode','manual');
  set(gcf,'PaperUnits','points'); 
  set(gcf,'PaperPosition',[0 0 350 200]);%left bottom width height
        
  plot(t1, Ef_R_dat01_0, 'g', 'markersize', 20, 'linewidth', 2)
  xlabel([txtData.label.tN_dat01_0{1}, ', ', txtData.units.tN_dat01_0{1}])
  ylabel('scaled functional response f (-)')
  xlim([0 340])
  ylim([0.5 2])
  title(char(txtData.bibkey.tN_dat01_0) )

  print -dpng results_Anas_platyrhynchos_03_custom.png
  saveas(gcf,'results_Anas_platyrhynchos_03_custom.png') 
  
  
  
  %AZT data 
  % get predictions
  data2plot = data;              % copy data to Prd_data
  t3 = linspace(0, 371, 100)';   % set independent variable
  t4 = linspace(287, 371, 100)';
  
 
  data2plot.tWw_fe_dat11_0= t3; 
  data2plot.tN_dat11_0 = t4; 

  
  [prdData, info, f_R] = predict_Anas_platyrhynchos(par, data2plot, auxData);
  
  [stat, txt_stat]  = feval('statistics_st', metaPar.model, par, C2K(20), par.f);
 
  if strcmp(metaPar.model, 'abj')
    fprintf(['\n acceleration factor s_M is ', num2str(stat.s_M), ' \n'])
  end

  % unpack data & predictions
  
  tWw_fe_dat11_0 = data.tWw_fe_dat11_0;     % data points second set

  tN_dat11_0 = data.tN_dat11_0;     % data points second set

  EWw_fe_dat11_0   = prdData.tWw_fe_dat11_0; % predictions (dependent variable) second set
 EN_dat11_0   = prdData.tN_dat11_0; % predictions (dependent variable) second set
 Ef_R_dat11_0 =  f_R.tf_R_dat11_0; 
 CI_tN_dat11_0 = auxData.CI.tN_dat11_0;
 CI_tWw_fe_dat11_0 = auxData.CI.tWw_fe_dat11_0;
 
  %Calculate NRMSE 
  

  % get predictions
  data2plot = data;              % copy data to Prd_data
  
  
  data2plot.tWw_fe_dat11_0= data.tWw_fe_dat11_0(:,1); 
 
  data2plot.tN_dat11_0 = data.tN_dat11_0(:,1);

  [prdData, info] = predict_Anas_platyrhynchos(par, data2plot, auxData);
  

  EWw_fe_dat11_0_NRMSE = prdData.tWw_fe_dat11_0; % predictions (dependent variable) second set
  EN_dat11_0_NRMSE = prdData.tN_dat11_0; % predictions (dependent variable) second set
  
 
  NRMSE_tWw_fe_dat11_0 = sqrt(sum((data.tWw_fe_dat11_0(:,2)- EWw_fe_dat11_0_NRMSE).^2)/size(data.tWw_fe_dat11_0(:,2),1))/mean(data.tWw_fe_dat11_0(:,2))*100;
  
  NRMSE_tN_dat11_0 = sqrt(sum((data.tN_dat11_0(:,2)- EN_dat11_0_NRMSE).^2)/size(data.tN_dat11_0(:,2),1))/mean(data.tN_dat11_0(:,2))*100;
  
 
  
  
  %dat11_0
  figure % figure to show results of uni-variate data
  set(gca,'Fontsize',12, 'Box', 'on')
  set(gcf,'PaperPositionMode','manual');
  set(gcf,'PaperUnits','points'); 
  set(gcf,'PaperPosition',[0 0 350 200]);%left bottom width height
        
  plot(t3, EWw_fe_dat11_0, 'g', tWw_fe_dat11_0(:,1), tWw_fe_dat11_0(:,2), '.r', 'markersize', 20, 'linewidth', 2)
  xlabel([txtData.label.tWw_fe_dat11_0{1}, ', ', txtData.units.tWw_fe_dat11_0{1}])
  ylabel([txtData.label.tWw_fe_dat11_0{2}, ', ', txtData.units.tWw_fe_dat11_0{2}])
  title([char(txtData.bibkey.tWw_fe_dat11_0) ', NRMSE: ' num2str(round(NRMSE_tWw_fe_dat11_0,1)) '%' ])
  xlim([0 400])
  ylim([0 1500])

  print -dpng results_Anas_platyrhynchos_04_custom.png
  saveas(gcf,'results_Anas_platyrhynchos_04_custom.png')
  
 figure % figure to show results of uni-variate data
  set(gca,'Fontsize',12, 'Box', 'on')
  set(gcf,'PaperPositionMode','manual');
  set(gcf,'PaperUnits','points'); 
  set(gcf,'PaperPosition',[0 0 350 200]);%left bottom width height
        
  plot(t4, EN_dat11_0, 'g', tN_dat11_0(:,1), tN_dat11_0(:,2), '.r', 'markersize', 20, 'linewidth', 2)
  xlabel([txtData.label.tN_dat11_0{1}, ', ', txtData.units.tN_dat11_0{1}])
  ylabel([txtData.label.tN_dat11_0{2}, ', ', txtData.units.tN_dat11_0{2}])
  xlim([0 380])
  ylim([0 60])
  
  title([char(txtData.bibkey.tN_dat11_0) ', NRMSE: ' num2str(round(NRMSE_tN_dat11_0,1)) '%' ])
  
  print -dpng results_Anas_platyrhynchos_05_custom.png
  saveas(gcf,'results_Anas_platyrhynchos_05_custom.png') 
  

   % scaled functional response
   
  Pal(1,:) = [0 0 0];
  Pal(2,:) = [0 .8 0];
  Pal(3,:) = [0.3 0.3 1];
  Pal(4,:) = [1 0 0];
  
   figure % figure to show results of uni-variate data
  set(gca,'Fontsize',12, 'Box', 'on')
  set(gcf,'PaperPositionMode','manual');
  set(gcf,'PaperUnits','points'); 
  set(gcf,'PaperPosition',[0 0 350 200]);%left bottom width height
        
  pt(1)= plot(t3, Ef_R_dat11_0, 'g','color',Pal(1,:), 'markersize', 20, 'linewidth', 2);
  hold on

  grid on
  box on
  xlabel([txtData.label.tN_dat11_0{1}, ', ', txtData.units.tN_dat11_0{1}])
  ylabel('scaled functional response f (-)')
  xlim([0 380])
  ylim([0.5 2])
  title(char(txtData.bibkey.tN_dat11_0) )
  legend(pt,{'0','500','1200','3000'},'Location','southeast')

  print -dpng results_Anas_platyrhynchos_06_custom.png
  saveas(gcf,'results_Anas_platyrhynchos_06_custom.png')
  
    %Save data and predictions
%dat01_0
  data_growth_dat01 = horzcat(tWw_fe_dat01_0(:,1),tWw_fe_dat01_0(:,2));
  save('data_growth_dat01_mallard.txt','data_growth_dat01','-ascii', '-double', '-tabs');
  data_growth_CI_dat01 = CI_tWw_fe_dat01_0;
  save('data_growth_CI_dat01_mallard.txt','data_growth_CI_dat01','-ascii', '-double', '-tabs');
  predictions_growth_dat01 = horzcat(t1, EWw_fe_dat01_0);
 save('predictions_growth_dat01_mallard.txt','predictions_growth_dat01','-ascii', '-double', '-tabs');
  NRMSE_growth_dat01 = [NRMSE_tWw_fe_dat01_0];
 save('NRMSE_growth_dat01.txt','NRMSE_growth_dat01','-ascii', '-double', '-tabs');
 
  data_repro_dat01 = horzcat(tN_dat01_0(:,1),tN_dat01_0(:,2));
  save('data_repro_dat01_mallard.txt','data_repro_dat01','-ascii', '-double', '-tabs');
  data_repro_CI_dat01 =CI_tN_dat01_0;
  save('data_repro_CI_dat01_mallard.txt','data_repro_CI_dat01','-ascii', '-double', '-tabs');
  predictions_repro_dat01 = horzcat(t2, EN_dat01_0);
  save('predictions_repro_dat01_mallard.txt','predictions_repro_dat01','-ascii', '-double', '-tabs');
  NRMSE_repro_dat01 = [NRMSE_tN_dat01_0];
  save('NRMSE_repro_dat01.txt','NRMSE_repro_dat01','-ascii', '-double', '-tabs');

 predictions_feeding_dat01 = horzcat(t1, Ef_R_dat01_0);
 save('predictions_feeding_dat01_mallard.txt','predictions_feeding_dat01','-ascii', '-double', '-tabs');

%dat11_0 
  data_growth_dat11 = horzcat(tWw_fe_dat11_0(:,1),tWw_fe_dat11_0(:,2)) ;
  save('data_growth_dat11_mallard.txt','data_growth_dat11','-ascii', '-double', '-tabs');
  data_growth_CI_dat11 = CI_tWw_fe_dat11_0;
  save('data_growth_CI_dat11_mallard.txt','data_growth_CI_dat11','-ascii', '-double', '-tabs');
  predictions_growth_dat11 = horzcat(t3, EWw_fe_dat11_0);
  save('predictions_growth_dat11_mallard.txt','predictions_growth_dat11','-ascii', '-double', '-tabs');
  NRMSE_growth_dat11 = [NRMSE_tWw_fe_dat11_0];
 save('NRMSE_growth_dat11.txt','NRMSE_growth_dat11','-ascii', '-double', '-tabs');
 
  data_repro_dat11 = horzcat(tN_dat11_0(:,1),tN_dat11_0(:,2)) ;
  save('data_repro_dat11_mallard.txt','data_repro_dat11','-ascii', '-double', '-tabs');
  data_repro_CI_dat11 =CI_tN_dat11_0;
  save('data_repro_CI_dat11_mallard.txt','data_repro_CI_dat11','-ascii', '-double', '-tabs');
  predictions_repro_dat11 = horzcat(t4, EN_dat11_0);
  save('predictions_repro_dat11_mallard.txt','predictions_repro_dat11','-ascii', '-double', '-tabs');
  NRMSE_repro_dat11 = [NRMSE_tN_dat11_0];
  save('NRMSE_repro_dat11.txt','NRMSE_repro_dat11','-ascii', '-double', '-tabs');
  
  predictions_feeding_dat11 = horzcat(t3, Ef_R_dat11_0);
  save('predictions_feeding_dat11_mallard.txt','predictions_feeding_dat11','-ascii', '-double', '-tabs');
  

 
