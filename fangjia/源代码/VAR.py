from statsmodels.tsa.vector_ar.var_model import VAR
from statsmodels.compat.python import (range, lrange, string_types, StringIO, iteritems,
                                cStringIO)

from collections import defaultdict

import numpy as np
import numpy.linalg as npl
from numpy.linalg import cholesky as chol, solve
import scipy.stats as stats
import scipy.linalg as L

from statsmodels.tools.decorators import cache_readonly
from statsmodels.tools.tools import chain_dot
from statsmodels.tools.linalg import logdet_symm
from statsmodels.tsa.tsatools import vec, unvec

from statsmodels.tsa.vector_ar.irf import IRAnalysis
from statsmodels.tsa.vector_ar.output import VARSummary

import statsmodels.tsa.tsatools as tsa
import statsmodels.tsa.vector_ar.output as output
import statsmodels.tsa.vector_ar.plotting as plotting
import statsmodels.tsa.vector_ar.util as util
import statsmodels.tsa.base.tsa_model as tsbase
import statsmodels.base.wrapper as wrap
import pandas as pd
import statsmodels.tsa.stattools as ts
import matplotlib.pyplot as plt

gz = pd.read_csv('终极数据.csv')
for i in gz.columns:
    result = ts.adfuller(gz[i],0,regression='ct')
    print(result)
gz = np.diff(gz,n=2,axis=0)
model = VAR(gz)
est = model.fit(maxlags=3)
print(est.summary())
irf = est.irf()
plt.figure()
irf.plot()
plt.show()
