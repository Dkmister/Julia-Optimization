using Evolutionary

utility = [10,20,30,10,10,20]
mass =    [1, 4 , 5,4, 5,6]

function sum_mass(n::Vector{Bool})
    sum(mass . * n)
end

function objective(n::Vector{Bool} )
    (sum_mass(n) <= 20) ? sum(utility .* n) : 0
end

best, invbestfit, generations, tolerance, history = ga(
    x -> 1/objective(x),
    6 ,# Chromosse length
    initPopulation = collect(randbool(6)),
    selection = roulette, 
    mutation = inversion,
    crossover = singlepoint,
    mutationRate = 0.2,
    crossoverRate = 0.5,
    ɛ = 0.1, # Elitism
    debug = false,
    verbose = false,
    iterations = 200,
    populationSize = 50,
    interim = true
);

println(best)