% Compare echo pdf with and without added noise

SAVE_DIR = '/mnt/storage/bb_echopdf_figs/bb_echopdf_pool_wnoise';
A = load(['/mnt/storage/bb_echopdf_figs/echopdfmodel_with_without_noise/' ...
          'echopdfmodel_wnoise_N10_50.mat']);
B = load(['/mnt/storage/bb_echopdf_figs/echopdfmodel_with_without_noise/' ...
          'echopdfmodel_wnoise_N100to1000.mat']);

raylx = logspace(-4,2,100);
rayl = raylpdf(raylx,1/sqrt(2));

h = figure;
loglog(raylx,rayl,'color',[1 1 1]*180/255,'linewidth',1.5);
hold on
loglog(A.pmx,A.pm(:,1),'k','linewidth',2);
loglog(A.pmx,A.pm(:,2),'k','linewidth',0.5);
loglog(B.pmx,B.pm(:,[1,3,9,15]),'k','linewidth',0.5);
axis([5e-3 50 1e-5 1e2]);
xlabel('Normazlied echo amplitude','fontsize',12);
ylabel('PDF','fontsize',12);
set(gca,'fontsize',10);
title(['Rayleigh, N=[10,50,100,200,500,800]'],'fontsize',12);

print([SAVE_DIR,'/bb_echopdf_pool_wnoise.png'],'-dpng');
saveas(h,[SAVE_DIR,'/bb_echopdf_pool_wnoise.fig'],'fig');
