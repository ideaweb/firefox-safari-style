# Firefox userChrome.css Safari style (macOS only)

This theme will make Firefox more compliant with macOS.

<p align="center"><img alt="Firefox with NelliTab" src="https://raw.githubusercontent.com/ideaweb/firefox-safari-style/master/img/preview.png"/><br/><i>Firefox with macOS theme and <a href="https://nellitab.io">NelliTab</a> new tab extension</i></p>

## Requirements

*  Firefox 71 or higher for macOS

## Known issues

* Dark theme is supported but [Firefox not really have native dark mode](https://bugzilla.mozilla.org/buglist.cgi?quicksearch=dark%20mode%20macos) (e.g. context menus are still "light", white line on top of the window etc.)

## Installing

* [Clone](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository) (recommended) or just download this repository 
* Set ```toolkit.legacyUserProfileCustomizations.stylesheets``` to **true** in [about:config](https://support.mozilla.org/en-US/kb/about-config-editor-firefox)
* Open the [userChrome.css](http://kb.mozillazine.org/index.php?title=UserChrome.css&printable=yes) file located in your profile folder of Firefox with any text editor
* Add there the following line to import the userChrome.css of this theme but please do not forget to update the path and do not mix up the imported file with the none working scss/userChrome.scss of this repository

```css
@import '/path/to/firefox-safari-style/css/userChrome.css';
```

* Restart Firefox that changes can take effect

## Updating

A Firefox release may change its styles and break this theme. To update please just run `git pull` in the cloned repository to or just re-download it.

## Extras

Some code snippets to add extra functionallity. Just add any code below to the end of your userChrome.css.

### Hide solo tab

Hides tab bar if there is only one tab open. Unfortunately currently its not possible to move the new tab button up and that's why it should be hidden as well.

```css
#tabbrowser-tabs tab[first-visible-tab="true"][last-visible-tab="true"],
#tabbrowser-tabs tab[first-visible-tab="true"][last-visible-tab="true"] ~ toolbarbutton {
  visibility: collapse;
}
```

### Shows favicons in bookmarks bar

```css
#personal-bookmarks .bookmark-item .toolbarbutton-icon {
    display: inline !important;
}
```

## Troubleshooting

Make sure that your userChrome.css does not contain any lines beginning with [`@namespace`](https://github.com/ideaweb/firefox-safari-style/issues/3), just only a single line with the above `@import` statement. Remove any extra code snippets as well.

If still nothing changes in Firefox make sure that the userChrome.css in your profile directory is loaded. It can be tested easily by adding the following line at the end which changes the entire browser to _red_.

```css
* { background-color: red !important; }
```

Please add the same line to the imported userChrome.css of this theme but use another color like _blue_ instead of _red_.

Restart Firefox and check the color. If still nothing changes the userChrome.css in your profile is not loaded. Please verify the first boths steps of the install section above. If you see _red_ and not _blue_ the import of the theme failed e.g. by wrong path.

In case of _blue_, please check the list of [known issues](https://github.com/ideaweb/firefox-safari-style/issues) to see if it has been previously reported. Otherwise, please open a ticket [here](https://github.com/ideaweb/firefox-safari-style/issues). 

---

Mozilla and Firefox are trademarks of the Mozilla Foundation in the U.S. and other countries. 
Safari and macOS are trademarks of Apple Inc., registered in the U.S. and other countries.


