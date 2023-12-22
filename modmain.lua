local GMCD = GetModConfigData

local minR = GMCD("MinR")
local maxR = GMCD("MaxR")

local minG = GMCD("MinG")
local maxG = GMCD("MaxG")

local minB = GMCD("MinB")
local maxB = GMCD("MaxB")

local env = env
GLOBAL.setfenv(1, GLOBAL)

--Thanks hornet!
local ItemTile = require('widgets/itemtile')
local _SetPercent = ItemTile.SetPercent

function ItemTile:SetPercent(percent, ...)
    _SetPercent(self, percent, ...)

    if percent ~= nil and percent <= 1 and self.percent ~= nil then -- < 1 for UM compat especifically, or any other mod really that decides to override durability colour above 100%
        --self.inst.item_lerp_percent = percent

        self.percent:SetColour({ Lerp(minR, maxR, percent), Lerp(minG, maxG, percent), Lerp(minB, maxB, percent), 1 })
    end

end

--[[
env.AddClassPostConstruct("widgets/itemtile", function(self, invitem)
    if self.percent then
        self.inst.percent_colour_task = self.inst:DoPeriodicTask(FRAMES, function(inst)
            if inst.item_lerp_percent ~= nil and inst.item_lerp_percent < 1 then
                self.percent:SetColour({ Lerp(minR, maxR, inst.item_lerp_percent), Lerp(minG, maxG, inst.item_lerp_percent), Lerp(minB, maxB, inst.item_lerp_percent), 1 })
            end
        end)
    end

    local _SetPercent = self.SetPercent

    function self:SetPercent(percent)
        _SetPercent(self, percent)
        if percent ~= nil then
            self.inst.item_lerp_percent = percent

            self.percent:SetColour({ Lerp(minR, maxR, percent), Lerp(minG, maxG, percent), Lerp(minB, maxB, percent), 1 })
        end
    end
end)
]]


