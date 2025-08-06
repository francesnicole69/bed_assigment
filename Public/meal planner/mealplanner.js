// Meal Planner JavaScript

// Global variables
let currentRecipes = [];
let currentMealType = '';

// Initialize the application
document.addEventListener('DOMContentLoaded', function() {
    setupEventListeners();
});

// Setup event listeners
function setupEventListeners() {
    // Form submission
    document.getElementById('addRecipeForm').addEventListener('submit', handleAddRecipe);
    
    // Modal close on outside click
    document.getElementById('recipeModal').addEventListener('click', function(e) {
        if (e.target === this) {
            closeModal();
        }
    });
}

// Tab Management
function showTab(tabName) {
    // Hide all tabs
    const tabs = document.querySelectorAll('.tab-content');
    tabs.forEach(tab => tab.classList.remove('active'));
    
    // Hide all tab buttons active state
    const tabBtns = document.querySelectorAll('.tab-btn');
    tabBtns.forEach(btn => btn.classList.remove('active'));
    
    // Show selected tab
    document.getElementById(tabName + '-tab').classList.add('active');
    
    // Activate selected tab button
    event.target.classList.add('active');
}

// Load recipes by meal type
async function loadRecipesByMealType() {
    const mealType = document.getElementById('mealType').value;
    currentMealType = mealType;
    
    if (!mealType) {
        document.getElementById('recipesGrid').innerHTML = '<p class="no-recipes">Select a meal type to view recipes</p>';
        return;
    }
    
    showLoading(true);
    
    try {
        // Try to fetch from local database first
        const response = await fetch(`/api/recipes/mealtype/${mealType}`);
        let localRecipes = [];
        
        if (response.ok) {
            localRecipes = await response.json();
        } else {
            console.warn('Database not set up, using sample data');
            localRecipes = getSampleRecipesByMealType(mealType);
        }
        
        // Try to fetch recipes from Spoonacular API, but don't fail if it doesn't work
        let externalRecipes = [];
        try {
            externalRecipes = await fetchExternalRecipes(mealType);
            console.log(`Successfully fetched ${externalRecipes.length} external recipes`);
        } catch (error) {
            console.warn('External API unavailable, using local recipes only:', error.message);
            // Add some sample external-style recipes as fallback
            externalRecipes = getSampleExternalRecipes(mealType);
        }
        
        // Combine local and external recipes
        const allRecipes = [...localRecipes, ...externalRecipes];
        currentRecipes = allRecipes;
        
        if (allRecipes.length > 0) {
            displayRecipes(allRecipes, 'recipesGrid');
        } else {
            document.getElementById('recipesGrid').innerHTML = `<p class="no-recipes">No ${mealType.toLowerCase()} recipes found</p>`;
        }
        
    } catch (error) {
        console.error('Error:', error);
        // If everything fails, use sample data
        console.warn('All APIs failed, using sample data');
        const sampleRecipes = getSampleRecipesByMealType(mealType);
        currentRecipes = sampleRecipes;
        displayRecipes(sampleRecipes, 'recipesGrid');
    } finally {
        showLoading(false);
    }
}

// Display recipes in a grid
function displayRecipes(recipes, containerId) {
    const container = document.getElementById(containerId);
    
    if (!recipes || recipes.length === 0) {
        container.innerHTML = `<p class="no-recipes">No ${currentMealType.toLowerCase()} recipes found</p>`;
        return;
    }
    
    container.innerHTML = recipes.map(recipe => createRecipeCard(recipe)).join('');
}

