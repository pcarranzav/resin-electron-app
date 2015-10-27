var app = require('app');
var BrowserWindow = require('browser-window');
require('crash-reporter').start();
var mainWindow = null;
app.on('window-all-closed', function() {
  app.quit();
});
app.on('ready', function() {
  var screen = require('screen');
  var size = screen.getPrimaryDisplay().workAreaSize;
  mainWindow = new BrowserWindow({
    show: false,
    resizable: false,
    width: size.width,
    height: size.height,
  });
  console.log('width: ' + size.width + ' height: ' + size.height);
  mainWindow.loadUrl('file://' + __dirname + '/index.html');
  mainWindow.on('closed', function() {
    mainWindow = null;
  });
});
