name = "Coloured Percent"
-- borrowed from IA
folder_name = folder_name or "workshop-"
if not folder_name:find("workshop-") then
    name = "[LOCAL] - " .. name
end

description = [[Changes the colour of the percent text in equipment based on durability to be more visible, or simply for preference! Configureable.]]

author = "Atobá Azul"

version = "1.4"

api_version = 10

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
hamlet_compatible = false

forge_compatible = false

all_clients_require_mod = false
client_only_mod = true
icon_atlas = "modicon.xml"
icon = "modicon.tex"

server_filter_tags = {}

priority = -10
 
------------------------------
-- local functions to makes things prettier

local function NumericalConfig(name, label, hover, default)
    local base_config = 	{
		name = name,
		label = label,
		hover = hover,
		options = {
            description = "x0", data = 0
		},
		default = default,
	}

    for i = 0, 100, 5 do--fucking table insert doesn't work in modinfo
        base_config.options[#base_config.options+1]= {
            description = "x"..i*0.01, data = i*0.01
        }
    end

    return base_config
end

local function Header(title)
	return { name = "", label = title, hover = "", options = { {description = "", data = false}, }, default = false, }
end

local function SkipSpace()
	return { name = "", label = "", hover = "", options = { {description = "", data = false}, }, default = false, }
end

local function BinaryConfig(name, label, hover, default)
    return { name = name, label = label, hover = hover, options = { {description = "Enabled", data = true, hover = "Enabled."}, {description = "Disabled", data = false, hover = "Disabled."}, }, default = default, }
end



------------------------------
configuration_options = {
    Header("100% Colours"),
    NumericalConfig("MaxR", "High: Red Value", "The red RGB value of items when the durability is high.", 0),
    NumericalConfig("MaxG", "High: Green Value", "The green RGB value of items when the durability is high.", 1),
    NumericalConfig("MaxB", "High: Blue Value", "The blue RGB value of items when the durability is high.", 0),
    SkipSpace(),
    Header("0% Colours"),
    NumericalConfig("MinR", "Low: Red Value", "The red RGB value of items when the durability is low.", 1),
    NumericalConfig("MinG", "Low: Green Value", "The green RGB value of items when the durability is low.", 0),
    NumericalConfig("MinB", "Low: Blue Value", "The blue RGB value of items when the durability is low.", 0),
}