// Create recipe card HTML
function createRecipeCard(recipe) {
    // Handle both local and external recipe formats
    const isExternal = recipe.IsExternal || recipe.RecipeID.toString().startsWith('sp_');
    const recipeName = recipe.RecipeName || recipe.title;
    const prepTime = recipe.PrepTime || recipe.prepTime || 0;
    const cookTime = recipe.CookTime || recipe.cookTime || 0;
    const difficulty = recipe.Difficulty || recipe.difficulty || 'Easy';
    const servings = recipe.Servings || recipe.servings || 1;
    const description = recipe.Description || recipe.description || '';
    const recipeId = recipe.RecipeID || recipe.id;
    
    // Truncate description for card view
    const shortDescription = description.length > 120 ? 
        description.substring(0, 120) + '...' : description;
    
    return `
        <div class="recipe-card ${isExternal ? 'external-recipe' : ''}">
            ${recipe.image ? `<img src="${recipe.image}" alt="${recipeName}" class="recipe-card-image" style="width: 100%; height: 200px; object-fit: cover; border-radius: 8px 8px 0 0;">` : ''}
            
            <div class="recipe-card-header">
                <h3>${escapeHtml(recipeName)}</h3>
                ${isExternal ? '<span class="external-badge">🌐</span>' : ''}
                <div class="recipe-meta">
                    ${prepTime ? `<span>${prepTime}m prep</span>` : ''}
                    ${cookTime ? `<span>${cookTime}m cook</span>` : ''}
                    <span>${difficulty}</span>
                </div>
            </div>
            
            <div class="recipe-card-body">
                ${shortDescription ? `<p class="recipe-description">${escapeHtml(shortDescription)}</p>` : ''}
                <div class="recipe-stats">
                    <span>🍽️ ${servings} servings</span>
                    ${!isExternal ? '<span>🏠 Local Recipe</span>' : '<span>🌐 External</span>'}
                </div>
                <div class="recipe-actions">
                    <button class="btn btn-primary" onclick="viewFullRecipe('${recipeId}')">View Full Recipe</button>
                    ${!isExternal ? `<button class="btn btn-danger" onclick="deleteRecipe(${recipeId})">Delete</button>` : ''}
                </div>
            </div>
        </div>
    `;
}

// View full recipe in modal
async function viewFullRecipe(recipeId) {
    showLoading(true);
    
    try {
        let recipe = null;
        
        // Check if this is a Spoonacular recipe (string ID starting with 'sp_') or local recipe
        if (typeof recipeId === 'string' && recipeId.startsWith('sp_')) {
            // Check if this is a sample external recipe
            if (recipeId.startsWith('sp_sample_')) {
                // This is a sample external recipe, find it in current recipes
                const sampleRecipe = currentRecipes.find(r => r.RecipeID === recipeId);
                if (sampleRecipe) {
                    // Create a detailed view for the sample recipe
                    const detailedSampleRecipe = {
                        id: sampleRecipe.RecipeID,
                        title: sampleRecipe.RecipeName,
                        mealType: sampleRecipe.MealType,
                        prepTime: sampleRecipe.PrepTime,
                        cookTime: sampleRecipe.CookTime,
                        totalTime: sampleRecipe.PrepTime + sampleRecipe.CookTime,
                        servings: sampleRecipe.Servings,
                        difficulty: sampleRecipe.Difficulty,
                        description: sampleRecipe.Description,
                        ingredients: getSampleIngredients(recipeId),
                        instructions: getSampleInstructions(recipeId),
                        image: sampleRecipe.image,
                        sourceUrl: sampleRecipe.sourceUrl,
                        isExternal: true
                    };
                    showRecipeModal(detailedSampleRecipe, true);
                } else {
                    showError('Sample recipe not found');
                }
            } else {
                // This is a real Spoonacular recipe
                const spoonacularId = recipeId.replace('sp_', '');
                recipe = await fetchSpoonacularRecipeDetails(spoonacularId);
                
                if (recipe) {
                    showRecipeModal(recipe, true); // true indicates external recipe
                } else {
                    showError('Error loading external recipe details');
                }
            }
        } else {
            // This is a local recipe
            try {
                const response = await fetch(`/api/recipes/${recipeId}`);
                recipe = await response.json();
                
                if (response.ok) {
                    showRecipeModal(recipe, false); // false indicates local recipe
                } else {
                    // Fallback to sample data if recipe not found
                    const fallbackRecipe = currentRecipes.find(r => r.id == recipeId || r.RecipeID == recipeId);
                    if (fallbackRecipe) {
                        showRecipeModal(fallbackRecipe, false);
                    } else {
                        showError('Recipe not found');
                    }
                }
            } catch (error) {
                // Fallback to sample data
                const fallbackRecipe = currentRecipes.find(r => r.id == recipeId || r.RecipeID == recipeId);
                if (fallbackRecipe) {
                    showRecipeModal(fallbackRecipe, false);
                } else {
                    showError('Error loading recipe details. Please try again.');
                }
            }
        }
    } catch (error) {
        console.error('Error:', error);
        showError('Error loading recipe details. Please try again.');
    } finally {
        showLoading(false);
    }
}

