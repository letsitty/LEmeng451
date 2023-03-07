# Lake Etsitty
# 3.1.2 calling Success_And_Older_Relaxation_from_GS.jl

using Pkg; Pkg.activate(".")
using LinearAlgebra
using Printf
using Plots

# The Inputs
nx = 30
ny = nx
T_south = 0
T_east  = 50
T_north = 100
T_west  = 75

# initial guess
T0 = zeros(nx,ny)

## Apply BC
T0[:,1]   .= T_south
T0[end,:] .= T_east
T0[:,end] .= T_north
T0[1,:]   .= T_west

# Set the tolerance and maximum iterations
tol = 1e-6
maxIter = 5000

## SOR
include("Success_And_Older_Relaxation_From_GS.jl")
T, iter_gs = SOR_from_gs(nx,ny,tol, maxIter, T0, verbose=true)

## Plotting
x = LinRange(0,1,nx)
y = LinRange(0,1,ny)

contour(x,y,transpose(T),
    fill=true,
    aspect_ratio=:equal,
    levels=20,
    xlabel="x", ylabel="y")




