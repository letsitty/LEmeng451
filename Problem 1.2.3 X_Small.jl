## Problem 1.2.2 LAKE ETSITTY MENG451
for a = [0.000005 0.000001]
    for i = 0:8
        function dff2(c)
            # Equation 1
            x3 = c.^(-0.5)
            # Equation 2
            x4 = -2*log10((a/3.7).+(2.51/((2.322964*9^i+3991).*(c^(0.5)))))
            # (2.322964*9^i+3991) -> covers the range that we need
            if -0.002 <= ( x3 - x4 ) <= 0.002
                return x3
            else 
                # if not equal, iterate the variable c
                dff2(c*1.001) # [the iterative process]
        end
    end
        # play around with the inputs below to make it work
        output2 = dff2(0.00065)
        darcy2 = (1/output2)^2
        display(darcy2)
end      
end 