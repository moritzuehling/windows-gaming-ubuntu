var child_process = require('child_process');
var fs = require('fs');
var process = require('process');

const offFile = '/tmp/hotkeyMonitorOff';
const edgeGrab = '/home/moritz/git/windows-gaming-ubunti/windows-gaming/target/debug/windows-edge-grab';

if(fs.existsSync(offFile)) {
  child_process.spawn('xrandr', ['--output', 'HDMI1', '--auto', '--primary', '--output', 'HDMI2', '--left-of', 'HDMI1']);

  const pid = fs.readFileSync(offFile, { encoding: 'utf8' });
  fs.unlinkSync(offFile);
  process.kill(+pid);
} else {
  child_process.spawn('xrandr', ['--output', 'HDMI1', '--off']);
  var proc = child_process.spawn(edgeGrab);
  fs.writeFileSync(offFile, proc.pid.toString());
}
