extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"CertificateWindow".visible = false
	Client.connectRelayServerSucess.connect(_on_connect_relay_server_sucess)
	Client.connectRelayServerFail.connect(_on_connect_relay_server_fail)
	
func _on_connect_relay_server_sucess():
	print("连接成功！")
	
func _on_connect_relay_server_fail(failCode):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
