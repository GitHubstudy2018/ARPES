%energy contour volume slice
figure('Name','3D plot');
%set(gcf, 'Visible', 'off');
Fermi_Level = abs(Ymin) + ((ypos/Ylim)*(abs(Ymax) - abs(Ymin)));
diff = double(B); %double(squeeze(B));
Energy_Limit = ypos - 200;
Energy_Cut = 1:int16(Energy_Limit/4):Energy_Limit;
Energy_Contour = ypos - Energy_Cut;
h = slice(diff,double(Energy_Contour),[],[]);
set(h, 'EdgeColor','none', 'FaceColor','interp')
%alpha(.5)
axis on
axis square
colormap(cold)
xlabel(strcat('Energy'),'FontSize',14)
ylabel(strcat('K_x','(1/',Ang,')'),'FontSize',14)
zlabel(strcat('K_y','(1/',Ang,')'),'FontSize',14)
% set(h,'YData',[KY_Angle_Min KY_Angle_Max]);
% set(h,'ZData',[KX_Angle_Min KX_Angle_Max]);
 %set(h,'XData',[eV(1) eV(end)]);
view(90,-76)
hold off