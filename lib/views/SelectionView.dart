// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:i_migrate/components/cards/CoutryComparisonCard.dart';
import 'package:i_migrate/controllers/SelectionViewController.dart';

import '../components/CustomButton.dart';
import '../components/cards/CountrySelectionCard.dart';

class SelectionView extends StatefulWidget {
  SelectionView({
    super.key,
  });

  @override
  State<SelectionView> createState() => _SelectionViewState();
}

class _SelectionViewState extends State<SelectionView> {
  List<Map> coutriesList = [
    {
      'name': "Spain",
      'selected': false,
      'Restaurants': {
        'Meal, Inexpensive Restaurant': 15.00,
        'Meal for 2 People, Mid-range Restaurant, Three-course': 60.00,
        'McMeal at McDonalds (or Equivalent Combo Meal)': 8.00,
        'Domestic Beer (0.5 liter draught)': 5.00,
        'Imported Beer (0.33 liter bottle)': 4.00,
        'Cappuccino (regular)': 1.50,
        'Coke/Pepsi (0.33 liter bottle)': 2.28,
        'Water (0.33 liter bottle)': 1.08
      },
      'Markets': {
        'Milk (regular), (1 liter)': 1.23,
        'Loaf of Fresh White Bread (500g)': 1.73,
        'Rice (white), (1kg)': 2.10,
        'Eggs (regular) (12)': 2.97,
        'Local Cheese (1kg)': 12.72,
        'Chicken Fillets (1kg)': 9.28,
        'Beef Round (1kg) (or Equivalent Back Leg Red Meat)': 15.33,
        'Apples (1kg)': 1.92,
        'Banana (1kg)': 1.68,
        'Oranges (1kg)': 1.91,
        'Tomato (1kg)': 2.45,
        'Potato (1kg)': 1.32,
        'Onion (1kg)': 1.33,
        'Lettuce (1 head)': 1.10,
        'Water (1.5 liter bottle)': 0.42,
        'Bottle of Wine (Mid-Range)': 5.95,
        'Domestic Beer (0.5 liter bottle)': 1.43,
        'Imported Beer (0.33 liter bottle)': 1.98,
        'Cigarettes 20 Pack (Marlboro)': 5.90,
      },
      'Transportation': {
        'One-way Ticket (Local Transport)': 1.50,
        'Monthly Pass (Regular Price)': 35.00,
        'Taxi Start (Normal Tariff)': 5.00,
        'Taxi 1km (Normal Tariff)': 1.30,
        'Taxi 1hour Waiting (Normal Tariff)': 28.00,
        'Gasoline (1 liter)': 1.95,
        'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)': 24000.00,
        'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)':
            25663.02,
      },
      'Utilities (Monthly)': {
        'Basic (Electricity, Heating, Cooling, Water, Garbage) for 85m2 Apartment':
            185.47,
        '1 min. of Prepaid Mobile Tariff Local (No Discounts or Plans)': 0.16,
        'Internet (60 Mbps or More, Unlimited Data, Cable/ADSL)': 28.05,
      },
      'Sports And Leisure': {
        'Fitness Club, Monthly Fee for 1 Adult': 46.77,
        'Tennis Court Rent (1 Hour on Weekend)': 19.65,
        'Cinema, International Release, 1 Seat': 9.00,
      },
      'Childcare': {
        'Preschool (or Kindergarten), Full Day, Private, Monthly for 1 Child':
            457.88,
        'International Primary School, Yearly for 1 Child': 871.82,
      },
      'Clothing And Shoes': {
        '1 Pair of Jeans (Levis 501 Or Similar)': 77.28,
        '1 Summer Dress in a Chain Store (Zara, H&M, ...)': 32.23,
        '1 Pair of Nike Running Shoes (Mid-Range)': 83.49,
        '1 Pair of Men Leather Business Shoes': 108.69,
      },
      'Rent Per Month': {
        'Apartment (1 bedroom) in City Centre': 653.29,
        'Apartment (1 bedroom) Outside of Centre': 507.79,
        'Apartment (3 bedrooms) in City Centre': 1265.50,
        'Apartment (3 bedrooms) Outside of Centre': 891.77,
      },
      'Buy Apartment Price': {
        'Price per Square Meter to Buy Apartment in City Centre': 3756.40,
        'Price per Square Meter to Buy Apartment Outside of Centre': 2272.62,
      },
      'Salaries And Financing': {
        'Average Monthly Net Salary (After Tax)': 1551.94,
        'Mortgage Interest Rate in Percentages (%), Yearly, for 20 Years Fixed-Rate':
            1.91,
      }
    },
    {
      'name': "Hungary",
      'selected': false,
      'Restaurants': {
        'Meal, Inexpensive Restaurant': 15.00,
        'Meal for 2 People, Mid-range Restaurant, Three-course': 60.00,
        'McMeal at McDonalds (or Equivalent Combo Meal)': 8.00,
        'Domestic Beer (0.5 liter draught)': 5.00,
        'Imported Beer (0.33 liter bottle)': 4.00,
        'Cappuccino (regular)': 1.50,
        'Coke/Pepsi (0.33 liter bottle)': 2.28,
        'Water (0.33 liter bottle)': 1.08
      },
      'Markets': {
        'Milk (regular), (1 liter)': 1.23,
        'Loaf of Fresh White Bread (500g)': 1.73,
        'Rice (white), (1kg)': 2.10,
        'Eggs (regular) (12)': 2.97,
        'Local Cheese (1kg)': 12.72,
        'Chicken Fillets (1kg)': 9.28,
        'Beef Round (1kg) (or Equivalent Back Leg Red Meat)': 15.33,
        'Apples (1kg)': 1.92,
        'Banana (1kg)': 1.68,
        'Oranges (1kg)': 1.91,
        'Tomato (1kg)': 2.45,
        'Potato (1kg)': 1.32,
        'Onion (1kg)': 1.33,
        'Lettuce (1 head)': 1.10,
        'Water (1.5 liter bottle)': 0.42,
        'Bottle of Wine (Mid-Range)': 5.95,
        'Domestic Beer (0.5 liter bottle)': 1.43,
        'Imported Beer (0.33 liter bottle)': 1.98,
        'Cigarettes 20 Pack (Marlboro)': 5.90,
      },
      'Transportation': {
        'One-way Ticket (Local Transport)': 1.50,
        'Monthly Pass (Regular Price)': 35.00,
        'Taxi Start (Normal Tariff)': 5.00,
        'Taxi 1km (Normal Tariff)': 1.30,
        'Taxi 1hour Waiting (Normal Tariff)': 28.00,
        'Gasoline (1 liter)': 1.95,
        'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)': 24000.00,
        'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)':
            25663.02,
      },
      'Utilities (Monthly)': {
        'Basic (Electricity, Heating, Cooling, Water, Garbage) for 85m2 Apartment':
            185.47,
        '1 min. of Prepaid Mobile Tariff Local (No Discounts or Plans)': 0.16,
        'Internet (60 Mbps or More, Unlimited Data, Cable/ADSL)': 28.05,
      },
      'Sports And Leisure': {
        'Fitness Club, Monthly Fee for 1 Adult': 46.77,
        'Tennis Court Rent (1 Hour on Weekend)': 19.65,
        'Cinema, International Release, 1 Seat': 9.00,
      },
      'Childcare': {
        'Preschool (or Kindergarten), Full Day, Private, Monthly for 1 Child':
            457.88,
        'International Primary School, Yearly for 1 Child': 871.82,
      },
      'Clothing And Shoes': {
        '1 Pair of Jeans (Levis 501 Or Similar)': 77.28,
        '1 Summer Dress in a Chain Store (Zara, H&M, ...)': 32.23,
        '1 Pair of Nike Running Shoes (Mid-Range)': 83.49,
        '1 Pair of Men Leather Business Shoes': 108.69,
      },
      'Rent Per Month': {
        'Apartment (1 bedroom) in City Centre': 653.29,
        'Apartment (1 bedroom) Outside of Centre': 507.79,
        'Apartment (3 bedrooms) in City Centre': 1265.50,
        'Apartment (3 bedrooms) Outside of Centre': 891.77,
      },
      'Buy Apartment Price': {
        'Price per Square Meter to Buy Apartment in City Centre': 3756.40,
        'Price per Square Meter to Buy Apartment Outside of Centre': 2272.62,
      },
      'Salaries And Financing': {
        'Average Monthly Net Salary (After Tax)': 1551.94,
        'Mortgage Interest Rate in Percentages (%), Yearly, for 20 Years Fixed-Rate':
            1.91,
      }
    },
    {
      'name': "Serbia",
      'selected': false,
      'Restaurants': {
        'Meal, Inexpensive Restaurant': 15.00,
        'Meal for 2 People, Mid-range Restaurant, Three-course': 60.00,
        'McMeal at McDonalds (or Equivalent Combo Meal)': 8.00,
        'Domestic Beer (0.5 liter draught)': 5.00,
        'Imported Beer (0.33 liter bottle)': 4.00,
        'Cappuccino (regular)': 1.50,
        'Coke/Pepsi (0.33 liter bottle)': 2.28,
        'Water (0.33 liter bottle)': 1.08
      },
      'Markets': {
        'Milk (regular), (1 liter)': 1.23,
        'Loaf of Fresh White Bread (500g)': 1.73,
        'Rice (white), (1kg)': 2.10,
        'Eggs (regular) (12)': 2.97,
        'Local Cheese (1kg)': 12.72,
        'Chicken Fillets (1kg)': 9.28,
        'Beef Round (1kg) (or Equivalent Back Leg Red Meat)': 15.33,
        'Apples (1kg)': 1.92,
        'Banana (1kg)': 1.68,
        'Oranges (1kg)': 1.91,
        'Tomato (1kg)': 2.45,
        'Potato (1kg)': 1.32,
        'Onion (1kg)': 1.33,
        'Lettuce (1 head)': 1.10,
        'Water (1.5 liter bottle)': 0.42,
        'Bottle of Wine (Mid-Range)': 5.95,
        'Domestic Beer (0.5 liter bottle)': 1.43,
        'Imported Beer (0.33 liter bottle)': 1.98,
        'Cigarettes 20 Pack (Marlboro)': 5.90,
      },
      'Transportation': {
        'One-way Ticket (Local Transport)': 1.50,
        'Monthly Pass (Regular Price)': 35.00,
        'Taxi Start (Normal Tariff)': 5.00,
        'Taxi 1km (Normal Tariff)': 1.30,
        'Taxi 1hour Waiting (Normal Tariff)': 28.00,
        'Gasoline (1 liter)': 1.95,
        'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)': 24000.00,
        'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)':
            25663.02,
      },
      'Utilities (Monthly)': {
        'Basic (Electricity, Heating, Cooling, Water, Garbage) for 85m2 Apartment':
            185.47,
        '1 min. of Prepaid Mobile Tariff Local (No Discounts or Plans)': 0.16,
        'Internet (60 Mbps or More, Unlimited Data, Cable/ADSL)': 28.05,
      },
      'Sports And Leisure': {
        'Fitness Club, Monthly Fee for 1 Adult': 46.77,
        'Tennis Court Rent (1 Hour on Weekend)': 19.65,
        'Cinema, International Release, 1 Seat': 9.00,
      },
      'Childcare': {
        'Preschool (or Kindergarten), Full Day, Private, Monthly for 1 Child':
            457.88,
        'International Primary School, Yearly for 1 Child': 871.82,
      },
      'Clothing And Shoes': {
        '1 Pair of Jeans (Levis 501 Or Similar)': 77.28,
        '1 Summer Dress in a Chain Store (Zara, H&M, ...)': 32.23,
        '1 Pair of Nike Running Shoes (Mid-Range)': 83.49,
        '1 Pair of Men Leather Business Shoes': 108.69,
      },
      'Rent Per Month': {
        'Apartment (1 bedroom) in City Centre': 653.29,
        'Apartment (1 bedroom) Outside of Centre': 507.79,
        'Apartment (3 bedrooms) in City Centre': 1265.50,
        'Apartment (3 bedrooms) Outside of Centre': 891.77,
      },
      'Buy Apartment Price': {
        'Price per Square Meter to Buy Apartment in City Centre': 3756.40,
        'Price per Square Meter to Buy Apartment Outside of Centre': 2272.62,
      },
      'Salaries And Financing': {
        'Average Monthly Net Salary (After Tax)': 1551.94,
        'Mortgage Interest Rate in Percentages (%), Yearly, for 20 Years Fixed-Rate':
            1.91,
      }
    },
    {
      'name': "France",
      'selected': false,
      'Restaurants': {
        'Meal, Inexpensive Restaurant': 15.00,
        'Meal for 2 People, Mid-range Restaurant, Three-course': 60.00,
        'McMeal at McDonalds (or Equivalent Combo Meal)': 8.00,
        'Domestic Beer (0.5 liter draught)': 5.00,
        'Imported Beer (0.33 liter bottle)': 4.00,
        'Cappuccino (regular)': 1.50,
        'Coke/Pepsi (0.33 liter bottle)': 2.28,
        'Water (0.33 liter bottle)': 1.08
      },
      'Markets': {
        'Milk (regular), (1 liter)': 1.23,
        'Loaf of Fresh White Bread (500g)': 1.73,
        'Rice (white), (1kg)': 2.10,
        'Eggs (regular) (12)': 2.97,
        'Local Cheese (1kg)': 12.72,
        'Chicken Fillets (1kg)': 9.28,
        'Beef Round (1kg) (or Equivalent Back Leg Red Meat)': 15.33,
        'Apples (1kg)': 1.92,
        'Banana (1kg)': 1.68,
        'Oranges (1kg)': 1.91,
        'Tomato (1kg)': 2.45,
        'Potato (1kg)': 1.32,
        'Onion (1kg)': 1.33,
        'Lettuce (1 head)': 1.10,
        'Water (1.5 liter bottle)': 0.42,
        'Bottle of Wine (Mid-Range)': 5.95,
        'Domestic Beer (0.5 liter bottle)': 1.43,
        'Imported Beer (0.33 liter bottle)': 1.98,
        'Cigarettes 20 Pack (Marlboro)': 5.90,
      },
      'Transportation': {
        'One-way Ticket (Local Transport)': 1.50,
        'Monthly Pass (Regular Price)': 35.00,
        'Taxi Start (Normal Tariff)': 5.00,
        'Taxi 1km (Normal Tariff)': 1.30,
        'Taxi 1hour Waiting (Normal Tariff)': 28.00,
        'Gasoline (1 liter)': 1.95,
        'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)': 24000.00,
        'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)':
            25663.02,
      },
      'Utilities (Monthly)': {
        'Basic (Electricity, Heating, Cooling, Water, Garbage) for 85m2 Apartment':
            185.47,
        '1 min. of Prepaid Mobile Tariff Local (No Discounts or Plans)': 0.16,
        'Internet (60 Mbps or More, Unlimited Data, Cable/ADSL)': 28.05,
      },
      'Sports And Leisure': {
        'Fitness Club, Monthly Fee for 1 Adult': 46.77,
        'Tennis Court Rent (1 Hour on Weekend)': 19.65,
        'Cinema, International Release, 1 Seat': 9.00,
      },
      'Childcare': {
        'Preschool (or Kindergarten), Full Day, Private, Monthly for 1 Child':
            457.88,
        'International Primary School, Yearly for 1 Child': 871.82,
      },
      'Clothing And Shoes': {
        '1 Pair of Jeans (Levis 501 Or Similar)': 77.28,
        '1 Summer Dress in a Chain Store (Zara, H&M, ...)': 32.23,
        '1 Pair of Nike Running Shoes (Mid-Range)': 83.49,
        '1 Pair of Men Leather Business Shoes': 108.69,
      },
      'Rent Per Month': {
        'Apartment (1 bedroom) in City Centre': 653.29,
        'Apartment (1 bedroom) Outside of Centre': 507.79,
        'Apartment (3 bedrooms) in City Centre': 1265.50,
        'Apartment (3 bedrooms) Outside of Centre': 891.77,
      },
      'Buy Apartment Price': {
        'Price per Square Meter to Buy Apartment in City Centre': 3756.40,
        'Price per Square Meter to Buy Apartment Outside of Centre': 2272.62,
      },
      'Salaries And Financing': {
        'Average Monthly Net Salary (After Tax)': 1551.94,
        'Mortgage Interest Rate in Percentages (%), Yearly, for 20 Years Fixed-Rate':
            1.91,
      }
    },
    {
      'name': "Finland",
      'selected': false,
      'Restaurants': {
        'Meal, Inexpensive Restaurant': 15.00,
        'Meal for 2 People, Mid-range Restaurant, Three-course': 60.00,
        'McMeal at McDonalds (or Equivalent Combo Meal)': 8.00,
        'Domestic Beer (0.5 liter draught)': 5.00,
        'Imported Beer (0.33 liter bottle)': 4.00,
        'Cappuccino (regular)': 1.50,
        'Coke/Pepsi (0.33 liter bottle)': 2.28,
        'Water (0.33 liter bottle)': 1.08
      },
      'Markets': {
        'Milk (regular), (1 liter)': 1.23,
        'Loaf of Fresh White Bread (500g)': 1.73,
        'Rice (white), (1kg)': 2.10,
        'Eggs (regular) (12)': 2.97,
        'Local Cheese (1kg)': 12.72,
        'Chicken Fillets (1kg)': 9.28,
        'Beef Round (1kg) (or Equivalent Back Leg Red Meat)': 15.33,
        'Apples (1kg)': 1.92,
        'Banana (1kg)': 1.68,
        'Oranges (1kg)': 1.91,
        'Tomato (1kg)': 2.45,
        'Potato (1kg)': 1.32,
        'Onion (1kg)': 1.33,
        'Lettuce (1 head)': 1.10,
        'Water (1.5 liter bottle)': 0.42,
        'Bottle of Wine (Mid-Range)': 5.95,
        'Domestic Beer (0.5 liter bottle)': 1.43,
        'Imported Beer (0.33 liter bottle)': 1.98,
        'Cigarettes 20 Pack (Marlboro)': 5.90,
      },
      'Transportation': {
        'One-way Ticket (Local Transport)': 1.50,
        'Monthly Pass (Regular Price)': 35.00,
        'Taxi Start (Normal Tariff)': 5.00,
        'Taxi 1km (Normal Tariff)': 1.30,
        'Taxi 1hour Waiting (Normal Tariff)': 28.00,
        'Gasoline (1 liter)': 1.95,
        'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)': 24000.00,
        'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)':
            25663.02,
      },
      'Utilities (Monthly)': {
        'Basic (Electricity, Heating, Cooling, Water, Garbage) for 85m2 Apartment':
            185.47,
        '1 min. of Prepaid Mobile Tariff Local (No Discounts or Plans)': 0.16,
        'Internet (60 Mbps or More, Unlimited Data, Cable/ADSL)': 28.05,
      },
      'Sports And Leisure': {
        'Fitness Club, Monthly Fee for 1 Adult': 46.77,
        'Tennis Court Rent (1 Hour on Weekend)': 19.65,
        'Cinema, International Release, 1 Seat': 9.00,
      },
      'Childcare': {
        'Preschool (or Kindergarten), Full Day, Private, Monthly for 1 Child':
            457.88,
        'International Primary School, Yearly for 1 Child': 871.82,
      },
      'Clothing And Shoes': {
        '1 Pair of Jeans (Levis 501 Or Similar)': 77.28,
        '1 Summer Dress in a Chain Store (Zara, H&M, ...)': 32.23,
        '1 Pair of Nike Running Shoes (Mid-Range)': 83.49,
        '1 Pair of Men Leather Business Shoes': 108.69,
      },
      'Rent Per Month': {
        'Apartment (1 bedroom) in City Centre': 653.29,
        'Apartment (1 bedroom) Outside of Centre': 507.79,
        'Apartment (3 bedrooms) in City Centre': 1265.50,
        'Apartment (3 bedrooms) Outside of Centre': 891.77,
      },
      'Buy Apartment Price': {
        'Price per Square Meter to Buy Apartment in City Centre': 3756.40,
        'Price per Square Meter to Buy Apartment Outside of Centre': 2272.62,
      },
      'Salaries And Financing': {
        'Average Monthly Net Salary (After Tax)': 1551.94,
        'Mortgage Interest Rate in Percentages (%), Yearly, for 20 Years Fixed-Rate':
            1.91,
      }
    },
    {
      'name': "Ukraine",
      'selected': false,
      'Restaurants': {
        'Meal, Inexpensive Restaurant': 15.00,
        'Meal for 2 People, Mid-range Restaurant, Three-course': 60.00,
        'McMeal at McDonalds (or Equivalent Combo Meal)': 8.00,
        'Domestic Beer (0.5 liter draught)': 5.00,
        'Imported Beer (0.33 liter bottle)': 4.00,
        'Cappuccino (regular)': 1.50,
        'Coke/Pepsi (0.33 liter bottle)': 2.28,
        'Water (0.33 liter bottle)': 1.08
      },
      'Markets': {
        'Milk (regular), (1 liter)': 1.23,
        'Loaf of Fresh White Bread (500g)': 1.73,
        'Rice (white), (1kg)': 2.10,
        'Eggs (regular) (12)': 2.97,
        'Local Cheese (1kg)': 12.72,
        'Chicken Fillets (1kg)': 9.28,
        'Beef Round (1kg) (or Equivalent Back Leg Red Meat)': 15.33,
        'Apples (1kg)': 1.92,
        'Banana (1kg)': 1.68,
        'Oranges (1kg)': 1.91,
        'Tomato (1kg)': 2.45,
        'Potato (1kg)': 1.32,
        'Onion (1kg)': 1.33,
        'Lettuce (1 head)': 1.10,
        'Water (1.5 liter bottle)': 0.42,
        'Bottle of Wine (Mid-Range)': 5.95,
        'Domestic Beer (0.5 liter bottle)': 1.43,
        'Imported Beer (0.33 liter bottle)': 1.98,
        'Cigarettes 20 Pack (Marlboro)': 5.90,
      },
      'Transportation': {
        'One-way Ticket (Local Transport)': 1.50,
        'Monthly Pass (Regular Price)': 35.00,
        'Taxi Start (Normal Tariff)': 5.00,
        'Taxi 1km (Normal Tariff)': 1.30,
        'Taxi 1hour Waiting (Normal Tariff)': 28.00,
        'Gasoline (1 liter)': 1.95,
        'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)': 24000.00,
        'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)':
            25663.02,
      },
      'Utilities (Monthly)': {
        'Basic (Electricity, Heating, Cooling, Water, Garbage) for 85m2 Apartment':
            185.47,
        '1 min. of Prepaid Mobile Tariff Local (No Discounts or Plans)': 0.16,
        'Internet (60 Mbps or More, Unlimited Data, Cable/ADSL)': 28.05,
      },
      'Sports And Leisure': {
        'Fitness Club, Monthly Fee for 1 Adult': 46.77,
        'Tennis Court Rent (1 Hour on Weekend)': 19.65,
        'Cinema, International Release, 1 Seat': 9.00,
      },
      'Childcare': {
        'Preschool (or Kindergarten), Full Day, Private, Monthly for 1 Child':
            457.88,
        'International Primary School, Yearly for 1 Child': 871.82,
      },
      'Clothing And Shoes': {
        '1 Pair of Jeans (Levis 501 Or Similar)': 77.28,
        '1 Summer Dress in a Chain Store (Zara, H&M, ...)': 32.23,
        '1 Pair of Nike Running Shoes (Mid-Range)': 83.49,
        '1 Pair of Men Leather Business Shoes': 108.69,
      },
      'Rent Per Month': {
        'Apartment (1 bedroom) in City Centre': 653.29,
        'Apartment (1 bedroom) Outside of Centre': 507.79,
        'Apartment (3 bedrooms) in City Centre': 1265.50,
        'Apartment (3 bedrooms) Outside of Centre': 891.77,
      },
      'Buy Apartment Price': {
        'Price per Square Meter to Buy Apartment in City Centre': 3756.40,
        'Price per Square Meter to Buy Apartment Outside of Centre': 2272.62,
      },
      'Salaries And Financing': {
        'Average Monthly Net Salary (After Tax)': 1551.94,
        'Mortgage Interest Rate in Percentages (%), Yearly, for 20 Years Fixed-Rate':
            1.91,
      }
    },
    {
      'name': "Austria",
      'selected': false,
      'Restaurants': {
        'Meal, Inexpensive Restaurant': 15.00,
        'Meal for 2 People, Mid-range Restaurant, Three-course': 60.00,
        'McMeal at McDonalds (or Equivalent Combo Meal)': 8.00,
        'Domestic Beer (0.5 liter draught)': 5.00,
        'Imported Beer (0.33 liter bottle)': 4.00,
        'Cappuccino (regular)': 1.50,
        'Coke/Pepsi (0.33 liter bottle)': 2.28,
        'Water (0.33 liter bottle)': 1.08
      },
      'Markets': {
        'Milk (regular), (1 liter)': 1.23,
        'Loaf of Fresh White Bread (500g)': 1.73,
        'Rice (white), (1kg)': 2.10,
        'Eggs (regular) (12)': 2.97,
        'Local Cheese (1kg)': 12.72,
        'Chicken Fillets (1kg)': 9.28,
        'Beef Round (1kg) (or Equivalent Back Leg Red Meat)': 15.33,
        'Apples (1kg)': 1.92,
        'Banana (1kg)': 1.68,
        'Oranges (1kg)': 1.91,
        'Tomato (1kg)': 2.45,
        'Potato (1kg)': 1.32,
        'Onion (1kg)': 1.33,
        'Lettuce (1 head)': 1.10,
        'Water (1.5 liter bottle)': 0.42,
        'Bottle of Wine (Mid-Range)': 5.95,
        'Domestic Beer (0.5 liter bottle)': 1.43,
        'Imported Beer (0.33 liter bottle)': 1.98,
        'Cigarettes 20 Pack (Marlboro)': 5.90,
      },
      'Transportation': {
        'One-way Ticket (Local Transport)': 1.50,
        'Monthly Pass (Regular Price)': 35.00,
        'Taxi Start (Normal Tariff)': 5.00,
        'Taxi 1km (Normal Tariff)': 1.30,
        'Taxi 1hour Waiting (Normal Tariff)': 28.00,
        'Gasoline (1 liter)': 1.95,
        'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)': 24000.00,
        'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)':
            25663.02,
      },
      'Utilities (Monthly)': {
        'Basic (Electricity, Heating, Cooling, Water, Garbage) for 85m2 Apartment':
            185.47,
        '1 min. of Prepaid Mobile Tariff Local (No Discounts or Plans)': 0.16,
        'Internet (60 Mbps or More, Unlimited Data, Cable/ADSL)': 28.05,
      },
      'Sports And Leisure': {
        'Fitness Club, Monthly Fee for 1 Adult': 46.77,
        'Tennis Court Rent (1 Hour on Weekend)': 19.65,
        'Cinema, International Release, 1 Seat': 9.00,
      },
      'Childcare': {
        'Preschool (or Kindergarten), Full Day, Private, Monthly for 1 Child':
            457.88,
        'International Primary School, Yearly for 1 Child': 871.82,
      },
      'Clothing And Shoes': {
        '1 Pair of Jeans (Levis 501 Or Similar)': 77.28,
        '1 Summer Dress in a Chain Store (Zara, H&M, ...)': 32.23,
        '1 Pair of Nike Running Shoes (Mid-Range)': 83.49,
        '1 Pair of Men Leather Business Shoes': 108.69,
      },
      'Rent Per Month': {
        'Apartment (1 bedroom) in City Centre': 653.29,
        'Apartment (1 bedroom) Outside of Centre': 507.79,
        'Apartment (3 bedrooms) in City Centre': 1265.50,
        'Apartment (3 bedrooms) Outside of Centre': 891.77,
      },
      'Buy Apartment Price': {
        'Price per Square Meter to Buy Apartment in City Centre': 3756.40,
        'Price per Square Meter to Buy Apartment Outside of Centre': 2272.62,
      },
      'Salaries And Financing': {
        'Average Monthly Net Salary (After Tax)': 1551.94,
        'Mortgage Interest Rate in Percentages (%), Yearly, for 20 Years Fixed-Rate':
            1.91,
      }
    },
    {
      'name': "Germany",
      'selected': false,
      'Restaurants': {
        'Meal, Inexpensive Restaurant': 12.00,
        'Meal for 2 People, Mid-range Restaurant, Three-course': 55.00,
        'McMeal at McDonalds (or Equivalent Combo Meal)': 9.00,
        'Domestic Beer (0.5 liter draught)': 4.00,
        'Imported Beer (0.33 liter bottle)': 3.50,
        'Cappuccino (regular)': 3.09,
        'Coke/Pepsi (0.33 liter bottle)': 2.55,
        'Water (0.33 liter bottle)': 2.26
      },
      'Markets': {
        'Milk (regular), (1 liter)': 1.06,
        'Loaf of Fresh White Bread (500g)': 1.80,
        'Rice (white), (1kg)': 2.07,
        'Eggs (regular) (12)': 2.74,
        'Local Cheese (1kg)': 11.90,
        'Chicken Fillets (1kg)': 8.15,
        'Beef Round (1kg) (or Equivalent Back Leg Red Meat)': 14.83,
        'Apples (1kg)': 2.50,
        'Banana (1kg)': 1.64,
        'Oranges (1kg)': 2.74,
        'Tomato (1kg)': 1.46,
        'Potato (1kg)': 1.61,
        'Onion (1kg)': 1.11,
        'Lettuce (1 head)': 1.26,
        'Water (1.5 liter bottle)': 0.58,
        'Bottle of Wine (Mid-Range)': 5.00,
        'Domestic Beer (0.5 liter bottle)': 0.66,
        'Imported Beer (0.33 liter bottle)': 1.43,
        'Cigarettes 20 Pack (Marlboro)': 7.60,
      },
      'Transportation': {
        'One-way Ticket (Local Transport)': 2.90,
        'Monthly Pass (Regular Price)': 70.00,
        'Taxi Start (Normal Tariff)': 3.50,
        'Taxi 1km (Normal Tariff)': 2.00,
        'Taxi 1hour Waiting (Normal Tariff)': 30.00,
        'Gasoline (1 liter)': 2.00,
        'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)': 25000.00,
        'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)':
            25702.16,
      },
      'Utilities (Monthly)': {
        'Basic (Electricity, Heating, Cooling, Water, Garbage) for 85m2 Apartment':
            260.11,
        '1 min. of Prepaid Mobile Tariff Local (No Discounts or Plans)': 0.11,
        'Internet (60 Mbps or More, Unlimited Data, Cable/ADSL)': 35.12,
      },
      'Sports And Leisure': {
        'Fitness Club, Monthly Fee for 1 Adult': 32.70,
        'Tennis Court Rent (1 Hour on Weekend)': 22.19,
        'Cinema, International Release, 1 Seat': 12.00,
      },
      'Childcare': {
        'Preschool (or Kindergarten), Full Day, Private, Monthly for 1 Child':
            351.21,
        'International Primary School, Yearly for 1 Child': 11945.34,
      },
      'Clothing And Shoes': {
        '1 Pair of Jeans (Levis 501 Or Similar)': 78.75,
        '1 Summer Dress in a Chain Store (Zara, H&M, ...)': 36.70,
        '1 Pair of Nike Running Shoes (Mid-Range)': 82.86,
        '1 Pair of Men Leather Business Shoes': 107.28,
      },
      'Rent Per Month': {
        'Apartment (1 bedroom) in City Centre': 848.01,
        'Apartment (1 bedroom) Outside of Centre': 638.17,
        'Apartment (3 bedrooms) in City Centre': 1571.56,
        'Apartment (3 bedrooms) Outside of Centre': 1189.41,
      },
      'Buy Apartment Price': {
        'Price per Square Meter to Buy Apartment in City Centre': 6662.59,
        'Price per Square Meter to Buy Apartment Outside of Centre': 4814.99,
      },
      'Salaries And Financing': {
        'Average Monthly Net Salary (After Tax)': 2728.31,
        'Mortgage Interest Rate in Percentages (%), Yearly, for 20 Years Fixed-Rate':
            2.35,
      }
    },
    {
      'name': "Italy",
      'selected': false,
      'Restaurants': {
        'Meal, Inexpensive Restaurant': 15.00,
        'Meal for 2 People, Mid-range Restaurant, Three-course': 60.00,
        'McMeal at McDonalds (or Equivalent Combo Meal)': 8.00,
        'Domestic Beer (0.5 liter draught)': 5.00,
        'Imported Beer (0.33 liter bottle)': 4.00,
        'Cappuccino (regular)': 1.50,
        'Coke/Pepsi (0.33 liter bottle)': 2.28,
        'Water (0.33 liter bottle)': 1.08
      },
      'Markets': {
        'Milk (regular), (1 liter)': 1.23,
        'Loaf of Fresh White Bread (500g)': 1.73,
        'Rice (white), (1kg)': 2.10,
        'Eggs (regular) (12)': 2.97,
        'Local Cheese (1kg)': 12.72,
        'Chicken Fillets (1kg)': 9.28,
        'Beef Round (1kg) (or Equivalent Back Leg Red Meat)': 15.33,
        'Apples (1kg)': 1.92,
        'Banana (1kg)': 1.68,
        'Oranges (1kg)': 1.91,
        'Tomato (1kg)': 2.45,
        'Potato (1kg)': 1.32,
        'Onion (1kg)': 1.33,
        'Lettuce (1 head)': 1.10,
        'Water (1.5 liter bottle)': 0.42,
        'Bottle of Wine (Mid-Range)': 5.95,
        'Domestic Beer (0.5 liter bottle)': 1.43,
        'Imported Beer (0.33 liter bottle)': 1.98,
        'Cigarettes 20 Pack (Marlboro)': 5.90,
      },
      'Transportation': {
        'One-way Ticket (Local Transport)': 1.50,
        'Monthly Pass (Regular Price)': 35.00,
        'Taxi Start (Normal Tariff)': 5.00,
        'Taxi 1km (Normal Tariff)': 1.30,
        'Taxi 1hour Waiting (Normal Tariff)': 28.00,
        'Gasoline (1 liter)': 1.95,
        'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)': 24000.00,
        'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)':
            25663.02,
      },
      'Utilities (Monthly)': {
        'Basic (Electricity, Heating, Cooling, Water, Garbage) for 85m2 Apartment':
            185.47,
        '1 min. of Prepaid Mobile Tariff Local (No Discounts or Plans)': 0.16,
        'Internet (60 Mbps or More, Unlimited Data, Cable/ADSL)': 28.05,
      },
      'Sports And Leisure': {
        'Fitness Club, Monthly Fee for 1 Adult': 46.77,
        'Tennis Court Rent (1 Hour on Weekend)': 19.65,
        'Cinema, International Release, 1 Seat': 9.00,
      },
      'Childcare': {
        'Preschool (or Kindergarten), Full Day, Private, Monthly for 1 Child':
            457.88,
        'International Primary School, Yearly for 1 Child': 871.82,
      },
      'Clothing And Shoes': {
        '1 Pair of Jeans (Levis 501 Or Similar)': 77.28,
        '1 Summer Dress in a Chain Store (Zara, H&M, ...)': 32.23,
        '1 Pair of Nike Running Shoes (Mid-Range)': 83.49,
        '1 Pair of Men Leather Business Shoes': 108.69,
      },
      'Rent Per Month': {
        'Apartment (1 bedroom) in City Centre': 653.29,
        'Apartment (1 bedroom) Outside of Centre': 507.79,
        'Apartment (3 bedrooms) in City Centre': 1265.50,
        'Apartment (3 bedrooms) Outside of Centre': 891.77,
      },
      'Buy Apartment Price': {
        'Price per Square Meter to Buy Apartment in City Centre': 3756.40,
        'Price per Square Meter to Buy Apartment Outside of Centre': 2272.62,
      },
      'Salaries And Financing': {
        'Average Monthly Net Salary (After Tax)': 1551.94,
        'Mortgage Interest Rate in Percentages (%), Yearly, for 20 Years Fixed-Rate':
            1.91,
      }
    },
    {
      'name': "United Kingdom",
      'selected': false,
      'Restaurants': {
        'Meal, Inexpensive Restaurant': 15.00,
        'Meal for 2 People, Mid-range Restaurant, Three-course': 55.00,
        'McMeal at McDonalds (or Equivalent Combo Meal)': 6.00,
        'Domestic Beer (0.5 liter draught)': 4.20,
        'Imported Beer (0.33 liter bottle)': 4.00,
        'Cappuccino (regular)': 2.95,
        'Coke/Pepsi (0.33 liter bottle)': 1.48,
        'Water (0.33 liter bottle)': 1.08,
      },
      'Markets': {
        'Milk (regular), (1 liter)': 1.01,
        'Loaf of Fresh White Bread (500g)': 1.04,
        'Rice (white), (1kg)': 1.39,
        'Eggs (regular) (12)': 2.13,
        'Local Cheese (1kg)': 5.91,
        'Chicken Fillets (1kg)': 5.71,
        'Beef Round (1kg) (or Equivalent Back Leg Red Meat)': 8.93,
        'Apples (1kg)': 1.93,
        'Banana (1kg)': 1.09,
        'Oranges (1kg)': 1.79,
        'Tomato (1kg)': 2.05,
        'Potato (1kg)': 1.07,
        'Onion (1kg)': 0.98,
        'Lettuce (1 head)': 0.72,
        'Water (1.5 liter bottle)': 1.00,
        'Bottle of Wine (Mid-Range)': 7.00,
        'Domestic Beer (0.5 liter bottle)': 1.81,
        'Imported Beer (0.33 liter bottle)': 2.07,
        'Cigarettes 20 Pack (Marlboro)': 12.00,
      },
      'Transportation': {
        'One-way Ticket (Local Transport)': 2.50,
        'Monthly Pass (Regular Price)': 65.88,
        'Taxi Start (Normal Tariff)': 3.00,
        'Taxi 1km (Normal Tariff)': 1.24,
        'Taxi 1hour Waiting (Normal Tariff)': 17.40,
        'Gasoline (1 liter)': 1.56,
        'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)': 22000.00,
        'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)':
            22423.21,
      },
      'Utilities (Monthly)': {
        'Basic (Electricity, Heating, Cooling, Water, Garbage) for 85m2 Apartment':
            197.38,
        '1 min. of Prepaid Mobile Tariff Local (No Discounts or Plans)': 0.12,
        'Internet (60 Mbps or More, Unlimited Data, Cable/ADSL)': 30.00,
      },
      'Sports And Leisure': {
        'Fitness Club, Monthly Fee for 1 Adult': 31.38,
        'Tennis Court Rent (1 Hour on Weekend)': 10.44,
        'Cinema, International Release, 1 Seat': 10.00,
      },
      'Childcare': {
        'Preschool (or Kindergarten), Full Day, Private, Monthly for 1 Child':
            1060.14,
        'International Primary School, Yearly for 1 Child': 13681.42,
      },
      'Clothing And Shoes': {
        '1 Pair of Jeans (Levis 501 Or Similar)': 60.96,
        '1 Summer Dress in a Chain Store (Zara, H&M, ...)': 29.99,
        '1 Pair of Nike Running Shoes (Mid-Range)': 64.99,
        '1 Pair of Men Leather Business Shoes': 65.61,
      },
      'Rent Per Month': {
        'Apartment (1 bedroom) in City Centre': 905.93,
        'Apartment (1 bedroom) Outside of Centre': 695.81,
        'Apartment (3 bedrooms) in City Centre': 1580.46,
        'Apartment (3 bedrooms) Outside of Centre': 1190.11,
      },
      'Buy Apartment Price': {
        'Price per Square Meter to Buy Apartment in City Centre': 4408.05,
        'Price per Square Meter to Buy Apartment Outside of Centre': 3249.76,
      },
      'Salaries And Financing': {
        'Average Monthly Net Salary (After Tax)': 2317.41,
        'Mortgage Interest Rate in Percentages (%), Yearly, for 20 Years Fixed-Rate':
            3.39,
      }
    },
    {
      'name': "USA",
      'selected': false,
      'Restaurants': {
        'Meal, Inexpensive Restaurant': 18.00,
        'Meal for 2 People, Mid-range Restaurant, Three-course': 70.00,
        'McMeal at McDonalds (or Equivalent Combo Meal)': 9.99,
        'Domestic Beer (0.5 liter draught)': 5.00,
        'Imported Beer (0.33 liter bottle)': 6.50,
        'Cappuccino (regular)': 4.68,
        'Coke/Pepsi (0.33 liter bottle)': 2.30,
        'Water (0.33 liter bottle)': 1.82,
      },
      'Markets': {
        'Milk (regular), (1 liter)': 1.02,
        'Loaf of Fresh White Bread (500g)': 3.27,
        'Rice (white), (1kg)': 4.16,
        'Eggs (regular) (12)': 4.12,
        'Local Cheese (1kg)': 11.74,
        'Chicken Fillets (1kg)': 11.93,
        'Beef Round (1kg) (or Equivalent Back Leg Red Meat)': 15.04,
        'Apples (1kg)': 4.84,
        'Banana (1kg)': 1.61,
        'Oranges (1kg)': 4.14,
        'Tomato (1kg)': 4.53,
        'Potato (1kg)': 2.74,
        'Onion (1kg)': 2.75,
        'Lettuce (1 head)': 2.11,
        'Water (1.5 liter bottle)': 1.93,
        'Bottle of Wine (Mid-Range)': 13.00,
        'Domestic Beer (0.5 liter bottle)': 2.69,
        'Imported Beer (0.33 liter bottle)': 3.35,
        'Cigarettes 20 Pack (Marlboro)': 9.00,
      },
      'Transportation': {
        'One-way Ticket (Local Transport)': 2.50,
        'Monthly Pass (Regular Price)': 70.00,
        'Taxi Start (Normal Tariff)': 3.50,
        'Taxi 1km (Normal Tariff)': 1.68,
        'Taxi 1hour Waiting (Normal Tariff)': 30.00,
        'Gasoline (1 liter)': 1.00,
        'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)': 25000.00,
        'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)':
            23333.40,
      },
      'Utilities (Monthly)': {
        'Basic (Electricity, Heating, Cooling, Water, Garbage) for 85m2 Apartment':
            183.00,
        '1 min. of Prepaid Mobile Tariff Local (No Discounts or Plans)': 0.17,
        'Internet (60 Mbps or More, Unlimited Data, Cable/ADSL)': 69.59,
      },
      'Sports And Leisure': {
        'Fitness Club, Monthly Fee for 1 Adult': 41.93,
        'Tennis Court Rent (1 Hour on Weekend)': 18.33,
        'Cinema, International Release, 1 Seat': 12.00,
      },
      'Childcare': {
        'Preschool (or Kindergarten), Full Day, Private, Monthly for 1 Child':
            1171.14,
        'International Primary School, Yearly for 1 Child': 16550.68,
      },
      'Clothing And Shoes': {
        '1 Pair of Jeans (Levis 501 Or Similar)': 46.46,
        '1 Summer Dress in a Chain Store (Zara, H&M, ...)': 36.64,
        '1 Pair of Nike Running Shoes (Mid-Range)': 80.20,
        '1 Pair of Men Leather Business Shoes': 109.78,
      },
      'Rent Per Month': {
        'Apartment (1 bedroom) in City Centre': 1705.07,
        'Apartment (1 bedroom) Outside of Centre': 1376.66,
        'Apartment (3 bedrooms) in City Centre': 2847.60,
        'Apartment (3 bedrooms) Outside of Centre': 2244.21,
      },
      'Buy Apartment Price': {
        'Price per Square Meter to Buy Apartment in City Centre': 4549.36,
        'Price per Square Meter to Buy Apartment Outside of Centre': 3063.50,
      },
      'Salaries And Financing': {
        'Average Monthly Net Salary (After Tax)': 4223.61,
        'Mortgage Interest Rate in Percentages (%), Yearly, for 20 Years Fixed-Rate':
            5.39,
      }
    }
  ];
  int selectedCountryes = 0;
  bool compare = false;

