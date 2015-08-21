Bootstrapped
=================

A theme implementing as many Bootstrap features as possible while leaving OJS's core intact.

### Overview

This plugin draws from both [https://github.com/cu-library/OJS-Modern-Theme][c67d9dac] and [https://github.com/cul/cdrs-bootstrappish][63bac875].

The difference being that Bootstrapped mainly overrides OJS's styles with a Bootstrap counterpart. By doing this, very little template modification is necessary. However, some templates were modified--mainly the header and navbar in order to provide as close to a responsive layout as possible without overriding all of the templates.

Additionally, some of the forms which were created as tables were edited.

### Style

Bootstrapped uses Sass and follows, as closely as possible, the ITCSS architecture and BEM naming conventions. This approach gives the appearance of many files, however, each file is small in size and scope. Each file only deals with the scope for which it is named.

You'll find you can make most of your customizations through changing the variables found in the \_settings.vars.scss file.

### Responsive Design

As the theme doesn't fully incorporate Bootstrap and doesn't override every template, it isn't a completely responsive design. It stops at around 560px. This is due to the tables used in most of the forms in OJS.

### Using Grunt and Compass

There is the capability to use Grunt to clean and minify the Sass and CSS. If you make changes to the SCSS files, make sure you have `compass` installed so you can compile the changes. Once you've done that,  you can run the default Grunt task via the command line:  `grunt` from the root directory of the plugin. It uses purifycss to purge unused CSS and cssmin to minify it.

Get Compass: [http://compass-style.org/install/][compass]  
Get Grunt: [http://gruntjs.com/getting-started][grunt]

### Custom Metadata

There is a section in the templates/article/dublincore.tpl that has metadata specific to Virginia Tech journals. Feel free to remove this section for your own purposes.

### License

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

See the `LICENSE.MD` for more information.

  [c67d9dac]: https://github.com/cu-library/OJS-Modern-Theme "OJS Modern Theme"
  [63bac875]: https://github.com/cul/cdrs-bootstrappish "CDRS Bootstrappish"
  [compass]: http://compass-style.org/install/ "Compass Installation"
  [grunt]: http://gruntjs.com/getting-started "Grunt Installation"
  
