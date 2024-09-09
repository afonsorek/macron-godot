extends KitchenState
class_name CookingState

var processed_ingredients : Array[Ingredient] = []
var saved_controller : KitchenController

#region Public functions
func enter(controller : KitchenController):
	controller.ingredient_controller.allow_ingredient_process()
	controller.ingredient_controller.sending_ingredient.connect(_ingredient_sent)
	controller.camera.move_view_to(CameraController.Position.CLOSER)
	saved_controller = controller
	_get_next_ingredient()
	
func update(controller : KitchenController, delta : float):
	pass

func beat(controller : KitchenController):
	pass

func exit(controller : KitchenController):
	controller.ingredient_controller.stop_ingredient_process()
	controller.ingredient_controller.sending_ingredient.disconnect(_ingredient_sent)
	saved_controller = null
	processed_ingredients.clear()
#endregion

#region Private functions
func _get_next_ingredient():
	if saved_controller.selected_ingredient_names.is_empty():
		return
	var next_ingredient_name : String = saved_controller.selected_ingredient_names.pop_front()
	print("Setando ingrediente: %s" % [next_ingredient_name])
	saved_controller.ingredient_controller.set_ingredient_by_name(next_ingredient_name)
	
func _ingredient_sent(ingredient: Ingredient):
	if !ingredient:
		return
	processed_ingredients.append(ingredient)
	print("Ingredient received in CookingState!")
	print(">>>> There are %d processed ingredient(s)" % processed_ingredients.size())
	if processed_ingredients.size() == 3:
		saved_controller.make_recipe(processed_ingredients)
		saved_controller.transition_state(name,"judgement")
	else:
		#await RhythmManager.beat
		_get_next_ingredient()
#endregion

#region Subclasses
#endregion


