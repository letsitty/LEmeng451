# Lake Etsitty
# PROBLEM 3.1.3
# calling bicgstab_from_cg.jl
using LinearAlgebra
using Printf
include("bicgstab_from_cg.jl")

A = [ 4 -1 0 -1 0 0 0 0 0 ; -1 4 -1 0 -1 0 0 0 0 ; 0 -1 4 0 0 -1 0 0 0 ; -1 0 0 4 -1 0 -1 0 0 ; 0 -1 0 -1 4 -1 0 -1 0 ; 0 0 -1 0 -1 4 0 0 -1; 0 0 0 -1 0 0 4 -1 0 ; 0 0 0 0 -1 0 -1 4 -1 ; 0 0 0 0 0 -1 0 -1 4];
b = [75 ; 0 ;50 ;75 ;0 ;50; 175 ;100 ;150];
x0 = [0;0;0;0;0;0;0;0;0]

x, iter = bigstab(A,b,x0, verbose=true)
println("From BICGSTAB: ", x)

#did not yet show how solver converged