# Lake Etsitty
# SOR function adapted from Professor Fitzgerald's
# gauss-seidel function

function SOR_from_gs(nx,ny, tol, maxIter, T0; verbose=false)

    T = copy(T0)
    residuals = zeros(nx,ny)
    # ADD omega FOR SOR
    omega = 1.4
    # ADD END
    flag = 0
    iter = 0

    while flag == 0
        iter += 1 # iter = iter + 1

        # SOR
        for i = 2:nx-1
            for j = 2:ny-1
                # EDITING THIS FOR GS to SOR
                T_0 = copy(T)
                T[i,j] = 1/4*( T[i+1,j] + T[i-1,j] + T[i,j+1] + T[i,j-1])
                # KEY LINE
                T[i,j] = (1 - omega)*T_0[i,j] .+ omega*T[i,j]
                # ^ KEY LINE
                
            end
        end
        
        for i = 2:nx-1
            for j = 2:ny-1
                residuals[i,j] = T[i+1,j] + T[i-1,j] + T[i,j+1] + T[i,j-1] - 4*T[i,j]
            end
        end

        if verbose
            @printf("iter=%3d, |res|=%.3e\n", iter, norm(residuals))
            
        end

        if norm(residuals) <= tol
            flag = 1
        elseif iter >= maxIter
            flag = -1
            error("Failed to converge")
        end
    end

    return (T, iter)

end
