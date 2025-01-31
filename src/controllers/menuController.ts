import { Request, Response } from 'express';
import { MenuItem } from '../models/menuItem';
//import sqllite3 
import sqlite3 from 'sqlite3'
import path from 'path';
const PizzaRules = {
    "sizes" : {
      "small": {
        "size": 8,
        "d_types" : {
          "regular": ["thin", "thick", "regular"],
          "whole_wheat": ["thin", "thick", "regular"]
        }
      },
      "medium": {
        "size": 10,
        "d_types" : {
          "regular": ["thin", "thick", "regular"],
          "whole_wheat": ["thin", "thick", "regular"],
          "gluten_free": ["regular"],
          "carbon": ["thin", "regular"]
        }
      },
      "large": {
        "size": 12,
        "d_types" : {
          "regular": ["thin", "thick", "regular"],
          "whole_wheat": ["thin", "regular"]
        }
      },
      "jumbo": {
        "size": 16,
        "d_types" : {
          "regular": ["thin", "thick", "regular"]
        }
      },
      "party": {
        "size": 18,
        "d_types" : {
          "regular": ["thin", "thick", "regular"]
        }
      }
    }
  }
  
const DATA_DIR = path.join(process.cwd(), 'db');
const dbPath = path.join(DATA_DIR, 'menu.db');

const db = new sqlite3.Database(dbPath, (err) => {
    if (err) {
        console.error('Error opening database:', err.message);
    } else {
        console.log('Connected to the database.');
    }
});

//import json object 

export type Topping = {
    name: string;
    side: "left" | "right" | "whole";
    extra: boolean;
}

export type PizzaOrder = {
    quantity: number;
    name: string;
    size: "small" | "medium" | "large" | "jumbo" | "party";
    d_type: "regular" | "whole_wheat" | "gluten_free" | "carbon";
    d_thickness: "regular" | "thin" | "thick";
    toppings: Topping[];
}

const menu: MenuItem[] = [
    { id: 1, name: "Pepperoni Pizza", price: 15.99 },
    { id: 2, name: "Veggie Pizza", price: 12.99 },
    // Add more menu items
];

// Get menu
export const getMenu = (req: Request, res: Response) => {
    res.json(menu);
};

// Get toppings 
export const getToppings = (): Promise<string[]> => {
    return new Promise((resolve, reject) => {
        db.all('SELECT name FROM ToppingCategories', (err, rows) => {
            if (err) {
                console.error(err.message);
                reject(err);
            }
            //@ts-ignore
            resolve(rows.map(row => row.name));
        });
    });
}

// Validate order
export const validateOrder = async (req: Request, res: Response) => {
    // destructure the request body
    let order:PizzaOrder;
    console.log("validateOrder")
    console.log("req.body")
    console.log(req.body)
    console.table(req.body)
    try{
        console.log("TRYING TO PARSE ORDER")
        console.log("REQ BODY")
        console.table(req.body)
        order = req.body.order as PizzaOrder;
        if (!order){
            console.error("Invalid Order Structure")
            console.table(req.body)
            res.status(400).send("Invalid Order Structure");
            return;
        }
        console.log("ORDER: " + order)
        console.log("ORDER TABLE: ")
        console.table(order)
    }catch(e){
        console.error("Invalid Order Structure")
        console.table(req.body)
        res.status(400).send("Invalid Order Structure");
        return;
    }
    // Validate order according to the rules 
    //Check valid size:
    let issues = []
    let broken = false;
    if(!PizzaRules.sizes[order.size]){
        console.log("Invalid Size : "+order.size)
        issues.push("Invalid Size : "+order.size)
        broken = true;
    }
    //Check valid dough type:
    //@ts-ignore
    if(!broken && !PizzaRules.sizes[order.size].d_types[order.d_type]){
        console.log("Invalid Dough Type: "+order.d_type + " for size: "+order.size + " Valid types: "+ Object.keys(PizzaRules.sizes[order.size].d_types).join(","))j
        issues.push("Invalid Dough Type: "+order.d_type + " for size: "+order.size + " Valid types: "+ Object.keys(PizzaRules.sizes[order.size].d_types).join(","))
        console.log("ISSUES: " + issues)
        broken = true;
    }    //Check valid dough thickness:
    //@ts-ignore

    if (!broken && !PizzaRules.sizes[order.size].d_types[order.d_type] && !PizzaRules.sizes[order.size].d_types[order.d_type].includes(order.d_thickness)){
        //@ts-ignore
        console.log("Invalid Dough Thickness: "+order.d_thickness + " for size: "+order.size + " and dough type: "+order.d_type + " Valid thicknesses: "+ PizzaRules.sizes[order.size].d_types[order.d_type].join(","))
        //@ts-ignore
        issues.push("Invalid Dough Thickness: "+order.d_thickness + " for size: "+order.size + " and dough type: "+order.d_type + " Valid thicknesses: "+ PizzaRules.sizes[order.size].d_types[order.d_type].join(","))
    }
    //Check Sauce types 



    if(order["toppings"] && order["toppings"].length>10){
        console.log("Too many toppings FROM MC, max 10 allowed, you have "+order.toppings.length)
        issues.push("Too many toppings, max 10 allowed, you have "+order.toppings.length)
    }
    console.log("ISSUES: " + issues)
    //check if toppings are valid
    const validToppings = await getToppings()
    // console.log(validToppings)
    order["toppings"].filter((topping:Topping)=>{
        //pull toppings from local sqlite db
        //@ts-ignore
        if(!validToppings.map(topping=>topping.toLowerCase()).includes(topping.name.toLowerCase())){
            issues.push("Invalid Topping: "+topping.name)
        }
    })
    console.log("ISSUES: " + issues)
    if (issues.length>0){
        console.log(issues)
        res.status(400).send(issues)
        return;
    }
    res.status(200).send("Order is valid")
    return;
};
