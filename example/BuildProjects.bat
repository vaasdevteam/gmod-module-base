premake5 --os=windows --file=BuildProjects.lua vs2019
premake5 --os=macosx --file=BuildProjects.lua gmake
premake5 --os=linux --file=BuildProjects.lua gmake
pause
