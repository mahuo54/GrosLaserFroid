T1 = table2array(testpuissance(:, 2)); 
T2 = table2array(testpuissance(:, 4)); 
T3 = table2array(testpuissance(:, 6)); 
P_teorique = table2array(testpuissance(:, 7));
temps = table2array(testpuissance(:, 1));

nb_points = numel(T1);
T(1) = (T1(1)+T2(1)+T3(1))/3;
P_mesure(1)= 0; 
%boucle de prédiction de puissance 
for i =2: nb_points
    T(i) = (T1(i)+T2(i)+T3(i))/3;
    P(1) = 0.2271*T(2)-4.7234;
    P(i) = 0.2271*T(i)-4.7234; 
    P_mesure(i) = P(i) + 14.665*(P(i)-P(i-1))/(temps(i)-temps(i-1));
end

%boucle pour la position
for i = 1:nb_points
    T_moyenne = (T1(i)+T2(i)+T3(i))/3;
    R1(i) = (T1(i)/T_moyenne)*12.25; 
    R2(i) = (T2(i)/T_moyenne)*12.25; 
    R3(i) = (T3(i)/T_moyenne)*12.25; 
    Position_x(i) = real(1/696*sqrt((484416*R1(i)^2+256*R2(i)^4-512*R2(i)^2*R3(i)^2-242208*R2(i)^2-26100*sqrt(-256*R2(i)^4+512*R2(i)^2*R3(i)^2+242208*R2(i)^2-256*R3(i)^4+242208*R3(i)^2-57289761)+256*R3(i)^4-242208*R3(i)^2-113012739)));
    Position_y(i)= 12.5-sqrt(R1(i)^2-Position_x(i)^2);
end  