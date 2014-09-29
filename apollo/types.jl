module types

export Body, Moon, Command_Module, EarthMoonSystem

type Body{T}
    mass::T
    velocity::Vector{T}
    radius::T
    position::Vector{T}
end

# Create a new type, Moon
# Moon has all the attributes of Body, but is treated as its own type
typealias Moon Body

type Command_Module{T}
    mass::T
    velocity::Vector{T}
    radius::T
    position::Vector{T}
    positionE::Vector{T}
    positionH::Vector{T}
    velocityE::Vector{T}
    velocityH::Vector{T}
end

type EarthMoonSystem
    time::Float64
    earth::Body
    moon::Moon
    command_module::Command_Module
end

end
