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


workspace(string.lower(lua_state..vaas.project_name))	--Name automatically converted to lower case to prevent stupid issues
	configurations{'Debug','Release'}
	platforms{'x86','x86-64'}
	location('os.target())

	project(string.lower(lua_state..vaas.project_name))
		kind'SharedLib'

		language'C++'	--What language is the project(this might end up moving to the config, but fuck C#.)
		includedirs(vaas.dependancies_folder) 	--Handles dependancies folder from the config
		targetdir'build'

		for k,v in pairs(vaas.solution_calls)do	--Applies Flags from the table for easy configuration
			vaas.solution_calls.v()
		end

		filter'platforms:x86'
			architecture'x86'
		filter'platforms:x64'
			architecture'x86_64'
		filter{}

		libdirs{vaas.dependancies_folder}
		configuration'Debug'
			links{'lua_shared.lib'}
			for k,v in pairs(vaas.debug_flags)do
				vaas.debug_flags.v()
			end
		configuration'Release'
			links{'lua_shared.lib'}
			for k,v in pairs(vaas.release_flags)do
				vaas.release_flags.v()
			end
		configuration{}

		files{vaas.source_folder..'**.*',vaas.dependancies_folder..'**.*'}--Handles the source folder from the config
