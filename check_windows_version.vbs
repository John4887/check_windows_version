'==============================================================================
' Auteur      : John Gonzalez
'==============================================================================

'==============================================================================
' Version     : 1.0.0.0
'==============================================================================

Set arguments = WScript.Arguments
script = "check_windows_version"
version = "1.0.0"
author = "John Gonzalez"
verbose = False

For i = 0 To arguments.Count - 1
    If arguments.Item(i) = "-v" Then
        verbose = True
        Exit For
    ElseIf Left(arguments.Item(i), 1) = "-" Then
        WScript.Echo "Invalid option: " & arguments.Item(i)
        WScript.Quit 1
    End If
Next

If verbose Then
    WScript.Echo script & " - " & author & " - " & version
    WScript.Quit 0
End If

On Error Resume Next

Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
Set colOperatingSystems = objWMIService.ExecQuery("Select * from Win32_OperatingSystem")

For Each objOperatingSystem in colOperatingSystems
    WScript.StdOut.Write objOperatingSystem.Caption & " " & objOperatingSystem.Version
Next

WScript.Quit(0)