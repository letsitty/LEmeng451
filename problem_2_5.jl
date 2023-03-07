# Lake Etsitty
using LinearAlgebra

# Before part five was created
# s = 10*[ 2. 5. 3. ; 5. 1. 4. ; 3. 4. 3.]

#PART FIVE
#showing here that the Von Mises Stress does not care about a rotation 5(a)
s_1 = 10*[ 2. 5. 3. ; 5. 1. 4. ; 3. 4. 3.]
Q = [ -1 0 0 ; 0 -1 0 ; 0 0 -1]
Q_t = transpose(Q)
s = Q_t*s_1*Q


# PART ONE
stress = eigvals(s)
# PART TWO
direction = eigvecs(s)
println("The stresses are, ", stress)
println("The directions are, ", direction)
# PART THREE
max_shear_stress = (stress[3,1] - stress[1,1])/2
println("The max shear stress is: ", max_shear_stress)

## Von Mises Time ##
# knowing the Tensile Yield Strength is 276 MPa from 
# https://www.glemco.com/capabilities/material-expertise/aluminum-6061-t6/

# PART FOUR

# using the values in s
von_1 = sqrt(0.5*((s[1,1]-s[2,2])^2 + (s[2,2]-s[3,3])^2 + (s[3,3]-s[1,1])^2 + 6*((s[1,2])^2 + (s[2,3])^2 + (s[3,1])^2)))
#display(von_1)
FOS_1 = 276/von_1
println("the factor of safety is ", FOS_1)

# using the principal stresses
von_2 = sqrt(0.5*((stress[1,1]-stress[2,1])^2 + (stress[2,1]-stress[3,1])^2 + (stress[3,1]-stress[1,1])^2))
#display(von_2)
FOS_2 = 276/von_2
println("the factor of safety is ", FOS_2)

# using the second invariant...
stress_2 = s - (1/3)*tr(s)*I
Jay_2 = 0.5*tr((stress_2)^2)
von_3 = sqrt(3*Jay_2)
#display(von_3)
FOS_3 = 276/von_3
println("the factor of safety is ", FOS_3)
#did not do 5(b) yet