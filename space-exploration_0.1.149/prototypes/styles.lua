local ui_width = 300
local margin_right = 20
local space_for_button = 36
data.raw["gui-style"]["default"]["space_platform_textfield"] = {
    width = ui_width - margin_right,
    type = "textbox_style",
}
data.raw["gui-style"]["default"]["space_platform_textfield_short"] = {
    width = ui_width - margin_right - space_for_button,
    type = "textbox_style",
}
data.raw["gui-style"]["default"]["space_platform_label"] = {
    width = ui_width - margin_right,
    parent= "label",
    type = "label_style",
    single_line = false,
}
data.raw["gui-style"]["default"]["space_platform_label_short"] = {
    width = ui_width - margin_right - space_for_button,
    parent= "label",
    type = "label_style",
    single_line = false,
}
data.raw["gui-style"]["default"]["space_platform_title"] = {
    width = ui_width - margin_right,
    parent= "label",
    type = "label_style",
    font = "default-large-semibold",
    single_line = false,
}
data.raw["gui-style"]["default"]["space_platform_title_short"] = {
    width = ui_width - margin_right - space_for_button,
    parent= "label",
    type = "label_style",
    font = "default-large-semibold",
    single_line = false,
}
data.raw["gui-style"]["default"]["space_platform_fieldset"] = {
    width = ui_width - margin_right,
    type = "frame_style",
    parent = "frame",
}
data.raw["gui-style"]["default"]["space_platform_container"] = {
    minimal_width = ui_width,
    type = "frame_style",
    parent = "frame",
}
data.raw["gui-style"]["default"]["space_platform_sprite_button"] = {
    type = "button_style",
    parent = "button",
    width = 32,
    height = 32,
    top_padding = 1,
    right_padding = 1,
    bottom_padding = 1,
    left_padding = 1,
}
data.raw["gui-style"]["default"]["space_platform_sprite_button_small"] = {
    type = "button_style",
    parent = "space_platform_sprite_button",
    width = 20,
    height = 20,
}
data.raw["gui-style"]["default"]["space_platform_button"] = {
    type = "button_style",
    parent = "button",
}
data.raw["gui-style"]["default"]["space_platform_progressbar_capsule"] = {
    type = "progressbar_style",
    parent = "progressbar",
    color = {
      r = 0/255,
      g = 255/255,
      b = 0/255
    }
}
data.raw["gui-style"]["default"]["space_platform_progressbar_sections"] = {
    type = "progressbar_style",
    parent = "progressbar",
    color = {
      r = 255/255,
      g = 255/255,
      b = 0/255
    }
}
data.raw["gui-style"]["default"]["space_platform_progressbar_fuel"] = {
    type = "progressbar_style",
    parent = "progressbar",
    color = {
      r = 233/255,
      g = 93/255,
      b = 0/255
    }
}
data.raw["gui-style"]["default"]["space_platform_progressbar_cargo"] = {
    type = "progressbar_style",
    parent = "progressbar",
    color = {
      r = 52/255,
      g = 107/255,
      b = 219/255
    }
}
data.raw["gui-style"]["default"]["space_platform_progressbar_integrity"] = {
    type = "progressbar_style",
    parent = "progressbar",
    color = {
      r = 233/255,
      g = 0/255,
      b = 0/255
    }
}
data.raw["gui-style"]["default"]["view_zone_button"] = {
    type = "button_style",
    vertical_align = "center",
    scale = 1,
    scalable = false,
    width = 300,
    height = 32,
    horizontally_stretchable = "off",
    vertically_stretchable = "off",
    horizontally_squashable = "off",
    vertically_squashable = "off",
    top_padding = 0,
    bottom_padding = 0,
    left_padding = 0,
    right_padding = 0,
    top_margin = 0,
    bottom_margin = 0,
    left_margin = 0,
    right_margin = 0,
}
data.raw["gui-style"]["default"]["view_zone_button_flow"] = {
    type = "horizontal_flow_style",
    vertical_align = "center",
    scale = 1,
    scalable = false,
    width = 300,
    height = 32,
    horizontally_stretchable = "off",
    vertically_stretchable = "off",
    horizontally_squashable = "off",
    vertically_squashable = "off",
    top_padding = 0,
    bottom_padding = 0,
    left_padding = 0,
    right_padding = 0,
    top_margin = 0,
    bottom_margin = 0,
    left_margin = 0,
    right_margin = 0,
}
data.raw["gui-style"]["default"]["view_zone_button_label"] = {
    type = "label_style",
    scale = 1,
    scalable = false,
    width = 200,
    height = 32,
    horizontally_stretchable = "off",
    vertically_stretchable = "off",
    horizontally_squashable = "off",
    vertically_squashable = "off",
    top_padding = 0,
    bottom_padding = 0,
    left_padding = 0,
    right_padding = 0,
    top_margin = 0,
    bottom_margin = 0,
    left_margin = 0,
    right_margin = 0,
}
data.raw["gui-style"]["default"]["view_zone_button_sprite"] = {
  type = "button_style",
  parent = "map_generator_preview_button",
  icon_horizontal_align = "left",
  width = 300
}

--icon_horizontal_align = "left",
