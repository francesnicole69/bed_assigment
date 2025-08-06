-- =============================================
-- Meal Planner Database Setup Script
-- Run this in SQL Server Management Studio
-- =============================================

-- Use your database
USE bed_db;
GO

-- Create MealPlanner table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'MealPlanner')
BEGIN
    CREATE TABLE MealPlanner (
        MealID INT IDENTITY(1,1) PRIMARY KEY,
        MealName NVARCHAR(255) NOT NULL,
        VideoURL NVARCHAR(500) NULL,
        Recipe NVARCHAR(MAX) NOT NULL,
        Category NVARCHAR(100) NOT NULL DEFAULT 'General',
        PrepTime INT NOT NULL DEFAULT 0,
        CookTime INT NOT NULL DEFAULT 0,
        Servings INT NOT NULL DEFAULT 1,
        Difficulty NVARCHAR(50) NOT NULL DEFAULT 'Easy',
        CreatedBy INT NOT NULL DEFAULT 1,
        CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),
        
        -- Constraints
        CONSTRAINT CK_MealPlanner_PrepTime CHECK (PrepTime >= 0),
        CONSTRAINT CK_MealPlanner_CookTime CHECK (CookTime >= 0),
        CONSTRAINT CK_MealPlanner_Servings CHECK (Servings >= 1),
        CONSTRAINT CK_MealPlanner_Difficulty CHECK (Difficulty IN ('Easy', 'Medium', 'Hard'))
    );
    
    PRINT 'MealPlanner table created successfully!';
END
ELSE
BEGIN
    PRINT 'MealPlanner table already exists!';
END
GO

-- Create indexes for better performance
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_MealPlanner_Category')
BEGIN
    CREATE INDEX IX_MealPlanner_Category ON MealPlanner(Category);
    PRINT 'Category index created!';
END

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_MealPlanner_Difficulty')
BEGIN
    CREATE INDEX IX_MealPlanner_Difficulty ON MealPlanner(Difficulty);
    PRINT 'Difficulty index created!';
END

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_MealPlanner_CreatedDate')
BEGIN
    CREATE INDEX IX_MealPlanner_CreatedDate ON MealPlanner(CreatedDate);
    PRINT 'CreatedDate index created!';
END

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_MealPlanner_CreatedBy')
BEGIN
    CREATE INDEX IX_MealPlanner_CreatedBy ON MealPlanner(CreatedBy);
    PRINT 'CreatedBy index created!';
END
GO

-- Insert sample data (only if table is empty)
IF (SELECT COUNT(*) FROM MealPlanner) = 0
BEGIN
    INSERT INTO MealPlanner (MealName, Recipe, Category, PrepTime, CookTime, Servings, Difficulty, CreatedBy) 
    VALUES 
    (
        'Classic Spaghetti Carbonara',
        'Ingredients:
- 400g spaghetti
- 200g pancetta or guanciale, diced
- 4 large eggs
- 100g Pecorino Romano cheese, grated
- 100g Parmigiano-Reggiano cheese, grated
- Black pepper to taste
- Salt for pasta water

Instructions:
1. Bring a large pot of salted water to boil. Cook spaghetti according to package instructions until al dente.
2. While pasta cooks, heat a large skillet over medium heat. Add pancetta and cook until crispy, about 5-7 minutes.
3. In a bowl, whisk together eggs, both cheeses, and a generous amount of black pepper.
4. When pasta is ready, reserve 1 cup of pasta water, then drain pasta.
5. Add hot pasta to the skillet with pancetta. Remove from heat.
6. Quickly add the egg mixture, tossing constantly to create a creamy sauce. Add pasta water as needed.
7. Serve immediately with extra cheese and black pepper.',
        'Dinner',
        15,
        20,
        4,
        'Medium',
        1
    ),
    (
        'Avocado Toast with Poached Egg',
        'Ingredients:
- 2 slices whole grain bread
- 1 ripe avocado
- 2 fresh eggs
- 1 tbsp white vinegar
- Salt and pepper to taste
- Red pepper flakes (optional)
- Fresh herbs for garnish

Instructions:
1. Toast bread slices until golden brown.
2. Meanwhile, mash avocado with salt and pepper.
3. Fill a pot with water and bring to a gentle simmer. Add vinegar.
4. Crack each egg into a small bowl, then gently slip into simmering water.
5. Poach eggs for 3-4 minutes for runny yolks.
6. Spread mashed avocado on toast.
7. Top with poached eggs, season with salt, pepper, and red pepper flakes.
8. Garnish with fresh herbs and serve immediately.',
        'Breakfast',
        10,
        8,
        2,
        'Easy',
        1
    ),
    (
        'Chocolate Chip Cookies',
        'Ingredients:
- 2¼ cups all-purpose flour
- 1 tsp baking soda
- 1 tsp salt
- 1 cup butter, softened
- ¾ cup granulated sugar
- ¾ cup packed brown sugar
- 2 large eggs
- 2 tsp vanilla extract
- 2 cups chocolate chips

Instructions:
1. Preheat oven to 375°F (190°C).
2. In a bowl, whisk together flour, baking soda, and salt.
3. In a large bowl, cream together butter and both sugars until fluffy.
4. Beat in eggs one at a time, then vanilla.
5. Gradually mix in flour mixture until just combined.
6. Fold in chocolate chips.
7. Drop rounded tablespoons of dough onto ungreased baking sheets.
8. Bake for 9-11 minutes until golden brown.
9. Cool on baking sheet for 2 minutes, then transfer to wire rack.',
        'Dessert',
        20,
        10,
        24,
        'Easy',
        1
    );
    
    PRINT 'Sample data inserted successfully!';
END
ELSE
BEGIN
    PRINT 'Sample data already exists!';
END
GO

-- Verify table creation and data
SELECT 
    'MealPlanner' as TableName,
    COUNT(*) as RecordCount
FROM MealPlanner;

-- Show table structure
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'MealPlanner'
ORDER BY ORDINAL_POSITION;

PRINT 'Database setup completed successfully!';
