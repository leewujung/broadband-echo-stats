% 2014 04 27  Figure out where the code was left in August 2013

%N = [10,20,50,100,200,500,1000];
%N = [10:10:90,100:100:2000];
N = 10;
mix_r = 1;
ns = 10e4;
gate_len = 0.5;
save_opt = 1;
tx = 3;
sdir = '/mnt/storage/ECHO_STAT/20140427_bbechopdf';
if ~exist(sdir,'dir')
    mkdir(sdir);
end

for iN=1:length(N)
% bbechopdf(N,mix_r,ns,gate_len,tx,sdir,fname,...
%           bpa,indiv,[len_bin,len_dist],[angle_mean,angle_std],nb_freq);

% Rayleigh
bbechopdf(N(iN),mix_r,ns,gate_len,tx,sdir,'rayleigh',[],0);
%model_n_scat_freqdep_bp_mixed_freqdomain(N(iN),mix_r,ns,gate_len,3,0,...
%                                         1,sdir,'rayleigh_old_routine');

% Prolate spheroid
bbechopdf(N(iN),mix_r,ns,gate_len,tx,sdir,'prosph_0.5',...
          [],2,0.5);

% Fish, empirical length distribution
bbechopdf(N(iN),mix_r,ns,gate_len,tx,sdir,'fish_defaultLenDistr_defaultAngleDistr',...
          [],1,[],[]);
%bbechopdf(N(iN),mix_r,ns,gate_len,tx,sdir,'fish_defaultLenDistr_mean0_std5',...
%          [],1,[],[0,5]);
%bbechopdf(N(iN),mix_r,ns,gate_len,tx,sdir,'fish_defaultLenDistr_mean0_std10',...
%          [],1,[],[0,10]);
%bbechopdf(N(iN),mix_r,ns,gate_len,tx,sdir,'fish_defaultLenDistr_mean0_std20',...
%          [],1,[],[0,20]);
%bbechopdf(N(iN),mix_r,ns,gate_len,tx,sdir,'fish_defaultLenDistr_mean0_std40',...
%          [],1,[],[0,40]);

end