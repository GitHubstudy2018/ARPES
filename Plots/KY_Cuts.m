%Ky Cuts
figure('Name', "K_Y Cut Plots",'Position', get(0, 'Screensize'));
set(gcf, 'Visible', 'off');
Energy_Contour = double(int16(80:20:200));
subplot(2,3,1)
imshow(squeeze(B(:,ypos,:))',[], 'XData', [KX_Angle_Min KX_Angle_Max]...
    , 'YData', [KY_Angle_Min KY_Angle_Max], 'colormap', setmap);
%colorbar;
hold on
for ii = 1:5
DKX = (KX_Angle_Max - KX_Angle_Min)*(Energy_Contour(ii)/Xlim) + KX_Angle_Min;
line([DKX DKX],[KY_Angle_Min KY_Angle_Max], 'color', 'white', 'linewidth', 1,'linestyle','--')
text(DKX,KY_Angle_Min + 0.2,num2str(ii),'color','White','FontSize',12, 'FontWeight','bold')
% DKX = (KY_Angle_Max - KY_Angle_Min)*(Energy_Contour(ii)/Xlim) + KY_Angle_Min;
% line([KX_Angle_Min KX_Angle_Max],[DKX DKX], 'color', 'white', 'linewidth',1,'linestyle','--')
% text(KX_Angle_Min,DKX + 0.1,num2str(ii),'color','White','FontSize',12, 'FontWeight','bold')
end
axis on
%axis square
title(' Fermi level')
xlabel(strcat('K_x','(1/',Ang,')'),'FontSize',14)
ylabel(strcat('K_y','(1/',Ang,')'),'FontSize',14)
hold off
for ii = 2:6
subplot(2,3,ii)
imshow(squeeze(B(int16(Energy_Contour(ii-1)),:,:)),[], 'XData',...
    [KY_Angle_Min KY_Angle_Max], 'YData',...
     [abs(Ymin) - Fermi_Level, abs(Ymax)- Fermi_Level], 'colormap', setmap);
axis on
%axis square
title(strcat("Cut ",num2str(ii-1)))
xlabel(strcat('K_y','(1/',Ang,')'),'FontSize',14)
ylabel('Binding energy (eV)','FontSize',14)
hold off
end
saveas(gcf,strcat(dir,sample,'_',file_no,'_Ky_Cuts.png'))