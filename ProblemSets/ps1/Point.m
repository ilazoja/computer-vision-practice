classdef Point < handle
    properties
        centre;
        radius;
    end
    methods (Access = public)
        function c = Point(centre, radius)
            assert(length(radius) == 1, 'Expected a scalar radius')
            assert(length(centre) == 2, 'Expected centre to be a 2-vector')
            
            c.centre = centre;
            c.radius = radius;
        end
    end
end