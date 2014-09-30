using queuingSystem

# Model times
warm_up_time = 4320. # in s
run_time = 20160. # in s

# Standard deviation = mean * coefficient of variance
coeff_of_variance = 1

# Average arrival time
mean_iat = 3. # in s

# Average length of service
mean_los = 9. # in s

# Number of servers
num_servers = 4


# Standard deviation in length of service
std_dev_los = mean_los * coeff_of_variance

# Standard deviation in arrival time
std_dev_iat = mean_iat * coeff_of_variance

# Initialize vectors for arrival and service times
arrival_times = Float64[]
service_times = Float64[]

max_arrivals = 15000 # simulate no more than 15,000 customers
prev_arrival = 0 # first arrival is at time = 0

# Generaterandom numbers to represent arrival and service times
for i = 1:max_arrivals

    prev_arrival = random_gaussian(mean_iat, std_dev_iat)
    prev_los = random_gaussian(mean_los, std_dev_los)

    # Push random values into the arrays
    arrival_times = push!(arrival_times, prev_arrival)
    service_times = push!(service_times, prev_los)
end

# Create queuing system
qs = Queuing_System(arrival_times, service_times, warm_up_time, run_time, num_servers)

# Run simulation
run_to_end(qs)
