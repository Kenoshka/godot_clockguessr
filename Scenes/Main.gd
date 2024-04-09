extends Control

var rng : RandomNumberGenerator
var hours
var minutes

# Called when the node enters the scene tree for the first time.
func _ready():
	if Glob.difficulty == 1:
		$Clocks.texture = load("res://clocks_hard.jpeg")
	rng = RandomNumberGenerator.new()
	_on_generate_button_pressed()

func _on_generate_button_pressed():
	$Result.visible = false
	hours = rng.randi_range(0, 11)
	minutes = rng.randi_range(0, 59)
	$Hours.text = ""
	$Minutes.text = ""
	$Clocks/LongRotator.rotation_degrees = 6 * minutes
	$Clocks/ShortRotator.rotation_degrees = (30 * hours) + lerp(0, 30, float(minutes) / 59.0)

func _on_guess_button_pressed():
	if (int($Hours.text) % 12 == hours and int($Minutes.text) == minutes and int($Hours.text) < 24):
		$Result.add_theme_color_override("font_color", Color.FOREST_GREEN)
		$Result.visible = true
	else:
		$Result.add_theme_color_override("font_color", Color.DARK_RED)
		$Result.visible = true
	$Result.text = str(hours) + ":" + "%0*d" % [2, minutes] + " / " + str(hours + 12) + ":" + "%0*d" % [2, minutes]
