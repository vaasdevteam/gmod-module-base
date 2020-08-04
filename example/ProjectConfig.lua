vaas.project_name = 'vaas_example'	--Name of your module(don't worry about case sensetiveness, it converts it to lowercase to prevent fuckups)
vaas.serverside = true 			--true for a server module, false for clientside

vaas.solution_calls = {			--I ran into issues when originally updating this thing and replacing all the depricated flags.
	symbols'On',				--This isn't super necessary but rather than having to constnatly edit the BuildProject file
	editandcontinue'Off',			--I felt that adding these things here would make it alot easier for people having
	staticruntime'On',			--to change one of these for what ever purpose.
	vectorextensions'SSE'
}

vaas.configuration_calls = {		--Same reason as above with vaas.solution_calls
	optimize'On',
	floatingpoint'Fast'
}

vaas.release_flags = {		--Same reason as above with vaas.solution_calls
	--optimize'Speed',
	--floatingpoint'Fast'
}
vaas.debug_flags = {		--Same reason as above with vaas.solution_calls
	--optimize'Debug',
}

vaas.dependancies_folder = '../include/'--location of your includes folder(should be left alone but hey do what ever you want)
vaas.source_folder = 'src/'		--location folder of the modules source code
