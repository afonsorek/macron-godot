class_name IngredientState
extends Resource

 #Signals são usados para criar o design pattern de Observer
signal transitioned

@export var name : String

func enter(controller : IngredientController):
	pass

func update(controller : IngredientController, delta : float):
	pass

func beat(controller : IngredientController):
	pass

func exit(controller : IngredientController):
	pass
