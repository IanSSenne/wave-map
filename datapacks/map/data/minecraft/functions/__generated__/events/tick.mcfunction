execute if entity @a[x=-16,z=-16,dx=32,dz=32] run function main:__generated__/execute/0
effect give @a minecraft:saturation 1 1 true
execute as @a[x=-1,y=33,z=16,dx=3,dy=3,dz=0,gamemode=adventure,team=!playing] run function main:__generated__/execute/1
execute as @a[x=-1,y=33,z=-16,dx=3,dy=3,dz=0,gamemode=adventure] run function main:__generated__/execute/2
execute as @a[x=-1,y=40,z=-1,dx=2,dy=2,dz=2] run function main:__generated__/execute/3
execute as @e[tag=spectator-exit] at @s run tp @s ~ ~ ~ ~90 ~