Description
===========

Installs and configures Rubymine

Requirements
============

user and java cookbooks

Attributes
==========

Source - URL from where the rubymine is being downloaded, by default https://download.jetbrains.com/ruby/
Version - what version of rubymine to install

Usage
=====

Just include `rubymine` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[rubymine]"
  ]
}
```


