
-- Insert data into the Rules table
INSERT INTO Rules (maxChoices, maxPerTopping) VALUES
    (10, 2);

-- Insert data into the PriceArrays table (normal prices)
INSERT INTO PriceArrays (type, price, size) VALUES
    ('normal', '+$1.90',"small"),
    ('normal', '+$2.40', "medium"),
    ('normal', '+$2.75', "large"),
    ('normal', '+$3.75', "jumbo"),
    ('normal', '+$3.95', "party");

-- Insert data into the PriceArrays table (premium prices)
INSERT INTO PriceArrays (type, price, size) VALUES
    ('premium', '+$2.55', "small"),
    ('premium', '+$3.00', "medium"),
    ('premium', '+$3.50', "large"),
    ('premium', '+$4.60', "jumbo"), 
    ('premium', '+$4.80', "party");

-- Insert data into the Sizes table
INSERT INTO Sizes (size) VALUES
    ('small'),
    ('medium'),
    ('large'),
    ('jumbo'),
    ('party');

-- Insert data into the DT table
INSERT INTO DT (name) VALUES
    ('thin'),
    ('regular'),
    ('thick');


-- Insert data into the ToppingCategories table (Meat)
INSERT INTO ToppingCategories (category, name, description, premium) VALUES
    ('Meat', 'Pepperoni', 'Free of antibiotics or hormones, made from Canadian, vegetable grain-fed beef and pork.', 0),
    ('Meat', 'Bacon', 'Centre-cut strips of Canadian bacon, from pork raised without antibiotics.', 1),
    ('Meat', 'Hot Soppressata', 'Southern Italian specialty, dry-cured salami rich in spice.', 1),
    ('Meat', 'Spicy Sausage', 'Seasoned with herbs, chili peppers, and fennel seeds.', 0),
    ('Meat', 'Anchovies', 'Imported small, salty fish from Morocco.', 0),
    ('Meat', 'Grilled Chicken', 'Canadian farm-raised chicken without antibiotics.', 1),
    ('Meat', 'Smoked Ham', 'Thinly sliced smoked ham from Canadian farms.', 0),
    ('Meat', 'Ground Beef', 'Seasoned ground beef from Canadian farms. Contains gluten.', 0),
    ('Meat', 'Cup And Char Pepperoni', 'Bold-flavoured pepperoni slices that curl into cups when baked.', 1);

-- Insert data into the ToppingCategories table (Vegetables)
INSERT INTO ToppingCategories (category, name, description, premium) VALUES
    ('Vegetables', 'Artichokes', 'Dense, bold, and earthy flavour.', 1),
    ('Vegetables', 'Black Olives', 'Sourced from Greece, a classic flavour.', 0),
    ('Vegetables', 'Bruschetta', 'Fresh Roma tomatoes, red onion, roasted garlic, and herbs.', 1),
    ('Vegetables', 'Roasted Garlic', 'Roasted to bring out a bold, aromatic flavour.', 0),
    ('Vegetables', 'Green Olives', 'Distinctive taste with health benefits.', 0),
    ('Vegetables', 'Green Peppers', 'Freshly sliced to preserve flavour.', 0),
    ('Vegetables', 'Hot Honey', 'Chili pepper-infused honey.', 1),
    ('Vegetables', 'Italian Style Hot Peppers', 'Small but mighty peppers for heat and colour.', 0),
    ('Vegetables', 'Fresh Mushrooms', 'Grown on Ontario farms and freshly sliced.', 0),
    ('Vegetables', 'Spanish Onions', 'Mild and sweet, complements many flavours.', 0),
    ('Vegetables', 'Pineapple', 'Adds sweetness and unique texture.', 0),
    ('Vegetables', 'Plant-Based Pepperoni', 'Pea protein-based alternative with spices. Contains gluten.', 1),
    ('Vegetables', 'Portobello Mushrooms', 'Meaty, dense mushrooms grown in Ontario.', 1),
    ('Vegetables', 'Red Onions', 'Nutritious and mildly sweet.', 0),
    ('Vegetables', 'Roasted Red Peppers', 'Fire-roasted for bold flavour.', 1),
    ('Vegetables', 'Sautéed Spinach', 'Sautéed with olive oil and garlic for flavour.', 1),
    ('Vegetables', 'Sun-dried Black Olives', 'Sun-ripened for chewy, bold flavour.', 1),
    ('Vegetables', 'Sun-dried Tomatoes', 'Intensely flavoured, sourced from Italy.', 1),
    ('Vegetables', 'Sliced Tomatoes', 'Bright, bold flavour and rich in vitamins.', 0),
    ('Vegetables', 'Fresh Zucchini', 'Rich in nutrients, vibrant texture and flavour.', 1);

