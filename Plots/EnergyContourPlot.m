%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constant Energy Contour Plot
%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name',"Constant Energy Contour Plot",'Position', get(0, 'Screensize'));
set(gcf, 'Visible', 'off');
Energy_Limit = ypos - 200;
Energy_Cut = 1:int16(Energy_Limit/6):Energy_Limit;
Energy_Contour = ypos - Energy_Cut;
hold on
subaxis(1,6,1,'S',0.01); 
imshow(squeeze(B(:,ypos,:))',[], 'XData', [KX_Angle_Min KX_Angle_Max]...
    , 'YData', [KY_Angle_Min KY_Angle_Max], 'colormap', setmap);
axis on
set(gca,'box','off')
%axis square
xlabel(strcat('K_x','(1/',Ang,')'),'FontSize',14)
ylabel(strcat('K_y','(1/',Ang,')'),'FontSize',14)
%colorbar;
for ii = 2:6
subaxis(1,6,ii,'S',0.01); 
imshow(squeeze(B(:,Energy_Contour(ii),:))',[], 'XData', [KX_Angle_Min KX_Angle_Max]...
    , 'YData', [KY_Angle_Min KY_Angle_Max], 'colormap', setmap);

xlabel(strcat('K_x','(1/',Ang,')'),'FontSize',14)
text(KX_Angle_Min + 0.10,KY_Angle_Max - 0.2,...
    strcat('-',num2str(round(abs(eV(Energy_Contour(ii)) - eV(ypos))*1000.0)),'meV') ...
 ,'color','Black','BackgroundColor','White','FontSize',12, 'FontWeight','bold')
end
hold off
saveas(gcf,strcat(dir,sample,'_',file_no,'_Energy_Contour.png'))
