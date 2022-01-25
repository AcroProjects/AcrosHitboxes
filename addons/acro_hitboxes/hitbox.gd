tool
extends Area2D

export(int) var launch_angle setget update_la
export(int) var strength setget update_st
export(int) var damage setget update_da
export(float, 0,1) var knockback_scale = 1 setget update_kb
export(int) var scale_x = 10 setget update_x
export(int) var scale_y = 10 setget update_y
export(bool) var disabled = false setget update_en
export(bool) var reversed = false setget reverseLaunchAngle
export(int) var lineThickness = 1 setget update_lt
export(bool) var draw_line_in_game = false setget update_vl
# Color given as red-green-blue value (alpha will always be 1).
export(Color, RGBA) var hitbox_color = Color(1,0,0,1) setget update_co
#export(Array, int) var extraValues = [0, 0]


# Called when the node enters the scene tree for the first time.
func _ready():
	var shape = RectangleShape2D.new()
	
	#shape.set_radius(radius)
	var collision = CollisionShape2D.new()
	collision.set_shape(shape)
	collision.shape.extents = Vector2(scale_x,scale_y)
	collision.modulate = hitbox_color
	add_child(collision)
	

# Updates the launch_angle of the hitbox
func update_la(newVal):
	launch_angle = newVal
	update()

# Updates the strength of the hitbox
func update_st(newVal):
	strength = newVal
	update()
	
# Updates the damage of the hitbox
func update_da(newVal):
	damage = newVal
	update()

# Updates the knockback scale of the hitbox
func update_kb(newVal):
	knockback_scale = newVal
	update()

# Updates the x scale of the hitbox
func update_x(newVal):
	for obj in get_children():
		obj.shape.extents.x = newVal
	scale_x = newVal
	update()

# Updates the x scale of the hitbox
func update_y(newVal):
	for obj in get_children():
		obj.shape.extents.y = newVal
	scale_y = newVal
	update()

# Enables and disables the hitbox
func update_en(newVal):
	for obj in get_children():
		match newVal:
			true:
				obj.disabled = true
			false:
				obj.disabled = false
	disabled = newVal
	update()

# Updates the line thickness of the hitbox IN THE EDITOR
func update_lt(newVal):
	lineThickness = newVal
	update()

func update_co(newVal):
	for obj in get_children():
		obj.modulate = hitbox_color
	hitbox_color = newVal
	update()

# Updates if the line of the angle is visible
func update_vl(newVal):
	draw_line_in_game = newVal
	update()
	

# Calculates the launch vector to apply knockback
# @param angle - launch_angle (int)
# @param strength - length and width of the vector (int)
# @returns Vector to apply knockback
func get_launch_vector(angle,strength):
	#Converts angle to radians
	angle = angle * PI / 180
	
	#Get X and Y components of vector
	var fx = strength * cos(angle)
	var fy = -strength * sin(angle)
	
	#Returns the vector of fx and fy
	match reversed:
		true:
			return Vector2(fx*-1,fy)
		false:
			return Vector2(fx,fy)

# Updates the "reversed" variable
func reverseLaunchAngle(newVal):
	reversed = newVal
	update()
	pass

# Draws a line to show the knockback angle IN THE EDITOR
func _draw():
	if not Engine.editor_hint and !draw_line_in_game:
		return
	draw_line(Vector2(),get_launch_vector(launch_angle,strength), Color('#ffffff'),lineThickness)
