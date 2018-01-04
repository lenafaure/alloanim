# AlloAnim

A Web application that helps the City of Paris find available after-school staff.

[![AlloAnim](http://img.youtube.com/vi/AoMaZQC6JKw/0.jpg)](https://www.youtube.com/watch?v=AoMaZQC6JKw)


Live app: [alloanim.futur.paris](http://alloanim.futur.paris/)

## Description of content

**app**
  Holds all the code that's specific to this particular application.

**app/controllers**
  Holds controllers that should be named like weblogs_controller.rb for
  automated URL mapping. All controllers should descend from ApplicationController
  which itself descends from ActionController::Base.

**app/models**
  Holds models that should be named like post.rb.
  Most models will descend from ActiveRecord::Base.

**app/views**
  Holds the template files for the view that should be named like
  weblogs/index.html.erb for the WeblogsController#index action. All views use eRuby
  syntax.

**app/views/layouts**
  Holds the template files for layouts to be used with views. This models the common
  header/footer method of wrapping views. In your views, define a layout using the
  <tt>layout :default</tt> and create a file named default.html.erb. Inside default.html.erb,
  call <% yield %> to render the view using this layout.

**app/helpers**
  Holds view helpers that should be named like weblogs_helper.rb. These are generated
  for you automatically when using script/generate for controllers. Helpers can be used to
  wrap functionality for your views into methods.

**config**
  Configuration files for the Rails environment, the routing map, the database, and other dependencies.

**db**
  Contains the database schema in schema.rb.  db/migrate contains all
  the sequence of Migrations for your schema.

**lib**
  Application specific libraries. Basically, any kind of custom code that doesn't
  belong under controllers, models, or helpers. This directory is in the load path.

**public**
  The directory available for the web server. Contains subdirectories for images, stylesheets,
  and javascripts. Also contains the dispatchers and the default HTML files. This should be
  set as the DOCUMENT_ROOT of your web server.

**test**
  Unit and functional tests along with fixtures. When using the script/generate scripts, template
  test files will be generated for you and placed in this directory.

**vendor**
  External libraries that the application depends on. Also includes the plugins subdirectory.
  If the app has frozen rails, those gems also go here, under vendor/rails/.
  This directory is in the load path.
  
## System dependencies

  - Sqlite3
  - Ruby version 2.4.1
  - Rails 5.1.4

## Installing

**1. Clone the app**

Browse to where you want the app to live and clone app:

```
git clone https://gitlab.com/startups-ville-paris/animexpress.git
```

Change directory into the alloanim folder
```
cd alloanim
```

**2. Start the app**

First install all the required gems:
```
bundle install
```

Set up and migrate the database:
```
rake db:setup
rake db:migrate
```

Fill the database with predetermined data (Be sure to run this command only **once**):
```
rake db:seed
```


Lets run the App:
```
rails server
```

Then browse to [http://localhost:3000](http://localhost:3000) to view the app. 

**3. Log in as Admin**

Navigate to the Admin dashboard and enter the following email and password:

admin@example.com / password

[http://localhost:3000/admin/login](http://localhost:3000/admin/login)


## Deployment

**1. Deploy to Heroku**

Following [these steps](https://devcenter.heroku.com/articles/getting-started-with-rails5)

**2. Install add-ons**

Install [Sendgrid](https://elements.heroku.com/addons/sendgrid) and [Heroku Scheduler](https://elements.heroku.com/addons/scheduler) on your Heroku instance

**3. Configure rake tasks in Heroku Scheduler**

Set up these exact three tasks with daily frequency at the following times: 

![rake tasks](https://raw.githubusercontent.com/lenafaure/alloanim/master/Heroku%20Scheduler.png)


## Authors

* **Lena Faure** - *Initial work* - [lenafaure](https://github.com/lenafaure)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

