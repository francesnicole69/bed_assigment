const RecipeModel = require('../Model/recipeModel');

class RecipeController {
  // Get all recipes
  static async getAllRecipes(req, res) {
    try {
      const recipes = await RecipeModel.getAllRecipes();
      res.json(recipes);
    } catch (error) {
      console.error('Controller error:', error);
      res.status(500).json({ error: 'Error retrieving recipes' });
    }
  }

  // Get recipes by meal type
  static async getRecipesByMealType(req, res) {
    try {
      const { mealType } = req.params;
      
      // Validate meal type
      const validMealTypes = ['Breakfast', 'Lunch', 'Dinner'];
      if (!validMealTypes.includes(mealType)) {
        return res.status(400).json({ error: 'Invalid meal type. Must be Breakfast, Lunch, or Dinner' });
      }

      const recipes = await RecipeModel.getRecipesByMealType(mealType);
      res.json(recipes);
    } catch (error) {
      console.error('Controller error:', error);
      res.status(500).json({ error: 'Error retrieving recipes by meal type' });
    }
  }

  // Get recipe by ID
  static async getRecipeById(req, res) {
    try {
      const recipeId = parseInt(req.params.id);
      if (isNaN(recipeId) || recipeId <= 0) {
        return res.status(400).json({ error: 'Invalid recipe ID' });
      }

      const recipe = await RecipeModel.getRecipeById(recipeId);
      if (recipe.error) {
        return res.status(404).json(recipe);
      }

      res.json(recipe);
    } catch (error) {
      console.error('Controller error:', error);
      res.status(500).json({ error: 'Error retrieving recipe' });
    }
  }

  // Create new recipe
  static async createRecipe(req, res) {
    try {
      const { recipeName, mealType, instructions, ingredients, prepTime, cookTime, servings, difficulty, description } = req.body;
      
      // Validate required fields
      if (!recipeName || !mealType || !instructions || !ingredients) {
        return res.status(400).json({ error: 'Recipe name, meal type, instructions, and ingredients are required' });
      }

      // Validate meal type
      const validMealTypes = ['Breakfast', 'Lunch', 'Dinner'];
      if (!validMealTypes.includes(mealType)) {
        return res.status(400).json({ error: 'Invalid meal type. Must be Breakfast, Lunch, or Dinner' });
      }

      const recipeData = {
        recipeName,
        mealType,
        instructions,
        ingredients,
        prepTime: parseInt(prepTime) || 0,
        cookTime: parseInt(cookTime) || 0,
        servings: parseInt(servings) || 1,
        difficulty: difficulty || 'Easy',
        description: description || '',
        createdBy: 1 // Default user ID
      };

      const newRecipe = await RecipeModel.createRecipe(recipeData);
      res.status(201).json(newRecipe);
    } catch (error) {
      console.error('Controller error:', error);
      res.status(500).json({ error: 'Error creating recipe' });
    }
  }

  // Update recipe
  static async updateRecipe(req, res) {
    try {
      const recipeId = parseInt(req.params.id);
      if (isNaN(recipeId) || recipeId <= 0) {
        return res.status(400).json({ error: 'Invalid recipe ID' });
      }

      const { recipeName, mealType, instructions, ingredients, prepTime, cookTime, servings, difficulty, description } = req.body;
      
      // Get existing recipe
      const existingRecipe = await RecipeModel.getRecipeById(recipeId);
      if (existingRecipe.error) {
        return res.status(404).json(existingRecipe);
      }

      const recipeData = {
        recipeName: recipeName || existingRecipe.RecipeName,
        mealType: mealType || existingRecipe.MealType,
        instructions: instructions || existingRecipe.Instructions,
        ingredients: ingredients || existingRecipe.Ingredients,
        prepTime: parseInt(prepTime) || existingRecipe.PrepTime,
        cookTime: parseInt(cookTime) || existingRecipe.CookTime,
        servings: parseInt(servings) || existingRecipe.Servings,
        difficulty: difficulty || existingRecipe.Difficulty,
        description: description || existingRecipe.Description
      };

      const updatedRecipe = await RecipeModel.updateRecipe(recipeId, recipeData);
      res.json(updatedRecipe);
    } catch (error) {
      console.error('Controller error:', error);
      res.status(500).json({ error: 'Error updating recipe' });
    }
  }

  // Delete recipe
  static async deleteRecipe(req, res) {
    try {
      const recipeId = parseInt(req.params.id);
      if (isNaN(recipeId) || recipeId <= 0) {
        return res.status(400).json({ error: 'Invalid recipe ID' });
      }

      const result = await RecipeModel.deleteRecipe(recipeId);
      res.json(result);
    } catch (error) {
      console.error('Controller error:', error);
      res.status(500).json({ error: 'Error deleting recipe' });
    }
  }

}

module.exports = {
  RecipeController
};