// Show recipe in modal
function showRecipeModal(recipe, isExternalRecipe = false) {
    const modal = document.getElementById('recipeModal');
    const detailsContainer = document.getElementById('recipeDetails');
    
    let prepTime, cookTime, totalTime, recipeName, mealType, servings, difficulty, description, ingredients, instructions;
    
    if (isExternalRecipe) {
        // Handle Spoonacular recipe format
        prepTime = recipe.prepTime ? `${recipe.prepTime}` : '0';
        cookTime = recipe.cookTime ? `${recipe.cookTime}` : '0';
        totalTime = recipe.totalTime ? `${recipe.totalTime}` : '0';
        recipeName = recipe.title;
        mealType = recipe.mealType || 'External Recipe';
        servings = recipe.servings || 'Not specified';
        difficulty = recipe.difficulty || 'Medium';
        description = recipe.description || '';
        
        // Handle ingredients array
        if (Array.isArray(recipe.ingredients)) {
            ingredients = recipe.ingredients;
        } else {
            ingredients = ['Ingredients not available'];
        }
        
        // Handle instructions array
        if (Array.isArray(recipe.instructions)) {
            instructions = recipe.instructions;
        } else {
            instructions = ['Instructions not available'];
        }
    } else {
        // Handle local database recipe format
        prepTime = recipe.PrepTime ? `${recipe.PrepTime}` : '0';
        cookTime = recipe.CookTime ? `${recipe.CookTime}` : '0';
        totalTime = (recipe.PrepTime && recipe.CookTime) ? (recipe.PrepTime + recipe.CookTime).toString() : '0';
        recipeName = recipe.RecipeName || recipe.title;
        mealType = recipe.MealType || recipe.meal_type || 'General';
        servings = recipe.Servings || recipe.servings || 'Not specified';
        difficulty = recipe.Difficulty || recipe.difficulty || 'Easy';
        description = recipe.Description || recipe.description || '';
        
        // Parse ingredients and instructions for local recipes
        const ingredientsText = recipe.Ingredients || recipe.ingredients || '';
        const instructionsText = recipe.Instructions || recipe.instructions || '';
        
        ingredients = ingredientsText.split('\n').filter(item => item.trim());
        instructions = instructionsText.split('\n').filter(item => item.trim());
        
        // Clean up instructions - remove any existing numbering
        instructions = instructions.map(instruction => {
            // Remove leading numbers and dots (e.g., "1. ", "2. ")
            return instruction.replace(/^\d+\.\s*/, '').trim();
        }).filter(instruction => instruction.length > 0);
        
        if (ingredients.length === 0) ingredients = ['Ingredients not available'];
        if (instructions.length === 0) instructions = ['Instructions not available'];
    }
    
    detailsContainer.innerHTML = `
        <div class="recipe-detail">
            <h2>${escapeHtml(recipeName)}</h2>
            ${isExternalRecipe ? '<div class="external-recipe-badge">🌐 External Recipe</div>' : ''}
            
            <div class="recipe-detail-meta">
                <span>🍽️ ${mealType}</span>
                <span>⏱️ Prep: ${prepTime} minutes</span>
                <span>🔥 Cook: ${cookTime} minutes</span>
                <span>👥 Serves: ${servings}</span>
                <span>📊 ${difficulty}</span>
            </div>
            
            ${description ? `<p><strong>Description:</strong> ${escapeHtml(description)}</p>` : ''}
            
            ${recipe.sourceUrl ? `<p><strong>Source:</strong> <a href="${recipe.sourceUrl}" target="_blank">View Original Recipe</a></p>` : ''}
            
            ${recipe.image ? `<img src="${recipe.image}" alt="${recipeName}" style="width: 100%; max-width: 400px; height: auto; border-radius: 8px; margin: 15px 0;">` : ''}
            
            ${(recipe.VideoURL || recipe.video_url) ? `
                <div class="recipe-video">
                    <h3>Recipe Video</h3>
                    <video controls>
                        <source src="${recipe.VideoURL || recipe.video_url}" type="video/mp4">
                        Your browser does not support the video tag.
                    </video>
                </div>
            ` : ''}
            
            <div class="recipe-ingredients">
                <h3>Ingredients</h3>
                <ul>
                    ${ingredients.map(ingredient => `<li>${escapeHtml(ingredient)}</li>`).join('')}
                </ul>
            </div>
            
            <div class="recipe-instructions">
                <h3>Instructions</h3>
                <ol>
                    ${instructions.map(instruction => `<li>${escapeHtml(instruction)}</li>`).join('')}
                </ol>
            </div>
        </div>
    `;
    
    modal.style.display = 'block';
}

// Close modal
function closeModal() {
    document.getElementById('recipeModal').style.display = 'none';
}