  @override
  void initState() {
    // TODO: implement initState
    // coutriesList = [
    //   {'name': "Germany", 'selected': false},
    //   {'name': "Italy", 'selected': false},
    //   {'name': "United Kingdom", 'selected': false},
    //   {'name': "U SA", 'selected': false}
    // ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return compare
        ? Compare(comparingCountries: coutriesList)
        : CountrySelection(
            coutriesList: coutriesList,
            selectedCountryes: selectedCountryes,
            setCompare: () {
              setState(() {
                compare = true;
              });
            },
            selectCountry: (name, selected) {
              setState(() {
                if (selected) {
                  selectedCountryes--;
                } else {
                  selectedCountryes++;
                }
                print(coutriesList.map((e) {
                  if (e['name'] == name) {
                    e['selected'] = !e['selected'];
                    return e;
                  }
                  ;
                  return e;
                }));
              });
            });
  }
}

class CountrySelection extends StatelessWidget {
  List<Map> coutriesList;
  int selectedCountryes;
  Function selectCountry;
  Function setCompare;

  CountrySelection(
      {required this.coutriesList,
      required this.selectedCountryes,
      required this.setCompare,
      required this.selectCountry});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
        child: Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              Expanded(
                  child: ListView.builder(
                shrinkWrap: true,
                itemCount: coutriesList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CountrySelectionCard(
                      countryName: coutriesList[index]['name'],
                      selected: coutriesList[index]['selected'],
                      selectedCountryes: selectedCountryes,
                      onClick: (name, selected) =>
                          {selectCountry(name, selected)},
                    ),
                  );
                }),
              )),
              selectedCountryes == 2
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            setCompare();
                          },
                          child: const Text('Compare'),
                        ),
                      ),
                    )
                  : Container(color: Colors.white)
            ]))));
  }
}

