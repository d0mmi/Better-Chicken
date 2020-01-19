execute if entity @s[tag=inlove] run say <3
execute if entity @s[tag=inlove] run tag @s remove inlove
execute as @s store result score @s inlove run data get entity @s InLove
execute if predicate better_chicken:inlove run tag @s add inlove