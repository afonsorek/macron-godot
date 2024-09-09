class_name Ingredient
extends Resource

#region Enums
#endregion

#region Variables
## StringNames são strings únicas no código: ótimas para relacionar dados,
## funcionando efetivamente como UUIDs.
@export var name : StringName
@export var description : String
@export var elements : Array[StringName]
@export var states : Array[IngredientState]
@export var view_tscn : PackedScene # .tscn que herda da classe IngredientView
var known : bool = false
#endregion

#region Computed properties
#endregion

#region Public functions
#endregion

#region Subclasses
#endregion


