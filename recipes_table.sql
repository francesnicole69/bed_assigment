-- =============================================
-- Recipes Table for Meal Planner System
-- Created: August 6, 2025
-- Purpose: Store recipes with meal type categorization, video storage, and detailed recipe information
-- =============================================

-- Drop table if exists
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Recipes]') AND type IN ('U'))
	DROP TABLE [dbo].[Recipes]
GO

-- Create Recipes table
CREATE TABLE [dbo].[Recipes] (
  [RecipeID] int IDENTITY(1,1) PRIMARY KEY,
  [RecipeName] nvarchar(200) NOT NULL,
  [MealType] nvarchar(20) NOT NULL CHECK ([MealType] IN ('Breakfast', 'Lunch', 'Dinner')),
  [VideoURL] nvarchar(500) NULL,
  [Instructions] nvarchar(max) NOT NULL,
  [Ingredients] nvarchar(max) NOT NULL,
  [PrepTime] int DEFAULT 0,
  [CookTime] int DEFAULT 0,
  [Servings] int DEFAULT 1,
  [Difficulty] nvarchar(10) DEFAULT 'Easy' CHECK ([Difficulty] IN ('Easy', 'Medium', 'Hard')),
  [Description] nvarchar(1000) NULL,
  [CreatedDate] datetime2(0) DEFAULT GETDATE(),
  [CreatedBy] int DEFAULT 1,
  [LastModified] datetime2(0) DEFAULT GETDATE(),
  [IsActive] bit DEFAULT 1
)
GO

-- Set lock escalation
ALTER TABLE [dbo].[Recipes] SET (LOCK_ESCALATION = TABLE)
GO

-- Create indexes for better performance
CREATE INDEX IX_Recipes_MealType ON [dbo].[Recipes] ([MealType])
GO

CREATE INDEX IX_Recipes_Difficulty ON [dbo].[Recipes] ([Difficulty])
GO

CREATE INDEX IX_Recipes_CreatedBy ON [dbo].[Recipes] ([CreatedBy])
GO

CREATE INDEX IX_Recipes_CreatedDate ON [dbo].[Recipes] ([CreatedDate])
GO

CREATE INDEX IX_Recipes_IsActive ON [dbo].[Recipes] ([IsActive])
GO

-- Full-text index for recipe search (if full-text search is enabled)
-- CREATE FULLTEXT INDEX ON [dbo].[Recipes] ([RecipeName], [Instructions], [Ingredients])
-- KEY INDEX PK__Recipes__[RecipeID]
-- GO

-- Add extended properties for documentation
EXEC sp_addextendedproperty
'MS_Description', N'Primary key for recipes table',
'SCHEMA', N'dbo',
'TABLE', N'Recipes',
'COLUMN', N'RecipeID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Name of the recipe (max 200 characters)',
'SCHEMA', N'dbo',
'TABLE', N'Recipes',
'COLUMN', N'RecipeName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Type of meal: Breakfast, Lunch, or Dinner',
'SCHEMA', N'dbo',
'TABLE', N'Recipes',
'COLUMN', N'MealType'
GO

EXEC sp_addextendedproperty
'MS_Description', N'URL for recipe video stored in Cloudinary (optional)',
'SCHEMA', N'dbo',
'TABLE', N'Recipes',
'COLUMN', N'VideoURL'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Step-by-step cooking instructions',
'SCHEMA', N'dbo',
'TABLE', N'Recipes',
'COLUMN', N'Instructions'
GO

