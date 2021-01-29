clear;
clf;

%Vectors
p_x = zeros(1000, 1);
v_x = zeros(1000, 1);
d_x = zeros(1000, 1);

%Values to be plotted
%records position, velocity, and displacement of the first electron
pos(1) = 0; 
vel(1) = 0;
dis(1) = 0;

delta_t = 0;
tau = 20;
time = 1;

figure(1)
v_plot = subplot(2, 1, 1);
v_plot.XLabel.String = 'Time';
v_plot.YLabel.String = 'Velocity';
p_plot = subplot(2, 1, 2);
p_plot.XLabel.String = 'Time';
p_plot.YLabel.String = 'Position';

for i = 2:500
    pos = [pos, 0];
    vel = [vel, 0];
    dis = [dis, 0];
    
    %scattering
    P_scat = 1-exp(-delta_t/tau);
    if rand() <= P_scat 
        %scatters
        v_x = 0;
        delta_t = 0;
    else 
        v_x = v_x + 1;
        delta_t = delta_t + 1;
    end
    
    d_x = v_x*time;
    p_x = p_x + d_x;
    
    pos(i) = p_x(1);
    vel(i) = v_x(1);
    dis(i) = d_x(1);
    v_avg = mean(vel);
    subplot(2, 1, 1)
    title(["Average: ", num2str(v_avg)])
    hold on
    plot(vel, 'b')
    plot(i, v_avg, '.', 'color', 'g')
    
    subplot(2, 1, 2)
    plot(pos, 'color', 'b')
    hold off
    pause(0.05)
end
