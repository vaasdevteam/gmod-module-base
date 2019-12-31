vaas = {}
include'ProjectConfig.lua'	--Includes the config


--You shouldn't mess with much below, most should be handled in the config file. Proceed below at own risk

--Auto handles project namming and file name output
local lua_state
if vaas.serverside == false then
	lua_state = 'gmcl_'
elseif vaas.serverside == true then
	lua_state = 'gmsv_'
elseif vaas.serverside == 'shared' then
	lua_state = 'gm_'
else
	print"You didn't set vaas.serverside properly in the config file!!!"
end
if os.target() == 'windows' then
	targetsuffix'_win32'
elseif os.target() == 'macosx'then
	targetsuffix'_osx'
elseif os.target() == 'linux' then
	targetsuffix'_linux'
else
	print'unknown target OS, wtf?'
end


workspace(string.lower(lua_state..vaas.project_name))
	configurations{'Release','Debug'}
	location(os.target()..'-'.._ACTION)

	project(string.lower(lua_state..vaas.project_name))	--Name automatically converted to lower case to prevent stupid issues
		kind'SharedLib'
		architecture'x86_64'	--Support that damn update facepunch is insistant on doing?	
		language'C++' --What language is the project(this might end up moving to the config, but fuck C#.)
		includedirs{vaas.dependancies_folder}	--Handles dependancies folder from the config
		targetdir('lib/'..os.target()..'/')

		defines{'GMMODULE'}

		flags{'NoPCH'}
		for k,v in pairs(vaas.solution_calls)do	--Applies Flags from the table for easy configuration
			vaas.solution_calls.v()
		end

		configuration'Debug'
			for k,v in pairs(vaas.debug_flags)do	--Flag handling
				vaas.debug_flags.v()
			end
		configuration'Release'
			defines{'NDEBUG'}
			for k,v in pairs(vaas.release_flags)do	--Flag handling
				vaas.release_flags.v()
			end
		configuration{}

		files{vaas.source_folder..'**.*',vaas.dependancies_folder..'**.*'}--Handles the source folder from the config
