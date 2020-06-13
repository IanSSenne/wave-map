say loaded!
scoreboard objectives add LANG_MC_INTERNAL dummy
scoreboard objectives add lobby_stats dummy
scoreboard objectives add game_config dummy
team add playing
team modify playing color red
team add spectating
team modify spectating color gray
tp @e[type=!player] 0 -2000 0
kill @e[type=!player]
summon minecraft:area_effect_cloud 0.5 34 16.5 {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["text"], CustomNameVisible: 1b, CustomName: '[{"text": "Join Game","color":"red"}]'}
summon minecraft:area_effect_cloud 0.5 34 -15.5 {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["text"], CustomNameVisible: 1b, CustomName: '[{"text": "Spectate","color":"white"}]'}
summon minecraft:area_effect_cloud -14.50 34.5 0.5 {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["text"], CustomNameVisible: 1b, CustomName: '[{"text": "Difficulty:","color":"white"}]'}
summon minecraft:area_effect_cloud -14.50 34 0.5 {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["text", "difficulty-display"], CustomNameVisible: 1b, CustomName: '[{"text": "Easy","color":"green"}]'}
summon minecraft:magma_cube 0 40 0 {NoGravity: 1b, Silent: 1b, NoAI: 1b, ActiveEffects: [{Id: 14b, Amplifier: 1b, Duration: 199999998, ShowParticles: 0b}], Tags: ["spectator-exit"], CustomName: '[{"text": "exit spectator","color":"gold"}]', Size: 5}
summon minecraft:item_frame -13.5 33.00 0.5 {Facing: 5b, Invulnerable: 1b, Item: {id: "minecraft:arrow", Count: 1b}, ItemRotation: 0b, Tags: ["difficulty-selector"]}