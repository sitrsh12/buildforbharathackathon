# Build For Bharat Hackathon

--------------------------------------------------------

This project is a solution to the Build For Bharat Hackathon problem statements Under the theme Retail Ecommerce - Scalable Solutions. The aim is to transform the way pricing strategies are traditionally devised and employed within the grocery retail industry. Sellers need to know the best pricing to be set for a product or service to nudge conversions on buyer applications end. The price(s) should be valid for a limited duration. At its core, the application should be agile, intuitive, and data-driven, with the ability to swiftly adapt prices in real-time. It should include a multifaceted array of factors, including but not limited to the ever-shifting demands of consumers, the nuanced dynamics of product shelf life, and the real-time status of inventory levels. Focus on products and categories where there is margin for a cost change that impacts the customer ( Example: Perishable products, Services). In the application, customers check for pricing received from the various seller platforms to get the best value for their purchase based on factors such as Inventory, Terms of Trade, Margins, Strategic Call, time of the day and current market prices. 
_________________________________________________________

## Deliverabls expected

Showcase a solution that will provide the seller a recommendation of the price, with time range validity, that should be offered by the seller, when there is a search for a product or a service. With this information, the seller should be able to decide and select the price for their products.
All artefact used to compute the prices should be elaborated.
Application should be able to demonstrate the change in prices when the values of the variables are changed.
All assumptions should be elaborated.

___________________________________________________________

## Facts and Assumptions:

In a Nifty index chart,  if we want to predict the next day closing price, it is quite an impossible task, even if we do some advance analysis. But if we are given a set of time period, say next 5 years, we can predict the price movement and can determine whether the price will meet our expectation. 

All indicators are a lagging indicators. A one hour candle stick indicator, a candle will not close until the price action takes place for one entire hour. Similarly for a month candle indicator, a month candle will not close until the 29th day of  initiation date, and until the closing price one cannot derive the candle closing pattern. Even we have a set of 20 -30 years of data.

It is hard to predict the next day closing price precisely. Therefore solutions to the problem statement of this hackathon should found somewhere between the algorithm I design and the data I can acquire from the market. The past data may entirely came from the situation and the circumstances of past factors, and tomorrow the situation can be different all together.

Since I need to derive the upcoming selling price from the market itself, which is not the range of prices from where I can predict the movement of market, I decided to go with the solution, which is ahead of time and still the data driven solution of that particular time.

Similar to an AI driving car. AI driving car can get the help of previous data to learn from it. But cannot depend entirely on those data, because what it is going to face on the road can be entirely different from previous experience and learning. So there we need to work with set of algorithms which helps our AI car to take the decision, ahead of time.

Depending upon above scenario, I decided to go with flutter application. Which is also my area of expertise. First I setup an environment setup application. This application is to setup the background environment task, which may impact the buyer and seller price fixing decision. 

This is only one of the approach that can suggest the varying price of the grocery items to the seller. There could be combination of multiple such approaches and algorithms that we could work on to decide the closest and healthiest selling price recommendations.

The Google bard says, the estimated number of households in Gangtok as of 2024 is 23,773. This data comes from the 2011 census report, which is the most recent official data available. However, it's important to note that this number is likely an underestimate, as the 2021 census scheduled for Gangtok has been postponed due to the pandemic. 

It is expected that a new population census will be conducted in 2024, and the official number of households will be updated then. The population of Gangtok is estimated to be around 140,000 in 2024 and the radius of Gangtok is around 2.2 Kms. This data helps us in getting the average household member numbers which is 5.8 ~ 6 in Gangtok.

Above scenario gives us the clear indication of my environment variables that I need to apply to my applications which are as follows.

City, Place, Unit, Grocery, Base Price of the grocery, Max Price of the Grocery, HouseHoldRate, Initial Radius of the place, Max Radius of the place. 

These environment variables are self explanatory and I manually supplied these variable values for this demonstration. Later these values can be derived and replaced from google map data of the buyer app, Official Censes Website, Scraping data from different sources and when adding the grocery items. This also helps us automate this process.

