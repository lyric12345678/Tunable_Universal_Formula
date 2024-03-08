clear all
close all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Research Problem: A Tunable Universal Formula for Safety Control
%Author: Ming Li
%Date: Feb. 26. 2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global Initial_position
global x_Stabilization x_Sontag x_QP x_Ming_kappa1 x_Ming_kappa2 x_Ming_kappa3 x_Ming_kappa4
global u_Sontg_save u_QP_save u_kappa1_save u_kappa2_save u_kappa3_save u_kappa4_save
Initial_position(:,1)=[-4,3];
t_end =100;

% %% With Input Case
% global x_tilde_Sontag x_tilde_QP x_tilde_kappa1 x_tilde_kappa2 x_tilde_kappa3 x_tilde_kappa4
% global u_tilde_Sontg u__tilde_QP u_tilde_kappa1 u_tilde_kappa2 u_tilde_kappa3 u_tilde_kappa4

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Part I: Without Control Input Constraints
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Stabilization_only
for i=1:size(Initial_position,2)
    [T,x_Stabilization(:,:,i)] = ode45(@odefcn_Stabilization,[0:0.01:t_end],Initial_position(:,i));
end


%% Sontag's Universal formula Control Law
for i=1:size(Initial_position,2)
    [T,x_Sontag(:,:,i)] = ode45(@odefcn_Sontag,[0:0.01:t_end/10],Initial_position(:,i));
end
% Compute control input of Sontag's universal formula
% [u] = Sontag_Input(x_Sontag);
flag =1;   % kappa choice
[u_Sontg_save] = Input_Compute(x_Sontag,flag);


%% Ming Li(QP-Synthesized Universal formula)
for i=1:size(Initial_position,2)
    [T,x_QP(:,:,i)] = ode45(@odefcn_QP,[0:0.01:t_end],Initial_position(:,i));
end
flag =2;   % kappa choice
[u_QP_save] = Input_Compute(x_QP,flag);



%% Ming Li (A Generalized Universal formula with norm bounded constraints) kappa_1
for i=1:size(Initial_position,2)
    [T,x_Ming_kappa1(:,:,i)] = ode45(@odefcn_Ming_kappa1,[0:0.01:t_end],Initial_position(:,i));
end
flag =3;   % kappa choice
[u_kappa1_save] = Input_Compute(x_Ming_kappa1,flag);

%% Ming Li (A Generalized Universal formula with norm bounded constraints) kappa_2
for i=1:size(Initial_position,2)
    [T,x_Ming_kappa2(:,:,i)] = ode45(@odefcn_Ming_kappa2,[0:0.01:t_end],Initial_position(:,i));
end
flag =4;   % kappa choice
[u_kappa2_save] = Input_Compute(x_Ming_kappa2,flag);

%% Ming Li (A Generalized Universal formula with norm bounded constraints) kappa_3
for i=1:size(Initial_position,2)
    [T,x_Ming_kappa3(:,:,i)] = ode45(@odefcn_Ming_kappa3,[0:0.01:t_end],Initial_position(:,i));
end
flag =5;   % kappa choice
[u_kappa3_save] = Input_Compute(x_Ming_kappa3,flag);


%% Ming Li (A Generalized Universal formula with norm bounded constraints) kappa_4
for i=1:size(Initial_position,2)
    [T,x_Ming_kappa4(:,:,i)] = ode45(@odefcn_Ming_kappa4,[0:0.01:t_end],Initial_position(:,i));
end
flag =6;   % kappa choice
[u_kappa4_save] = Input_Compute(x_Ming_kappa4,flag);


% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Part II: Without Control Input Constraints
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Ming Li (A Generalized Universal formula with norm bounded constraints) kappa_1
% for i=1:size(Initial_position,2)
%     [T,x_tilde_kappa1(:,:,i)] = ode45(@odefcn_tilde_kappa1,[0:0.01:t_end],Initial_position(:,i));
% end
% flag =2;   % kappa choice
% [u_tilde_kappa1] = Constrained_Input_Compute(x_tilde_kappa1,flag);
% 
%% Plot Figures
Figure_plot()




