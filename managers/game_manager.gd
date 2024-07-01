#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
#endregion

#region Variables
var ingredients : Array[StringName] = []
#endregion

#region Computed properties
#endregion

#region Public functions
func add_ingredient(ingredient_name : StringName):
	ingredients.append(ingredient_name)
	IngredientData.set_ingredient_as_known(ingredient_name)
	
func start_run():
	ingredients = ["batata"]
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


