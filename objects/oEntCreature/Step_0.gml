target = global.lockTarget==self and oPlayer.lockCursor

if selected and !target 
	showHealthTimer++
if showHealthTimer>=200{
	selected=false
	showHealthTimer=0
}
