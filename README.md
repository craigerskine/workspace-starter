# Symphony CMS - Workspace Starter
This is a baseline starterkit that I use for most of my site builds. This may not be appropriate for everyone, but if you know of a better way to do things, I'm all ears.

Installation
------------
* Install [node.js](https://nodejs.org).
* Download this repo.
* Open the containing `_dev` folder in a command prompt.
* `npm install`

Usage
-----
* Open the `_dev` folder in a command prompt.
* `./node_modules/.bin/gulp`
* Edit the `master.xsl`, `*.css`, `*.js` files in the `app` folder as well as any `*.xsl` in the `/live/workspace/theme/[pages | partials | utilities]/` and save your changes to see the magic happen. Any changes you make will auto compile the .xsl, .css, .js files and maintain a hashed version of the assets while also automatically keeping the hashed file name references updated in your `/live/workspace/theme/templates/master.xsl`. Then just sync your changes up to your server using your favorite method and you are all set.
* **NOTE**: DO NOT edit the main master.xsl file in `/live/workspace/theme/templates/` as it will cause you to loose potential changes later down the road.

Features
--------
* Automated build system using Gulp and a bunch helper packages.
* Concatinated and compressed single `main-[hash].css` file that is auto prefixed and purged of all unused rules and classes.
* Concatinated and compressed single `main-[hash].js` file.
* [Tailwind CSS](https://tailwindcss.com/) utility first CSS framework for rapidly building custom designs.
* [Turbolinks](https://github.com/turbolinks/turbolinks) feature for faster page loads and a progress bar for slower database driven pages.
* Master .xsl example.
* Portable page .xsl example.
* Partial .xsl example.
* Option for per-page inline or referenced CSS and JS.
* Other stuff I probably forgot to mention.