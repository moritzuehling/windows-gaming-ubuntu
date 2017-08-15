var child_process = require('child_process');
var fs = require('fs');

const offFile = '/tmp/hotkeyMonitorOff';

if(fs.existsSync(offFile)) {
  child_process.spawn('xrandr', ['--output', 'HDMI1', '--auto', '--primary', '--output', 'HDMI2', '--left-of', 'HDMI1']);
  fs.unlinkSync(offFile);
} else {
  child_process.spawn('xrandr', ['--output', 'HDMI1', '--off']);
  fs.closeSync(fs.openSync(offFile, 'w+'));
}
