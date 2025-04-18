> **WARNING**: This repository is not maintained anymore.
> A much better adaptation is [Zen Browser](https://github.com/zen-browser).
 
# Firefox userChrome.css Safari style (macOS only)

This theme will make Firefox more compliant with macOS.

<p align="center"><img alt="Firefox with NelliTab" src="https://raw.githubusercontent.com/ideaweb/firefox-safari-style/master/img/preview.png"/><br/><i>Firefox with macOS theme and <a href="https://nellitab.io">NelliTab</a> new tab extension</i></p>

<p align="center"><img alt="Firefox with NelliTab" src="https://raw.githubusercontent.com/ideaweb/firefox-safari-style/master/img/preview-vertical.png"/><br/><i>Experimental support for <a href="https://blog.nightly.mozilla.org/2024/08/07/firefox-sidebar-and-vertical-tabs-try-them-out-in-nightly-firefox-labs-131/">vertical tabs</a></i></p>

## Requirements

*  Firefox for macOS

## Known issues

* "Tinting" is currently not supported. IF you want that Firefox and macOS have the same colors please disable the option "Allow wallpaper tinting windows" in system preferences.

## Installing

* [Clone](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository) (recommended) or just download this repository (for legacy theme please checkout branch 0.1)
* Set ```toolkit.legacyUserProfileCustomizations.stylesheets``` to **true** in [about:config](https://support.mozilla.org/en-US/kb/about-config-editor-firefox)
* Open the [userChrome.css](http://kb.mozillazine.org/index.php?title=UserChrome.css&printable=yes) file located in your profile folder of Firefox with any text editor
* Add there **one** of the following lines below to import your chosen userChrome.css of this theme but please do not forget to update the path and do not mix up the imported file with the none working scss/userChrome.scss of this repository

**Default for "System theme" and all other themes in Firefox settings**

Extra: Try [Adaptive Tab Bar Color](https://github.com/easonwong-de/Adaptive-Tab-Bar-Colour) or [colorf0x](https://addons.mozilla.org/en-US/firefox/addon/colorf0x/) for dynamic colors.

```css
@import '/path/to/firefox-safari-style/css/userChrome.css';
```

**or(!) for macOS colors with enabled transparency / blur effect in toolbar**

But no theme support and experimental, because vibrancy is mostly broken from update to update of Firefox...

```css
@import '/path/to/firefox-safari-style/css/userChrome-vibrancy.css';
```

* Restart Firefox that changes can take effect

## Updating

A Firefox release may change its styles and break this theme. To update please just run `git pull` in the cloned repository or just re-download it.

## Extras

Some code snippets to add extra functionality. Just add any code below to the end of your userChrome.css.

### Hide solo tab

Hides tab bar if there is only one tab open. Unfortunately currently its not possible to move the new tab button up and that's why it should be hidden as well.

```css
#alltabs-button,
#tabbrowser-tabs tab[first-visible-tab="true"][last-visible-tab="true"]:not([pinned]),
#tabbrowser-tabs tab[first-visible-tab="true"][last-visible-tab="true"]:not([pinned]) ~ toolbarbutton,
#tabbrowser-tabs tab[first-visible-tab="true"][last-visible-tab="true"]:not([pinned]) ~ #tabbrowser-arrowscrollbox-periphery {
  visibility: collapse;
}
```

### Shows favicons in bookmarks bar

```css
#personal-bookmarks .bookmark-item .toolbarbutton-icon {
    display: inline !important;
}
```

### Change the purple color in private windows

To change the purple color in private windows you need to add the following code to another file [userContent.css](http://kb.mozillazine.org/index.php?title=userContent.css&printable=yes). Please do not mix up with the file [userChrome.css](http://kb.mozillazine.org/index.php?title=UserChrome.css&printable=yes) above for this theme. 

```css
html.private {
    --in-content-page-background: #838383 !important;
}
```

## Troubleshooting

Make sure that your userChrome.css does not contain any lines beginning with [`@namespace`](https://github.com/ideaweb/firefox-safari-style/issues/3), just only a single line with the above `@import` statement. Remove any extra code snippets as well.

If still nothing changes in Firefox make sure that the userChrome.css in your profile directory is loaded. It can be tested easily by adding the following line at the end which changes the entire browser to _red_.

```css
* { background-color: red !important; }
```

Please add the same line to the imported userChrome.css of this theme but use another color like _blue_ instead of _red_.

Restart Firefox and check the color. If still nothing changes the userChrome.css in your profile is not loaded. Please verify the first both steps of the install section above. If you see _red_ and not _blue_ the import of the theme failed e.g. by wrong path.

In case of _blue_, please check the list of [known issues](https://github.com/ideaweb/firefox-safari-style/issues) to see if it has been previously reported. Otherwise, please open a ticket [here](https://github.com/ideaweb/firefox-safari-style/issues). 

## Development

If you want to contribute or to make your own changes please edit userChrome.scss file only. Then just run `make` in root folder of this repository to get more details how to create final CSS files.

##  License

MIT License.

---

Mozilla and Firefox are trademarks of the Mozilla Foundation in the U.S. and other countries. 
Safari and macOS are trademarks of Apple Inc., registered in the U.S. and other countries.


