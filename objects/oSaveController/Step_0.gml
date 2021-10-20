if checkpoint{
	checkpoint=0
	stateSaved = true;
	buffer_seek(saveBuffer, buffer_seek_start, 0);
	game_save_buffer(saveBuffer);
}

if restart{
	if stateSaved {
		buffer_seek(saveBuffer, buffer_seek_start, 0);
		game_load_buffer(saveBuffer);
	}
}

if save{
	save=0
	buffer_save(saveBuffer,"save.sv")
}

if load{
	if file_exists("save.sv"){
		//entra numa room qualquer para inicializar as variaveis
		room_goto(rStage)
		game_load_buffer(buffer_load("save.sv"))
	}
}

show_debug_message(save)