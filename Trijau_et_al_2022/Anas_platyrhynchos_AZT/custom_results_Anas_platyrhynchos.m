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
  t1 = linspace(0, 371, 100)';   % set independent variable
  %t2 = linspace(287, 357, 100)';
  
 
  data2plot.tWw_fe_dat11_0= t1; 
  data2plot.tWw_fe_dat11_1= t1; 
  data2plot.tWw_fe_dat11_2= t1; 
  data2plot.tWw_fe_dat11_3= t1; 
 
  data2plot.tN_dat11_0 = t1; 
  data2plot.tN_dat11_1 = t1; 
  data2plot.tN_dat11_2 = t1; 
  data2plot.tN_dat11_3 = t1; 
  
  [prdData, info, f_R, cV] = predict_Anas_platyrhynchos(par, data2plot, auxData);
  
  [stat, txt_stat]  = feval('statistics_st', metaPar.model, par, C2K(20), par.f);
 
  if strcmp(metaPar.model, 'abj')
    fprintf(['\n acceleration factor s_M is ', num2str(stat.s_M), ' \n'])
  end

  % unpack data & predictions
  
  tWw_fe_dat11_0 = data.tWw_fe_dat11_0;     % data points second set
  tWw_fe_dat11_1 = data.tWw_fe_dat11_1;     
  tWw_fe_dat11_2 = data.tWw_fe_dat11_2;     
  tWw_fe_dat11_3 = data.tWw_fe_dat11_3;
  
  tN_dat11_0 = data.tN_dat11_0;     % data points second set
  tN_dat11_1 = data.tN_dat11_1;     
  tN_dat11_2 = data.tN_dat11_2;     
  tN_dat11_3 = data.tN_dat11_3; 
 
  EWw_fe_dat11_0   = prdData.tWw_fe_dat11_0; % predictions (dependent variable) second set
  EWw_fe_dat11_1   = prdData.tWw_fe_dat11_1; 
  EWw_fe_dat11_2   = prdData.tWw_fe_dat11_2; 
  EWw_fe_dat11_3   = prdData.tWw_fe_dat11_3;
 
  EN_dat11_0   = prdData.tN_dat11_0; % predictions (dependent variable) second set
  EN_dat11_1   = prdData.tN_dat11_1; 
  EN_dat11_2   = prdData.tN_dat11_2; 
  EN_dat11_3   = prdData.tN_dat11_3;
  
  
  Ef_R_dat11_0 =  f_R.tf_R_dat11_0; 
  Ef_R_dat11_1 =  f_R.tf_R_dat11_1; 
  Ef_R_dat11_2 =  f_R.tf_R_dat11_2; 
  Ef_R_dat11_3 =  f_R.tf_R_dat11_3; 
  
  EcV_dat11_0 =  cV.tcV_dat11_0; 
  EcV_dat11_1 =  cV.tcV_dat11_1; 
  EcV_dat11_2 =  cV.tcV_dat11_2; 
  EcV_dat11_3 =  cV.tcV_dat11_3; 
  
  CI_tN_dat11_0 = auxData.CI.tN_dat11_0;
  CI_tN_dat11_1 = auxData.CI.tN_dat11_1;
  CI_tN_dat11_2 = auxData.CI.tN_dat11_2;
  CI_tN_dat11_3 = auxData.CI.tN_dat11_3;
  
  CI_tWw_fe_dat11_0 = auxData.CI.tWw_fe_dat11_0;
  CI_tWw_fe_dat11_1 = auxData.CI.tWw_fe_dat11_1;
  CI_tWw_fe_dat11_2 = auxData.CI.tWw_fe_dat11_2;
  CI_tWw_fe_dat11_3 = auxData.CI.tWw_fe_dat11_3;
  
  reproRate_tN_dat11_0=auxData.reproRate.tN_dat11_0;
  reproRate_tN_dat11_1=auxData.reproRate.tN_dat11_1; 
  reproRate_tN_dat11_2=auxData.reproRate.tN_dat11_2; 
  reproRate_tN_dat11_3=auxData.reproRate.tN_dat11_3; 
  
  %Calculate NRMSE 
  
  % get predictions
  data2plot = data;              % copy data to Prd_data
  
  
  data2plot.tWw_fe_dat11_0= data.tWw_fe_dat11_0(:,1); 
  data2plot.tWw_fe_dat11_1= data.tWw_fe_dat11_1(:,1);  
  data2plot.tWw_fe_dat11_2= data.tWw_fe_dat11_2(:,1);  
  data2plot.tWw_fe_dat11_3= data.tWw_fe_dat11_3(:,1);  
 
  data2plot.tN_dat11_0 = data.tN_dat11_0(:,1);
  data2plot.tN_dat11_1 = data.tN_dat11_1(:,1);
  data2plot.tN_dat11_2 = data.tN_dat11_2(:,1); 
  data2plot.tN_dat11_3 = data.tN_dat11_3(:,1);
  
  [prdData, info] = predict_Anas_platyrhynchos(par, data2plot, auxData);
  

  EWw_fe_dat11_0_NRMSE = prdData.tWw_fe_dat11_0; % predictions (dependent variable) second set
  EWw_fe_dat11_1_NRMSE = prdData.tWw_fe_dat11_1; 
  EWw_fe_dat11_2_NRMSE = prdData.tWw_fe_dat11_2; 
  EWw_fe_dat11_3_NRMSE = prdData.tWw_fe_dat11_3;
  EN_dat11_0_NRMSE = prdData.tN_dat11_0; % predictions (dependent variable) second set
  EN_dat11_1_NRMSE = prdData.tN_dat11_1; 
  EN_dat11_2_NRMSE = prdData.tN_dat11_2; 
  EN_dat11_3_NRMSE = prdData.tN_dat11_3;
  
 
  NRMSE_tWw_fe_dat11_0 = sqrt(sum((data.tWw_fe_dat11_0(:,2)- EWw_fe_dat11_0_NRMSE).^2)/size(data.tWw_fe_dat11_0(:,2),1))/mean(data.tWw_fe_dat11_0(:,2))*100;
  NRMSE_tWw_fe_dat11_1 = sqrt(sum((data.tWw_fe_dat11_1(:,2)- EWw_fe_dat11_1_NRMSE).^2)/size(data.tWw_fe_dat11_1(:,2),1))/mean(data.tWw_fe_dat11_1(:,2))*100;
  NRMSE_tWw_fe_dat11_2 = sqrt(sum((data.tWw_fe_dat11_2(:,2)- EWw_fe_dat11_2_NRMSE).^2)/size(data.tWw_fe_dat11_2(:,2),1))/mean(data.tWw_fe_dat11_2(:,2))*100;
  NRMSE_tWw_fe_dat11_3 = sqrt(sum((data.tWw_fe_dat11_3(:,2)- EWw_fe_dat11_3_NRMSE).^2)/size(data.tWw_fe_dat11_3(:,2),1))/mean(data.tWw_fe_dat11_3(:,2))*100;
 
    NRMSE_growth = sqrt(sum([(data.tWw_fe_dat11_0(:,2)- EWw_fe_dat11_0_NRMSE);...
      (data.tWw_fe_dat11_1(:,2)- EWw_fe_dat11_1_NRMSE);...
      (data.tWw_fe_dat11_2(:,2)- EWw_fe_dat11_2_NRMSE);...
      (data.tWw_fe_dat11_3(:,2)- EWw_fe_dat11_3_NRMSE)].^2)/...
      size([data.tWw_fe_dat11_0(:,2);...
      data.tWw_fe_dat11_1(:,2);...
      data.tWw_fe_dat11_2(:,2);...
      data.tWw_fe_dat11_3(:,2)],1))/...
      mean([ data.tWw_fe_dat11_0(:,2); data.tWw_fe_dat11_1(:,2); data.tWw_fe_dat11_2(:,2); data.tWw_fe_dat11_3(:,2)]);
      %(max([ data.tWw_fe_dat11_0(:,2); data.tWw_fe_dat11_1(:,2); data.tWw_fe_dat11_2(:,2); data.tWw_fe_dat11_3(:,2)])- min([ data.tWw_fe_dat11_0(:,2); data.tWw_fe_dat11_1(:,2); data.tWw_fe_dat11_2(:,2); data.tWw_fe_dat11_3(:,2)]));
 NRMSE_growth
 
  NRMSE_tN_dat11_0 = sqrt(sum((data.tN_dat11_0(:,2)- EN_dat11_0_NRMSE).^2)/size(data.tN_dat11_0(:,2),1))/mean(data.tN_dat11_0(:,2))*100;
  NRMSE_tN_dat11_1 = sqrt(sum((data.tN_dat11_1(:,2)- EN_dat11_1_NRMSE).^2)/size(data.tN_dat11_1(:,2),1))/mean(data.tN_dat11_1(:,2))*100;
  NRMSE_tN_dat11_2 = sqrt(sum((data.tN_dat11_2(:,2)- EN_dat11_2_NRMSE).^2)/size(data.tN_dat11_2(:,2),1))/mean(data.tN_dat11_2(:,2))*100;
  NRMSE_tN_dat11_3 = sqrt(sum((data.tN_dat11_3(:,2)- EN_dat11_3_NRMSE).^2)/size(data.tN_dat11_3(:,2),1))/mean(data.tN_dat11_3(:,2))*100;
  
   NRMSE_repro = sqrt(sum([(data.tN_dat11_0(:,2)- EN_dat11_0_NRMSE);...
      (data.tN_dat11_1(:,2)- EN_dat11_1_NRMSE);...
      (data.tN_dat11_2(:,2)- EN_dat11_2_NRMSE);...
      (data.tN_dat11_3(:,2)- EN_dat11_3_NRMSE)].^2)/...
      size([data.tN_dat11_0(:,2);...
      data.tN_dat11_1(:,2);...
      data.tN_dat11_2(:,2);...
      data.tN_dat11_3(:,2)],1))/...
      mean([ data.tN_dat11_0(:,2); data.tN_dat11_1(:,2); data.tN_dat11_2(:,2); data.tN_dat11_3(:,2)]);
  
  NRMSE_repro
  
  close all % remove existing figures, else you get more and more if you retry
  
  
  %dat11_0
  figure % figure to show results of uni-variate data
  set(gca,'Fontsize',12, 'Box', 'on')
  set(gcf,'PaperPositionMode','manual');
  set(gcf,'PaperUnits','points'); 
  set(gcf,'PaperPosition',[0 0 350 200]);%left bottom width height
        
  plot(t1, EWw_fe_dat11_0, 'g', tWw_fe_dat11_0(:,1), tWw_fe_dat11_0(:,2), '.r', 'markersize', 20, 'linewidth', 2)
  xlabel([txtData.label.tWw_fe_dat11_0{1}, ', ', txtData.units.tWw_fe_dat11_0{1}])
  ylabel([txtData.label.tWw_fe_dat11_0{2}, ', ', txtData.units.tWw_fe_dat11_0{2}])
  title([char(txtData.bibkey.tWw_fe_dat11_0) ', NRMSE: ' num2str(round(NRMSE_tWw_fe_dat11_0,1)) '%' ])
  xlim([0 400])
  ylim([0 1500])

  print -dpng results_Anas_platyrhynchos_01_custom.png
  saveas(gcf,'results_Anas_platyrhynchos_01_custom.png')
  
 figure % figure to show results of uni-variate data
  set(gca,'Fontsize',12, 'Box', 'on')
  set(gcf,'PaperPositionMode','manual');
  set(gcf,'PaperUnits','points'); 
  set(gcf,'PaperPosition',[0 0 350 200]);%left bottom width height
        
  plot(t1, EN_dat11_0, 'g', tN_dat11_0(:,1), tN_dat11_0(:,2), '.r', 'markersize', 20, 'linewidth', 2)
  xlabel([txtData.label.tN_dat11_0{1}, ', ', txtData.units.tN_dat11_0{1}])
  ylabel([txtData.label.tN_dat11_0{2}, ', ', txtData.units.tN_dat11_0{2}])
  xlim([0 380])
  ylim([0 60])
  
  title([char(txtData.bibkey.tN_dat11_0) ', NRMSE: ' num2str(round(NRMSE_tN_dat11_0,1)) '%' ])
  
  print -dpng results_Anas_platyrhynchos_02_custom.png
  saveas(gcf,'results_Anas_platyrhynchos_02_custom.png') 
  
    %dat11_1
  figure % figure to show results of uni-variate data
  set(gca,'Fontsize',12, 'Box', 'on')
  set(gcf,'PaperPositionMode','manual');
  set(gcf,'PaperUnits','points'); 
  set(gcf,'PaperPosition',[0 0 350 200]);%left bottom width height
        
  plot(t1, EWw_fe_dat11_1, 'g', tWw_fe_dat11_1(:,1), tWw_fe_dat11_1(:,2), '.r', 'markersize', 20, 'linewidth', 2)
  xlabel([txtData.label.tWw_fe_dat11_1{1}, ', ', txtData.units.tWw_fe_dat11_1{1}])
  ylabel([txtData.label.tWw_fe_dat11_1{2}, ', ', txtData.units.tWw_fe_dat11_1{2}])
  xlim([0 400])
  ylim([0 1500])
  title([char(txtData.bibkey.tWw_fe_dat11_1) ', NRMSE: ' num2str(round(NRMSE_tWw_fe_dat11_1,1)) '%' ])
  
  print -dpng results_Anas_platyrhynchos_03_custom.png
  saveas(gcf,'results_Anas_platyrhynchos_03_custom.png')
  
 figure % figure to show results of uni-variate data
  set(gca,'Fontsize',12, 'Box', 'on')
  set(gcf,'PaperPositionMode','manual');
  set(gcf,'PaperUnits','points'); 
  set(gcf,'PaperPosition',[0 0 350 200]);%left bottom width height
        
  plot(t1, EN_dat11_1, 'g', tN_dat11_1(:,1), tN_dat11_1(:,2), '.r', 'markersize', 20, 'linewidth', 2)
  xlabel([txtData.label.tN_dat11_1{1}, ', ', txtData.units.tN_dat11_1{1}])
  ylabel([txtData.label.tN_dat11_1{2}, ', ', txtData.units.tN_dat11_1{2}])
  xlim([0 380])
  ylim([0 60])
  title([char(txtData.bibkey.tN_dat11_1) ', NRMSE: ' num2str(round(NRMSE_tN_dat11_1,1)) '%' ])
  
  print -dpng results_Anas_platyrhynchos_04_custom.png
  saveas(gcf,'results_Anas_platyrhynchos_04_custom.png')
  
      %dat11_2
  figure % figure to show results of uni-variate data
  set(gca,'Fontsize',12, 'Box', 'on')
  set(gcf,'PaperPositionMode','manual');
  set(gcf,'PaperUnits','points'); 
  set(gcf,'PaperPosition',[0 0 350 200]);%left bottom width height
        
  plot(t1, EWw_fe_dat11_2, 'g', tWw_fe_dat11_2(:,1), tWw_fe_dat11_2(:,2), '.r', 'markersize', 20, 'linewidth', 2)
  xlabel([txtData.label.tWw_fe_dat11_2{1}, ', ', txtData.units.tWw_fe_dat11_2{1}])
  ylabel([txtData.label.tWw_fe_dat11_2{2}, ', ', txtData.units.tWw_fe_dat11_2{2}])
  xlim([0 400])
  ylim([0 1500])
  title([char(txtData.bibkey.tWw_fe_dat11_2) ', NRMSE: ' num2str(round(NRMSE_tWw_fe_dat11_2,1)) '%' ])
  
  print -dpng results_Anas_platyrhynchos_05_custom.png
  saveas(gcf,'results_Anas_platyrhynchos_05_custom.png')
  
 figure % figure to show results of uni-variate data
  set(gca,'Fontsize',12, 'Box', 'on')
  set(gcf,'PaperPositionMode','manual');
  set(gcf,'PaperUnits','points'); 
  set(gcf,'PaperPosition',[0 0 350 200]);%left bottom width height
        
  plot(t1, EN_dat11_2, 'g', tN_dat11_2(:,1), tN_dat11_2(:,2), '.r', 'markersize', 20, 'linewidth', 2)
  xlabel([txtData.label.tN_dat11_2{1}, ', ', txtData.units.tN_dat11_2{1}])
  ylabel([txtData.label.tN_dat11_2{2}, ', ', txtData.units.tN_dat11_2{2}])
  xlim([0 380])
  ylim([0 60])
  title([char(txtData.bibkey.tN_dat11_2) ', NRMSE: ' num2str(round(NRMSE_tN_dat11_2,1)) '%' ])
  
  print -dpng results_Anas_platyrhynchos_06_custom.png
  saveas(gcf,'results_Anas_platyrhynchos_06_custom.png') 
  
      %dat11_3
  figure % figure to show results of uni-variate data
  set(gca,'Fontsize',12, 'Box', 'on')
  set(gcf,'PaperPositionMode','manual');
  set(gcf,'PaperUnits','points'); 
  set(gcf,'PaperPosition',[0 0 350 200]);%left bottom width height
        
  plot(t1, EWw_fe_dat11_3, 'g', tWw_fe_dat11_3(:,1), tWw_fe_dat11_3(:,2), '.r', 'markersize', 20, 'linewidth', 2)
  xlabel([txtData.label.tWw_fe_dat11_3{1}, ', ', txtData.units.tWw_fe_dat11_3{1}])
  ylabel([txtData.label.tWw_fe_dat11_3{2}, ', ', txtData.units.tWw_fe_dat11_3{2}])
  xlim([0 400])
  ylim([0 1500])
  title([char(txtData.bibkey.tWw_fe_dat11_3) ', NRMSE: ' num2str(round(NRMSE_tWw_fe_dat11_3,1)) '%'])
  
  print -dpng results_Anas_platyrhynchos_07_custom.png
  saveas(gcf,'results_Anas_platyrhynchos_07_custom.png')
  
 figure % figure to show results of uni-variate data
  set(gca,'Fontsize',12, 'Box', 'on')
  set(gcf,'PaperPositionMode','manual');
  set(gcf,'PaperUnits','points'); 
  set(gcf,'PaperPosition',[0 0 350 200]);%left bottom width height
        
  plot(t1, EN_dat11_3, 'g', tN_dat11_3(:,1), tN_dat11_3(:,2), '.r', 'markersize', 20, 'linewidth', 2)
  xlabel([txtData.label.tN_dat11_3{1}, ', ', txtData.units.tN_dat11_3{1}])
  ylabel([txtData.label.tN_dat11_3{2}, ', ', txtData.units.tN_dat11_3{2}])
  xlim([0 380])
  ylim([0 60])
  title([char(txtData.bibkey.tN_dat11_3) ', NRMSE: ' num2str(round(NRMSE_tN_dat11_3,1)) '%' ])
  
  print -dpng results_Anas_platyrhynchos_08_custom.png
  saveas(gcf,'results_Anas_platyrhynchos_08_custom.png') 
  
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
        
  pt(1)= plot(t1, Ef_R_dat11_0, 'g','color',Pal(1,:), 'markersize', 20, 'linewidth', 2);
  hold on
  pt(2)= plot(t1, Ef_R_dat11_1, 'g','color',Pal(2,:), 'markersize', 20, 'linewidth', 2);
  pt(3)= plot(t1, Ef_R_dat11_2, 'g','color',Pal(3,:), 'markersize', 20, 'linewidth', 2);
  pt(4)= plot(t1, Ef_R_dat11_3, 'g','color',Pal(4,:), 'markersize', 20, 'linewidth', 2);
  
  grid on
  box on
  xlabel([txtData.label.tN_dat11_0{1}, ', ', txtData.units.tN_dat11_0{1}])
  ylabel('scaled functional response f (-)')
  xlim([0 380])
  ylim([0.5 2])
  title(char(txtData.bibkey.tN_dat11_0) )
  legend(pt,{'0','500','1200','3000'},'Location','southeast')
  set(gca,'Yscale','log')

  print -dpng results_Anas_platyrhynchos_09_custom.png
  saveas(gcf,'results_Anas_platyrhynchos_09_custom.png')
  
  %Save data and predictions
  
   data_growth = horzcat(tWw_fe_dat11_0(:,1), tWw_fe_dat11_0(:,2), tWw_fe_dat11_1(:,2), tWw_fe_dat11_2(:,2), tWw_fe_dat11_3(:,2) );
  save('data_growth.txt','data_growth','-ascii', '-double', '-tabs');
  data_growth_CI = horzcat(CI_tWw_fe_dat11_0, CI_tWw_fe_dat11_1, CI_tWw_fe_dat11_2, CI_tWw_fe_dat11_3);
  save('data_growth_CI.txt','data_growth_CI','-ascii', '-double', '-tabs');
  
   data_repro = horzcat(tN_dat11_0(:,1), tN_dat11_0(:,2),tN_dat11_1(:,2), tN_dat11_2(:,2),tN_dat11_3(:,2));
  save('data_repro.txt','data_repro','-ascii', '-double', '-tabs');
  data_repro_CI = horzcat(CI_tN_dat11_0,CI_tN_dat11_1, CI_tN_dat11_2,CI_tN_dat11_3);
  save('data_repro_CI.txt','data_repro_CI','-ascii', '-double', '-tabs');
  
  predictions_growth = horzcat(t1, EWw_fe_dat11_0, EWw_fe_dat11_1, EWw_fe_dat11_2, EWw_fe_dat11_3 );
  save('predictions_growth.txt','predictions_growth','-ascii', '-double', '-tabs');
   NRMSE_growth = [0,NRMSE_tWw_fe_dat11_0,NRMSE_tWw_fe_dat11_1, NRMSE_tWw_fe_dat11_2, NRMSE_tWw_fe_dat11_3];
  save('NRMSE_growth.txt','NRMSE_growth','-ascii', '-double', '-tabs');
  
  predictions_feeding = horzcat(t1, Ef_R_dat11_0, Ef_R_dat11_1, Ef_R_dat11_2, Ef_R_dat11_3 );
  save('predictions_feeding.txt','predictions_feeding','-ascii', '-double', '-tabs');
  
  predictions_concentration = horzcat(t1, EcV_dat11_0, EcV_dat11_1, EcV_dat11_2, EcV_dat11_3 );
  save('predictions_concentration.txt','predictions_concentration','-ascii', '-double', '-tabs');
  
% %   %Without tox 
%     predictions_repro_without_tox = horzcat(t1, EN_dat11_0,EN_dat11_1, EN_dat11_2, EN_dat11_3);
%     save('predictions_repro_without_tox.txt','predictions_repro_without_tox','-ascii', '-double', '-tabs');
%     NRMSE_repro_without_tox = [0,NRMSE_tN_dat11_0,NRMSE_tN_dat11_1, NRMSE_tN_dat11_2, NRMSE_tN_dat11_3];
%     save('NRMSE_repro_without_tox.txt','NRMSE_repro_without_tox','-ascii', '-double', '-tabs');

  %With tox 
    predictions_repro = horzcat(t1, EN_dat11_0,EN_dat11_1, EN_dat11_2, EN_dat11_3);
    save('predictions_repro.txt','predictions_repro','-ascii', '-double', '-tabs');
    NRMSE_repro = [0,NRMSE_tN_dat11_0,NRMSE_tN_dat11_1, NRMSE_tN_dat11_2, NRMSE_tN_dat11_3];
    save('NRMSE_repro.txt','NRMSE_repro','-ascii', '-double', '-tabs');
   





 
  




