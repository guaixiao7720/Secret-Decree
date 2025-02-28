extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GlobalValue.isDevelopment:
		get_tree().change_scene_to_file("res://client/scenario/PE/login/login.tscn")
	
	else:
		match OS.get_name():
			"Windows", "macOS":
				pass
			"Android", "iOS":
				get_tree().change_scene_to_file("res://client/scenario/PE/login/login.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
