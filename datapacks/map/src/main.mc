function load{
    !dev{
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
    }
}

function tick{
    execute if entity @a[x=-16,z=-16,dx=32,dz=32] run{
        scoreboard players set playing lobby_stats 0
        scoreboard players set unassigned lobby_stats 0
        scoreboard players set spectating lobby_stats 0
        execute as @a[team=playing] run scoreboard players add playing lobby_stats 1
        execute as @a[team=spectating] run scoreboard players add spectating lobby_stats 1
        execute as @a unless entity @s[team=playing] unless entity @s[team=spectating] run scoreboard players add unassigned lobby_stats 1
        execute store result score difficulty game_config run data get entity @e[tag=difficulty-selector,limit=1] ItemRotation 1
        execute if score difficulty game_config matches 0 run data modify entity @e[tag=difficulty-display,limit=1] CustomName set value '[{"text": "Easy","color":"green"}]'
        execute if score difficulty game_config matches 1 run data modify entity @e[tag=difficulty-display,limit=1] CustomName set value '[{"text": "Medium","color":"yellow"}]'
        execute if score difficulty game_config matches 2 run data modify entity @e[tag=difficulty-display,limit=1] CustomName set value '[{"text": "Hard","color":"red"}]'
        execute if score difficulty game_config matches 3 run data modify entity @e[tag=difficulty-display,limit=1] CustomName set value '[{"text": "Extra Hard","color":"dark_red"}]'
        execute if score difficulty game_config matches 4 run data modify entity @e[tag=difficulty-display,limit=1] CustomName set value '[{"text": "Challenge","color":"gold"}]'
        execute if score difficulty game_config matches 5 run data modify entity @e[tag=difficulty-display,limit=1] CustomName set value '[{"text": "reserved for future update!","color":""}]'
        execute if score difficulty game_config matches 6 run data modify entity @e[tag=difficulty-display,limit=1] CustomName set value '[{"text": "reserved for future update!","color":""}]'
        execute if score difficulty game_config matches 7 run data modify entity @e[tag=difficulty-display,limit=1] CustomName set value '[{"text": "reserved for future update!","color":""}]'
    }
    effect give @a minecraft:saturation 1 1 true
    execute as @a[x=-1,y=33,z=16,dx=3,dy=3,dz=0,gamemode=adventure,team=!playing] run{
        team join playing @s
        tellraw @s [{"text": "you will participate next round!","color":"red"}]
    }
    execute as @a[x=-1,y=33,z=-16,dx=3,dy=3,dz=0,gamemode=adventure] run{
        team join spectating @s
        gamemode spectator @s
        tellraw @s [{"text": "to exit spectator enter the spinning magma cube!","color":"green"}]
    }
    execute as @a[x=-1,y=40,z=-1,dx=2,dy=2,dz=2] run{
        team leave @s
        gamemode adventure @s
        effect give @s resistance 2 10 true
    }
    execute as @e[tag=spectator-exit] at @s run tp @s ~ ~ ~ ~90 ~
}