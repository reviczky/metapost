/* $Id$ */

/* This file a quick method to test the lua interface, it just loads
 * and runs the lua script file at argv[1] in an interpreter with
 * the mp module preloaded. I need to do it this way because the 
 * primary tester in Hans Hagen who is on Windows, and the cross-compiler
 * doesn't know (or rather, I don't) how to build lua for a dynamic library.
 * 
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

extern void luaopen_mp (lua_State *L);

int main (int argc, char **argv){
  int status;
  lua_State *L;
  if ((argc!=2) || argv[1][0] == '-') {
	fprintf(stdout,"First and only argument should be a lua script.\n");
	return EXIT_SUCCESS;
  }
  L = lua_open();
  if (L==NULL) {
	fprintf(stderr,"Can't create the Lua state.");
	return EXIT_FAILURE;
  }
  luaL_openlibs(L);
  luaopen_mp(L);
  status = luaL_loadfile(L, argv[1]);
  if (status == 0) {
    status = lua_pcall(L, 0, 0, 0);
	if (status) {
	  fprintf(stderr,"call of %s failed: %s\n",argv[1], lua_tostring(L,-1));
	}
  } else {
	fprintf(stderr,"compile of %s failed\n",argv[1]);
  }
  lua_close(L);
  return (status ? EXIT_FAILURE : EXIT_SUCCESS);
}
