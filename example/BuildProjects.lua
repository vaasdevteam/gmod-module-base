local project_name = 'vaas_example'
local serverside = true
local solution_calls = {
	symbols'On',
	editandcontinue'Off',
	staticruntime'On',
	vectorextensions'SSE'
}
local configuration_calls = {
	optimize'On',
	floatingpoint'Fast'
}
local dependancies_folder = '../include/'
local source_folder = 'src/'


local lua_state = 'gmsv_'
if serverside == false then
	lua_state = 'gmcl_'
end

solution(lua_state..project_name)
	language'C++'
	location(os.target()..'-'.._ACTION)
	flags{'NoPCH'}

	for k,v in pairs(solution_calls)do
		solution_calls.v()
	end
	
	targetdir('lib/'..os.target()..'/')
	includedirs{dependancies_folder}
	
	configurations
	{ 
		'Release'
	}
	
	configuration'Release'
		defines{'NDEBUG'}
		for k,v in pairs(configuration_calls)do
			configuration_calls.v()
		end

	project(lua_state..project_name)
		defines{'GMMODULE'}
		files{source_folder..'**.*',dependancies_folder..'**.*'}
		kind'SharedLib'
