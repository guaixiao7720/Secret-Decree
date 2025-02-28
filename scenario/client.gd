extends Node

var websocketPeer: WebSocketPeer

@export var url: String

signal connectRelayServerSucess
signal connectRelayServerFail(code: int)

signal certificateVerifySuceess

enum CONNECT{
	SUCESS,
	UNKNOW_ADDRESS,
	TIMEOUT,
}

enum VERIFY{
	SUCESS,
	FAIL,
	TIMEOUT,
}

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if url != "":
		websocketPeer.poll()
		
		var state = websocketPeer.get_ready_state()
		
		match state:
			websocketPeer.STATE_OPEN:
				while websocketPeer.get_available_packet_count():
					var packet: PackedByteArray = websocketPeer.get_packet()
					if websocketPeer.was_string_packet():
						var command: String = packet.get_string_from_utf8()
						var commandArray: Array[String] = command.split("||;;")
						
						match commandArray[0]:
							"connect":
								if int(commandArray[1]) == CONNECT.SUCESS:
									connectRelayServerSucess.emit()
								else:
									connectRelayServerFail.emit(int(commandArray[1]))
						
							"certificate":
								match commandArray[1]:
									"verify":
										if int(commandArray[2]) == VERIFY.SUCESS:
											certificateVerifySuceess.emit()
										
										
									
					
			websocketPeer.STATE_CLOSING:
				pass
			websocketPeer.STATE_CLOSED:
				pass
	
func checkRelayServer(url: String):
	pass
	
func connectRelayServer(url: String, key: String):
	websocketPeer = websocketPeer.new()
	self.url = url
	
	if websocketPeer.connect_to_url(url) == OK:
		websocketPeer.send_text(key + "||;;" + "connect")
		
	else:
		connectRelayServerFail.emit(CONNECT.UNKNOW_ADDRESS)
		
