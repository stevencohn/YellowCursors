<#
.SYNOPSIS
Install the yellow mouse cursor theme.
#>

# create Yellow scheme
$0 = 'HKCU:\ControlPanel\Cursors'
$p = '%SYSTEMROOT%\Cursors'

New-ItemProperty -Path "$0\Schemes" -Force -Name 'Yellow' -Value "$p\yellow_arrow.cur,$p\yellow_helpsel.cur,$p\yellow_working.ani,$p\aero_busy.ani,,,$p\aero_pen.cur,$p\aero_unavail.cur,$p\yellow_ns.cur,$p\yellow_ew.cur,$p\yellow_nwse.cur,$p\yellow_nesw.cur,$p\yellow_move.cur,$p\yellow_up.cur,$p\yellow_link.cur"

# apply Yellow scheme
New-ItemProperty $0 -Value 'Yellow' -Force
New-ItemProperty $0 -Name 'AppStarting' -Value "$0\yellow_working.ani" -Force
New-ItemProperty $0 -Name 'Arrow' -Value "$0\yellow_arrow.cur" -Force
New-ItemProperty $0 -Name 'Crosshair' -Value '' -Force
New-ItemProperty $0 -Name 'Hand' -Value "$0\yellow_link.cur" -Force
New-ItemProperty $0 -Name 'Help' -Value "$0\yellow_helpsel.cur" -Force
New-ItemProperty $0 -Name 'IBeam' -Value '' -Force
New-ItemProperty $0 -Name 'No' -Value "$0\yellow_aero_unavail.cur" -Force
New-ItemProperty $0 -Name 'NWPen' -Value "$0\yellow_pen.cur" -Force
New-ItemProperty $0 -Name 'SchemeSource' -Value 2 -Type dword -Force
New-ItemProperty $0 -Name 'SizeAll' -Value "$0\yellow_move.cur" -Force
New-ItemProperty $0 -Name 'SizeNESW' -Value "$0\yellow_nesw.cur" -Force
New-ItemProperty $0 -Name 'SizeNS' -Value "$0\yellow_ns.cur" -Force
New-ItemProperty $0 -Name 'SizeNWSE' -Value "$0\yellow_nwse.cur" -Force
New-ItemProperty $0 -Name 'SizeWE' -Value "$0\yellow_ew.cur" -Force
New-ItemProperty $0 -Name 'UpArrow' -Value "$0\yellow_up.cur" -Force
New-ItemProperty $0 -Name 'Wait' -Value "$0\aero_busy.ani" -Force

# reload system cursors
$cs = @'
[DllImport("user32.dll", SetLastError = true, EntryPoint = "SystemParametersInfo")]
[return: MarshalAs(UnmanagedType.Bool)]
public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, bool pvParam, uint fWinIni);
'@
 
$SPI_SETCURSORS = 0x0057
$CursorRefresh = Add-Type -MemberDefinition $cs -Name WinAPICall -Namespace SystemParamInfo –PassThru
$CursorRefresh::SystemParametersInfo($SPI_SETCURSORS, 0, $null, 0)
