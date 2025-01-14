

-- Create the SQLite database and the Rules table
DROP TABLE IF EXISTS Rules;
CREATE TABLE Rules (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    maxChoices INTEGER NOT NULL,
    maxPerTopping INTEGER NOT NULL
);

DROP TABLE IF EXISTS Sizes;
CREATE TABLE Sizes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    size TEXT NOT NULL
);

DROP TABLE IF EXISTS DT;
CREATE TABLE DT (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

DROP TABLE IF EXISTS Thickness;
CREATE TABLE Thickness (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    thickness TEXT NOT NULL
);


-- Create the Price Arrays table for normal and premium prices
DROP TABLE IF EXISTS PriceArrays;
CREATE TABLE PriceArrays (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT NOT NULL,  -- 'normal' or 'premium'
    price TEXT NOT NULL,
    size TEXT NOT NULL
);

-- Create the Topping Categories table (Meat, Vegetables, Cheese)
DROP TABLE IF EXISTS ToppingCategories;
CREATE TABLE ToppingCategories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category TEXT NOT NULL,  -- 'Meat', 'Vegetables', 'Cheese'
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    premium BOOLEAN NOT NULL
);



-- Create the SQLite database and the SignaturePizzas table
DROP TABLE IF EXISTS SignaturePizzas;
CREATE TABLE SignaturePizzas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category TEXT NOT NULL,  -- 'ClassicPizzas', 'WhitePizzas', 'PestoPizzas', 'PlantBasedPepperoniPizzas'
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    details TEXT NOT NULL
);
