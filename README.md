# LineJumper

Adds commands to move your cursor and select 10 lines at a time. This adds 4
commands available via keycommands.

```coffeescript
'.editor':
  'ctrl-up': 'line-jumper:move-up'
  'ctrl-down': 'line-jumper:move-down'

  'ctrl-shift-up': 'line-jumper:select-up'
  'ctrl-shift-down': 'line-jumper:select-down'
```

In action:

![omgwhoa][gif]

Your head just exploded didn't it? This is a clinically proven 1000%
productivity boost, I promise. No, really.

[gif]: https://f.cloud.github.com/assets/69169/1451208/13d67f38-4291-11e3-8ae3-badbb633593b.gif