-- Insert data into the ToppingCategories table (Cheese)
INSERT INTO ToppingCategories (category, name, description, premium) VALUES
    ('Cheese', 'Asiago Cheese', 'Bold, nutty Italian cheese.', 1),
    ('Cheese', 'Cheddar Cheese', 'Earthy, sharp cheese with a crumbly texture.', 1),
    ('Cheese', 'Extra Mozzarella Cheese', '100% Canadian milk, buttery taste. Default topping.', 0),
    ('Cheese', 'Feta Cheese', 'Greek cheese with a mild and tangy taste.', 1),
    ('Cheese', 'Goat Cheese', 'Creamy, tender cheese that pairs with fruits, meats, and veggies.', 1),
    ('Cheese', 'Parmigiano Cheese', 'Hard Italian cheese, a staple in kitchens.', 1),
    ('Cheese', 'Extra Dairy Free Mozzarella', 'Vegan, GMO, dairy, gluten, and soy-free alternative to mozzarella.', 0);

-- Insert data into the SignaturePizzas table (ClassicPizzas)
INSERT INTO SignaturePizzas (category, name, description, details) VALUES
    ('ClassicPizzas', 'Banquet Cheddar', 'Sharp cheddar with mozzarella, crispy Canadian bacon, and seasoned Canadian ground beef.', 'Inspired by cheeseburgers.'),
    ('ClassicPizzas', 'Calabrese', 'Spicy sausage, Spanish onion, roasted red pepper.', 'Southern Italy-inspired flavours.'),
    ('ClassicPizzas', 'Deluxe', 'Pepperoni, bacon, mushrooms, green peppers, sliced tomatoes, Spanish onions.', 'Loaded with hearty and fresh toppings.'),
    ('ClassicPizzas', 'Diavola', 'Hot Soppressata, Italian hot peppers.', 'For those who love it hot and spicy.'),
    ('ClassicPizzas', 'Honey Stinger', 'Hot soppressata, sun-dried black olives, drizzled with Mikes Hot Honey.', 'A sweet and spicy combination.'),
    ('ClassicPizzas', 'Meat Supreme', 'Pepperoni, bacon strips, ground beef, spicy sausage.', 'For meat lovers.'),
    ('ClassicPizzas', 'Mediterranean', 'Sundried black olives, Spanish onions, feta, sundried tomatoes.', 'Greek-inspired flavours.'),
    ('ClassicPizzas', 'Napoletana', 'Anchovies, black olives, mushrooms.', 'Bold and distinctive.'),
    ('ClassicPizzas', 'Pizza Pollo', 'Grilled chicken, feta, roasted red peppers, sautéed spinach.', 'Light and healthy.'),
    ('ClassicPizzas', 'Portobellissimo', 'Portobello mushrooms, Italian Asiago cheese, hot soppressata.', 'A bold kick of spice.'),
    ('ClassicPizzas', 'Primavera', 'Sautéed spinach, zucchini, roasted red peppers, mushrooms, parmigiano cheese.', 'Fresh and veggie-packed.'),
    ('ClassicPizzas', 'Quattro Stagioni', 'Artichokes, black olives, mushrooms, ham.', 'Ingredients representing four seasons.'),
    ('ClassicPizzas', 'Roasted Parma', 'Zucchini, roasted red peppers, parmigiano cheese.', 'Savoury yet light and healthy.'),
    ('ClassicPizzas', 'Super Gourmet', 'Seared chicken, roasted red peppers, sundried tomatoes, feta.', 'Robust Italian and Greek fusion.'),
    ('ClassicPizzas', 'Super Hawaiian', 'Pineapple, smoked ham, crispy bacon.', 'Classic tropical-inspired pizza.'),
    ('ClassicPizzas', 'The All-Star', 'Bacon strips, grilled chicken, Italian hot peppers.', 'Perfect for game day.'),
    ('ClassicPizzas', 'The Founder’s', 'Double bacon, double Spanish onion.', 'Homage to the founders.'),
    ('ClassicPizzas', 'Veggie', 'Mushrooms, green peppers, Spanish onions.', 'Light, healthy, and meatless.'),
    ('ClassicPizzas', 'Funghi Di Bosco', 'Portobello & button mushrooms, roasted garlic, herbed olive oil base.', 'Inspired by Italys forests.'),
    ('ClassicPizzas', 'Nonna’s Favourite', 'Herbed olive oil, mozzarella, plum tomato, basil, parmigiano cheese.', 'Simple yet delicious.'),
    ('ClassicPizzas', 'Basilicata', 'Spicy sausage, Italian hot peppers, sautéed spinach.', 'A perfect balance of hot and cool.'),
    ('ClassicPizzas', 'Bruschetta Pizza', 'Roma tomatoes, fresh herbs, red onion, roasted garlic, herbed olive oil.', 'A spin on the Italian starter dish.'),
    ('ClassicPizzas', 'California', 'Sautéed spinach, sundried tomatoes, feta, herbed olive oil base.', 'Fresh and flavourful.'),
    ('ClassicPizzas', 'Chicken Alla Bianca', 'Seared chicken, roasted red peppers, parmigiano cheese, herbed olive oil.', 'Toppings take center stage.'),
    ('ClassicPizzas', 'Greek Bruschetta', 'Bruschetta, black olives, feta, herbed olive oil.', 'A Greek-Italian fusion.'),
    ('ClassicPizzas', 'IL Giardino', 'Portobello mushrooms, roasted red peppers, sautéed spinach, parmigiano cheese.', 'Inspired by Nonnas garden.'),
    ('ClassicPizzas', 'Chicken Florentine', 'Pesto sauce, sautéed spinach, grilled chicken, feta, roasted garlic.', 'Florence-inspired pizza.'),
    ('ClassicPizzas', 'Tuscan Pesto', 'Pesto sauce, grilled chicken, roasted red peppers, artichokes, goat cheese.', 'A taste of Tuscany.'),
    ('ClassicPizzas', 'Planteroni', 'Plant-based pepperoni, mozzarella, tomato sauce.', 'A vegan take on classic pepperoni.'),
    ('ClassicPizzas', 'Aloha Plant', 'Plant-based pepperoni, pineapple, mozzarella, tomato sauce.', 'A tropical vegan delight.'),
    ('ClassicPizzas', 'Campo Pizza', 'Plant-based pepperoni, sautéed spinach, Portobello mushrooms, mozzarella, tomato sauce.', 'A veggie-rich vegan option.'),
    ('ClassicPizzas', 'Gusto Plant', 'Plant-based pepperoni, zucchini, red onions, mushrooms, mozzarella, tomato sauce.', 'Bold plant-based flavours.'),
    ('ClassicPizzas', 'Piccante Plant', 'Plant-based pepperoni, hot peppers, sundried black olives, mozzarella, tomato sauce.', 'Spicy and vegan.'),
    ('ClassicPizzas', 'Vita Plant', 'Plant-based pepperoni, sautéed spinach, red onions, mozzarella, tomato sauce.', 'A healthy, flavourful vegan choice.');

