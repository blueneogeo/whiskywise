# README

For whiskey lovers only

## Getting started

- Install overmind: `gem install overmind`
- Install the project gems: `bundle install`
- Check the types: `srb tc`
- Configure your database in `config/database.yml`
- Create the local databases: `rake db:create`
- Migrate the databases: `rake db:migrate`
- Run the project: `overmind s`
- Open in the browser: http://localhost:5000/

## Sorbet type checking

To type check your code you can do two things:

### Command line

Run `srb tc` to type check your code from the terminal.

If you have updated your Rails model, you can have the Rails-Sorbet gem
regenerate your type signatures:

`bundle exec rake rails_rbi:all`

This is not perfect and exhaustive but it will pick up most things. Ruby and
Rails are very dynamic and not everything can be picked up yet.

### Visual Studio Code

Use the `sorbet-lsp` extension to have checks and code completion.

https://marketplace.visualstudio.com/items?itemName=danhuynhdev.sorbet-lsp

To use this, disable the SolarGraph extension if you have it running, since this
extension has its own language server.

I noticed that this server has its niggles. For example, the robocop extension
interferes with it sometimes and makes it crash, so disable that extension.
Also sometimes to have it pick up new types you have to reload the window.
Always reload the window after generating new rails types:

`Cmd+Shift+P -> Developer: Reload Window`
