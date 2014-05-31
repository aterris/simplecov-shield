# simplecov-shield

[SimpleCov](https://github.com/colszowka/simplecov) Formatter to generate coverage badge via [Shields.io](http://shields.io/)

## Install

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

## License

see [LICENSE](LICENSE)

## Copyright

Copyright (c) 2014 Andrew Terris, Lesley Dennison