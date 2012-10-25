#! /usr/local/bin/python
#
import sys
sys.path.append('/Users/lentz/Documents/Physik/my_py') # Mac

import Gewindehammer as gwh
import numpy as np, networkx as nx, scipy as sc
from pprint import pprint

from scipy.integrate import odeint

def to_file(time,solution):
    #
    res={}
    for t1,w1 in zip(time,solution):
        res[t1]=(w1[0],w1[1],w1[2])    
    gwh.dict2file(res,'sir_single.txt')
    return

def sir(state,t,parameters):
    # SIR model
    #
    #
    s1,i1,r1=state
    pop=s1+i1+r1
    alph,gamm=parameters
    
    # the model
    f=[-alph*s1*i1/pop,alph*s1*i1/pop-gamm*i1,gamm*i1]
    return f


# Parameters
alpha=3.0
gamma=1.0


# Initial conditions
s0 = 299.0
i0 = 1.0
r0 = 0.0

# ODE solver parameters
abserr = 1.0e-8
relerr = 1.0e-6
stoptime = 30.0
numpoints = 250

# Create the time samples for the output of the ODE solver.
# I use a large number of points, only because I want to make
# a plot of the solution that looks nice.
t = [stoptime*float(i)/(numpoints-1) for i in range(numpoints)]

# Pack up the parameters and initial conditions:
p = [alpha,gamma]
w0 = [s0,i0,r0]

# Call the ODE solver.
wsol = odeint(sir,w0,t,args=(p,))#,atol=abserr,rtol=relerr)

# Print the solution.
for t1,w1 in zip(t,wsol):
    print t1,w1[0],w1[1],w1[2]

to_file(t,wsol)

