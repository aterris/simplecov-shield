# simplecov-shield

[![Build Status](https://travis-ci.org/aterris/simplecov-shield.svg?branch=master)](https://travis-ci.org/aterris/simplecov-shield)
[![Code Climate](http://img.shields.io/codeclimate/github/aterris/simplecov-shield.svg)](https://codeclimate.com/github/aterris/simplecov-shield)
[![Code Climate](http://img.shields.io/codeclimate/coverage/github/aterris/simplecov-shield.svg)](https://codeclimate.com/github/aterris/simplecov-shield)
[![Dependency Status](https://gemnasium.com/aterris/simplecov-shield.svg)](https://gemnasium.com/aterris/simplecov-shield)
[![License](http://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

 
[SimpleCov](https://github.com/colszowka/simplecov) Formatter to generate coverage badge via [Shields.io](http://shields.io/)

## Install

Add this line to your application's Gemfile

```
gem 'simplecov-shield'
```

Or install it yourself

```
gem install simplecov-shield
```

## Usage

```
require 'simplecov-shield'
SimpleCov.formatter = SimpleCov::Formatter::ShieldFormatter
```

Shield will be generated and save at `coverage/coverage.svg`

## Configuration

````
SimpleCov::Formatter::ShieldFormatter.config[:option] = value
````

##### Options

| Name       | Description                 | Default    | Allowed          |
| ---------- | --------------------------- | ---------- | ---------------- |
| badge_name | badge title                 | 'coverage' | String           |
| style      | badge style                 | :normal    | :normal, :flat   |
| precision  | coverage percent precision  | 0          | Integer          |


## Contributing

see [CONTRIBUTING.md](CONTRIBUTING.md)

## Copyright

Copyright (c) 2014 Andrew Terris, Lesley Dennison