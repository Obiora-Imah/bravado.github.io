# bravado.github.io

_Setup Instruction_
-- Run the following command starting from the first

```
  git clone git@github.com:Obiora-Imah/bravado.github.io.git
  git fetch origin working
  git checkout working
  cd bavado_test
  rake db:migrate
  rake db:seed
  rails server
```

Offer url: http://localhost:7000/offers?[parameters]

** Test **

```
  bundle exec rspec spec/models/offer_spec.rb

```
