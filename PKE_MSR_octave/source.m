# Get source value from input file for some t.
# Not general purpose. Only compatible with this project.


function S=source(t)
  S=0;
  if (t>input_data(nrows,1))
    rho=input_data(nrows,3);
  else
    for i = 1:nrows-1
      if (t>=input_data(i,1) & t<=input_data(i+1,1))
        S=input_data(i,3);
        break
        else
          continue
      endif
    endfor
  endif
endfunction
