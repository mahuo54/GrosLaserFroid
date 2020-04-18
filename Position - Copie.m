function [x, y] = Position(T1, T2, T3)
%boucle pour la position
    T_moyenne = (T1+T2+T3)/3;
    R1 = (T1/T_moyenne)*12.25; 
    R2 = (T2/T_moyenne)*12.25; 
    R3 = (T3/T_moyenne)*12.25; 
    x = real(1/696*sqrt((484416*R1^2+256*R2^4-512*R2^2*R3^2-242208*R2^2-26100*sqrt(-256*R2^4+512*R2^2*R3^2+242208*R2^2-256*R3^4+242208*R3^2-57289761)+256*R3^4-242208*R3^2-113012739)));
    y= -12.5+sqrt(R1^2-x^2); 
end