-- Insert data into the SignaturePizzas table (WhitePizzas)
INSERT INTO SignaturePizzas (category, name, description, details) VALUES
    ('WhitePizzas', 'Funghi Di Bosco', 'Portobello & button mushrooms, roasted garlic, white herbed olive oil base.', 'Inspired by Italys forests.'),
    ('WhitePizzas', 'Nonna’s Favourite', 'Herbed olive oil, mozzarella, plum tomato, basil, parmigiano cheese.', 'Simple and delicious, inspired by Nonna.'),
    ('WhitePizzas', 'Basilicata', 'Spicy sausage, Italian hot peppers, sautéed spinach, herbed olive oil base.', 'A balance of hot and cool.'),
    ('WhitePizzas', 'Bruschetta Pizza', 'Roma tomatoes, fresh herbs, red onion, roasted garlic, herbed olive oil, mozzarella.', 'A twist on the Italian starter dish.'),
    ('WhitePizzas', 'California', 'Sautéed spinach, sundried tomatoes, feta, herbed olive oil base.', 'Fresh and flavourful.'),
    ('WhitePizzas', 'Chicken Alla Bianca', 'Seared chicken, roasted red peppers, parmigiano cheese, herbed olive oil.', 'Let the toppings shine.'),
    ('WhitePizzas', 'Greek Bruschetta', 'Bruschetta, black olives, feta, herbed olive oil.', 'Greek-Italian fusion.'),
    ('WhitePizzas', 'IL Giardino', 'Portobello mushrooms, roasted red peppers, sautéed spinach, parmigiano cheese, herbed olive oil, mozzarella.', 'Inspired by Nonnas garden.');

-- Insert data into the SignaturePizzas table (PestoPizzas)
INSERT INTO SignaturePizzas (category, name, description, details) VALUES
    ('PestoPizzas', 'Chicken Florentine', 'Pesto sauce, sautéed spinach, grilled chicken, feta, roasted garlic.', 'Florence-inspired flavours.'),
    ('PestoPizzas', 'Tuscan Pesto', 'Pesto sauce, grilled chicken, roasted red peppers, artichokes, goat cheese.', 'A taste of Tuscany.');

-- Insert data into the SignaturePizzas table (PlantBasedPepperoniPizzas)
INSERT INTO SignaturePizzas (category, name, description, details) VALUES
    ('PlantBasedPepperoniPizzas', 'Planteroni', 'Plant-based pepperoni, mozzarella, tomato sauce.', 'A vegan take on classic pepperoni.'),
    ('PlantBasedPepperoniPizzas', 'Aloha Plant', 'Plant-based pepperoni, pineapple, mozzarella, tomato sauce.', 'A tropical vegan delight.'),
    ('PlantBasedPepperoniPizzas', 'Campo Pizza', 'Plant-based pepperoni, sautéed spinach, Portobello mushrooms, mozzarella, tomato sauce.', 'A veggie-rich vegan option.'),
    ('PlantBasedPepperoniPizzas', 'Gusto Plant', 'Plant-based pepperoni, zucchini, red onions, mushrooms, mozzarella, tomato sauce.', 'Bold plant-based flavours.'),
    ('PlantBasedPepperoniPizzas', 'Piccante Plant', 'Plant-based pepperoni, hot peppers, sundried black olives, mozzarella, tomato sauce.', 'Spicy and vegan.'),
    ('PlantBasedPepperoniPizzas', 'Vita Plant', 'Plant-based pepperoni, sautéed spinach, red onions, mozzarella, tomato sauce.', 'A healthy, flavourful vegan choice.');


