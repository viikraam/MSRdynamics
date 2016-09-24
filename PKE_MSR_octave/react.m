# Get reactivity value from input file for some t. 
# Not general purpose. Only compatible with this project.


function rho=react(t)
  rho=0;
  if (t>input_data(14,1))
    rho=input_data(14,2);
  else
    for i = 1:14-1
      if (t>=input_data(i,1) & t<=input_data(i+1,1))
        rho=input_data(i,2);
        break
        else
          continue
      endif
    endfor
  endif  
endfunction