extends GridContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for info_text: String in GlobalValue.infoArray:
		var infoLabel: Label = Label.new()
		infoLabel.text = info_text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
