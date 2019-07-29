# from rpy2.robjects import r, pandas2ri
import csv

import numpy as np
# import pandas as pd
# pandas2ri.activate()
# r.data('trees')
# x=np.array(r['trees'])
# x1=pd.DataFrame(x)
data_path = '/Users/sib/PYTHON/trees.csv'
with open(data_path, 'r') as f:
    reader = csv.reader(f, delimiter=',')
    # get header from first row
    headers = next(reader)
    # get all the rows as a list
    data = list(reader)
    # transform data into numpy array
    x = np.array(data).astype(float)

print("\n Data Set = ", x,end='   ')
y=x[:,2].reshape(len(x),1)
X=np.hstack((np.ones((len(x),1)),x[:,(0,1)]))
def trans(M):
    return [[M[j][i] for j in range(len(M))] for i in range(len(M[0]))]
def mul(X,Y):
    result=np.empty((len(X),len(Y[0])))
    for i in range(len(X)):
        for j in range(len(Y[0])):
            result[i][j]=0.0
            for k in range(len(Y)):
                result[i][j] += X[i][k] * Y[k][j]
    return (result)
def det(M):
    return (np.linalg.det(M))

def inv(M):
    return (np.linalg.inv(M))
def eig(M):
    return (np.linalg.eig(M))

def chol(M):
    return (np.linalg.cholesky(M))

def cond(M):
    return (np.linalg.cond(M))

def rege(y,X,W=np.eye(len(y))):
    return (mul(inv(mul((trans(X)),mul(W,X))), mul(trans(X),mul(W,y))))
W=np.eye(len(y))
beta=rege(y,X,W)
err=[y[i]-mul(X,beta)[i] for i in range(len(y))]
sse=0.0
for e in err:
    sse += e**2
sigmasq =sse/ (len(y)-len(X[0]))    
sst=np.var(y)*len(y)
Rsq=1-(sse/sst)
print("\n Coeff. Vector= ", beta, "\n $\sigma^2 $ = ", sigmasq, "\n $R^2$ = ", Rsq,end='  ')
