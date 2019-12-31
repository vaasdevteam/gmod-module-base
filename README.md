gmod-module-base
================
Technically everything you need is in include. 

Example contains an example project. Running BuildProjects.bat requires premake5 (https://premake.github.io/download.html).
The example folder contains a ProjectConfig.lua which is meant to make the setting up of your project much easier for some people.
Most config options won't matter to you unless you know what your doing with them, the important portions are the source code folder, if its server side, client or shared and the project name.


The generated dlls should be placed in:
garrysmod/lua/bin/

They should also be named approriately:
gmsv_vaas_example_win32.dll     <- require('vaas_example') serverside on windows
gmsv_vaas_example_linux.dll     <- require('vaas_example') serverside on linux
gmsv_vaas_example_osx.dll       <- require('vaas_example') serverside on osx

gmcl_vaas_example_win32.dll     <- require('vaas_example') clientside on windows
gmcl_vaas_example_osx.dll       <- require('vaas_example') clientside on osx

gm_vaas_example_win32.dll       <- require('vaas_example') clientside on windows, be sure to name it to either gmcl_ or gmsv_ first
gm_vaas_example_linux.dll       <- require('vaas_example') clientside on linux, be sure to name it to either gmcl_ or gmsv_ first
