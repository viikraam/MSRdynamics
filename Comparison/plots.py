from pylab import *
import matplotlib.pyplot as plt
import numpy as np

diff = np.loadtxt('difference.txt',unpack=True)

index = np.arange(0,15.1,0.1)
plt.bar(index,diff,0.1)
plt.xlabel('Time [s]')
plt.ylabel('% Difference')
plt.title('Delta% C2(t) - U233 Pulse insertion')
show()
