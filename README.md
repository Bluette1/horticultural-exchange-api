# horticultural-exchange-api

![Linters](https://github.com/Bluette1/horticultural-exchange-api/workflows/Linters/badge.svg)

## Built With
- Ruby
- Rails 

## Description
- This project is for building a simple RESTful backend API for the horticultural-exchange [application](https://xchange-plant-app.herokuapp.com/).

## Built with
- Ruby version 2.7.2
- Rails version 6.1.4

## Live Demo
[Live Demo](https://xchange-plant-api.herokuapp.com/)

### Run instructions 
-  You can clone the GitHub repo and type the following commands in the terminal to run the app locally 
    ```
    bundle install
    rake db:migrate
    rails server
    ```

### How to use the site
Make sure the server is running
- Go to http://localhost:3000/ in your web browser


- Follow the links on the [horticultural-exchange-website](https://xchange-plant-app.herokuapp.com/) to access the available features.

## Generate documentation
Run `bundle exec rdoc` in the terminal.

### Integration with Amazon Web Services(AWS) S3 Storage
#### Setup
- Create an [Amazon Web Services](https://signin.aws.amazon.com/) account.
- Afterwards

``Download your credentials `csv` from the management console file to access your credentials.
- You may have to edit bucket policy to give access permissions to stored objects. For further information, read the [documentation](https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-bucket-policies.html).

#### Integration With Stripe
- Create a [Stripe](https://dashboard.stripe.com/register) account.
- Copy and safely paste your credentials locally in the rails credentials file.

### Setting up env variables
 - Set access keys/credentials locally according to the `.env_example` file.
 - You can edit the Rails credentials file by running to add Stripe and AWS access keys:

 ``` 
 EDITOR=gedit rails credentials:edit
 ```


## Deployment
- You can deploy on [Heroku](https://devcenter.heroku.com/categories/ruby-support).
#### Heroku Deployment with Docker
- Instructions can be found [here]( 
 https://betterprogramming.pub/how-to-containerize-and-deploy-apps-with-docker-and-heroku-b1c49e5bc070).

## Authors

👤 **Marylene Sawyer**
- Github: [@Bluette1](https://github.com/Bluette1)
- Twitter: [@MaryleneSawyer](https://twitter.com/MaryleneSawyer)
- Linkedin: [Marylene Sawyer](https://www.linkedin.com/in/marylene-sawyer)

# Acknowledgements
- [Tutorial to build a RESTful JSON API with Rails](https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Bluette1/horticultural-exchange-api/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.

