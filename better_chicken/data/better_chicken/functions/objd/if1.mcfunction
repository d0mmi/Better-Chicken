say Drop
execute if entity @s[type=chicken,tag=iron_chicken,tag=better_chicken] run summon item ~ ~ ~ {Item:{id:"minecraft:iron_ingot",Count:1}}
data modify entity @s EggLayTime set value 9800