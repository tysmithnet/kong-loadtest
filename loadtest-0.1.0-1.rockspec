package = "loadtest"
version = "0.1.0-1"
source = {
	url = "https://bitbucket.csod.com/scm/~tsmith/kong-loadtest-plugin.git"
}
dependencies = {

}
build = {
	type = "builtin",
	modules = {
		["kong.plugins.loadtest.handler"] = "handler.lua",
		["kong.plugins.loadtest.schema"] = "schema.lua"
	}
}