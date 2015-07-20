Bootstrapped
=================

A theme implementing as many Bootstrap features as possible while leaving OJS's core intact.

### Overview

This plugin draws from both [https://github.com/cu-library/OJS-Modern-Theme][c67d9dac] and [https://github.com/cul/cdrs-bootstrappish][63bac875].

The difference being that Bootstrapped mainly overrides OJS's styles with a Bootstrap counterpart. By doing this, very little template modifcation is necessary. However, some templates were modified--mainly the header and navbar in order to provide as close to a responsive layout as possible without overriding all of the templates.

### Style

Bootstrapped uses Sass and follows, as closely as possible, the ITCSS architecture and BEM naming conventions. This approach gives the appearance of many files, however, each file is small in size and scope. Each file only deals with the scope for which it is named.

You'll find you can make most of your customizations through changing the variables found in the \_settings.vars.scss file.

### IMPORTANT

**In order for the plugin to work properly, you must have the User Login block enabled and located on one of the sidebars.**

  [c67d9dac]: https://github.com/cu-library/OJS-Modern-Theme "OJS Modern Theme"
  [63bac875]: https://github.com/cul/cdrs-bootstrappish "CDRS Bootstrappish"
