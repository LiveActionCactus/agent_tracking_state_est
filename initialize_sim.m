function sys = initialize_sim()
%INITIALIZE_SYSTEM initialize simulation and agent states 
%
% Inputs:
%       None
%
% Outputs:
%       sys     : object containing simulation states
%

% sim properties
sys.sim_len = 10;           % simulation length (seconds)
sys.T = 0.1;                % simulation sampling rate (seconds)
sys.n = sys.sim_len/sys.T;  % samples in simulation

% initialize pose state -- agent 1
sys.state.x = 0;          % x-position (meters)
sys.state.y = 0;          % y-position (meters)
sys.state.theta = pi/4;     % heading (radians)
sys.input.speed = 1;        % speed (meters/sec)
sys.input.omega = 0;     % angular velocity (rads/sec)

% initialize robot specific model error params -- agent 1
sys.err.a1 = 0.1;       % linear velocity error
sys.err.a2 = 0.1;
sys.err.a3 = 0.1;       % angular velocity error
sys.err.a4 = 0.1;
sys.err.a5 = 0.1;       % final orientation error term
sys.err.a6 = 0.1;

% initialize logging -- agent 1
sys.log = zeros(3, (sys.n));    % agent 1 state logging

end