Number of households per square kilometres within Gangtok area is 10805, which is derived by dividing (HouseHoldNumbers / Radius of Gangtok). Considering this a standard number, first slider in an environment setup app, upon changing the value in kilometres, first the number of households changes with changing distance. Second, within price indicator, number of searchers and distance in Km changes and thus the price is adjusted accordingly. Here the number of searchers are equivalent to number of households considering each household cook food under the same kitchen and only one person is searching the item at that particular time. 

With the increasing distance, household number increases and thus the searchers number increases. If there is only one Mandi in that particular area, assuming the supply source of the grocery is limited, the price will increase with more household demand. 

Here I tried to demonstrate how the price of the grocery get effected upon changing the variables of the market. This assumption demonstrates the price Impact on one Grocery Stores and Sabji Mandi.

Since the demand supply can itself limiting to many factors, here I made Maximum Rs X increase with 1Km radius increase for a small town like Gangtok, the increment and decrement of these variable entirely depends upon environment variables mentioned below. These variables not only decides the incremental rate, but also decides the base price of the item. 

Which may be the of high or low value change which will impact the price just to demonstrate the features. Of course these variable can be changed on real case scenario, here I made an assumption to demonstrate the clear picture of the changes. These values also depends on process of delivery expenses if the grocery is bought from e-commerce platform, available logistics in the area of demand, distance from the ordered item and so on.

Therefore each variables mentioned here need more attention and needed to turn out to be the more effective algorithm. For this demonstration, I kept the default and the same weightage for all below variables like a public opinion pool with 10 a max value and 0 the lowest. The variables are mentioned below.

Transportation availability and its cost, Modern farming education, Storage Capacity and Availability, Waste management, Seasonal Farming, Water Supply Availability, Production per unit, Favourable Weather Conditions, Organic Farming Practices and Quality of seed.  

In a real case scenario, these calculations can be performed considering many different factors inside backend of the application. With the help of data accumulated in the database, we could perform the complex calculations to derive the actual algorithm. 

Cost of transportation can be derived from the local transport services, Farming awareness and education can be derived from public opinion pool. Storage capacity from manually visiting the site and so on. All variables are not only limited to above mentioned variables but also the real time scenario of that particular area.

And this is also a best case scenario for a small town like Gangtok. For a larger City like Mumbai and Delhi, more things need to be taken into considerations. Like maximum radius should not exceed more than few kms, assuming within every 10Kms radius there is another Retail Store or sabji Mandi. 

This solution illustrates average buying price, which is derived from summing all buying prices and dividing it with the number of buyers. The solution also demonstrate the number of  people participated on searching the item. This gives the clear picture to the ONDC, the number of people involved in each item on an hourly, daily, weekly, monthly and yearly  basis. This helps ONDC to maintain upcoming demand on the market need.

Here I considered seller app will be operated by ONDC, not the seller themselves . This ensures ONDC, the reasonable profit margin to Manufacturers Or Farmers, Distributers and Retailers, considering all inbound factors. 

With the help of Seller app, ONDC can decide if the suggested price gives the distributed network a reasonable profit margin, incase the suggested price is not align with the profitability of distributed network,  ONDC can themselves adjust the price. The adjusted price is the final and shown to the buyer app.

I have also included timer for each item price recommendation. For this prototype I made price expiration on every 10 seconds for each item, to make it easy for simulation. These expiration time for each price could be increased on real case later. Expiration timer also triggered when starting the seller app for the first time and when the buyer price is assigned to the buyer application to nullify the time lapse between expired time and when ONDC update the buyer price so that, environment setup app would give the search count on updated and real time. 

There could be the different algorithms trial and tested to fit the exact market need depending upon all factors which may cause grocery production on YOY basis, may it be weather conditions for that particular year, transportations, wastage management, quality and quantity of fertilisers used, storage capacity and available resources, manpower needed for the production and so on, which may cause the direct or indirect effect to the cost of grocery  base price at that particular time.

