<# 
.SYNOPSIS
Install the yellow mouse cursor theme.
#>

<#
Article https://blogs.technet.microsoft.com/heyscriptingguy/2013/01/17/use-powershell-to-change-the-mouse-pointer-scheme/
Article http://thecomputermanagersden.blogspot.com/2014/05/powershell-script-to-customize-windows.html
SystmParametersInfo https://msdn.microsoft.com/en-us/library/windows/desktop/ms724947(v=vs.85).aspx
#>

# create Yellow scheme
$0 = 'HKCU:\Control Panel\Cursors'
$p = '%SystemRoot%\cursors'

if (!(Test-Path "$0\Schemes")) { $null = New-Item -Path $0 -Name 'Schemes' -Force }
$null = New-ItemProperty -Path "$0\Schemes" -Force -Name 'Yellow' -Value "$p\yellow_arrow.cur,$p\yellow_helpsel.cur,$p\yellow_working.ani,$p\aero_busy.ani,,,$p\yellow_pen.cur,$p\aero_unavail.cur,$p\yellow_ns.cur,$p\yellow_ew.cur,$p\yellow_nwse.cur,$p\yellow_nesw.cur,$p\yellow_move.cur,$p\yellow_up.cur,$p\yellow_link.cur,$p\yellow_pin.cur,$p\yellow_person.cur"

# apply Yellow scheme
Set-Item $0 -Value 'Yellow' -Force
$null = New-ItemProperty $0 -Name 'AppStarting' -Value "$p\yellow_working.ani" -Force
$null = New-ItemProperty $0 -Name 'Arrow' -Value "$p\yellow_arrow.cur" -Force
$null = New-ItemProperty $0 -Name 'Crosshair' -Value '' -Force
$null = New-ItemProperty $0 -Name 'Hand' -Value "$p\yellow_link.cur" -Force
$null = New-ItemProperty $0 -Name 'Help' -Value "$p\yellow_helpsel.cur" -Force
$null = New-ItemProperty $0 -Name 'IBeam' -Value '' -Force
$null = New-ItemProperty $0 -Name 'No' -Value "$p\yellow_aero_unavail.cur" -Force
$null = New-ItemProperty $0 -Name 'NWPen' -Value "$p\yellow_pen.cur" -Force
$null = New-ItemProperty $0 -Name 'Person' -Value "$p\yellow_person.cur" -Force
$null = New-ItemProperty $0 -Name 'Pin' -Value "$p\yellow_pin.cur" -Force
$null = New-ItemProperty $0 -Name 'Scheme Source' -Value 2 -Type dword -Force
$null = New-ItemProperty $0 -Name 'SizeAll' -Value "$p\yellow_move.cur" -Force
$null = New-ItemProperty $0 -Name 'SizeNESW' -Value "$p\yellow_nesw.cur" -Force
$null = New-ItemProperty $0 -Name 'SizeNS' -Value "$p\yellow_ns.cur" -Force
$null = New-ItemProperty $0 -Name 'SizeNWSE' -Value "$p\yellow_nwse.cur" -Force
$null = New-ItemProperty $0 -Name 'SizeWE' -Value "$p\yellow_ew.cur" -Force
$null = New-ItemProperty $0 -Name 'UpArrow' -Value "$p\yellow_up.cur" -Force
$null = New-ItemProperty $0 -Name 'Wait' -Value "$p\aero_busy.ani" -Force

# reload system cursors
$cs = @'
[DllImport("user32.dll", SetLastError = true, EntryPoint = "SystemParametersInfo")]
[return: MarshalAs(UnmanagedType.Bool)]
public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, bool pvParam, uint fWinIni);
'@
 
$SPI_SETCURSORS = 0x0057
$CursorRefresh = Add-Type -MemberDefinition $cs -Name WinAPICall -Namespace SystemParamInfo –PassThru
$CursorRefresh::SystemParametersInfo($SPI_SETCURSORS, 0, $null, 0)
