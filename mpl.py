# %%
# Matplotlib Config
#==============================================================
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pgf import FigureCanvasPgf
from matplotlib.backend_bases import register_backend
register_backend('pdf', FigureCanvasPgf)
plt.style.use('tex.mplstyle')
plt.tight_layout()