// Handle add recipe form submission
async function handleAddRecipe(event) {
    event.preventDefault();
    
    const formData = new FormData(event.target);
    
    // Convert FormData to JSON object
    const recipeData = {
        recipeName: formData.get('recipeName'),
        mealType: formData.get('mealType'),
        instructions: formData.get('instructions'),
        ingredients: formData.get('ingredients'),
        prepTime: formData.get('prepTime'),
        cookTime: formData.get('cookTime'),
        servings: formData.get('servings'),
        difficulty: formData.get('difficulty'),
        description: formData.get('description')
    };
    
    showLoading(true);
    
    try {
        const response = await fetch('/api/recipes', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(recipeData)
        });
        
        const result = await response.json();
        
        if (response.ok) {
            showSuccess('Recipe added successfully!');
            event.target.reset();
            
            // Reload recipes if we're viewing the same meal type
            if (currentMealType === recipeData.mealType) {
                loadRecipesByMealType();
            }
        } else {
            if (result.details && Array.isArray(result.details)) {
                const errorMessages = result.details.map(error => error.msg).join(', ');
                showError('Validation errors: ' + errorMessages);
            } else {
                showError('Error adding recipe: ' + result.error);
            }
        }
    } catch (error) {
        console.error('Error:', error);
        showError('Recipe form submission failed. Database may not be set up yet. Please run the recipes_table.sql script first.');
    } finally {
        showLoading(false);
    }
}

// Delete recipe
async function deleteRecipe(recipeId) {
    if (!confirm('Are you sure you want to delete this recipe? This action cannot be undone.')) {
        return;
    }
    
    showLoading(true);
    
    try {
        const response = await fetch(`/api/recipes/${recipeId}`, {
            method: 'DELETE'
        });
        
        const result = await response.json();
        
        if (response.ok) {
            showSuccess('Recipe deleted successfully!');
            
            // Reload current view
            if (currentMealType) {
                loadRecipesByMealType();
            }
        } else {
            showError('Error deleting recipe: ' + result.error);
        }
    } catch (error) {
        console.error('Error:', error);
        showError('Error deleting recipe. Please try again.');
    } finally {
        showLoading(false);
    }
}

// Utility Functions
function showLoading(show) {
    const overlay = document.getElementById('loadingOverlay');
    overlay.style.display = show ? 'flex' : 'none';
}

function showError(message) {
    alert('Error: ' + message);
}

function showSuccess(message) {
    alert('Success: ' + message);
}

function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString();
}

// API Recipe Integration with Spoonacular
async function fetchExternalRecipes(mealType) {
    // Note: Direct API calls from browser may fail due to CORS or API key issues
    // This is a fallback implementation that simulates external recipes
    
    try {
        // Try a different API key or endpoint
        const API_KEY = 'af04e68d00334fffbe04a9140059858d';
        const BASE_URL = 'https://api.spoonacular.com/recipes';
        
        // Map meal types to Spoonacular types
        const mealTypeMap = {
            'Breakfast': 'breakfast',
            'Lunch': 'main course',
            'Dinner': 'main course'
        };
        
        const spoonacularType = mealTypeMap[mealType] || 'main course';
        
        console.log(`Attempting to fetch ${mealType} recipes from Spoonacular API...`);
        
        // Create the request with proper headers
        const response = await fetch(
            `${BASE_URL}/complexSearch?type=${spoonacularType}&number=6&addRecipeInformation=true&apiKey=${API_KEY}`,
            {
                method: 'GET',
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                }
            }
        );
        
        if (!response.ok) {
            if (response.status === 401) {
                throw new Error('API key invalid or expired (401)');
            } else if (response.status === 402) {
                throw new Error('API quota exceeded (402)');
            } else {
                throw new Error(`Spoonacular API error: ${response.status}`);
            }
        }
        
        const data = await response.json();
        console.log(`Successfully received ${data.results.length} recipes from Spoonacular`);
        
        // Convert Spoonacular format to our format
        return data.results.map(recipe => {
            const prepTime = recipe.preparationMinutes > 0 ? recipe.preparationMinutes : 
                            (recipe.readyInMinutes ? Math.max(5, Math.floor(recipe.readyInMinutes * 0.3)) : 15);
            const cookTime = recipe.cookingMinutes > 0 ? recipe.cookingMinutes : 
                            (recipe.readyInMinutes ? Math.max(5, Math.floor(recipe.readyInMinutes * 0.7)) : 20);
            
            return {
                RecipeID: `sp_${recipe.id}`,
                RecipeName: recipe.title,
                MealType: mealType,
                PrepTime: prepTime,
                CookTime: cookTime,
                Servings: recipe.servings || 1,
                Difficulty: recipe.spoonacularScore > 80 ? 'Hard' : recipe.spoonacularScore > 60 ? 'Medium' : 'Easy',
                Description: recipe.summary ? 
                    recipe.summary.replace(/<[^>]*>/g, '').substring(0, 150).trim() + '...' : 
                    'Delicious recipe from Spoonacular',
                image: recipe.image,
                IsExternal: true,
                spoonacularId: recipe.id,
                sourceUrl: recipe.sourceUrl,
                Ingredients: 'Click "View Full Recipe" to see ingredients',
                Instructions: 'Click "View Full Recipe" to see instructions',
                CreatedDate: new Date().toISOString(),
                VideoURL: null
            };
        });
        
    } catch (error) {
        console.error('Error fetching external recipes:', error.message);
        
        // Instead of returning empty array, throw the error so it can be caught
        // and fallback recipes can be used
        throw new Error(`External API unavailable: ${error.message}`);
    }
}

