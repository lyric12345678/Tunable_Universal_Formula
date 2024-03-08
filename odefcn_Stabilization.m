function dxdt = odefcn_Stabilization(t,x)
%% Dynamics -first case
dxdt = zeros(2,1);
k_1=1;
k_2=1;
k_d(1)=-k_1*x(1);
k_d(2)=-k_2*x(2);
u=k_d;
dxdt(1) = u(1);
dxdt(2) = u(2);
end