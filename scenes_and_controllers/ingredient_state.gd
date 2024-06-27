class_name IngredientState

 #Signals são usados para criar o design pattern de Observer
signal transitioned

var name : String
var enter : Callable # () -> void
var exit : Callable # () -> void
var update : Callable # (delta : float) -> void
var beat : Callable # () -> void