class CountrySelectionCard extends StatelessWidget {
  String countryName;
  bool selected;
  int selectedCountryes;
  Function onClick;

  CountrySelectionCard(
      {required this.selected,
      required this.countryName,
      required this.selectedCountryes,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (selectedCountryes < 2 || selected) onClick(countryName, selected);
        },
        child:
            (Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            // ignore: sort_child_properties_last
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    countryName,
                    style: const TextStyle(
                        fontSize: 30,
                        fontFamily: "Alegreya Sans",
                        fontWeight: FontWeight.w300,
                        overflow: TextOverflow.visible),
                  ),
                ),
                const Icon(
                  Icons.info_outline,
                  color: Colors.grey,
                  size: 28.0,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: selected
                  ? Color.fromARGB(255, 112, 85, 249)
                  : Color(0xFFEFEFEF),
            ),
            padding: EdgeInsets.all(25),
          ),
        ])));
  }
}

class Compare extends StatelessWidget {
  List<Map> comparingCountries;
  List<Map> selectedComparingCountries = [];
  Compare({
    super.key,
    required this.comparingCountries,
  }) {
    this.selectedComparingCountries =
        comparingCountries.where((country) => country['selected']).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 10,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.restaurant)),
                Tab(icon: Icon(Icons.food_bank)),
                Tab(icon: Icon(Icons.emoji_transportation)),
                Tab(icon: Icon(Icons.dangerous)),
                Tab(icon: Icon(Icons.sports_football)),
                Tab(icon: Icon(Icons.child_care)),
                Tab(icon: Icon(Icons.checkroom)),
                Tab(icon: Icon(Icons.house)),
                Tab(icon: Icon(Icons.apartment)),
                Tab(icon: Icon(Icons.attach_money)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Restaurants'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Markets'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Transportation'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Utilities (Monthly)'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Sports And Leisure'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Childcare'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Clothing And Shoes'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Rent Per Month'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Buy Apartment Price'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Salaries And Financing'),
            ],
          ),
        ),
      ),
    );
  }
}

