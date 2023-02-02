
println("THE NUMERICAL SINE SOLUTIONS:")
for n = [0 1 2 3 4] # the powers of ten
    function sinlmao(m) # m is...

        x = m*10^n
        # ...whatever you want to multiply by the powers of ten

        # SHIFT CASE 1
        if x >= pi
                # SIGN ISSUES TOOK PLACE IN LINE 10
            x1 = x - (floor(x/pi))*pi
                # ^ where my sign issues originated from.
                # ^ using multiples of pi, not 2*pi
                # ^ so every answer I got was positive
                # ^ however, using multiples of pi allows for greater precision

            # pull the lever Kronk
            x2 = x1 - (x1^3)/(factorial(3)) + (x1^5)/(factorial(5)) - (x1^7)/(factorial(7)) + (x1^9)/(factorial(9)) - (x1^11)/(factorial(11)) + (x1^13)/(factorial(13))

                #  solving the sign issues
                if (x - floor(x/pi)*pi) < (x - floor(x/(2*pi))*2*pi)
                    x2 = -x2
                else 
                    x2 = x2
                end
                # sign issues solved

            println("for ", x , " the y-value is: ", x2)
                
        # SHIFT CASE 2
        elseif x <= -pi
            x1 = x - (ceil((x)/(pi)))*pi
            x2 = x1 - (x1^3)/(factorial(3)) + (x1^5)/(factorial(5)) - (x1^7)/(factorial(7)) + (x1^9)/(factorial(9)) - (x1^11)/(factorial(11)) + (x1^13)/(factorial(13))
                
                if (x - (floor((x)/pi))*pi) < (x - ((floor((x)/(2*pi)))*2*pi)) 
                x2 = x2
                else 
                x2 = -x2
                end  
            println("for ", x , " the y-value is: ", x2)

        # NO SHIFT REQUIRED (SMALL x) 
        else 
            x1 = x
            x2 = x1 - (x1^3)/(factorial(3)) + (x1^5)/(factorial(5)) - (x1^7)/(factorial(7)) + (x1^9)/(factorial(9)) - (x1^11)/(factorial(11)) + (x1^13)/(factorial(13))
            println("for ", x , " the y-value is: ", x2)
        end

    end
    # input your m here (what you want to multiply by the powers of ten)

    local input = sinlmao(-1)
    @time(sinlmao)
    # The End
end







