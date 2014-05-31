# Contribute

## Running Specs

````
  bundle exec rake
````

## Workflow

* Fork the project.
* Clone down your fork ( `git clone git@github.com:<username>/simplecov-shield.git` ).
* Create a topic branch to contain your change ( `git checkout -b my_awesome_feature` ).
* Hack away, add tests. Not necessarily in that order.
* Make sure everything still passes by running `bundle exec rake`.
* If necessary, rebase your commits into logical chunks, without errors.
* Push the branch up ( `git push origin my_awesome_feature` ).
* Create a pull request against jekyll/jekyll and describe what your change
  does and the why you think it should be merged.


## Notes

* If you want to bump the gem version, please put that in a separate commit.
  This way, the maintainers can control when the gem gets released.
* Try to keep your patch(es) based from the latest commit on jekyll/jekyll.
  The easier it is to apply your work, the less work the maintainers have to do,
  which is always a good thing.
* Please follow the [GitHub Ruby Styleguide](https://github.com/styleguide/ruby)
  when modifying Ruby code.

## Thanks!