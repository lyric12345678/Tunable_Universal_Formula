function [u] = Input_Compute(x_ODE,flag)
% u_kappa2_save=(x_ODE(2:end,:)-x_ODE(1:end-1,:))/0.01;
k_d=[];
u=[];
for i=1:size(x_ODE,1)
    h_x(i)=(x_ODE(i,1)+2)^2+(x_ODE(i,2)-2)^2-1;
    beta=5;
    c_x(i)=beta*h_x(i);
    d_x(i,:)=[2*(x_ODE(i,1)+2),2*(x_ODE(i,2)-2)];
    Gamma_x(i)=sqrt(c_x(i)^2+norm(d_x(i,:))^4);
    k_1=1;
    k_2=1;
    k_d(i,:)=[-k_1*x_ODE(i,1),-k_2*x_ODE(i,2)];
    c_x_tilde(i)=c_x(i)+d_x(i,:)*k_d(i,:).';
    eta=100;
    
    if flag ==1
        kappa(i)=1;
    end
    if flag == 2
        kappa(i)=0;
        if c_x_tilde(i)-kappa(i)*Gamma_x(i)<0
            u(i,:)=(-c_x_tilde(i)+kappa(i)*Gamma_x(i))./(norm(d_x(i,:))^2)*d_x(i,:);
        else
            u(i,:)=zeros(1,2);
        end
    end
    if flag ==3
        kappa(i)=1/eta*log(exp(eta*c_x_tilde(i)/Gamma_x(i))+exp(eta*2/Gamma_x(i)));
        %         if abs(c_x_tilde(i))>1.5
        %             zeta=0.3;
        %         else
        %             zeta=0.4;
        %         end
        %         kappa(i)=max(c_x_tilde(i)/Gamma_x(i),zeta);
    end
    if flag ==4
        kappa(i)=1/eta*log(exp(eta*c_x_tilde(i)/Gamma_x(i))+exp(eta*6/Gamma_x(i)));
    end
    if flag ==5
        kappa(i)=1/eta*log(exp(eta*c_x_tilde(i)/Gamma_x(i))+exp(eta*10/Gamma_x(i)));
    end
    if flag ==6
        kappa(i)=1/eta*log(exp(eta*c_x_tilde(i)/Gamma_x(i))+exp(eta*15/Gamma_x(i)));
    end
    if flag ==7
        if abs(c_x_tilde(i))>1.5
            zeta=0.3;
        else
            zeta=0.4;
        end
        kappa(i)=max(c_x_tilde(i)/Gamma_x(i),zeta);
    end
    if flag~=2
        u(i,:)=(-c_x_tilde(i)+kappa(i)*Gamma_x(i))/(norm(d_x(i,:))^2)*d_x(i,:);
    end
end
end

