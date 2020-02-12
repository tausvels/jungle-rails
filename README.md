# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Screenshots

*home_page*
![home_page](screenshots/1.home_pg.png "Home")

*category_select*
![category_select](screenshots/2.category_select.png "category_select")

*signup_pg*
![signup_pg](screenshots/10.signup_pg.png "Signup pg")

*invalid_login*
![invalid_login](screenshots/10_1.invalid_login_pg.png "invalid_login")

*product_pg_after_login*
![product_pg_after_login](screenshots/4.product_pg_after_login.png "Product_pg_after_login")

*select_admin_pg*
![select_admin_pg](screenshots/5.select_admin_pg.png "select_admin_pg")

*admin_auth*
![admin_auth](screenshots/6.admin_auth.png "admin_auth")

*admin_product*
![admin_product](screenshots/7.admin_product_pg.png "admin_product")

*admin_sale*
![admin_sale](screenshots/8.admin_sale_pg.png "admin_sale")

*admin_add_product*
![admin_add_product](screenshots/9.admin_add_product_pg.png "admin_add_product")