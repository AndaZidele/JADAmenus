//
//  ContentManager.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 03/03/2022.
//

import Foundation

class ContentManager {
    
    static let shared = ContentManager()
    
    
    var categories = [
        "First Courses",
        "Second Courses",
        "Desserts",
        "Drinks",
        "Snacks"
    
    ]
    var categoriesImg = [
        "Screenshot 2022-04-08 at 13.37.26.imageset",
        "Screenshot 2022-04-08 at 13.41.33.imageset",
        "Screenshot 2022-04-08 at 13.43.34.imageset",
        "Screenshot 2022-04-08 at 13.49.59.imageset",
        "Screenshot 2022-04-08 at 13.47.10.imageset"
    ]
    
    var classes = [
        "Latvian Cuisine",
        "Mexican Cuisine",
        "Vegan Cuisine",
        "Vegetarian Cuisine",
        "Low Sugar Cuisine",
        "Children Cuisine",
        "Salad Cuisine"
    ]
    
    var firstCourses = [
        "Salads",
        "Soups"
    ]
    
    var secondCourses = [
        "Chicken Dishes",
        "Ground Meat Dishes",
        "Beef Dishes",
        "Pasta",
        "Pork Dishes",
        "Vegetable Dishes",
        "Mushroom Dishes",
        "Fish Dishes"
    ]
    
    var desserts = [
        "Flour Desserts",
        "Puddings",
        "Chocolate Desserts",
        "Fruit Desserts",
        "Coffee Desserts",
        "Marmalade Desserts",
        "Ice Creams"
    ]
    
    var drinks = [
        "Cold Drinks",
        "Hot Drinks",
        "Drinks with Alcohol"
    ]
    
    var snacks = [
        "Hot Snacks",
        "Cold Snacks"
    ]
    
}
