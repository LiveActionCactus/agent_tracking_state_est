clear all
close all

sys = initialize_sim();
sys = run_sim(sys);


%% Plot / Analyze results

t = 0:sys.T:sys.sim_len;

figure()
plot(sys.log(1,:), sys.log(2,:))
title("Position over time")
xlabel("x")
ylabel("y")
axis([0 10 0 10])

figure()
plot(t,sys.log(3,:))
title("Heading over time")
xlabel("Time (t)")
ylabel("Heading (rad)")
axis([0 sys.sim_len 0 2*pi])