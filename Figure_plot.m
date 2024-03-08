function Figure_plot()
global Initial_position
global x_Stabilization x_Sontag x_QP x_Ming_kappa1 x_Ming_kappa2 x_Ming_kappa3 x_Ming_kappa4
global u_Sontg_save u_QP_save u_kappa1_save u_kappa2_save u_kappa3_save u_kappa4_save

%% With Input Case
global x_tilde_Sontag x_tilde_QP x_tilde_kappa1 x_tilde_kappa2 x_tilde_kappa3 x_tilde_kappa4
global u_tilde_Sontg u__tilde_QP u_tilde_kappa1 u_tilde_kappa2 u_tilde_kappa3 u_tilde_kappa4

%% Create the barrier area
% Define the circle equation
theta = linspace(0, 2*pi, 100);
x1 = -2 + cos(theta);
x2 = 2 + sin(theta);
figure(1)
subplot(1,2,1)
% plot(Initial_position(1),Initial_position(2),'bp','MarkerSize',12)
% hold on
h8=fill(x1, x2, 'red', 'FaceAlpha', 0.3, 'EdgeColor', 'red');  % 'red' for fill and boundary color
hold on
% Plot the filled area where h(x1, x2) < 0 with shallow red color
for i=1:1:size(Initial_position,2)
    h_1(i)=plot(x_Stabilization(:,1,i),x_Stabilization(:,2,i),'k--','linewidth',1.5);
    hold on
    h_2(i)=plot(x_QP(:,1,i),x_QP(:,2,i),'c-','linewidth',1.5);
    h_3(i)=plot(x_Ming_kappa1(:,1,i),x_Ming_kappa1(:,2,i),'g-','linewidth',1.5);
    h_4(i)=plot(x_Ming_kappa2(:,1,i),x_Ming_kappa2(:,2,i),'b-','linewidth',1.5);
    h_5(i)=plot(x_Ming_kappa3(:,1,i),x_Ming_kappa3(:,2,i),'y-','linewidth',1.5);
    h_6(i)=plot(x_Ming_kappa4(:,1,i),x_Ming_kappa4(:,2,i),'m-','linewidth',1.5);
    h_7(i)=plot(x_Sontag(:,1,i),x_Sontag(:,2,i),'r-','linewidth',1.5);
end
plot(Initial_position(1), Initial_position(2), 'bp', 'MarkerSize', 15, 'MarkerFaceColor', 'b');

% Add an arrow using quiver with a larger arrowhead
arrowLength = 0.2;  % Length of the arrow
arrowDirection = [1, 1];  % Direction of the arrow
arrowHeadSize = 6;  % Size of the arrowhead
quiver(Initial_position(1), Initial_position(2), arrowLength * arrowDirection(1), arrowLength * arrowDirection(2), 'b', 'LineWidth', 2, 'MaxHeadSize', arrowHeadSize);

% Add text near the marker
text(Initial_position(1) + arrowLength, Initial_position(2) + arrowLength, 'Start Position', 'FontSize', 14, 'Color', 'b','interpreter','latex');
plot(0,0,'ro','MarkerSize',15, 'MarkerFaceColor', 'r')
arrowDirection = [-0.7, 0.8];  % Direction of the arrow
arrowLength = 0.8;  % Length of the arrow
quiver(0, 0, arrowLength * arrowDirection(1), arrowLength * arrowDirection(2), 'r', 'LineWidth', 2, 'MaxHeadSize', arrowHeadSize);

% Add text near the marker
text( -arrowLength-0.3, arrowLength+0.1, 'End Position', 'FontSize', 14, 'Color', 'r','interpreter','latex');
xlabel('$x_1 (-)$','interpreter','latex')
ylabel('$x_2 (-)$','interpreter','latex')
set(gca,'FontSize',20)
% set(gcf,'Position',[200,200,1000,725], 'color','w')
set(gcf,'Position',[200,200,1000,790], 'color','w')
% lgd =legend([h8,h_1,h_2,h_3,h_4,h_5,h_6,h_7],'Obstacle','Open Loop','QP Controller','Tunable-$\kappa_{1}$','Tunable-$\kappa_{2}$','Tunable-$\kappa_{3}$','Tunable-$\kappa_{4}$','Sontag','interpreter','latex');
% lgd.NumColumns = 8;  % Set the number of columns in the legend
% lgd.Position = [0.47 0.815 0.1 0.1];  % Adjust the position if needed
% Move the legend to the top of the figure
lgd = legend([h8,h_1,h_2,h_3,h_4,h_5,h_6,h_7],'Obstacle','Open Loop','QP Controller','Tunable-$\kappa_{1}$','Tunable-$\kappa_{2}$','Tunable-$\kappa_{3}$','Tunable-$\kappa_{4}$','Sontag','interpreter','latex');
lgd.NumColumns = 4;  % Set the number of columns in the legend

