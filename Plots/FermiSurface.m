% Create and save fermi surface plot
figure('Name', "Fermi Surface", 'units','normalized','outerposition',[0 0 1 1]);  
set(gcf, 'Visible', 'on');
AxesH = axes;
drawnow;
InSet = get(AxesH, 'TightInset');
set(AxesH, 'Position', [InSet(1:2), 0.9-InSet(1)-InSet(3), 1-InSet(2)-InSet(4)])
Fermi_Level = abs(Ymin) + ((ypos/Ylim)*(abs(Ymax) - abs(Ymin)));
imshow(squeeze(B(:,ypos,:))',[], 'XData', [KX_Angle_Min KX_Angle_Max]...
    , 'YData', [KY_Angle_Min KY_Angle_Max], 'colormap', setmap);
%colorbar;
axis on
xlabel(strcat('K_x','(1/',Ang,')'),'FontSize',14)
ylabel(strcat('K_y','(1/',Ang,')'),'FontSize',14)
hold off
%colormapeditor
saveas(gcf,strcat(dir,sample,'_',file_no,'_Fermi_Surface.png'))