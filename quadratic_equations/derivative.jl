function derivative(f)

    return function(x)

        # pick a small value for h
        h = x == 0 ? sqrt(eps(Float64)) : sqrt(eps(Float64)) * x

        # floating point arithmetic to avoid binary rounding errors
        xph = x + h
        dx = xph - x

        # evaluate f at x + h
        f1 = f(xph)

        # evaluate f at x
        f0 = f(x)

        # divide the difference by h
        return (f1 - f0) / dx
    end
end

derivative((x) -> x^2 + 2x + 3)
