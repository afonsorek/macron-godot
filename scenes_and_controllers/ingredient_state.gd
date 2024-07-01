class_name IngredientState

 #Signals são usados para criar o design pattern de Observer
signal transitioned

var name : String
var enter : Callable # (controller: IngredientController) -> void
var update : Callable # (controller: IngredientController, delta : float) -> void
var beat : Callable # (controller: IngredientController) -> void
var exit : Callable # (controller: IngredientController) -> void

func _init(name : String, enter := Callable(), update := Callable(), beat := Callable(), exit := Callable()):
	self.name = name
	self.enter = enter
	self.update = update
	self.beat = beat
	self.exit = exit