// Fetch detailed recipe from Spoonacular
async function fetchSpoonacularRecipeDetails(recipeId) {
    const API_KEY = 'af04e68d00334fffbe04a9140059858d';
    const BASE_URL = 'https://api.spoonacular.com/recipes';
    
    try {
        console.log(`Fetching details for recipe ${recipeId} from Spoonacular...`);
        
        const response = await fetch(
            `${BASE_URL}/${recipeId}/information?includeNutrition=false&apiKey=${API_KEY}`
        );
        
        if (!response.ok) {
            throw new Error(`Spoonacular API error: ${response.status}`);
        }
        
        const recipe = await response.json();
        
        // Get analyzed instructions
        const instructionsResponse = await fetch(
            `${BASE_URL}/${recipeId}/analyzedInstructions?apiKey=${API_KEY}`
        );
        
        let instructions = ['Instructions not available'];
        if (instructionsResponse.ok) {
            const instructionsData = await instructionsResponse.json();
            if (instructionsData.length > 0 && instructionsData[0].steps) {
                instructions = instructionsData[0].steps
                    .map(step => step.step.trim())
                    .filter(step => step.length > 0);
            }
        }
        
        // Calculate realistic times if they're 0
        const prepTime = recipe.preparationMinutes > 0 ? recipe.preparationMinutes : 
                        (recipe.readyInMinutes ? Math.max(5, Math.floor(recipe.readyInMinutes * 0.3)) : 15);
        const cookTime = recipe.cookingMinutes > 0 ? recipe.cookingMinutes : 
                        (recipe.readyInMinutes ? Math.max(5, Math.floor(recipe.readyInMinutes * 0.7)) : 20);
        
        console.log(`Successfully fetched recipe details for: ${recipe.title}`);
        
        return {
            id: `sp_${recipe.id}`,
            title: recipe.title,
            mealType: 'External Recipe',
            prepTime: prepTime,
            cookTime: cookTime,
            totalTime: prepTime + cookTime,
            servings: recipe.servings || 1,
            difficulty: recipe.spoonacularScore > 80 ? 'Hard' : recipe.spoonacularScore > 60 ? 'Medium' : 'Easy',
            description: recipe.summary ? recipe.summary.replace(/<[^>]*>/g, '').trim() : 'Delicious recipe from Spoonacular',
            ingredients: recipe.extendedIngredients ? 
                recipe.extendedIngredients.map(ing => ing.original) : 
                ['Ingredients not available'],
            instructions: instructions,
            image: recipe.image,
            sourceUrl: recipe.sourceUrl,
            isExternal: true,
            spoonacularId: recipe.id
        };
        
    } catch (error) {
        console.error('Error fetching recipe details:', error);
        return null;
    }
}

