# PROBLEM 3.1.3 
# Lake Etsitty adapted this into bicgstab code 
# from Professor Fitzgerald's cg code

function bigstab( A, b, x0 ; tol=1e-3, maxIter=2*length(b)^2, verbose=true)

    iter = 0
    r = b - A*x0
    if norm(r) <= tol
        return (x0,0)
    end

    p = copy(r)
    x = copy(x0)
    # add the r0
    r0 = copy(r)

    flag = 0
    while flag == 0
        iter += 1

        # Edited the following 
        z = A*p
        α = (r'*r0)/( p'*r0 )
        s = r - α*A*p
        z2 = A*s
        omega = (z2'*s)/(z2'*z2)
        x += α*p + omega*s
        r1 = s - omega*A*s
        # EDIT COMPLETE

        if verbose
            @printf("iter=%3d, |res|=%.3e\n", iter, norm(r1))
        end

        if norm(r1) <= tol
            return x, iter
        elseif iter >= maxIter
            error("Failed to converge")
        end

        # A FEW MORE EDITS
        β = (α/omega)*((r1'*r1)/(r'*r))
        r = copy(r1)
        p = r + β*(p - omega*A*p)
        # EDITS DONE

    end

end


