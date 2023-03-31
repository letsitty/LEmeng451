# Credits go to Professor Fitzgerald, he wrote this code, I only adjusted it.
# Edited by Lake Etsitty

using Pkg;
Pkg.activate(".");
using Plots

include("Spine.jl")
include("LagrangeInterp.jl")
# number of nodes
N = 11
X = LinRange(-1,1,N)
t = LinRange(0,pi,N)
X2 = -cos.(t)

f(x) = 1/(1+25*x^2)
Y = f.(X)
Y2 = f.(X2)

L1 = LagrangeInterp.interp(X,Y)
L2 = LagrangeInterp.interp(X2,Y2)
S2 = Spine.spinterp(X,Y)

scatter(X,Y, marker=3, label="control points", 
    xlabel="x", ylabel="f(x)")
scatter!(X2,Y2, marker=5, label="cheby nodes")
plot!(L1, -1, 1, label="Lagrange")
plot!(L2, -1, 1, label="Lagrange Cheby")
plot!(S2, -1, 1, label="NaN Cubic-Splines")
plot!(f, -1, 1, label="Original function")