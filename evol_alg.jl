crossoverRate = 0.75

function individual_generate(interval)
	return rand(interval)
end

function population(population_size,interval)
	pop = 1:population_size	
	pop = [individual_generate(interval) for i = 1:population_size]
	return pop
end

function calculate_fitness(individual)
	x = individual 

	f = x * x + 2*x - 4 

	return f
end

function generate_fitness_population(pop)
   pop_fit = 1:length(pop)
   pop_fit = [calculate_fitness(pop[i]) for i = 1:length(pop)]

   return pop_fit
end

function offspring(pop)
	return similiar(pop)
end

function selection_pop(pop)
	select_p = [rand(pop) for i = 1:length(pop)/2]
	return select_p
end

function list_true(lst, i)
	lt = falses(1,length(lst))
	lt[i] = true
	return lt
end

function crossing(pop)
	offs = offspring(pop)
	off_index = randperm(len(pop))
	for i in 1:2:len(pop)
		j = (i == len(pop)) ? i-1 : i+1
		if rand() < crossoverRate
			offs[i], offs[j] =



end


function evolute_without_mt(pop_size,interval)
	p = population(pop_size,interval)

	while(length(p)>1)
		p = selection_pop(p)
	end

	return p

end

