require('dotenv').config();
const sql = require('mssql');
const dbConfig = require('./dbConfig');

async function createMealPlannerTable() {
    try {
        const pool = await sql.connect(dbConfig);
        
        // Check if table exists
        const checkTableQuery = `
            SELECT COUNT(*) as count 
            FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'MealPlanner'
        `;
        
        const tableExists = await pool.request().query(checkTableQuery);
        
        if (tableExists.recordset[0].count > 0) {
            console.log('MealPlanner table already exists!');
            return;
        }
        
        // Create table
        const createTableQuery = `
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
        `;
        
        await pool.request().query(createTableQuery);
        console.log('MealPlanner table created successfully!');
        
        // Create indexes
        const indexQueries = [
            'CREATE INDEX IX_MealPlanner_Category ON MealPlanner(Category)',
            'CREATE INDEX IX_MealPlanner_Difficulty ON MealPlanner(Difficulty)',
            'CREATE INDEX IX_MealPlanner_CreatedDate ON MealPlanner(CreatedDate)',
            'CREATE INDEX IX_MealPlanner_CreatedBy ON MealPlanner(CreatedBy)'
        ];
        
        for (const indexQuery of indexQueries) {
            await pool.request().query(indexQuery);
        }
        console.log('Indexes created successfully!');
        
        // Insert sample data
        const insertSampleData = `
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
            )
        `;
        
        await pool.request().query(insertSampleData);
        console.log('Sample data inserted successfully!');
        
        // Verify table creation
        const verifyQuery = 'SELECT COUNT(*) as count FROM MealPlanner';
        const result = await pool.request().query(verifyQuery);
        console.log(`Total meals in database: ${result.recordset[0].count}`);
        
        await pool.close();
        console.log('Database setup completed successfully!');
        
    } catch (error) {
        console.error('Error creating MealPlanner table:', error);
    }
}

// Run the setup
createMealPlannerTable();
