import numpy as np
from scipy.io import loadmat, savemat

from fooof import FOOOF
import matplotlib.pyplot as plt


data = loadmat('name_of_.mat_savedfile') #ok so export power_spectrum from matlab after computing.

freqs = np.squeeze(data['frq'])
psd = np.squeeze(data['pow_channel'])

fm = FOOOF(peak_threshold=3.5,peak_width_limits=[3.0, 14.0])
fm.report(freqs, psd, [0.5, 290])

plt.show() #if u wanna see
