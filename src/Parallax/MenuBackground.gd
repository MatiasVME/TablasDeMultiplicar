extends ParallaxBackground

var offset_x = 0
const VELOCITY = 50

func _ready():
	set_process(true)

func _process(delta):
	offset_x -= VELOCITY * delta
	set_scroll_offset(Vector2(offset_x, 0))

