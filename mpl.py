# %%
# Matplotlib Config
#==============================================================
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pgf import FigureCanvasPgf
from matplotlib.backend_bases import register_backend
register_backend('pdf', FigureCanvasPgf)
plt.style.use('pgf.mplstyle')
plt.tight_layout()
def center_spines(ax=None):
    if ax is None:
        ax = plt.gca()
    for spine in ax.spines.values():
        spine.set_position(('data', 0))
    return ax
# %%
# Plot Figure
#==============================================================
fig, ax = plt.subplots()
# %%
# Save Figure
#==============================================================
fig.savefig('fig.pdf', bbox_inches='tight', pad_inches=0.0)