EXEC sp_addextendedproperty
'MS_Description', N'List of ingredients needed for the recipe',
'SCHEMA', N'dbo',
'TABLE', N'Recipes',
'COLUMN', N'Ingredients'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Preparation time in minutes',
'SCHEMA', N'dbo',
'TABLE', N'Recipes',
'COLUMN', N'PrepTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Cooking time in minutes',
'SCHEMA', N'dbo',
'TABLE', N'Recipes',
'COLUMN', N'CookTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Number of servings this recipe makes',
'SCHEMA', N'dbo',
'TABLE', N'Recipes',
'COLUMN', N'Servings'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Recipe difficulty level: Easy, Medium, or Hard',
'SCHEMA', N'dbo',
'TABLE', N'Recipes',
'COLUMN', N'Difficulty'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Brief description of the recipe (max 1000 characters)',
'SCHEMA', N'dbo',
'TABLE', N'Recipes',
'COLUMN', N'Description'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Date when the recipe was created',
'SCHEMA', N'dbo',
'TABLE', N'Recipes',
'COLUMN', N'CreatedDate'
GO

EXEC sp_addextendedproperty
'MS_Description', N'User ID who created the recipe',
'SCHEMA', N'dbo',
'TABLE', N'Recipes',
'COLUMN', N'CreatedBy'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Date when the recipe was last modified',
'SCHEMA', N'dbo',
'TABLE', N'Recipes',
'COLUMN', N'LastModified'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Whether the recipe is active/visible (soft delete)',
'SCHEMA', N'dbo',
'TABLE', N'Recipes',
'COLUMN', N'IsActive'
GO

-- Add table description
EXEC sp_addextendedproperty
'MS_Description', N'Stores recipes for the meal planner system with categorization by meal type, video support, and detailed recipe information',
'SCHEMA', N'dbo',
'TABLE', N'Recipes'
GO

-- Insert sample recipes for testing
INSERT INTO [dbo].[Recipes] (
    [RecipeName], [MealType], [Instructions], [Ingredients], [PrepTime], [CookTime], 
    [Servings], [Difficulty], [Description], [CreatedBy]
) VALUES 

-- Breakfast Recipes
('Classic Pancakes', 'Breakfast', 
'1. Mix flour, baking powder, salt, and sugar in a large bowl
2. In another bowl, whisk together milk, egg, and melted butter
3. Pour wet ingredients into dry ingredients and stir until just combined
4. Heat a griddle or large skillet over medium heat
5. Pour 1/4 cup of batter for each pancake
6. Cook until bubbles form on surface, then flip
7. Cook until golden brown on other side
8. Serve hot with maple syrup', 
'2 cups all-purpose flour
2 tablespoons sugar
2 teaspoons baking powder
1 teaspoon salt
1 3/4 cups milk
1 large egg
1/4 cup melted butter
Maple syrup for serving', 
10, 15, 4, 'Easy', 'Fluffy and delicious pancakes perfect for weekend breakfast', 1),

('Avocado Toast with Egg', 'Breakfast',
'1. Toast the bread slices until golden brown
2. Mash the avocado with lime juice, salt, and pepper
3. Heat oil in a pan and fry the egg sunny-side up
4. Spread mashed avocado on toast
5. Top with fried egg
6. Sprinkle with red pepper flakes and herbs
7. Serve immediately',
'2 slices whole grain bread
1 ripe avocado
1 large egg
1 tablespoon olive oil
1 tablespoon lime juice
Salt and pepper to taste
Red pepper flakes
Fresh herbs (optional)',
5, 5, 1, 'Easy', 'Healthy and nutritious breakfast with protein and healthy fats', 1),

('Greek Yogurt Parfait', 'Breakfast',
'1. Layer Greek yogurt in a glass or bowl
2. Add a layer of mixed berries
3. Sprinkle granola on top
4. Add another layer of yogurt
5. Top with more berries and granola
6. Drizzle with honey
7. Serve immediately',
'1 cup Greek yogurt
1/2 cup mixed berries
1/4 cup granola
2 tablespoons honey
1 tablespoon chopped nuts (optional)',
5, 0, 1, 'Easy', 'Light and healthy breakfast packed with protein and probiotics', 1),

