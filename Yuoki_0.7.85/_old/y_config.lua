-- Tweaking energy_source of Form-press and Crusher.  Change to true to make them electric.  The default is false.
electric_Form_press = false
electric_Crusher = false

if data.raw["assembling-machine"]["y-heat-form-press"] and electric_Form_press then
   data.raw["assembling-machine"]["y-heat-form-press"].energy_source = {type = "electric", input_priority = "secondary", usage_priority = "secondary-input", emissions = 0.05}
   data.raw["assembling-machine"]["y-heat-form-press"].energy_usage = "475kW"
end

if data.raw["assembling-machine"]["y-crusher"] and electric_Crusher then
   data.raw["assembling-machine"]["y-crusher"].energy_source = { type = "electric", input_priority = "secondary", usage_priority = "secondary-input",emissions = 0.02,}
   data.raw["assembling-machine"]["y-crusher"].energy_usage = "125kW"
end