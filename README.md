# Lunch n' Learn

> This application functions to search for cuisines by country, and provides opportunity to learn more about that country's culture. This app will allow users to search for recipes by country, favorite recipes, and learn more about a particular country.
>
> This app uses a service-oriented architecture. The front-end will communicate with this back-end through an API. 

## Dates
- November 9, 2023 - November 15, 2023

## Built With
- Ruby 3.2.2
- Rails 7.0.8

## Testing Tools
- RSpec 3.12
- Capybara 
- Webmock 
- VCR 

## Schema Visualization
This project utilizes a One-to-Many relationship for users and favorites. One user can have many favorites. Please see a visual representation of the schema below

![Diagram of the One-to-Many Relationship](https://user-images.githubusercontent.com/134240535/283046938-5fb8a207-f7b8-44f1-96a0-c7a8fe1de8bb.png)

## API Documentation 

### Search Recipes by Country
`GET /api/v1/recipes?country=<country>`

**Example response:**
  ```
  "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Cook the Book: Duck Phở",
                "url": "https://www.seriouseats.com/recipes/2011/10/duck-pho-recipe.html",
                "country": "vietnam",
                "image": "https://edamam-product-images.s3.amazonaws.com/web-img/16d/16d9aa27b92b8800aa6342b104...9b937c5b0f817025aa596eb918"
            }
        }
  ```
___
### Search Recipes by Randomized Country
`GET /api/v1/recipes?country=random`

**Example response:**
```
   "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Pots de Crème au Chocolat",
                "url": "https://food52.com/recipes/9724-pots-de-creme-au-chocolat",
                "country": "Gibraltar",
                "image": "https://edamam-product-images.s3.amazonaws.com/web-img/e68/e68f0a0cda89036d73de261f87cb959c...bbbb852a93642b6"
            }

```
___
### Find Learning Resources by Country
`GET /api/v1/learning_resources?country=<country>`

**Example response:**
```
"data": {
        "id": null,
        "type": "learning_resource",
        "attributes": {
            "country": "laos",
            "video": {
                "title": "A Super Quick History of Laos",
                "youtube_video_id": "uw8hjVqxMXw"
            },
            "images": [
                {
                    "alt_tag": "time lapse photography of flying hot air balloon",
                    "url": "https://images.unsplash.com/photo-1540611025311-01df3cef54b5?ixid=M3w1Mjc3NjN8MHwxfHNlYXJjaHwxfHxsYW9zfGVufDB8fHx8MTcwMDAyMDA4MXww&ixlib=rb-4.0.3"
                },
                {
                    "alt_tag": "aerial view of city at daytime",
                    "url": "https://images.unsplash.com/photo-1570366583862-f91883984fde?ixid=M3w1Mjc3NjN8MHwxfHNlYXJjaHwyfHxsYW9zfGVufDB8fHx8MTcwMDAyMDA4MXww&ixlib=rb-4.0.3"

```
___

### Create New  User
`POST /api/v1/users`

**Example Request (sent in the body of the request):**

```
{
  "name": "Odell",
  "email": "goodboy@ruffruff.com",
  "password": "treats4lyf",
  "password_confirmation": "treats4lyf"
}


```

**Example Response:**

``` 
{
  "data": {
    "type": "user",
    "id": "1",
    "attributes": {
      "name": "Odell",
      "email": "goodboy@ruffruff.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}

```


* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# lunch_n_learn
