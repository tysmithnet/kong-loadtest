return {
  no_consumer = false, -- this plugin is available on APIs as well as on Consumers,
  fields = {
    -- Describe your plugin's configuration's schema here.
    error_chance = { required = false, type = "number", default = 1000000 },
    error_delay = { required = false, type = "number", default = 0 },
    latency_chance = { required = false, type = "number", default = 1000000 },
    latency_delay = { required = false, type = "number", default = 0 }
  },
  self_check = function(schema, plugin_t, dao, is_updating)
    -- perform any custom verification
    return true
  end
}