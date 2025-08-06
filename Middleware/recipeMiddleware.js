const { body, validationResult } = require('express-validator');

// Validation rules for recipe creation and updates
const recipeValidationRules = () => {
  return [
    body('recipeName')
      .trim()
      .isLength({ min: 1, max: 200 })
      .withMessage('Recipe name must be between 1 and 200 characters'),
    
    body('mealType')
      .isIn(['Breakfast', 'Lunch', 'Dinner'])
      .withMessage('Meal type must be Breakfast, Lunch, or Dinner'),
    
    body('instructions')
      .trim()
      .isLength({ min: 10 })
      .withMessage('Instructions must be at least 10 characters long'),
    
    body('ingredients')
      .trim()
      .isLength({ min: 5 })
      .withMessage('Ingredients must be at least 5 characters long'),
    
    body('prepTime')
      .optional()
      .isInt({ min: 0, max: 1440 })
      .withMessage('Prep time must be between 0 and 1440 minutes'),
    
    body('cookTime')
      .optional()
      .isInt({ min: 0, max: 1440 })
      .withMessage('Cook time must be between 0 and 1440 minutes'),
    
    body('servings')
      .optional()
      .isInt({ min: 1, max: 50 })
      .withMessage('Servings must be between 1 and 50'),
    
    body('difficulty')
      .optional()
      .isIn(['Easy', 'Medium', 'Hard'])
      .withMessage('Difficulty must be Easy, Medium, or Hard'),
    
    body('description')
      .optional()
      .isLength({ max: 1000 })
      .withMessage('Description must be less than 1000 characters')
  ];
};

// Validation rules for recipe updates (all fields optional)
const recipeUpdateValidationRules = () => {
  return [
    body('recipeName')
      .optional()
      .trim()
      .isLength({ min: 1, max: 200 })
      .withMessage('Recipe name must be between 1 and 200 characters'),
    
    body('mealType')
      .optional()
      .isIn(['Breakfast', 'Lunch', 'Dinner'])
      .withMessage('Meal type must be Breakfast, Lunch, or Dinner'),
    
    body('instructions')
      .optional()
      .trim()
      .isLength({ min: 10 })
      .withMessage('Instructions must be at least 10 characters long'),
    
    body('ingredients')
      .optional()
      .trim()
      .isLength({ min: 5 })
      .withMessage('Ingredients must be at least 5 characters long'),
    
    body('prepTime')
      .optional()
      .isInt({ min: 0, max: 1440 })
      .withMessage('Prep time must be between 0 and 1440 minutes'),
    
    body('cookTime')
      .optional()
      .isInt({ min: 0, max: 1440 })
      .withMessage('Cook time must be between 0 and 1440 minutes'),
    
    body('servings')
      .optional()
      .isInt({ min: 1, max: 50 })
      .withMessage('Servings must be between 1 and 50'),
    
    body('difficulty')
      .optional()
      .isIn(['Easy', 'Medium', 'Hard'])
      .withMessage('Difficulty must be Easy, Medium, or Hard'),
    
    body('description')
      .optional()
      .isLength({ max: 1000 })
      .withMessage('Description must be less than 1000 characters')
  ];
};

// Middleware to check validation results
const checkValidationResults = (req, res, next) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({
      error: 'Validation failed',
      details: errors.array()
    });
  }
  next();
};

// Middleware to sanitize text inputs
const sanitizeInputs = (req, res, next) => {
  if (req.body.recipeName) {
    req.body.recipeName = req.body.recipeName.trim();
  }
  if (req.body.instructions) {
    req.body.instructions = req.body.instructions.trim();
  }
  if (req.body.ingredients) {
    req.body.ingredients = req.body.ingredients.trim();
  }
  if (req.body.description) {
    req.body.description = req.body.description.trim();
  }
  next();
};

// Middleware to validate meal type parameter
const validateMealTypeParam = (req, res, next) => {
  const validMealTypes = ['Breakfast', 'Lunch', 'Dinner'];
  if (req.params.mealType && !validMealTypes.includes(req.params.mealType)) {
    return res.status(400).json({
      error: 'Invalid meal type. Must be Breakfast, Lunch, or Dinner'
    });
  }
  next();
};

// Middleware to validate recipe ID parameter
const validateRecipeId = (req, res, next) => {
  const recipeId = parseInt(req.params.id);
  if (isNaN(recipeId) || recipeId <= 0) {
    return res.status(400).json({
      error: 'Invalid recipe ID. Must be a positive integer.'
    });
  }
  req.params.id = recipeId;
  next();
};

// Middleware to validate search query
const validateSearchQuery = (req, res, next) => {
  if (!req.query.q || req.query.q.trim().length === 0) {
    return res.status(400).json({
      error: 'Search query is required'
    });
  }
  req.query.q = req.query.q.trim();
  next();
};

module.exports = {
  recipeValidationRules,
  recipeUpdateValidationRules,
  checkValidationResults,
  sanitizeInputs,
  validateMealTypeParam,
  validateRecipeId,
  validateSearchQuery
};