In my opinion these assumption are applicable in all case scenario because the selling price  is derived from the demand of the market considering all above factors, and the market itself decides the demand and supply zone. No other factors could, specially when it comes to grocery items. 

An efficient architecture is not to memorise the past event and to derive the outcome out of it. But an actual efficiency is when, an application read the current available data from the large number of people in a realtime and come out with the more robust outcome, which decides the future of the market. Said this, the real time data are actually more efficient than the stored database not just to derive the complex algorithm but to change the future of market. 

The market moves basically on herd mentality where a crowd will decide the direction of the market. The fact is also little bit harsh if these data are driven by the single entity, which I hope will be take care with the help of blockchain technology on later days.


## Prepare the executables:

Download the 3 APK files from the link provided 

https://github.com/sitrsh12/buildforbharathackathon/tree/main/executables
_______________________________________________________________________

## Set Up Your Environment:

- Ensure you have 3 necessary android phone handy. Install environment setup application on the first phone. Install seller setup application on second phone and install buyer setup application on third. You can also install all 3 app on the same phone. But to test all application on the real time, 3 phones are suggested. Turn on “install app from unknown sources” in the settings of your android application.

## Application Testing:

- Open the env setup application. first slider in an environment setup app, upon changing the value in kilometres, first the number of households changes with changing distance. Second, within price indicator, number of searchers and distance in Km changes and thus the price is adjusted accordingly.

- Open the seller setup application. Watch closely the average price if it changes with changing distance on first app, and should equal to the price shown on env setup app price indicator.

- In the seller setup application watch closely the number of searches changes with changing distance and is equivalent to indicator shown on env setup application.

- On a seller setup app watch closely if timer triggered first on initial state, second On horizontal slider changes on third when env setup app slider changes.

- Open the buyer setup application on the third android phone. Watch closely if the buyer price changes on seller application

___________________________________________________________________________

## How to use this repo

- Prepare Your Flutter Application:
-- Download the completed project from the github repository from the link provided
- Set Up Your Environment:
-- Ensure you have the necessary development tools installed for your target platforms (e.g., Android Studio for Android, Xcode for iOS).
-- Make sure Flutter and Dart SDKs are installed on your development machine.
- Configure Application Settings:
-- Update the pubspec.yaml file with necessary metadata such as the application name, description, version, dependencies, etc.
-- Configure assets file settings such as images and fonts, in your pubspec.yaml file.
- Build Your Application:
-- Run flutter build command to build your Flutter application.
-- For Android, you can use flutter build apk to generate an APK file.
-- For iOS, you can use flutter build ios to generate an iOS build.

- Note: I've intentionally deleted the firebase_options.dart file inside all three projects under lib directory, Firebase api key exposeed in public domain. These file is auto generated file which contains the firebase credentials. This file will be auto generated inside your project lib directory during the application setup.

_____________________________________________________________________________


## For More Info Visit here
HINDI

https://youtu.be/ZXUr9ydpmQA

English

https://www.youtube.com/watch?v=hSLpvGuECVk

_________________________________________________________________________

## Screenshots
<img src="https://github.com/sitrsh12/buildforbharathackathon/assets/16430056/3df19652-2668-4359-8b01-4acdf8ba6ea7" width="45%"></img>
<img src="https://github.com/sitrsh12/buildforbharathackathon/assets/16430056/335e0a9c-7661-40d4-86ad-0bed2f971393" width="45%"></img> <img src="https://github.com/sitrsh12/buildforbharathackathon/assets/16430056/6928e849-5afe-4ac3-8b5e-4cbebc3f3a30" width="45%"></img> <img src="https://github.com/sitrsh12/buildforbharathackathon/assets/16430056/d8724ea6-0f67-4a4b-adc7-513e0753254e" width="45%"></img> <img src="https://github.com/sitrsh12/buildforbharathackathon/assets/16430056/2a135969-23c1-4333-8aa6-f2656f0eb54c" width="45%"></img> <img src="https://github.com/sitrsh12/buildforbharathackathon/assets/16430056/9358b506-1e86-49e9-845a-20dbfd603303" width="45%"></img>



