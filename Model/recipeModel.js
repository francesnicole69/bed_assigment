const sql = require('mssql');
const dbConfig = require('../dbConfig');

class RecipeModel {
  // Get all recipes
  static async getAllRecipes() {
    try {
      const pool = await sql.connect(dbConfig);
      const result = await pool.request().query(`
        SELECT 
          RecipeID,
          RecipeName,
          MealType,
          VideoURL,
          Instructions,
          Ingredients,
          PrepTime,
          CookTime,
          Servings,
          Difficulty,
          Description,
          CreatedBy
        FROM Recipes 
        ORDER BY RecipeID DESC
      `);
      return result.recordset;
    } catch (error) {
      console.error('Error fetching recipes:', error);
      throw error;
    }
  }

  // Get recipes by meal type
  static async getRecipesByMealType(mealType) {
    try {
      const pool = await sql.connect(dbConfig);
      const result = await pool.request()
        .input('mealType', sql.NVarChar(50), mealType)
        .query(`
          SELECT 
            RecipeID,
            RecipeName,
            MealType,
            VideoURL,
            Instructions,
            Ingredients,
            PrepTime,
            CookTime,
            Servings,
            Difficulty,
            Description,
            CreatedBy
          FROM Recipes 
          WHERE MealType = @mealType
          ORDER BY RecipeID DESC
        `);
      return result.recordset;
    } catch (error) {
      console.error('Error fetching recipes by meal type:', error);
      throw error;
    }
  }

  // Get recipe by ID
  static async getRecipeById(recipeId) {
    try {
      const pool = await sql.connect(dbConfig);
      const result = await pool.request()
        .input('recipeId', sql.Int, recipeId)
        .query(`
          SELECT 
            RecipeID,
            RecipeName,
            MealType,
            VideoURL,
            Instructions,
            Ingredients,
            PrepTime,
            CookTime,
            Servings,
            Difficulty,
            Description,
            CreatedBy
          FROM Recipes 
          WHERE RecipeID = @recipeId
        `);
      
      if (result.recordset.length === 0) {
        return { error: "Recipe not found" };
      }
      
      return result.recordset[0];
    } catch (error) {
      console.error('Error fetching recipe by ID:', error);
      throw error;
    }
  }

  // Create new recipe
  static async createRecipe(recipeData) {
    try {
      const pool = await sql.connect(dbConfig);
      const result = await pool.request()
        .input('recipeName', sql.NVarChar(255), recipeData.recipeName)
        .input('mealType', sql.NVarChar(50), recipeData.mealType)
        .input('videoURL', sql.NVarChar(500), recipeData.videoURL || null)
        .input('instructions', sql.NVarChar(sql.MAX), recipeData.instructions)
        .input('ingredients', sql.NVarChar(sql.MAX), recipeData.ingredients)
        .input('prepTime', sql.Int, recipeData.prepTime || 0)
        .input('cookTime', sql.Int, recipeData.cookTime || 0)
        .input('servings', sql.Int, recipeData.servings || 1)
        .input('difficulty', sql.NVarChar(50), recipeData.difficulty || 'Easy')
        .input('description', sql.NVarChar(500), recipeData.description || '')
        .input('createdBy', sql.Int, recipeData.createdBy || 1)
        .query(`
          INSERT INTO Recipes 
          (RecipeName, MealType, VideoURL, Instructions, Ingredients, PrepTime, CookTime, Servings, Difficulty, Description, CreatedBy)
          OUTPUT INSERTED.RecipeID
          VALUES 
          (@recipeName, @mealType, @videoURL, @instructions, @ingredients, @prepTime, @cookTime, @servings, @difficulty, @description, @createdBy)
        `);
      
      const newRecipeId = result.recordset[0].RecipeID;
      return await this.getRecipeById(newRecipeId);
    } catch (error) {
      console.error('Error creating recipe:', error);
      throw error;
    }
  }

  // Update recipe
  static async updateRecipe(recipeId, recipeData) {
    try {
      const pool = await sql.connect(dbConfig);
      
      // Check if recipe exists
      const existingRecipe = await this.getRecipeById(recipeId);
      if (existingRecipe.error) {
        return existingRecipe;
      }

      const result = await pool.request()
        .input('recipeId', sql.Int, recipeId)
        .input('recipeName', sql.NVarChar(255), recipeData.recipeName)
        .input('mealType', sql.NVarChar(50), recipeData.mealType)
        .input('videoURL', sql.NVarChar(500), recipeData.videoURL)
        .input('instructions', sql.NVarChar(sql.MAX), recipeData.instructions)
        .input('ingredients', sql.NVarChar(sql.MAX), recipeData.ingredients)
        .input('prepTime', sql.Int, recipeData.prepTime)
        .input('cookTime', sql.Int, recipeData.cookTime)
        .input('servings', sql.Int, recipeData.servings)
        .input('difficulty', sql.NVarChar(50), recipeData.difficulty)
        .input('description', sql.NVarChar(500), recipeData.description)
        .query(`
          UPDATE Recipes 
          SET 
            RecipeName = @recipeName,
            MealType = @mealType,
            VideoURL = @videoURL,
            Instructions = @instructions,
            Ingredients = @ingredients,
            PrepTime = @prepTime,
            CookTime = @cookTime,
            Servings = @servings,
            Difficulty = @difficulty,
            Description = @description
          WHERE RecipeID = @recipeId
        `);

      return await this.getRecipeById(recipeId);
    } catch (error) {
      console.error('Error updating recipe:', error);
      throw error;
    }
  }

  // Delete recipe
  static async deleteRecipe(recipeId) {
    try {
      const pool = await sql.connect(dbConfig);
      
      // Check if recipe exists
      const existingRecipe = await this.getRecipeById(recipeId);
      if (existingRecipe.error) {
        return existingRecipe;
      }

      await pool.request()
        .input('recipeId', sql.Int, recipeId)
        .query('DELETE FROM Recipes WHERE RecipeID = @recipeId');

      return { message: "Recipe deleted successfully" };
    } catch (error) {
      console.error('Error deleting recipe:', error);
      throw error;
    }
  }

  // Search recipes
  static async searchRecipes(searchTerm) {
    try {
      const pool = await sql.connect(dbConfig);
      const result = await pool.request()
        .input('searchTerm', sql.NVarChar(255), `%${searchTerm}%`)
        .query(`
          SELECT 
            RecipeID,
            RecipeName,
            MealType,
            VideoURL,
            Instructions,
            Ingredients,
            PrepTime,
            CookTime,
            Servings,
            Difficulty,
            Description,
            CreatedBy
          FROM Recipes 
          WHERE RecipeName LIKE @searchTerm 
             OR Ingredients LIKE @searchTerm 
             OR Instructions LIKE @searchTerm
          ORDER BY RecipeID DESC
        `);
      return result.recordset;
    } catch (error) {
      console.error('Error searching recipes:', error);
      throw error;
    }
  }
}

module.exports = RecipeModel;
