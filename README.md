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

#### Options

| Name       | Description                    | Default    |
| ---------- | ------------------------------ | ---------- |
| badge_name | Badge Title                    | 'coverage' |
| style      | Badge Style ['normal', 'flat'] | 'normal'   |
| precision  | Coverage Percent Precision     | 0          |

#### Configure

````
SimpleCov::Formatter::ShieldFormatter.config[:badge_name] = 'cov'
SimpleCov::Formatter::ShieldFormatter.config[:style]      = 'flat'
SimpleCov::Formatter::ShieldFormatter.config[:precision]  = 2

````

## Contributing

see [CONTRIBUTING.md](CONTRIBUTING.md)

## License

see [LICENSE](LICENSE)

## Copyright

Copyright (c) 2014 Andrew Terris, Lesley Dennison. See LICENSE for details.