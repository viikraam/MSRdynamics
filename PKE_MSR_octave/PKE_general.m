#{

Point Kinetics Equation (PKE) solver for education and research purposes.

Author: Vikram Singh, viikraam@gmail.com
Supervisor: Dr. Ondrej Chvala, 
Dept. of Nuclear Engineering, UTK, ochvala@utk.edu

This program takes an input file with time (in s), reactivity, and external 
neutron source as three columns and returns plots for n(t) and C_i(t) 
for i=1,2,...6

#}
################################################################################

# Ask for user unput on fuel type. Options: U233, U235 or MSBR; case insensitive.
x=[""]; # initialize string array

while (strcmp(x,""))
    x=input("Select fuel. Options are U233, U235, or MSBR   ","s")
    if (strcmpi("U233",x)==1 || strcmpi("U235",x)==1 || strcmpi("MSBR",x)==1)
        break
    else
        disp("Please try again!")
        x=[""]
    endif
endwhile


# Delayed neutron lifetimes 'beta' for the six precursor groups depending on 
# fuel type. B = sum(bet). Retrieved from ORNL-MSR-67-102
if (strcmpi("U233",x)==1)
  bet = [0.00023,0.00079,0.00067,0.00073,0.00013,0.00009]';
  B   = sum(bet);
  elseif (strcmpi("U235",x)==1)
    bet = [0.000215,0.00142,0.00127,0.00257,0.00075,0.00027]';
    B   = sum(bet);
      elseif (strcmpi("MSBR",x)==1)
        bet = [0.000229,0.000832,0.000710,0.000852,0.000171,0.000102]';
        B   = sum(bet);
endif


# Decay constants for the corresponding decay groups
lam = [0.0126,0.0337,0.139,0.325,1.13,2.50]';


# Mean neutron generation time
L = 0.0005; 


# Initial values for n(t) and C_i(t)
nt    = 1.0;
Ct(1) = (bet(1)/(L*lam(1)))*nt;
Ct(2) = (bet(2)/(L*lam(2)))*nt;
Ct(3) = (bet(3)/(L*lam(3)))*nt;
Ct(4) = (bet(4)/(L*lam(4)))*nt;
Ct(5) = (bet(5)/(L*lam(5)))*nt;
Ct(6) = (bet(6)/(L*lam(6)))*nt;


# Read in input file. Formatted as time, reactivity, source.
input_data = dlmread('./reactivity.dat');
nrows      = rows(input_data,"r");
tmax       = input_data(nrows,1); # length of time for which to evaluate the equations

