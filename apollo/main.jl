using Debug

using constants
using types
include("physics.jl")
include("moon.jl")
include("command-module.jl")
include("system.jl")

# initialize bodies
earth = Body(ME, [0., 0.], RE, ORIGIN)
moon = Moon(MM, [0., 0.], RM, moon_position(0.))
command_module = Command_Module(MCM, INITIAL_VELOCITY, 5., INITIAL_POSITION, INITIAL_POSITION, INITIAL_POSITION, INITIAL_VELOCITY, INITIAL_VELOCITY)
world = EarthMoonSystem(0., earth, moon, command_module)

@debug
function simulate()

    boost = 15. # in m/s
    position_list = Vector{Float64}[] # in m
    current_time = 1.
    h = .1 # initial step size in s
    h_new = h # adaptive step size of the next step in s
    mcc2_burn_done = false
    dps1_burn_done = false

    while current_time <= TOTAL_DURATION

        update(world, current_time, h)

        # reduce velocity if mcc2 burn fired
        if !mcc2_burn_done && current_time >= 101104
            println("mcc2_burn fired")
            world.command_module.velocity -= 7.04 / norm(world.command_module.velocity) * world.command_module_velocity
            mcc2_burn_done = true
        end

        # increase velocity for corrective boost
        if !dps1_burn_done && current_time >= 212100
            println("dps1_burn fired")
            world.command_module.velocity += boost / norm(world.command_module.velocity) * world.command_module.velocity
            corrective_burn_done = true
        end

        positionE = world.command_module.positionE
        positionH = world.command_module.positionH
        @bp
        velocityE = world.command_module.velocityE
        velocityH = world.command_module.velocityH

        error_amt = norm(positionE - positionH) + TOTAL_DURATION * norm(velocityE - velocityH)
        h_new = min(.5 * MARKER_TIME, max(.1, h * sqrt(TOLERANCE / error_amt))) # restrict step size to reasonable range

        current_time += h
        h = h_new

        push!(position_list, copy(world.command_module.position))
    end

    return position_list
end

println("starting")
@time pos = simulate()
println(typeof(pos))
writecsv("output.csv", pos)
