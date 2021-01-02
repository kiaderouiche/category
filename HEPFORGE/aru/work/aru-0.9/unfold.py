#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import numpy as np
from matplotlib import pyplot as plt
from math import *
from utils import *
from aru import *
from kernel import MyKernel

def GetData(inputFileName):
  from ROOT import TFile
  ntuple = TFile.Open(inputFileName).GetListOfKeys()[0].ReadObj()
  data = np.empty(ntuple.GetEntries())
  for i in xrange(ntuple.GetEntries()):
    ntuple.GetEntry(i)
    data[i] = ntuple.GetArgs()[0]
  return data

# data.root contains the raw data as a TNtupleD with a single branch
print "reading data..."
data = GetData("data.root")

# replace implementation of MyKernel by a proper kernel
kernel = MyKernel()

# x-range to be unfolded, may be set to other values
xmin = np.min(data)
xmax = np.max(data)

# customize number of knots (use a sufficiently large number) and their positions
nKnots = 20
xknots = np.linspace(xmin,xmax,nKnots)

# main program, encapsulated in ARU object
print "unfolding..."
aru = ARU(kernel, ToVector(xknots))
c_coefs, c_cov = aru.Unfold(ToVector(data))
unfolded = aru.GetUnfoldedSpline()
folded = aru.GetFoldedSpline()
c_refCoefs = aru.GetReferenceCoefficients()

coefs = Extract(c_coefs)
cov = Extract(c_cov)

# draw everything

xs = np.linspace(xmin,xmax,200)

yprior    = np.vectorize(lambda x: unfolded(c_refCoefs,x))(xs)
yfitted   = np.vectorize(lambda x: folded  (c_coefs,x))(xs)
yunfolded = np.vectorize(lambda x: unfolded(c_coefs,x))(xs)

from matplotlib.patches import Polygon
poly = Polygon(MakeSigmaPatch(unfolded, c_coefs, cov, xknots), closed=True)
poly.set(ec="b",fc="b",alpha=0.1,fill=True,zorder=0)
plt.gca().add_patch(poly)

plt.plot(xs,yprior,"y",lw=2,label="$g(x)$",zorder=1)

plt.plot(xs,yfitted,"r",lw=1,label="$f(y)$",zorder=2)

plt.plot(xs,yunfolded,"b",lw=2,label="$b(x)$",zorder=2)

xh, w, werr = GetScaledHistogram(data,bins=20,range=(xmin,xmax))
plt.errorbar(xh,w,werr,fmt="ko",capsize=0,label="data",zorder=3)

plt.ylim(ymin=0)
plt.xlim(xmin,xmax)
plt.xlabel("x")
plt.ylabel(r"$N_\mathrm{data} \times p.d.f.$")
plt.legend(loc="upper left")
plt.show()
