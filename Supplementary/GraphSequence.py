import sys
sys.path.append('/Users/lentz/Documents/GitHub_locals/my_py') # Mac
sys.path.append('/home/lentz/Documents/GitHub_locals/my_py') # Beta-Cl

import Gewindehammer as vz
import scipy as sc, networkx as nx


def sequence(n,p,c0,l0,nodes=1000,deg=10):
    # a sequence of graphs
    
    cs,ls=[],[]
    for i in range(n):
        G=nx.watts_strogatz_graph(nodes,deg,p)
        c=nx.average_clustering(G)/c0
        l=nx.average_shortest_path_length(G)/l0

        cs.append(c)
        ls.append(l)

    return (sc.mean(cs),sc.mean(ls))


if __name__=='__main__':
    
    G0=nx.watts_strogatz_graph(1000,10,0.0)
    c0=nx.average_clustering(G0)
    l0=nx.average_shortest_path_length(G0)
    
    rslt={}
    ps=[0.0001,0.0002,0.000333,0.000667,0.001,0.002,0.00333,0.00667,0.01,0.02,0.0333,0.0667,0.1,0.2,0.333,0.667,1.0]
    for p in ps:
        print p
        
        #G=nx.watts_strogatz_graph(1000,10,p)
        #c=nx.average_clustering(G)/c0
        #l=nx.average_shortest_path_length(G)/l0
    
        rslt[p]=sequence(100,p,c0,l0)
    
    vz.dict2file(rslt,'Watts_strogatz.txt')
        
    
