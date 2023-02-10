function updated_sys = update_velocity_sampling(sys)
%UPDATE_VELOCITY_SAMPLING sample the velocity motion model to provide pose
%update
%
% Inputs:
%       sys     : sys object, contains whole simulation
%
% Outputs:
%       updates_sys     : updates sys states via sampling the vel model
%

    % expand relevant sys variables
    x = sys.state.x;
    y = sys.state.y;
    theta = sys.state.theta;
    s = sys.input.speed;
    w = sys.input.omega;

    % generate stochastic inputs
    s_hat = s + sample_norm_dist(sys.err.a1*(s^2) + sys.err.a2*(w^2));
    w_hat = w + sample_norm_dist(sys.err.a3*(s^2) + sys.err.a4*(w^2));
    gamma_hat = sample_norm_dist(sys.err.a5*(s^2) + sys.err.a6*(w^2));
    xt = (x + s_hat*cos(theta)*sys.T) - (s_hat/w_hat)*sin(theta) + (s_hat/w_hat)*sin(theta + w*sys.T);
    yt = (y + s_hat*sin(theta)*sys.T) + (s_hat/w_hat)*cos(theta) - (s_hat/w_hat)*cos(theta + w*sys.T);
    thetat = theta + w_hat*sys.T + gamma_hat*sys.T;
    thetat = mod(thetat, (2*pi));

    updated_sys.x = xt;
    updated_sys.y = yt;
    updated_sys.theta = thetat;

end