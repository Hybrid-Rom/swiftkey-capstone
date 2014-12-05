

This project implements a typeahead prediction model that suggests words as a user types to help improve their typing efficiency on constrained mobile devices.  This is akin to products such as [Swiftkey](http://swiftkey.com/en/) which are available for Android and iOS mobile devices.  This was completed as the Project Capstone for the [Data Science Specialization](https://www.coursera.org/specialization/jhudatascience/1) offered by [Johns Hopkins University](http://www.jhu.edu/) through Coursera.

### Getting Started

To load, preprocess the data, and build the typeahead model simply run the following commands within an R session.  The project uses [Project Template](http://projecttemplate.net/) to organize the code base.  Once that's done, you can execute any code that you'd like.

	library('ProjectTemplate')
	load.project()

The data backing the typeahead model itself is contained within a data set called 'ngrams'.

	head (ngrams)
	str (ngrams)

The predictive capability is contained within a function called `predict_next_word`.  Use this funtion to predict the next word for any given phrase.

        predict_next_word ("What will I type next", ngrams)

### Resources

  * A [web application](https://farsite.shinyapps.io/swiftkey-cap/) was built to showcase the results of this model.
  * A [web presentation](http://rpubs.com/willylane333/46619) was created to describe the underlying statistical model.

