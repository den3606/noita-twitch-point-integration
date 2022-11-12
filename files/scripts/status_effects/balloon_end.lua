dofile_once("data/scripts/lib/utilities.lua")
dofile_once("mods/twitch-point-integration/files/scripts/lib/utilities.lua")

p("b e")

local player_entity_id = GetPlayerEntity()
if (player_entity_id == nil) then
  return
end

local x, y = EntityGetTransform(player_entity_id)

local character_platforming_component = EntityGetComponent(player_entity_id, "CharacterPlatformingComponent")

if (character_platforming_component ~= nil) then
  for _, component_id in ipairs(character_platforming_component) do
    ComponentSetValue(component_id, "pixel_gravity", "600")
  end
end

if (EntityHasTag(player_entity_id, "low_gravity") == true) then
  EntityRemoveTag(player_entity_id, "low_gravity")
end
