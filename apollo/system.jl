
function update(me::EarthMoonSystem, time::Float64, h::Float64)

    me.time = time # set time of system
    update(me.moon, time) # update moon
    update(me.command_module, time) # update command module

    return me
end
