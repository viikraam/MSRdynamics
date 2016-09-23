# Function to calculate the n(t) and C_i(t) as a function of time.
# The parameters passed to the function are
# 1. t=time vector, 
# 2. y=initial values for n(t) and C_i(t), 
# 3. react=function to retrieve reactivity values, 
# 4. source=function to retrieve source values, 
# 5. bet=column vector with beta values, 
# 6. B=sum of all betas, 
# 7. lam=column vector of lambda values, 
# 8. L=mean neutron generation time.


function ndot=neudens(t,y,react,source,bet,B,lam,L)
  ndot(1) = source(t) + (((react(t)-B)/L)*y(1)) + (lam(1)*y(2)) + 
  (lam(2)*y(3)) + (lam(3)*y(4)) + (lam(4)*y(5)) + (lam(5)*y(6)) + (lam(6)*y(7));
  ndot(2) = ((bet(1)/L)*y(1)) - (lam(1)*y(2));
  ndot(3) = ((bet(2)/L)*y(1)) - (lam(2)*y(3));
  ndot(4) = ((bet(3)/L)*y(1)) - (lam(3)*y(4));
  ndot(5) = ((bet(4)/L)*y(1)) - (lam(4)*y(5));
  ndot(6) = ((bet(5)/L)*y(1)) - (lam(5)*y(6));
  ndot(7) = ((bet(6)/L)*y(1)) - (lam(6)*y(7));
endfunction
