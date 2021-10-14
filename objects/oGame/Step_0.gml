keyInit()
if keyQuit game_end()
if keyDebug global.debug = !global.debug

//melee hitbox layers
layer_create(-100,"PlayerBladeHitbox")
layer_create(-200,"EnemyHitbox")
