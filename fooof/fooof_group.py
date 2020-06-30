import numpy as np
from scipy.io import loadmat, savemat

from fooof import FOOOFGroup
import matplotlib.pyplot as plt

#import csv

data = loadmat('name_of_.mat_savedfile') #load data u saved from matlab
#data = loadmat('hooman_allpeeps')

# Unpack data from dictionary, and squeeze numpy arrays
freqs = np.squeeze(data['frqclean']).astype('float')
psds = np.squeeze(data['avgpwr']).astype('float')
# ^Note: this also explicitly enforces type as float (type casts to float64, instead of float32)

fg = FOOOFGroup(peak_threshold=3.5,peak_width_limits=[3.0, 14.0])#, aperiodic_mode='knee'

fg.fit(freqs,psds,[0.2,290])
fg.plot()

fg.save_report('name_of_report')

#print(fg.group_results) #-> this just prints the values we are saving below.


r2 = fg.get_params('r_squared') #here it is visibly obvious what is happening.
savemat('r2.mat', {'r2' : r2})

exps = fg.get_params('aperiodic_params', 'exponent')
savemat('exps.mat', {'exps' : exps})

centerfrq = fg.get_params('peak_params','CF')
savemat('cfs.mat', {'cfs' : centerfrq})

offset = fg.get_params('aperiodic_params','offset')
savemat('offset.mat', {'offset' : offset})

#knee = fg.get_params('aperiodic_params','knee')
#savemat('knee.mat', {'knee' : knee})
