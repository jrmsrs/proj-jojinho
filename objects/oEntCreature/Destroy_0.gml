if name=="player" or name=="boss" 
	exit

var drops = 0
var r1 = irandom(100)

//40% de chance de dropar 1 item
//15% de chance de dropar 2 itens 
//05% de chance de dropar 3 itens
if r1 <= 5 
	drops = 3
if r1 >  5 and r1 <= 10
	drops = 2
if r1 > 10 and r1 <= 30
	drops = 1

for (i=0; i<drops; i++){
	var iName
	var r2 = irandom(100)
	
	//60% de chance desse item ser Life Heart 1
	//30% de chance desse item ser Life Heart 2
	//10% de chance desse item ser Life Heart 3
	if r2 > 40
		iName="Life Heart 1" //05 HP
	if r2 > 10 and r2 <= 40
		iName="Life Heart 2" //15 HP
	if r2 <= 10
		iName="Life Heart 3" //30 HP

	with (instance_create_layer(x,y,layer,oItem)){
		itemName = iName
		levitate = false
		rotate = false
		vSpeed = -choose(5,10,15,20)
		hSpeed = choose(-5,0,5)
		postCreation = true
	}
}
