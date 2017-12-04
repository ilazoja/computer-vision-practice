classdef particle_filter
    properties
        model
        searchSpace
        numParticles
        stateDims
        controlstd
        simstd
        alpha
        particles
    end
    methods
        function obj = particle_filter(model, searchSpace, numParticles, stateDims, controlstd, simstd, alpha)
            obj.model = model;
            obj.searchSpace = searchSpace;
            obj.numParticles = numParticles;
            obj.stateDims = stateDims;
            obj.controlstd = controlstd;
            obj.simstd = simstd;
            obj.alpha = alpha;
               
            % initialize particles using a uniform distribution
            obj.particles = zeros(obj.numParticles, obj.stateDims);
            for i = 1:obj.stateDims
                obj.particles(:,i) = obj.searchSpace(i) .* rand(obj.numParticles, 1);
            end
            
        end
    end
end