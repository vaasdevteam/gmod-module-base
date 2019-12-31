#include "GarrysMod/Lua/Interface.h"

using namespace GarrysMod;

int ExampleFunction(lua_State *state) {
  LUA->PushString("Hello from Example()!");

  return 1;
}

//Called when your module is opened
GMOD_MODULE_OPEN(){
  LUA->PushSpecial(Lua::SPECIAL_GLOB);
    LUA->PushString("ExampleFunction");
    LUA->PushCFunction(ExampleFunction);
  LUA->SetTable(-3);

  return 0;
}

//Called when your module is closed
GMOD_MODULE_CLOSE()
{
  return 0;
}
