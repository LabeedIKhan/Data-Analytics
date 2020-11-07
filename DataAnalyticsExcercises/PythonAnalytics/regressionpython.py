
import numpy
import matplotlib.pyplot as plt
from scipy import stats

xreg = [74,14,52,85,85,56,45,78,51,53,95,61,43,81,92,75,73,25,36,81,37,49]
yreg = [45,65,37,45,75,95,91,43,61,73,94,53,63,41,58,91,64,49,46,73,75,45]

xbft = [41,74,46,94,72,15,49,35,73,16,49,43,59,74,19,74]
ybft = [94,92,93,49,73,74,71,94,74,19,73,74,92,93,71,82]


xpr = [1,2,3,5,6,7,8,9,10,11,12,13,14,15,16]
ypr = [100,95,92,89,85,81,79,74,71,76,79,84,92,98,100]


def RunData():

    slope, intercept, r, p , std_err = stats.linregress(xreg,yreg)

    def equation(x):
        return slope * x + intercept

    speedpred = equation(10)

    print(speedpred)

    mymap = map(equation,xreg)

    model = list(mymap)

    plt.scatter(xreg, yreg)

    plt.plot(xreg, model)

    plt.show()

def BadFitExample():

    slope, intercept, r, p , std_err = stats.linregress(xbft,ybft)

    def predict(x):
        return slope* x + intercept

    mymap = map(predict,xbft)

    model = list(mymap)

    plt.scatter(xbft, ybft)

    plt.plot(xbft, model)

    plt.show()

def RunPrExample():

    print(len(xpr), len(ypr))

    plt.scatter(xpr,ypr)

    plt.show()

if __name__ == '__main__':
    RunData()
    BadFitExample()
    RunPrExample()