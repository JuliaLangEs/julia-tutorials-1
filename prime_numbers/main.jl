function is_prime(n::Int64)

    # check for 1, 2, 3
    if n <= 3
        return true
    end

    # check if number is even
    if n % 2 == 0
        return false
    end

    # initialize counter variable
    i = 3

    # only need to check til sqrt(n)
    while i <= sqrt(n)

        # check for divisibility
        if n % i == 0
            return false
        end

        i += 2
    end

    # otherwise the number is prime
    return true
end

function is_divisible(n, i)
    return n % i == 0
end

println(is_prime(100))
println(is_prime(17))
