-- assert(ngx.get_phase() == "timer", "The world is coming to an end!")
local responses = require "kong.tools.responses"
local plugin_name = ({...})[1]:match("^kong%.plugins%.([^%.]+)")
local plugin = require("kong.plugins.base_plugin"):extend()


-- constructor
function plugin:new()
  plugin.super.new(self, plugin_name)
  
end

function plugin:access(plugin_conf)
  plugin.super.access(self)

  local should_error = math.random(plugin_conf.error_chance)
  if(should_error == 1)
  then
    ngx.sleep(plugin_conf.error_delay)
    return responses.send(500, "oops")
  end
  local should_be_latent = math.random(plugin_conf.latency_chance)
  if(should_be_latent == 1)
  then
    ngx.sleep(plugin_conf.latency_delay)
  end
  
end 

function plugin:header_filter(plugin_conf)
  plugin.super.access(self)
  
end 

plugin.PRIORITY = 1000

return plugin