# Machine Learning on Raspberry Pi

## Issues
`npm ERR! at /usr/local/lib/node_modules/npm/node_modules/uid-number/uid-number.js:43`

Work around for this issue:

Open the file below in your editor:
/usr/local/lib/node_modules/npm/node_modules/uid-number/uid-number.js
Goto line 11, then replace uidSupport = process.getuid && process.setuid with uidSupport = false