// Load sample data function (for testing)
function getSampleRecipesByMealType(mealType) {
    const allSampleRecipes = {
        'Breakfast': [
            {
                RecipeID: 1,
                RecipeName: 'Classic Pancakes',
                MealType: 'Breakfast',
                PrepTime: 10,
                CookTime: 15,
                Servings: 4,
                Difficulty: 'Easy',
                Description: 'Fluffy and delicious pancakes perfect for breakfast',
                Ingredients: '2 cups flour\n2 tablespoons sugar\n2 teaspoons baking powder\n1 teaspoon salt\n1 3/4 cups milk\n1 large egg\n1/4 cup melted butter',
                Instructions: '1. Mix dry ingredients\n2. Combine wet ingredients\n3. Mix together until just combined\n4. Cook on griddle until bubbles form\n5. Flip and cook until golden',
                CreatedDate: new Date().toISOString(),
                VideoURL: null
            },
            {
                RecipeID: 2,
                RecipeName: 'Avocado Toast',
                MealType: 'Breakfast',
                PrepTime: 5,
                CookTime: 5,
                Servings: 1,
                Difficulty: 'Easy',
                Description: 'Healthy and nutritious breakfast with protein',
                Ingredients: '2 slices bread\n1 avocado\n1 egg\nSalt and pepper',
                Instructions: '1. Toast bread\n2. Mash avocado\n3. Fry egg\n4. Assemble and serve',
                CreatedDate: new Date().toISOString(),
                VideoURL: null
            }
        ],
        'Lunch': [
            {
                RecipeID: 3,
                RecipeName: 'Caesar Salad',
                MealType: 'Lunch',
                PrepTime: 15,
                CookTime: 15,
                Servings: 2,
                Difficulty: 'Medium',
                Description: 'Classic Caesar salad with grilled chicken',
                Ingredients: '2 chicken breasts\n6 cups romaine lettuce\nCaesar dressing\nCroutons\nParmesan cheese',
                Instructions: '1. Grill chicken\n2. Chop lettuce\n3. Make dressing\n4. Toss and serve',
                CreatedDate: new Date().toISOString(),
                VideoURL: null
            },
            {
                RecipeID: 4,
                RecipeName: 'Quinoa Bowl',
                MealType: 'Lunch',
                PrepTime: 20,
                CookTime: 25,
                Servings: 2,
                Difficulty: 'Medium',
                Description: 'Nutritious quinoa bowl with vegetables',
                Ingredients: '1 cup quinoa\nMixed vegetables\nChickpeas\nTahini dressing',
                Instructions: '1. Cook quinoa\n2. Roast vegetables\n3. Assemble bowl\n4. Add dressing',
                CreatedDate: new Date().toISOString(),
                VideoURL: null
            }
        ],
        'Dinner': [
            {
                RecipeID: 5,
                RecipeName: 'Salmon with Garlic',
                MealType: 'Dinner',
                PrepTime: 10,
                CookTime: 15,
                Servings: 4,
                Difficulty: 'Medium',
                Description: 'Elegant salmon dinner with garlic butter',
                Ingredients: '4 salmon fillets\nGarlic\nButter\nHerbs\nLemon',
                Instructions: '1. Season salmon\n2. Sear in pan\n3. Add garlic butter\n4. Finish in oven',
                CreatedDate: new Date().toISOString(),
                VideoURL: null
            },
            {
                RecipeID: 6,
                RecipeName: 'Pasta Carbonara',
                MealType: 'Dinner',
                PrepTime: 10,
                CookTime: 20,
                Servings: 4,
                Difficulty: 'Medium',
                Description: 'Classic Italian pasta with creamy sauce',
                Ingredients: '1 lb spaghetti\nPancetta\nEggs\nParmesan\nBlack pepper',
                Instructions: '1. Cook pasta\n2. Cook pancetta\n3. Mix eggs and cheese\n4. Combine quickly',
                CreatedDate: new Date().toISOString(),
                VideoURL: null
            }
        ]
    };
    
    return allSampleRecipes[mealType] || [];
}

