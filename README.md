# Нужно по адресу публичного репозитория на гитхабе найти трёх его самых активных контрибьюторов и сгенерировать для них простые pdf-дипломы и архив с ними.


# README

```
bundle install
bundle exec rails s
bundle exec sidekiq -L log/sidekiq.log -q gush
```
