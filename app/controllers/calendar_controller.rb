class CalendarController < ApplicationController
    
    require 'json'
    def index
        @days = PlannedDay.where(date: (Date.today)..(Date.today+13))
        @responses = get_days_responses
    end
    
    def show
        @days = PlannedDay.where(date: (Date.today)..(Date.today+13))
        @day = PlannedDay.find(params['id'])
        @responses = get_days_responses
        @response = get_recipe_info(@day[params['meal']])
        # @response = {"vegetarian"=>false, "vegan"=>false, "glutenFree"=>true, "dairyFree"=>true, "veryHealthy"=>true, "cheap"=>false, "veryPopular"=>false, "sustainable"=>false, "weightWatcherSmartPoints"=>26, "gaps"=>"no", "lowFodmap"=>true, "aggregateLikes"=>0, "spoonacularScore"=>83.0, "healthScore"=>67.0, "creditsText"=>"My Recipes", "sourceName"=>"My Recipes", "pricePerServing"=>416.98, "extendedIngredients"=>[{"id"=>2063, "aisle"=>"Produce", "image"=>"rosemary.jpg", "consistency"=>"solid", "name"=>"fresh rosemary", "original"=>"1 tablespoon fresh rosemary, chopped", "originalString"=>"1 tablespoon fresh rosemary, chopped", "originalName"=>"fresh rosemary, chopped", "amount"=>1.0, "unit"=>"tablespoon", "meta"=>["fresh", "chopped"], "metaInformation"=>["fresh", "chopped"], "measures"=>{"us"=>{"amount"=>1.0, "unitShort"=>"Tbsp", "unitLong"=>"Tbsp"}, "metric"=>{"amount"=>1.0, "unitShort"=>"Tbsp", "unitLong"=>"Tbsp"}}}, {"id"=>15031, "aisle"=>"Seafood", "image"=>"grouper-fresh.jpg", "consistency"=>"solid", "name"=>"grouper fillet", "original"=>"1 (8-ounce) grouper fillet", "originalString"=>"1 (8-ounce) grouper fillet", "originalName"=>"grouper fillet", "amount"=>8.0, "unit"=>"ounce", "meta"=>[], "metaInformation"=>[], "measures"=>{"us"=>{"amount"=>8.0, "unitShort"=>"oz", "unitLong"=>"ounces"}, "metric"=>{"amount"=>226.796, "unitShort"=>"g", "unitLong"=>"grams"}}}, {"id"=>9152, "aisle"=>"Produce", "image"=>"lemon-juice.jpg", "consistency"=>"liquid", "name"=>"lemon juice", "original"=>"2 tablespoons lemon juice", "originalString"=>"2 tablespoons lemon juice", "originalName"=>"lemon juice", "amount"=>2.0, "unit"=>"tablespoons", "meta"=>[], "metaInformation"=>[], "measures"=>{"us"=>{"amount"=>2.0, "unitShort"=>"Tbsps", "unitLong"=>"Tbsps"}, "metric"=>{"amount"=>2.0, "unitShort"=>"Tbsps", "unitLong"=>"Tbsps"}}}, {"id"=>4053, "aisle"=>"Oil, Vinegar, Salad Dressing", "image"=>"olive-oil.jpg", "consistency"=>"liquid", "name"=>"olive oil", "original"=>"1 (8-ounce) bottle olive oil-and-vinegar dressing", "originalString"=>"1 (8-ounce) bottle olive oil-and-vinegar dressing", "originalName"=>"olive oil-and-vinegar dressing", "amount"=>8.0, "unit"=>"ounce", "meta"=>[], "metaInformation"=>[], "measures"=>{"us"=>{"amount"=>8.0, "unitShort"=>"oz", "unitLong"=>"ounces"}, "metric"=>{"amount"=>226.796, "unitShort"=>"g", "unitLong"=>"grams"}}}, {"id"=>11297, "aisle"=>"Produce;Spices and Seasonings", "image"=>"parsley.jpg", "consistency"=>"solid", "name"=>"parsley", "original"=>"1/4 cup chopped fresh Italian parsley", "originalString"=>"1/4 cup chopped fresh Italian parsley", "originalName"=>"chopped fresh Italian parsley", "amount"=>0.25, "unit"=>"cup", "meta"=>["fresh", "italian", "chopped"], "metaInformation"=>["fresh", "italian", "chopped"], "measures"=>{"us"=>{"amount"=>0.25, "unitShort"=>"cups", "unitLong"=>"cups"}, "metric"=>{"amount"=>59.147, "unitShort"=>"ml", "unitLong"=>"milliliters"}}}, {"id"=>1022030, "aisle"=>"Spices and Seasonings", "image"=>"black-pepper.png", "consistency"=>"solid", "name"=>"peppercorns", "original"=>"1 tablespoon pink peppercorns", "originalString"=>"1 tablespoon pink peppercorns", "originalName"=>"pink peppercorns", "amount"=>1.0, "unit"=>"tablespoon", "meta"=>[], "metaInformation"=>[], "measures"=>{"us"=>{"amount"=>1.0, "unitShort"=>"Tbsp", "unitLong"=>"Tbsp"}, "metric"=>{"amount"=>1.0, "unitShort"=>"Tbsp", "unitLong"=>"Tbsp"}}}, {"id"=>15076, "aisle"=>"Seafood", "image"=>"salmon.png", "consistency"=>"solid", "name"=>"salmon fillet", "original"=>"1 (8-ounce) salmon fillet, skinned", "originalString"=>"1 (8-ounce) salmon fillet, skinned", "originalName"=>"salmon fillet, skinned", "amount"=>8.0, "unit"=>"ounce", "meta"=>[], "metaInformation"=>[], "measures"=>{"us"=>{"amount"=>8.0, "unitShort"=>"oz", "unitLong"=>"ounces"}, "metric"=>{"amount"=>226.796, "unitShort"=>"g", "unitLong"=>"grams"}}}, {"id"=>10015121, "aisle"=>"Seafood", "image"=>"canned-tuna.png", "consistency"=>"solid", "name"=>"tuna", "original"=>"1 (8-ounce) tuna fillet", "originalString"=>"1 (8-ounce) tuna fillet", "originalName"=>"tuna fillet", "amount"=>8.0, "unit"=>"ounce", "meta"=>[], "metaInformation"=>[], "measures"=>{"us"=>{"amount"=>8.0, "unitShort"=>"oz", "unitLong"=>"ounces"}, "metric"=>{"amount"=>226.796, "unitShort"=>"g", "unitLong"=>"grams"}}}], "id"=>3002, "title"=>"Fish Kabobs", "readyInMinutes"=>45, "servings"=>3, "sourceUrl"=>"http://www.myrecipes.com/recipe/fish-kabobs-10000000257501/", "image"=>"https://spoonacular.com/recipeImages/3002-556x370.jpg", "imageType"=>"jpg", "summary"=>"Fish Kabobs is a <b>caveman, gluten free, dairy free, and primal</b> main course. For <b>$4.25 per serving</b>, this recipe <b>covers 36%</b> of your daily requirements of vitamins and minerals. One serving contains <b>1012 calories</b>, <b>52g of protein</b>, and <b>88g of fat</b>. This recipe serves 3. 1 person has made this recipe and would make it again. From preparation to the plate, this recipe takes around <b>45 minutes</b>. If you have parsley, grouper fillet, salmon fillet, and a few other ingredients on hand, you can make it. To use up the lemon juice you could follow this main course with the <a href=\"https://spoonacular.com/recipes/lemon-shortbread-cookies-with-lemon-icing-a-tribute-to-aunt-roxanne-487814\">Lemon Shortbread Cookies with Lemon Icing {A Tribute to Aunt Roxanne}</a> as a dessert. All things considered, we decided this recipe <b>deserves a spoonacular score of 88%</b>. This score is amazing. Similar recipes include <a href=\"https://spoonacular.com/recipes/fish-kabobs-106968\">Fish Kabobs</a>, <a href=\"https://spoonacular.com/recipes/teriyaki-fish-kabobs-86471\">Teriyaki Fish Kabobs</a>, and <a href=\"https://spoonacular.com/recipes/south-beach-fish-kabobs-86429\">South Beach Fish Kabobs</a>.", "cuisines"=>[], "dishTypes"=>["lunch", "main course", "main dish", "dinner"], "diets"=>["gluten free", "dairy free", "paleolithic", "primal", "fodmap friendly", "pescatarian"], "occasions"=>[], "winePairing"=>{"pairedWines"=>["pinot grigio", "gruener veltliner", "pinot noir"], "pairingText"=>"Pinot Grigio, Gruener Veltliner, and Pinot Noir are great choices for Fish. Fish is as diverse as wine, so it's hard to pick wines that go with every fish. A crisp white wine, such as a pinot grigio or Grüner Veltliner, will suit any delicately flavored white fish. Meaty, strongly flavored fish such as salmon and tuna can even handle a light red wine, such as a pinot noir. The NV Amber Falls Winery Pinot Gris with a 5 out of 5 star rating seems like a good match. It costs about 18 dollars per bottle.", "productMatches"=>[{"id"=>432547, "title"=>"NV Amber Falls Winery Pinot Gris", "description"=>"This dry white wine is light and crisp offering tropical fruit notes which make it a perfect selection for summer. A great wine to savor on its own, it also pairs well with white meat chicken dishes, bisques, chowders and light seafood fare.", "price"=>"$18.27", "imageUrl"=>"https://spoonacular.com/productImages/432547-312x231.jpg", "averageRating"=>1.0, "ratingCount"=>1.0, "score"=>0.75, "link"=>"https://www.amazon.com/Amber-Falls-Winery-Pinot-Gris/dp/B019EKNSXM?tag=spoonacular-20"}]}, "instructions"=>"Cut each fish fillet into 1 1/2-inch-thick slices. Thread half of fish onto 2 skewers placed 2 inches apart. Repeat procedure with remaining fish, and place kabobs in a shallow dish.                                                                                                Stir together dressing and next 4 ingredients. Pour over fish; add fresh herb sprigs, if desired. Cover and chill 30 minutes.                                                                                                Remove fish from marinade, discarding marinade.                                                                                                Grill, covered with grill lid, over high heat (400 to 500) 4 minutes on each side or until fish reaches desired degree of doneness.", "analyzedInstructions"=>[{"name"=>"", "steps"=>[{"number"=>1, "step"=>"Cut each fish fillet into 1 1/2-inch-thick slices. Thread half of fish onto 2 skewers placed 2 inches apart. Repeat procedure with remaining fish, and place kabobs in a shallow dish.", "ingredients"=>[{"id"=>10115261, "name"=>"fish", "localizedName"=>"fish", "image"=>"fish-fillet.jpg"}], "equipment"=>[{"id"=>3065, "name"=>"skewers", "localizedName"=>"skewers", "image"=>"wooden-skewers.jpg"}]}, {"number"=>2, "step"=>"Stir together dressing and next 4 ingredients.", "ingredients"=>[], "equipment"=>[]}, {"number"=>3, "step"=>"Pour over fish; add fresh herb sprigs, if desired. Cover and chill 30 minutes.", "ingredients"=>[{"id"=>10115261, "name"=>"fish", "localizedName"=>"fish", "image"=>"fish-fillet.jpg"}], "equipment"=>[], "length"=>{"number"=>30, "unit"=>"minutes"}}, {"number"=>4, "step"=>"Remove fish from marinade, discarding marinade.", "ingredients"=>[{"id"=>0, "name"=>"marinade", "localizedName"=>"marinade", "image"=>"seasoning.png"}, {"id"=>10115261, "name"=>"fish", "localizedName"=>"fish", "image"=>"fish-fillet.jpg"}], "equipment"=>[]}, {"number"=>5, "step"=>"Grill, covered with grill lid, over high heat (400 to 50", "ingredients"=>[], "equipment"=>[{"id"=>404706, "name"=>"grill", "localizedName"=>"grill", "image"=>"grill.jpg"}]}, {"number"=>6, "step"=>"4 minutes on each side or until fish reaches desired degree of doneness.", "ingredients"=>[{"id"=>10115261, "name"=>"fish", "localizedName"=>"fish", "image"=>"fish-fillet.jpg"}], "equipment"=>[], "length"=>{"number"=>4, "unit"=>"minutes"}}]}]}
        # puts '\n\n\n\n\n\n\n'
        # puts @response.class
        # # @response = @response.to_json
        # puts @response
        render template: 'calendar/index'
    end
    
    def edit
        
    end
    
    def delete
        
    end
    
    def generate
        
    end

    def add
        @days = PlannedDay.where(date: (Date.today)..(Date.today+13))
        @responses = get_days_responses
        render template: 'calendar/index'
    end
    
    def get_recipe_info(recipe_id)
        if recipe_id == nil
            return nil
        end
        require 'uri'
        require 'net/http'
        require 'openssl'

        recipe = ApiResponse.find_by key: recipe_id
        if recipe != nil 
            puts "RETRIEVED RECIPE " + recipe_id
            recipe = recipe['response']
            return recipe
        end
        
        url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/#{recipe_id}/information")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = '7a2520581bmsh8114e7108a56b12p19bffdjsn57f2674b301b'
        request["x-rapidapi-host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

        response = http.request(request)
        response = JSON.parse(response.read_body)

        if recipe == nil 
            ApiResponse.create({key: recipe_id, response: response})
            puts "STOCKED THE RECIPE " + recipe_id
        end

        return response
    end

    def get_days_responses
        responses = Hash.new
        for day in @days do
            responses[day['id']] = {
                'lunch' => get_recipe_info(day['lunch']),
                'dinner' => get_recipe_info(day['dinner'])
            }
        end
        
        return responses
    end
end