-- Lunch Recipes
('Grilled Chicken Caesar Salad', 'Lunch',
'1. Season chicken breast with salt, pepper, and herbs
2. Grill chicken for 6-7 minutes per side until cooked through
3. Let chicken rest for 5 minutes, then slice
4. Wash and chop romaine lettuce
5. Make dressing by mixing mayonnaise, lemon juice, garlic, and parmesan
6. Toss lettuce with dressing
7. Top with sliced chicken, croutons, and extra parmesan
8. Serve immediately',
'2 chicken breasts
6 cups romaine lettuce
1/2 cup mayonnaise
2 tablespoons lemon juice
2 cloves garlic, minced
1/2 cup grated parmesan cheese
1 cup croutons
Salt and pepper to taste',
15, 15, 2, 'Medium', 'Classic Caesar salad with grilled chicken for a protein-rich lunch', 1),

('Quinoa Buddha Bowl', 'Lunch',
'1. Cook quinoa according to package instructions
2. Roast vegetables in oven at 400°F for 20 minutes
3. Prepare tahini dressing by whisking all dressing ingredients
4. Massage kale with a bit of olive oil and lemon
5. Assemble bowl with quinoa as base
6. Add roasted vegetables, massaged kale, and chickpeas
7. Top with avocado and seeds
8. Drizzle with tahini dressing',
'1 cup quinoa
2 cups mixed vegetables (sweet potato, broccoli, bell peppers)
2 cups kale, chopped
1 can chickpeas, drained
1 avocado, sliced
2 tablespoons pumpkin seeds
For dressing: 3 tbsp tahini, 2 tbsp lemon juice, 1 tbsp maple syrup, water to thin',
20, 25, 2, 'Medium', 'Nutritious and colorful bowl packed with plant-based protein and vegetables', 1),

-- Dinner Recipes
('Salmon with Garlic Butter', 'Dinner',
'1. Preheat oven to 425°F
2. Season salmon fillets with salt, pepper, and lemon juice
3. Heat olive oil in oven-safe skillet
4. Sear salmon skin-side up for 3-4 minutes
5. Flip salmon and add butter, garlic, and herbs to pan
6. Transfer to oven for 6-8 minutes
7. Baste with garlic butter from pan
8. Serve with steamed vegetables',
'4 salmon fillets
3 tablespoons olive oil
4 tablespoons butter
4 cloves garlic, minced
2 tablespoons fresh herbs (dill, parsley)
1 lemon, juiced
Salt and pepper to taste',
10, 15, 4, 'Medium', 'Elegant and healthy dinner featuring omega-3 rich salmon', 1),

('Spaghetti Carbonara', 'Dinner',
'1. Cook spaghetti in salted water until al dente
2. Cook pancetta in large skillet until crispy
3. Beat eggs with parmesan cheese and black pepper
4. Reserve 1 cup pasta water, then drain pasta
5. Add hot pasta to pancetta pan
6. Remove from heat and quickly toss with egg mixture
7. Add pasta water gradually to create creamy sauce
8. Serve immediately with extra parmesan',
'1 lb spaghetti
6 oz pancetta, diced
3 large eggs
1 cup grated parmesan cheese
1/2 teaspoon black pepper
Salt to taste',
10, 20, 4, 'Medium', 'Classic Italian pasta dish with creamy egg-based sauce', 1),

('Vegetable Stir Fry', 'Dinner',
'1. Prepare all vegetables by washing and chopping
2. Heat oil in large wok or skillet over high heat
3. Add garlic and ginger, stir for 30 seconds
4. Add harder vegetables first (carrots, broccoli)
5. Cook for 2-3 minutes, then add softer vegetables
6. Stir in sauce mixture and cook for 1 minute
7. Serve over steamed rice
8. Garnish with sesame seeds and green onions',
'2 cups mixed vegetables (broccoli, carrots, bell peppers, snap peas)
2 cloves garlic, minced
1 tablespoon fresh ginger, minced
2 tablespoons vegetable oil
For sauce: 3 tbsp soy sauce, 1 tbsp sesame oil, 1 tsp cornstarch, 1 tsp sugar
Steamed rice for serving',
15, 10, 3, 'Easy', 'Quick and healthy vegetable stir fry perfect for busy weeknights', 1);

GO

-- Create useful views for recipe management

