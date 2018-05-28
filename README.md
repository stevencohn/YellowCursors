# YellowCursors
Yellow mouse cursor theme for Windows

![alt text](Yellow.png "Yellow Cursors")

## Installation

Installation is simple. Just copy the cursors from this repo into C:\Windows\Cursors
and then use the control panel to change the pointers.

But if you'd like to automate the process, here's a script:

```powershell
$src='https://github.com/stevencohn/YellowCursors/archive/master.zip'
$zip="${env:TEMP}\YellowCursors.zip"
$exp="${env:TEMP}\YellowCursors-master"
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri $src -OutFile $zip
Expand-Archive -Path $zip -DestinationPath "${env:TEMP}\" -Force
Copy-Item "$exp\*.ani" C:\Windows\Cursors\ -Force
Copy-Item "$exp\*.cur" C:\Windows\Cursors\ -Force
Remove-Item $zip -Confirm:$False
Remove-Item $exp -Recurse -Force -Confirm:$False
```

Then run the install.ps1 script

```powershell
.\install.ps1
```

Of course, run both of these as administrator.

Notice that install.ps1 forces a dynamic reload of cursors.
This should work without requiring a logout/login or reboot.

Enjoy!

P.S. A very nice ico, cur, ani editor: [Greenfish Icon Editor Pro](http://greenfishsoftware.org/gfie.php)
