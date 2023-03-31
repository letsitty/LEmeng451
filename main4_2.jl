# Credits go to Professor Fitzgerald, he wrote this code, I only adjusted it.
# Edited by Lake Etsitty
using Pkg;
Pkg.activate(".");
using Plots

include("LagrangeInterp.jl")

X = [3, 4, 5]
X2 = [2, 3, 4, 5]
f(x) = (x^2)/(1+x^2)
#Y = f.(X)
Y = [0.9, 0.941176, 0.961538]
Y2 = [0.8, 0.9, 0.941176, 0.961538]

L1 = LagrangeInterp.interp(X,Y)
#guess high and check for the values to equal 0.93
display(L1(3.67297))
L2 = LagrangeInterp.interp(X2,Y2)
display(L2(3.61885))
display(f(3.64496))

scatter(X2,Y2, marker=3, label="control points", 
    xlabel="x", ylabel="f(x)")
plot!(L1, -1, 7, label="Lagrange 3-point (quad)")
plot!(L2, -1, 7, label="Lagrange 4-point (cubic)")
plot!(f, -1, 7, label="Original function")


#implementing Newton's method, iterate x_0 until error is to taste
x_0 = 3.7 #initial guess
function newton(x_0)
    f_prime(x) = (2*x)/((1+x^2)^2)
    x3 = x_0 + (0.93-f(x_0))/f_prime(x_0)
    error = f(x3) - 0.93
    if abs(error) < 0.0000000000001
        return x3
    else 
        x4 == x3
        newton(x4)
    end
    display(x4)
end

display(x3)
display(error)