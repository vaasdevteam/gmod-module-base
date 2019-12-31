vaas = {}
include'ProjectConfig.lua'	--Includes the config

local lua_state			--Auto handles project namming
if vaas.serverside == false then
	lua_state = 'gmcl_'
elseif vaas.serverside == true then
	lua_state = 'gmsv_'
elseif vaas.serverside == 'shared' then
	lua_state = 'gm_'	--You will still have to rename it later
end

solution(string.lower(lua_state..vaas.project_name))
	language'C++' --What language is the project(this might end up moving to the config, but fuck C#.)

	architecture'x86_64'	--Support that damn update facepunch is insistant on doing?

	location(os.target()..'-'.._ACTION)
	flags{'NoPCH'}

	for k,v in pairs(vaas.solution_calls)do	--Applies Flags from the table for easy configuration
		vaas.solution_calls.v()
	end
	
	targetdir('lib/'..os.target()..'/')
	includedirs{vaas.dependancies_folder}	--Handles dependancies folder from the config
	
	configurations
	{ 
		'Release'
	}
	
	configuration'Release'
		defines{'NDEBUG'}
		for k,v in pairs(vaas.configuration_calls)do	--Flag handling
			vaas.configuration_calls.v()
		end

	project(string.lower(lua_state..vaas.project_name))	--Name automatically converted to lower case to prevent stupid issues
		defines{'GMMODULE'}
		files{vaas.source_folder..'**.*',vaas.dependancies_folder..'**.*'}--Handles the source folder from the config
		kind'SharedLib'
