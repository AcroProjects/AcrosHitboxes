tool
class_name Hitbox
extends Area2D

export(Shape2D) var shape = null setget update_shape
export(int) var launch_angle setget update_la
export(int) var strength setget update_st
export(int) var damage setget update_da
export(float,EXP,0.001,4096,.02) var hit_stun = 1 setget update_hs
export(float, 0,1) var knockback_scale = 1 setget update_kb
export(bool) var disabled = false setget update_en
export(bool) var reversed = false setget reverseLaunchAngle
export(int) var lineThickness = 1 setget update_lt
export(bool) var draw_line_in_game = false setget update_vl
# Color given as red-green-blue value (alpha will always be 1).
export(Color, RGBA) var hitbox_color = Color(1,0,0,1) setget update_co
#export(Array, int) var extraValues = [0, 0]


# Called when the node enters the scene tree for the first time.
func _ready():
	var collision = CollisionShape2D.new()
	collision.modulate = hitbox_color
	collision.set_shape(shape)
	add_child(collision)
	

# Updates the collision shape of the hitbox
func update_shape(newVal):
	shape = newVal
	for collision in get_children():
		collision.set_shape(newVal)
	update()

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

# Updates the hit stun of the hitbox
func update_hs(newVal):
	hit_stun = newVal
	update()

# Updates the knockback scale of the hitbox
func update_kb(newVal):
	knockback_scale = newVal
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
	

# Calculates the launch vector to apply knockback automatically
# @returns Vector to apply knockback
func return_launch_vector():
	#Converts angle to radians
	launch_angle = launch_angle * PI / 180
	
	#Get X and Y components of vector
	var fx = strength * cos(launch_angle)
	var fy = -strength * sin(launch_angle)
	
	#Returns the vector of fx and fy
	match reversed:
		true:
			return Vector2(fx*-1,fy)
		false:
			return Vector2(fx,fy)

# Calculates the launch vector to apply knockback manually
# @param angle - launch_angle (int)
# @param strength - length and width of the vector (int)
# @returns Vector to apply knockback
func get_launch_vector(launch_angle,strength):
	#Converts angle to radians
	launch_angle = launch_angle * PI / 180
	
	#Get X and Y components of vector
	var fx = strength * cos(launch_angle)
	var fy = -strength * sin(launch_angle)
	
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
