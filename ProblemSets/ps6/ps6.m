videos = {'pres_debate.avi'; 'noisy_debate.avi'; 'pedestrians.avi'};
txtFiles = {'pres_debate.txt'; 'noisy_debate.txt'; 'pedestrians.txt'; 'pres_debate_hand.txt'};

%% 1. Particle Filter Tracking

pf_tracker(videos{1,1}, txtFiles{1,1}, 'framesToSave', [28, 74, 144], 'infix', '1-a', 'playVideo', true, 'numParticles', 100, 'dimensions', 2, 'control', 10, 'simstd', 20, 'alpha', 0)