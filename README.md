# Firefox userChrome.css Safari style (macOS only)

This theme will make Firefox more compliant with macOS.

## Requirements

*  Firefox 71 or higher for macOS

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