-- View for recipes with calculated total time
CREATE VIEW [dbo].[RecipesWithTotalTime] AS
SELECT 
    RecipeID,
    RecipeName,
    MealType,
    PrepTime,
    CookTime,
    (PrepTime + CookTime) AS TotalTime,
    Servings,
    Difficulty,
    Description,
    CreatedDate,
    CreatedBy,
    IsActive
FROM [dbo].[Recipes]
WHERE IsActive = 1
GO

-- View for recipe summary by meal type
CREATE VIEW [dbo].[RecipeSummaryByMealType] AS
SELECT 
    MealType,
    COUNT(*) AS TotalRecipes,
    AVG(CAST(PrepTime + CookTime AS FLOAT)) AS AvgTotalTime,
    AVG(CAST(Servings AS FLOAT)) AS AvgServings,
    COUNT(CASE WHEN Difficulty = 'Easy' THEN 1 END) AS EasyRecipes,
    COUNT(CASE WHEN Difficulty = 'Medium' THEN 1 END) AS MediumRecipes,
    COUNT(CASE WHEN Difficulty = 'Hard' THEN 1 END) AS HardRecipes
FROM [dbo].[Recipes]
WHERE IsActive = 1
GROUP BY MealType
GO

-- View for quick recipes (30 minutes or less)
CREATE VIEW [dbo].[QuickRecipes] AS
SELECT 
    RecipeID,
    RecipeName,
    MealType,
    PrepTime,
    CookTime,
    (PrepTime + CookTime) AS TotalTime,
    Difficulty,
    Description
FROM [dbo].[Recipes]
WHERE IsActive = 1 
  AND (PrepTime + CookTime) <= 30
GO

-- Add descriptions for views
EXEC sp_addextendedproperty
'MS_Description', N'View showing active recipes with calculated total cooking time',
'SCHEMA', N'dbo',
'VIEW', N'RecipesWithTotalTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Summary statistics of recipes grouped by meal type',
'SCHEMA', N'dbo',
'VIEW', N'RecipeSummaryByMealType'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Recipes that can be prepared in 30 minutes or less',
'SCHEMA', N'dbo',
'VIEW', N'QuickRecipes'
GO

-- Create a stored procedure for recipe search
CREATE PROCEDURE [dbo].[SearchRecipes]
    @SearchTerm NVARCHAR(100),
    @MealType NVARCHAR(20) = NULL,
    @Difficulty NVARCHAR(10) = NULL,
    @MaxTime INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        RecipeID,
        RecipeName,
        MealType,
        PrepTime,
        CookTime,
        (PrepTime + CookTime) AS TotalTime,
        Servings,
        Difficulty,
        Description,
        CreatedDate
    FROM [dbo].[Recipes]
    WHERE IsActive = 1
        AND (
            RecipeName LIKE '%' + @SearchTerm + '%'
            OR Instructions LIKE '%' + @SearchTerm + '%'
            OR Ingredients LIKE '%' + @SearchTerm + '%'
            OR Description LIKE '%' + @SearchTerm + '%'
        )
        AND (@MealType IS NULL OR MealType = @MealType)
        AND (@Difficulty IS NULL OR Difficulty = @Difficulty)
        AND (@MaxTime IS NULL OR (PrepTime + CookTime) <= @MaxTime)
    ORDER BY RecipeName;
END
GO

EXEC sp_addextendedproperty
'MS_Description', N'Stored procedure to search recipes by keywords with optional filters for meal type, difficulty, and cooking time',
'SCHEMA', N'dbo',
'PROCEDURE', N'SearchRecipes'
GO

PRINT 'Recipes table and related objects created successfully!'
PRINT 'Sample recipes have been inserted for testing.'
PRINT 'Use the following views for recipe analytics:'
PRINT '  - RecipesWithTotalTime: Recipes with calculated total time'
PRINT '  - RecipeSummaryByMealType: Recipe statistics by meal type'
PRINT '  - QuickRecipes: Recipes that take 30 minutes or less'
PRINT 'Use SearchRecipes stored procedure for advanced recipe search.'
