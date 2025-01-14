import { Request, Response } from 'express';
import { getMenu, getToppings, validateOrder } from './menuController';
import path from 'path';
import { describe, it, expect, beforeEach, test} from '@jest/globals';

describe('Menu Controller', () => {
  let mockRequest: Partial<Request>;
  let mockResponse: Partial<Response>;

  beforeEach(() => {
    mockResponse = {
      json: jest.fn(),
      status: jest.fn().mockReturnThis(),
      send: jest.fn()
    };
  });

  describe('getToppings', () => {
    test('should return valid toppings', async () => {
      const toppings = await getToppings()
      console.log(toppings)
      console.log(toppings.length)
        const vToppings =     [
        'Pepperoni',
        'Bacon',
        'Hot Soppressata',
        'Spicy Sausage',
        'Anchovies',
        'Grilled Chicken',
        'Smoked Ham',
        'Ground Beef',
        'Cup And Char Pepperoni',
        'Artichokes',
        'Black Olives',
        'Bruschetta',
        'Roasted Garlic',
        'Green Olives',
        'Green Peppers',
        'Hot Honey',
        'Italian Style Hot Peppers',
        'Fresh Mushrooms',
        'Spanish Onions',
        'Pineapple',
        'Plant-Based Pepperoni',
        'Portobello Mushrooms',
        'Red Onions',
        'Roasted Red Peppers',
        'Sautéed Spinach',
        'Sun-dried Black Olives',
        'Sun-dried Tomatoes',
        'Sliced Tomatoes',
        'Fresh Zucchini',
        'Asiago Cheese',
        'Cheddar Cheese',
        'Extra Mozzarella Cheese',
        'Feta Cheese',
        'Goat Cheese',
        'Parmigiano Cheese',
        'Extra Dairy Free Mozzarella'
      ]
      expect(toppings).toEqual(vToppings);
    });
  });

  describe('validateOrder', () => {
    test('should validate a correct order with valid toppings', async () => {
      mockRequest = {
        body: {
          quantity: 1,
          name: 'CYO',
          size: 'small',
          d_type: 'regular',
          d_thickness: 'thin',
          toppings: [
            { name: 'Pepperoni', side: 'whole', extra: false },
            { name: 'Black Olives', side: 'left', extra: false },
            { name: 'Extra Mozzarella Cheese', side: 'right', extra: true }
          ]
        }
      };

      await validateOrder(mockRequest as Request, mockResponse as Response);
      expect(mockResponse.status).toHaveBeenCalledWith(200);
      expect(mockResponse.send).toHaveBeenCalledWith('Order is valid');
    });

    test('should reject invalid topping', async () => {
      mockRequest = {
        body: {
          quantity: 1,
          name: 'CYO',
          size: 'small',
          d_type: 'regular',
          d_thickness: 'thin',
          toppings: [
            { name: 'InvalidTopping', side: 'whole', extra: false }
          ]
        }
      };

      await validateOrder(mockRequest as Request, mockResponse as Response);
      expect(mockResponse.status).toHaveBeenCalledWith(400);
      expect(mockResponse.send).toHaveBeenCalledWith(
        expect.arrayContaining(['Invalid Topping: InvalidTopping'])
      );
    });

    test('should reject too many toppings', async () => {
      mockRequest = {
        body: {
          quantity: 1,
          name: 'CYO',
          size: 'small',
          d_type: 'regular',
          d_thickness: 'thin',
          toppings: Array(11).fill({ name: 'Pepperoni', side: 'whole', extra: false })
        }
      };

      await validateOrder(mockRequest as Request, mockResponse as Response);
      expect(mockResponse.status).toHaveBeenCalledWith(400);
      expect(mockResponse.send).toHaveBeenCalledWith(
        expect.arrayContaining(['Too many toppings, max 10 allowed, you have 11'])
      );
    });

    test('should validate premium toppings combination', async () => {
      mockRequest = {
        body: {
          quantity: 1,
          name: 'CYO',
          size: 'small',
          d_type: 'regular',
          d_thickness: 'thin',
          toppings: [
            { name: 'Bacon', side: 'whole', extra: false },
            { name: 'Artichokes', side: 'left', extra: false },
            { name: 'Goat Cheese', side: 'right', extra: false }
          ]
        }
      };

      await validateOrder(mockRequest as Request, mockResponse as Response);
      expect(mockResponse.status).toHaveBeenCalledWith(200);
      expect(mockResponse.send).toHaveBeenCalledWith('Order is valid');
    });

    test('should handle invalid request structure', async () => {
      mockRequest = {
        body: null
      };
    
      await validateOrder(mockRequest as Request, mockResponse as Response);
      expect(mockResponse.status).toHaveBeenCalledWith(400);
      expect(mockResponse.send).toHaveBeenCalledWith(
        expect.stringContaining('Invalid Order Structure')
      );
    });

    test('should reject rule violation thickness', async () => {
      mockRequest = {
        body: {
          quantity: 1,
          name: 'CYO',
          size: 'large',
          d_type: 'whole_wheat',
          d_thickness: 'thick',
          toppings: [
            { name: 'Pepperoni', side: 'whole', extra: false },
          ]
        }
      };
      await validateOrder(mockRequest as Request, mockResponse as Response);
      expect(mockResponse.status).toHaveBeenCalledWith(400);
      expect(mockResponse.send).toHaveBeenCalledWith(
        expect.arrayContaining(['Invalid Dough Thickness: thick for size: large and dough type: whole_wheat Valid thicknesses: thin,regular'])
      );
    });

    test('should reject rule violation dough type', async () => {
      mockRequest = {
        body: {
          quantity: 1,
          name: 'CYO',
          size: 'large',
          d_type: 'carbon',
          d_thickness: 'thin',
          toppings: [
            { name: 'Pepperoni', side: 'whole', extra: false },
          ]
        }
      };
      await validateOrder(mockRequest as Request, mockResponse as Response);
      expect(mockResponse.status).toHaveBeenCalledWith(400);
      expect(mockResponse.send).toHaveBeenCalledWith(
        expect.arrayContaining(['Invalid Dough Type: carbon for size: large Valid types: regular,whole_wheat'])
      );
    });

    test('should reject rule violation, large thin carbon', async () => {
      mockRequest = {
        body: {
          quantity: 1,
          name: 'Margherita',
          size: 'large',
          d_type: 'carbon',
          d_thickness: 'thin',
          toppings: [
            { name: 'cheese', side: 'while', extra: true },
            { name: 'Pepperoni', side: 'right', extra: false },
          ]
        }
      }
      await validateOrder(mockRequest as Request, mockResponse as Response);
      expect(mockResponse.status).toHaveBeenCalledWith(400);
      expect(mockResponse.send).toHaveBeenCalledWith(
        expect.arrayContaining(['Invalid Dough Type: carbon for size: large Valid types: regular,whole_wheat'])
      );
    })
  });
});
