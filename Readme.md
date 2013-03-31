Simple ruby stubbing
==========

Opens up `Object` to add instance and class methods called
`instance_stub`.

## Stubbing all instances of a class

To stub a method universally (probably a bad idea to actually use):

    String.instance_stub :to_s, "Bananas"
    "Apples".to_s # "Bananas"

You can also stub a method locally to a block:

    String.instance_stub :to_s, "Bananas" do
      "Apples".to_s # Bananas
    end
    "Apples".to_s # "Apples"

## Stubbing a method for just one instance of an object

    x = "Apples"
    y = "Pears"

    x.instance_stub :to_s, "Bananas"

    x.to_s # Bananas
    y.to_s # Pears

## Development

Tests are done via minitest. Should be this simple:

    bundle install
    bundle exec rake test