// Fallback external-style recipes when Spoonacular API is unavailable
function getSampleExternalRecipes(mealType) {
    const externalSampleRecipes = {
        'Breakfast': [
            {
                RecipeID: 'sp_sample_1',
                RecipeName: 'French Toast Casserole',
                MealType: 'Breakfast',
                PrepTime: 15,
                CookTime: 45,
                Servings: 8,
                Difficulty: 'Medium',
                Description: 'Make-ahead breakfast casserole perfect for feeding a crowd. Rich, custardy, and delicious.',
                image: 'https://images.unsplash.com/photo-1484723091739-30a097e8f929?w=400',
                IsExternal: true,
                sourceUrl: '#',
                Ingredients: 'Click "View Full Recipe" to see ingredients',
                Instructions: 'Click "View Full Recipe" to see instructions',
                CreatedDate: new Date().toISOString(),
                VideoURL: null
            },
            {
                RecipeID: 'sp_sample_2',
                RecipeName: 'Blueberry Smoothie Bowl',
                MealType: 'Breakfast',
                PrepTime: 10,
                CookTime: 0,
                Servings: 2,
                Difficulty: 'Easy',
                Description: 'Healthy and refreshing smoothie bowl topped with fresh fruits and granola.',
                image: 'https://images.unsplash.com/photo-1511690743698-d9d85f2fbf38?w=400',
                IsExternal: true,
                sourceUrl: '#',
                Ingredients: 'Click "View Full Recipe" to see ingredients',
                Instructions: 'Click "View Full Recipe" to see instructions',
                CreatedDate: new Date().toISOString(),
                VideoURL: null
            }
        ],
        'Lunch': [
            {
                RecipeID: 'sp_sample_3',
                RecipeName: 'Mediterranean Wrap',
                MealType: 'Lunch',
                PrepTime: 15,
                CookTime: 0,
                Servings: 4,
                Difficulty: 'Easy',
                Description: 'Fresh and healthy wrap filled with Mediterranean flavors, perfect for a light lunch.',
                image: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400',
                IsExternal: true,
                sourceUrl: '#',
                Ingredients: 'Click "View Full Recipe" to see ingredients',
                Instructions: 'Click "View Full Recipe" to see instructions',
                CreatedDate: new Date().toISOString(),
                VideoURL: null
            },
            {
                RecipeID: 'sp_sample_4',
                RecipeName: 'Asian Fusion Bowl',
                MealType: 'Lunch',
                PrepTime: 20,
                CookTime: 15,
                Servings: 2,
                Difficulty: 'Medium',
                Description: 'Colorful and nutritious bowl with Asian-inspired flavors and fresh vegetables.',
                image: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400',
                IsExternal: true,
                sourceUrl: '#',
                Ingredients: 'Click "View Full Recipe" to see ingredients',
                Instructions: 'Click "View Full Recipe" to see instructions',
                CreatedDate: new Date().toISOString(),
                VideoURL: null
            }
        ],
        'Dinner': [
            {
                RecipeID: 'sp_sample_5',
                RecipeName: 'Herb-Crusted Chicken',
                MealType: 'Dinner',
                PrepTime: 15,
                CookTime: 30,
                Servings: 4,
                Difficulty: 'Medium',
                Description: 'Juicy chicken breast with a flavorful herb crust, served with roasted vegetables.',
                image: 'https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=400',
                IsExternal: true,
                sourceUrl: '#',
                Ingredients: 'Click "View Full Recipe" to see ingredients',
                Instructions: 'Click "View Full Recipe" to see instructions',
                CreatedDate: new Date().toISOString(),
                VideoURL: null
            },
            {
                RecipeID: 'sp_sample_6',
                RecipeName: 'Vegetarian Risotto',
                MealType: 'Dinner',
                PrepTime: 10,
                CookTime: 25,
                Servings: 4,
                Difficulty: 'Hard',
                Description: 'Creamy and rich risotto with seasonal vegetables and parmesan cheese.',
                image: 'https://images.unsplash.com/photo-1476124369491-e7addf5db371?w=400',
                IsExternal: true,
                sourceUrl: '#',
                Ingredients: 'Click "View Full Recipe" to see ingredients',
                Instructions: 'Click "View Full Recipe" to see instructions',
                CreatedDate: new Date().toISOString(),
                VideoURL: null
            }
        ]
    };
    
    return externalSampleRecipes[mealType] || [];
}

// Get detailed ingredients for sample external recipes
function getSampleIngredients(recipeId) {
    const ingredients = {
        'sp_sample_1': [
            '8 slices thick bread, cubed',
            '8 large eggs',
            '2 cups whole milk',
            '1/2 cup heavy cream',
            '1/2 cup maple syrup',
            '1 tsp vanilla extract',
            '1/2 tsp cinnamon',
            '1/4 tsp nutmeg',
            'Pinch of salt',
            '4 tbsp butter, melted'
        ],
        'sp_sample_2': [
            '1 cup frozen blueberries',
            '1 banana, sliced',
            '1/2 cup Greek yogurt',
            '1/4 cup almond milk',
            '1 tbsp honey',
            '1/4 cup granola',
            '2 tbsp chia seeds',
            'Fresh berries for topping',
            '2 tbsp coconut flakes'
        ],
        'sp_sample_3': [
            '4 large tortillas',
            '1 cup hummus',
            '2 cups mixed greens',
            '1 cucumber, diced',
            '2 tomatoes, diced',
            '1/2 red onion, sliced',
            '1/2 cup feta cheese',
            '1/4 cup olives',
            '2 tbsp olive oil',
            '1 tbsp lemon juice'
        ],
        'sp_sample_4': [
            '2 cups cooked quinoa',
            '1 cup edamame',
            '1 carrot, julienned',
            '1 bell pepper, sliced',
            '1/2 cup cabbage, shredded',
            '2 green onions, chopped',
            '2 tbsp sesame oil',
            '2 tbsp soy sauce',
            '1 tbsp rice vinegar',
            '1 tsp ginger, minced'
        ],
        'sp_sample_5': [
            '4 chicken breasts',
            '2 tbsp olive oil',
            '2 cloves garlic, minced',
            '1 tbsp fresh rosemary',
            '1 tbsp fresh thyme',
            '1 tsp oregano',
            '1/2 cup breadcrumbs',
            '1/4 cup parmesan cheese',
            'Salt and pepper to taste',
            '2 cups mixed vegetables'
        ],
        'sp_sample_6': [
            '1 1/2 cups arborio rice',
            '4 cups vegetable broth',
            '1 onion, diced',
            '2 cloves garlic, minced',
            '1/2 cup white wine',
            '1 cup mixed mushrooms',
            '1 zucchini, diced',
            '1/2 cup peas',
            '1/2 cup parmesan cheese',
            '3 tbsp butter'
        ]
    };
    
    return ingredients[recipeId] || ['Ingredients not available'];
}

