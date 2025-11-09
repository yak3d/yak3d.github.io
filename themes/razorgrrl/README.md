# 𝖌𝖆𝖈𝖐
This is the repository for my custom Hugo theme that I use on my blog. 

# Configuration
Swapping out color schemes and fonts can easily be done by changing the
variables in `static/css/style.scss` and compiling to `style.min.css`.

The `config.template.toml` file can be used as a guide for all the required
variables that the theme needs, just make sure to move it into the root of your
Hugo repository and rename it to `config.toml`. 

A few notes about configuration:
- The `description` variable is markdownified
- The `docsrepo` variable is where you link the git repo with all the markdown source of your posts, if you wish to do this. If not, you can remove Repo link section at the bottom of `layouts/_default/baseof.html`
- The `siterepo` variable is for linking to the subdirectory of your writings repo if you have the markdown source in a subdirectory where the `docsrepo` variable links to (for instance, in my case I have multiple sites and multiple subdirectories in my writings repo). If `docsrepo` isn't filled out, you'll want to also remove the Download link section from `layouts/_default/single.html`
- The `license` variable is for linking to whatever license you have licensed your writings under if you use a Creative Commons license, and the `licenseimg` variable is for linking to one of the images they provide to let your readers know that your writings are licensed under Creative Commons. If you don't want to have a license, you can remove the License section in `layouts/_default/single.html`
- The `[params.navigation]` section is for navigation links for your site (such as home, archives, about page); you can add as many additional `[[params.navigation.list]]` params as you like as long as they have the same structure
- The `[params.contact]` section is for links to ways to contact you, donation links, etc. You can add as many `[[params.contact.list]]` params as you like as long as they have the same structure. The theme uses [Font Awesome](https://fontawesome.com/), and the `icon` variable takes the class tag for any icon that you'd like to use in for an item in the contact links list (I left twitter filled in as an example).