% Adjust the position of the legend to the top
lgd.Position = [0.47 0.87 0.1 0.1];  % [left, bottom, width, height]
grid on
% axis equal
axis([-4.5,0,0,3.5])
subplot(1,2,2)
num_plot_end=150;
for i=1:size(Initial_position,2)
    h_1(i)=plot(vecnorm(u_QP_save(1:num_plot_end,:).'),'c-','linewidth',1.5);
    hold on
    h_2(i)=plot(vecnorm(u_kappa1_save(1:num_plot_end,:).'),'g-','linewidth',1.5);
    h_3(i)=plot(vecnorm(u_kappa2_save(1:num_plot_end,:).'),'b-','linewidth',1.5);
    h_4(i)=plot(vecnorm(u_kappa3_save(1:num_plot_end,:).'),'y-','linewidth',1.5);
    h_5(i)=plot(vecnorm(u_kappa4_save(1:num_plot_end,:).'),'m-','linewidth',1.5);
    h_6(i)=plot(vecnorm(u_Sontg_save(1:num_plot_end,:).'),'r-','linewidth',1.5);
    h_7(i)=plot(ones(size(u_kappa2_save,1),1)*3.5,'--','linewidth',1.5);
end
% Add an arrow using quiver with a larger arrowhead
arrowLength = 0.2;  % Length of the arrow
arrowDirection = [1, 1];  % Direction of the arrow
arrowHeadSize = 6;  % Size of the arrowhead
quiver(Initial_position(1), Initial_position(2), arrowLength * arrowDirection(1), arrowLength * arrowDirection(2), 'b', 'LineWidth', 2, 'MaxHeadSize', arrowHeadSize);


% Add text near the marker
text( 85-arrowLength-0.3, 3.7+arrowLength+0.1, 'Norm Bound $\gamma$', 'FontSize', 14, 'Color', 'k','interpreter','latex');
xlabel('$t$ (s)','interpreter','latex')
ylabel('$\|\mathbf{u}\| (-)$','interpreter','latex')
set(gca,'FontSize',20)
set(gcf,'Position',[200,200,1000,375], 'color','w')
axis([0,num_plot_end,0,8])
grid on




% 
% 
% % plot(Initial_position(1),Initial_position(2),'bp','MarkerSize',12)
% % hold on
% h8=fill(x1, x2, 'red', 'FaceAlpha', 0.3, 'EdgeColor', 'red');  % 'red' for fill and boundary color
% hold on
% % Plot the filled area where h(x1, x2) < 0 with shallow red color
% for i=1:1:size(Initial_position,2)
% %     h_1(i)=plot(x_Stabilization(:,1,i),x_Stabilization(:,2,i),'k--','linewidth',1.5);
% %     hold on
% %     h_2(i)=plot(x_QP(:,1,i),x_QP(:,2,i),'c-','linewidth',1.5);
%     h_3(i)=plot(x_tilde_kappa1(:,1,i),x_tilde_kappa1(:,2,i),'g-','linewidth',1.5);
% %     h_4(i)=plot(x_Ming_kappa2(:,1,i),x_Ming_kappa2(:,2,i),'b-','linewidth',1.5);
% %     h_5(i)=plot(x_Ming_kappa3(:,1,i),x_Ming_kappa3(:,2,i),'y-','linewidth',1.5);
% %     h_6(i)=plot(x_Ming_kappa4(:,1,i),x_Ming_kappa4(:,2,i),'m-','linewidth',1.5);
% %     h_7(i)=plot(x_Sontag(:,1,i),x_Sontag(:,2,i),'r-','linewidth',1.5);
% end
% plot(Initial_position(1), Initial_position(2), 'bp', 'MarkerSize', 15, 'MarkerFaceColor', 'b');
% 
% % Add an arrow using quiver with a larger arrowhead
% arrowLength = 0.2;  % Length of the arrow
% arrowDirection = [1, 1];  % Direction of the arrow
% arrowHeadSize = 6;  % Size of the arrowhead
% quiver(Initial_position(1), Initial_position(2), arrowLength * arrowDirection(1), arrowLength * arrowDirection(2), 'b', 'LineWidth', 2, 'MaxHeadSize', arrowHeadSize);
% 
% % Add text near the marker
% text(Initial_position(1) + arrowLength, Initial_position(2) + arrowLength, 'Start Position', 'FontSize', 10, 'Color', 'b');
% plot(0,0,'ro','MarkerSize',15, 'MarkerFaceColor', 'r')
% arrowDirection = [-1, 1];  % Direction of the arrow
% quiver(0, 0, arrowLength * arrowDirection(1), arrowLength * arrowDirection(2), 'r', 'LineWidth', 2, 'MaxHeadSize', arrowHeadSize);
% 
% % Add text near the marker
% text( -arrowLength-0.3, arrowLength+0.1, 'End Position', 'FontSize', 10, 'Color', 'r');
% xlabel('$x_1 (-)$','interpreter','latex')
% ylabel('$x_2 (-)$','interpreter','latex')
% set(gca,'FontSize',20)
% % set(gcf,'Position',[200,200,1000,725], 'color','w')
% set(gcf,'Position',[200,200,1000,790], 'color','w')
% % lgd =legend([h8,h_1,h_2,h_3,h_4,h_5,h_6,h_7],'Obstacle','Open Loop','QP Controller','Tunable-$\kappa_{1}$','Tunable-$\kappa_{2}$','Tunable-$\kappa_{3}$','Tunable-$\kappa_{4}$','Sontag','interpreter','latex');
% % lgd.NumColumns = 8;  % Set the number of columns in the legend
% % lgd.Position = [0.47 0.815 0.1 0.1];  % Adjust the position if needed
% % Move the legend to the top of the figure
% % lgd = legend([h8,h_1,h_2,h_3,h_4,h_5,h_6,h_7],'Obstacle','Open Loop','QP Controller','Tunable-$\kappa_{1}$','Tunable-$\kappa_{2}$','Tunable-$\kappa_{3}$','Tunable-$\kappa_{4}$','Sontag','interpreter','latex');
% lgd.NumColumns = 8;  % Set the number of columns in the legend
% 
% % Adjust the position of the legend to the top
% lgd.Position = [0.47 0.87 0.1 0.1];  % [left, bottom, width, height]
% grid on
% % axis equal
% axis([-4.5,0,0,3.5])
% 
% 
%  subplot(1,2,2)
% num_plot_end=150;
% for i=1:size(Initial_position,2)
% %     h_1(i)=plot(vecnorm(u_QP_save(1:num_plot_end,:).'),'c-','linewidth',1.5);
% %     hold on
%     h_2(i)=plot(vecnorm(u_tilde_kappa1(1:num_plot_end,:).'),'g-','linewidth',1.5);
% %     h_3(i)=plot(vecnorm(u_kappa2_save(1:num_plot_end,:).'),'b-','linewidth',1.5);
% %     h_4(i)=plot(vecnorm(u_kappa3_save(1:num_plot_end,:).'),'y-','linewidth',1.5);
% %     h_5(i)=plot(vecnorm(u_kappa4_save(1:num_plot_end,:).'),'m-','linewidth',1.5);
% %     h_6(i)=plot(vecnorm(u_Sontg_save(1:num_plot_end,:).'),'r-','linewidth',1.5);
% end
% xlabel('$t$ (s)','interpreter','latex')
% ylabel('$\|u\| (-)$','interpreter','latex')
% set(gca,'FontSize',20)
% set(gcf,'Position',[200,200,1000,375], 'color','w')
% axis([0,num_plot_end,0,8])
% grid on
end