// Get detailed instructions for sample external recipes
function getSampleInstructions(recipeId) {
    const instructions = {
        'sp_sample_1': [
            'Grease a 9x13 inch baking dish',
            'Place cubed bread in the prepared dish',
            'In a large bowl, whisk together eggs, milk, cream, maple syrup, vanilla, cinnamon, nutmeg, and salt',
            'Pour egg mixture over bread cubes',
            'Cover and refrigerate for at least 4 hours or overnight',
            'Preheat oven to 350°F (175°C)',
            'Drizzle melted butter over the top',
            'Bake for 45-50 minutes until golden brown and set',
            'Let cool for 5 minutes before serving'
        ],
        'sp_sample_2': [
            'Blend frozen blueberries, banana, Greek yogurt, almond milk, and honey until smooth',
            'Pour smoothie mixture into bowls',
            'Top with granola, chia seeds, and fresh berries',
            'Sprinkle with coconut flakes',
            'Serve immediately for best texture'
        ],
        'sp_sample_3': [
            'Warm tortillas in microwave or dry skillet',
            'Spread hummus evenly on each tortilla',
            'Layer with mixed greens, cucumber, tomatoes, and red onion',
            'Sprinkle with feta cheese and olives',
            'Drizzle with olive oil and lemon juice',
            'Roll tightly and cut in half',
            'Serve immediately'
        ],
        'sp_sample_4': [
            'Cook quinoa according to package directions and let cool',
            'Steam edamame until tender',
            'Prepare all vegetables by slicing and chopping',
            'In a large bowl, combine quinoa, edamame, and vegetables',
            'Whisk together sesame oil, soy sauce, rice vinegar, and ginger',
            'Pour dressing over the bowl and toss well',
            'Garnish with green onions',
            'Serve chilled or at room temperature'
        ],
        'sp_sample_5': [
            'Preheat oven to 400°F (200°C)',
            'Pound chicken breasts to even thickness',
            'Mix herbs, breadcrumbs, and parmesan in a bowl',
            'Brush chicken with olive oil and season with salt and pepper',
            'Press herb mixture onto chicken breasts',
            'Place on baking sheet with vegetables',
            'Drizzle vegetables with olive oil',
            'Bake for 25-30 minutes until chicken reaches 165°F',
            'Let rest for 5 minutes before slicing'
        ],
        'sp_sample_6': [
            'Heat broth in a saucepan and keep warm',
            'In a large pan, sauté onion and garlic until soft',
            'Add rice and stir for 2 minutes until coated',
            'Add wine and stir until absorbed',
            'Add warm broth one ladle at a time, stirring constantly',
            'Add mushrooms and zucchini halfway through cooking',
            'Continue adding broth until rice is creamy and tender (about 20 minutes)',
            'Stir in peas, butter, and parmesan',
            'Season with salt and pepper, serve immediately'
        ]
    };
    
    return instructions[recipeId] || ['Instructions not available'];
}

function loadSampleRecipes() {
    const sampleRecipes = [
        {
            RecipeID: 1,
            RecipeName: 'Classic Pancakes',
            MealType: 'Breakfast',
            PrepTime: 10,
            CookTime: 15,
            Servings: 4,
            Difficulty: 'Easy',
            Description: 'Fluffy and delicious pancakes perfect for breakfast',
            Ingredients: 'Flour\nMilk\nEggs\nBaking powder\nSalt\nSugar\nButter',
            Instructions: 'Mix dry ingredients\nCombine wet ingredients\nMix together until just combined\nCook on griddle until bubbles form\nFlip and cook until golden',
            CreatedDate: new Date().toISOString(),
            VideoURL: null
        }
    ];
    
    displayRecipes(sampleRecipes, 'recipesGrid');
}
