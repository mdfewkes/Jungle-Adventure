extends Area2D

signal player_present(player_position)

enum { WEST, NORTH, EAST, SOUTH }

const DIRECTION = [Vector2.LEFT, Vector2.UP, Vector2.RIGHT, Vector2.DOWN]

export var permanent = false;
export var available_nodes = {
	WEST: 0,
	NORTH: 0,
	EAST: 0,
	SOUTH: 0
}

var room_position = Vector2.ZERO
var _members = []


func add_room(_branch_for_members) -> Area2D:
	return self


func remove_room():
	for i in _members:
		_members[i].queue_free()
	_members.clear()
	queue_free()


func update_Room():
	pass


func _on_Room_body_entered(_body):
	emit_signal("player_present", room_position)
