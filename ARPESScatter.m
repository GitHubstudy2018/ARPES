%energy contour volume slice
figure('Name','3D plot');
set(gcf, 'Visible', 'off');
Fermi_Level = abs(Ymin) + ((ypos/Ylim)*(abs(Ymax) - abs(Ymin)));
diff = double(B); %double(squeeze(B));
Energy_Limit = ypos - 200;
Energy_Cut = 1:int16(Energy_Limit/4):Energy_Limit;
Energy_Contour = ypos - Energy_Cut;
%scatter3( )
set(h, 'EdgeColor','none', 'FaceColor','interp')
%alpha(.5)
axis on
axis square
colormap(cold)