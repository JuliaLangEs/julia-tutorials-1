
# time parameters
start_time = 0
end_time = 100

time_step = 1/4 # years
end_step = int(((end_time - start_time) / time_step))

# initialize populations
initial_rabbits = 30000
initial_foxes = 15

# model parameters
rabbits_killed_per_fox_birth = 1000
chance_a_rabbit_will_die_during_a_meeting = .5
chance_of_rabbit_and_fox_meeting = .02
rabbit_growth_rate = .2
fox_death_rate = .1

# initialize arrays
rabbits_over_time = fill(0.0, end_step + 1)
foxes_over_time = fill(0.0, end_step + 1)
model_time = fill(0.0, end_step + 1)

rabbits = initial_rabbits
foxes = initial_foxes

rabbits_over_time[1] = rabbits
foxes_over_time[1] = foxes

# run the model
for sim_step = 1:end_step

    # time from step
    sim_time = start_time + sim_step*time_step
    model_time[sim_step] = sim_time

    # calculate flows
    rabbit_births = rabbits * rabbit_growth_rate
    rabbits_eaten = min(rabbits, chance_a_rabbit_will_die_during_a_meeting * chance_of_rabbit_and_fox_meeting * foxes * rabbits)

    fox_births = 1/rabbits_killed_per_fox_birth * rabbits_eaten
    fox_deaths = foxes * fox_death_rate

    # update populations
    foxes = foxes + fox_births - fox_deaths
    rabbits = rabbits + rabbit_births - rabbits_eaten

    rabbits_over_time[sim_step+1] = rabbits
    foxes_over_time[sim_step+1] = foxes
end

println("Time, Rabbits (Thousands), Foxes")
for i = 1:end_step
    print(model_time[i])
    print(", ")
    print(rabbits_over_time[i]/1000)
    print(", ")
    println(foxes_over_time[i])
end
