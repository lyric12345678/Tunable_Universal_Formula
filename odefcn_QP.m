function dxdt = odefcn_QP(t,x)
global u_QP_save
%% Dynamics -first case
dxdt = zeros(2,1);
h_x=(x(1)+2)^2+(x(2)-2)^2-1;
beta=5;
c_x=beta*h_x;
d_x=[2*(x(1)+2),2*(x(2)-2)];
Gamma_x=sqrt(c_x^2+norm(d_x)^4);
k_1=1;
k_2=1;
k_d=[-k_1*x(1),-k_2*x(2)].';
c_x_tilde=c_x+d_x*k_d;
kappa=0;
if c_x_tilde-kappa*Gamma_x<0
    u=(-c_x_tilde+kappa*Gamma_x)/(norm(d_x)^2)*d_x;
else
    u=zeros(2,1);
end
% u=(-c_x_tilde+kappa*Gamma_x)/(norm(d_x)^2)*d_x;
u=u.'+k_d;
dxdt(1) =u(1);
dxdt(2) =u(2);
u_QP_save=[u_QP_save,u];
end