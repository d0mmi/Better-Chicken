execute as @e[type=chicken,tag=better_chicken] run execute as @s store result score @s chickendrop run data get entity @s EggLayTime
execute as @e[type=chicken,tag=better_chicken] run execute if predicate better_chicken:chickendrop run say Drop
execute as @e[type=chicken,tag=better_chicken] run execute if predicate better_chicken:chickendrop run data modify entity @s EggLayTime set value 9800