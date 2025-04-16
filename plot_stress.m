clear
clc
x=1; Sr=2; Sph=3; Sth=4; Si=5; Sii=6; Siii=7;

sensors = 2;
Tin = [150 110 110];
Tout = [70 60 85];
% Tball = 20
Tball = (Tin(sensors+1)+Tout(sensors+1))/2;

file_name = ['Symm36-Tinring-', num2str(Tin(sensors+1)), '-Toutring-', num2str(Tout(sensors+1)), '-Tball-', num2str(Tball), '.json'];

result = jsondecode(fileread(file_name));
inring = result.path_inring; inring(:,x) = inring(:,x) - max(inring(:,x))/2;
outring = result.path_outring; outring(:,x) = outring(:,x) - max(outring(:,x))/2;

plot(inring(:,x), inring(:,Si), inring(:,x), inring(:,Sii), inring(:,x), inring(:,Siii));
xlim([min(inring(:,x)), max(inring(:,x))]);
ylim([-150 150])