class ComparingPage extends StatelessWidget {
  String title = '';
  List<Map> selectedComparingCountries = [];
  List<DataRow> table = [];
  ComparingPage(
      {super.key,
      required this.title,
      required this.selectedComparingCountries}) {
    if (selectedComparingCountries[0][title] != null) {
      for (var key in selectedComparingCountries[0][title].keys) {
        table.add(
          DataRow(cells: [
            DataCell(Text(key)),
            DataCell(Align(
              alignment: Alignment
                  .center, // Align however you like (i.e .centerRight, centerLeft)
              child: Text(
                "${selectedComparingCountries[0][title][key]}\$",
                textAlign: TextAlign.center,
              ),
            )),
            DataCell(Align(
              alignment: Alignment
                  .center, // Align however you like (i.e .centerRight, centerLeft)
              child: Text(
                "${selectedComparingCountries[1][title][key]}\$",
                textAlign: TextAlign.center,
              ),
            )),
          ]),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: ListView(children: <Widget>[
        Center(
            child: Text(
          "$title ",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
        DataTable(
          columns: [
            DataColumn(
                label: Text('',
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text(
              selectedComparingCountries[0]['name'],
              style: TextStyle(fontSize: 18),
              softWrap: true,
              maxLines: 1,
            )),
            DataColumn(
                label: Text(
              selectedComparingCountries[1]['name'],
              style: TextStyle(fontSize: 18),
              softWrap: true,
              maxLines: 1,
            )),
          ],
          rows: table,
        ),
      ])),
    );
  }
}
