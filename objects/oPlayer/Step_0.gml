keyInit()
hAxis = round(keyRight-keyLeft)
event_inherited();

//Opções individuais do oPlayer

if keyJumpPressed
    jumpPressTime=jumpPressTimeMax
	
//Pulo minimo quando pressiona e solta antes de subir
if jumping and keyJumpReleased vSpeed = vSpeed/5

//Swap de sprites

if hAxis!=0							//Caso esteja se movendo
	if running sprite_index = sRun	//Caso esteja se movendo aceleradamente/fixo
	else sprite_index = sIdle		//Caso esteja desacelerando
else sprite_index = sIdle			//Caso esteja totalmente parado

if jumping or falling sprite_index=sJump