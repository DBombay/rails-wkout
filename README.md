Workout Store - Rails API
===
Built to keep my Rails skills sharp, this API will act as the back-end for a client-serving React application. 

*Ruby version*: **2.5.1**

Setup and Installation
---
1. Get Ruby running. I use [asdf](https://github.com/asdf-vm/asdf-ruby) for package management, but [rvm](https://rvm.io/)
 or [chruby](https://github.com/postmodern/chruby) will also work fine.
2. Install the Gem manager
    ```bash
    gem install bundler
    ```
3. Clone the repo down and `cd` into it
    ```bash
    git clone https://github.com/DBombay/rails-wkout.git
    cd rails-wkout
    ```
4. Install dependencies
      ```bash
      bundle exec bundle install
      ```
5. Create the database, run migrations, and seed the database
    ```bash
    rake db:create
    rake db:migrate
    rake db:seed
    ```
6. Start the rails server on port 5000
   ```bash
   rails s -p 5000
   ```

Endpoints
---
Models are broken into Categories, SubCategories, and Products. Once the server is running on port -5000, you can hit
the following endpoints to get JSON objects back from the API/database. I'll include sample objects as well.

### Category
```json
{
    "name": "Supplements",
    "description": "Shakes, vitamins, and more!"
}
```

#### Index
`GET http://localhost:5000/categories`

Returns:
```json
[
    {
        "id": 1,
        "name": "Fitness",
        "description": "Fitness products",
        "created_at": "2019-02-22T00:01:17.000Z",
        "updated_at": "2019-02-22T00:01:17.000Z"
    }
]
```    
#### New
`POST http://localhost:5000/categories`

Returns:
```json
{
    "id": 2,
    "name": "Supplements",
    "description": "Shakes, vitamins, and more!",
    "created_at": "2019-02-22T15:51:16.000Z",
    "updated_at": "2019-02-22T15:51:16.000Z"
}
```

#### Show
`GET http://localhost:5000/categories/{:category_id}`

Returns:
```json
{
    "id": 2,
    "name": "Supplements",
    "description": "Shakes, vitamins, and more!",
    "created_at": "2019-02-22T15:51:16.000Z",
    "updated_at": "2019-02-22T15:51:16.000Z"
}
```


### Update
`PUT https://localhost:5000/categories/{:category_id}`

Returns:
```json
{
    "id": 2,
    "name": "Supplements",
    "description": "Shakes, vitamins, pills, and more!",
    "created_at": "2019-02-22T15:51:16.000Z",
    "updated_at": "2019-02-22T15:53:46.000Z"
}
```

#### Destroy
`DELETE https://localhost:5000/categories/{:category_id}`

Doesn't return anything. To confirm delete, try hitting 'SHOW' for this item, you'll get:
```json
{
    "message": "Couldn't find Category with 'id'=2"
}
```

### SubCategories
```json
{
    "name": "Shakes",
    "description": "Delicious protein and whey in a multitude of flavors!",
    "category_id": 2
}
```

#### Index
`GET http://localhost:5000/categories/{:category_id}/sub_categories`

Returns all the child sub-categories of a given category:
```json
[
    {
        "id": 1,
        "name": "Workout Supplies",
        "description": "Gear to get you sweaty",
        "created_at": "2019-02-22T00:01:17.000Z",
        "updated_at": "2019-02-22T00:01:17.000Z",
        "category_id": 1
    }
]
```    

#### New
`POST http://localhost:5000/categories/{:category_id}/sub_categories`

Returns:
```json
{
    "id": 2,
    "name": "Supplements",
    "description": "Shakes, vitamins, pills, and more!",
    "created_at": "2019-02-22T16:08:53.000Z",
    "updated_at": "2019-02-22T16:08:53.000Z",
    "category_id": 1
}
```

#### Show
`GET http://localhost:5000/categories/{:category_id}/sub_categories/{:sub_category_id}`

Returns:
```json
{
    "id": 1,
    "name": "Workout Supplies",
    "description": "Gear to get you sweaty",
    "created_at": "2019-02-22T00:01:17.000Z",
    "updated_at": "2019-02-22T00:01:17.000Z",
    "category_id": 1
}
```


### Update
`PUT https://localhost:5000/categories/{:category_id}/sub_categories/{:sub_category_id}`

Returns:
```json
{
    "id": 1,
    "name": "Workout Supplies",
    "description": "Gear to get you strong and sweaty",
    "category_id": 1,
    "created_at": "2019-02-22T00:01:17.000Z",
    "updated_at": "2019-02-22T16:18:25.000Z"
}
```

#### Destroy
`DELETE https://localhost:5000/categories/{:category_id}/sub_categories/{:sub_category_id}`

Doesn't return anything. To confirm delete, try hitting 'SHOW' for this item, you'll get:
```json
{
    "message": "Couldn't find SubCategory with 'id'=2"
}
```


### Products
```json
{
	"name": "Exercise Bands 3x",
	"description": "Resistance training and stretching aides",
	"price": 7.99,
	"salePrice": 0,
	"active": true,
	"onSale": false,
	"product_image": "http://dummyimage.com/100x100.jpg/cc0000/ffffff",
	"category_id": 1,
	"sub_category_id": 1
}
```

#### Index
`GET http://localhost:5000/categories/{:category_id}/sub_categories/{:sub_category_id}/products`

Returns all the child products of the sub-category of a given category:
```json
[
    {
        "id": 1,
        "name": "Dumbbell 9000",
        "description": "Just when you thought the Dumbbell 8999 didn't go far enough...",
        "price": 99,
        "sale_price": 0.9,
        "active": true,
        "on_sale": true,
        "product_image": "https://images.cdn2.stockunlimited.net/preview1300/dumbbell_1809000.jpg",
        "created_at": "2019-02-22T00:01:17.000Z",
        "updated_at": "2019-02-22T00:01:17.000Z",
        "category_id": 1,
        "sub_category_id": 1
    }
]
```    

`GET http://localhost:5000/categories/{:category_id}/products`

Returns all the child products of a given category:
```json
[
    {
        "id": 1,
        "name": "Dumbbell 9000",
        "description": "Just when you thought the Dumbbell 8999 didn't go far enough...",
        "price": 99,
        "sale_price": 0.9,
        "active": true,
        "on_sale": true,
        "product_image": "https://images.cdn2.stockunlimited.net/preview1300/dumbbell_1809000.jpg",
        "created_at": "2019-02-22T00:01:17.000Z",
        "updated_at": "2019-02-22T00:01:17.000Z",
        "category_id": 1,
        "sub_category_id": 1
    },
    {
    	"name": "Exercise Bands 3x",
    	"description": "Resistance training and stretching aides",
    	"price": 7.99,
    	"salePrice": 0,
    	"active": true,
    	"onSale": false,
    	"product_image": "http://dummyimage.com/100x100.jpg/cc0000/ffffff",
    	"category_id": 1,
    	"sub_category_id": 2
    }
]
```    

#### New
`POST http://localhost:5000/categories/{:category_id}/sub_categories/{:sub_category_id}/products`

Returns:
```json
{
    "id": 2,
    "name": "Excercise Bands 3x",
    "description": "Resistance training and stretching aides",
    "price": 7.99,
    "sale_price": 1,
    "active": true,
    "on_sale": false,
    "product_image": "http://dummyimage.com/100x100.jpg/cc0000/ffffff",
    "created_at": "2019-02-22T16:23:08.000Z",
    "updated_at": "2019-02-22T16:23:08.000Z",
    "category_id": 1,
    "sub_category_id": 1
}
```

#### Show
`GET http://localhost:5000/categories/{:category_id}/sub_categories/{:sub_category_id}/products/{:product_id}`

Returns:
```json
{
    "id": 2,
    "name": "Excercise Bands 3x",
    "description": "Resistance training and stretching aides",
    "price": 7.99,
    "sale_price": 1,
    "active": true,
    "on_sale": false,
    "product_image": "http://dummyimage.com/100x100.jpg/cc0000/ffffff",
    "created_at": "2019-02-22T16:23:08.000Z",
    "updated_at": "2019-02-22T16:23:08.000Z",
    "category_id": 1,
    "sub_category_id": 1
}
```


### Update
`PUT https://localhost:5000/categories/{:category_id}/sub_categories/{:sub_category_id}/products/{:product_id}`

Returns:
```json
{
    "id": 2,
    "name": "Excercise Bands 3x",
    "description": "Resistance training and stretching tools",
    "price": 7.99,
    "active": true,
    "product_image": "http://dummyimage.com/100x100.jpg/cc0000/ffffff",
    "category_id": 1,
    "sub_category_id": 1,
    "sale_price": 1,
    "on_sale": false,
    "created_at": "2019-02-22T16:23:08.000Z",
    "updated_at": "2019-02-22T16:28:00.000Z"
}
```

#### Destroy
`DELETE https://localhost:5000/categories/{:category_id}/sub_categories/{:sub_category_id}/products/{:product_id}`

Doesn't return anything. To confirm delete, try hitting 'SHOW' for this item, you'll get:
```json
{
    "message": "Couldn't find Product with 'id'=2"
}
```
