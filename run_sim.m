function sys_update = run_sim(sys)
%RUN_SIM run full simulation for parameters given in sys
%
% Inputs:
%       sys     : simulation object
%
% Outputs:
%       sys     : simulation object update (fills log states w/ results)

for n = 1:(sys.n + 1)
    sys.log(:,n) = [
            sys.state.x;
            sys.state.y;
            sys.state.theta
            ];
    sys.state = update_velocity_sampling(sys);
%     disp(sys.state)
%     pause;
end

sys_update = sys;

end