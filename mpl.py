# %%
# Matplotlib Config
#==============================================================
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pgf import FigureCanvasPgf
from matplotlib.backend_bases import register_backend
register_backend('pdf', FigureCanvasPgf)
plt.style.use('pgf.mplstyle')
plt.tight_layout()
# %%
# Plot Figure
#==============================================================
fig, ax = plt.subplots()
# %%
# Save Figure
#==============================================================
fig.savefig('fig.pdf', bbox_inches='tight')