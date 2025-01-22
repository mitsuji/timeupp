Option Explicit

Const CONF_FILE_NAME = "timeupp.conf.xml"

Dim confXML
Set confXML = CreateObject("MSXML2.DOMDocument")
confXML.async = False
confXML.load(CONF_FILE_NAME)

Dim rootDOM
Set rootDOM = confXML.documentElement
Dim schedulesDOM
Set schedulesDOM = rootDOM.getElementsByTagName("schedule")

Dim nowDT
nowDT = Now

Dim hasChanged
hasChanged = False

Dim fso
Set fso = CreateObject("Scripting.FileSystemObject")

Dim scheduleDOM
For Each scheduleDOM In schedulesDOM
  If Not CBool(scheduleDOM.getAttribute("done")) Then
     Dim scheduleDT, scheduleDate, scheduleTime
     scheduleDate = scheduleDOM.getAttribute("date")
     scheduleTime = scheduleDOM.getAttribute("time")
     scheduleDT = CDate(scheduleDate & " " & scheduleTime)
     If True _
       And Year(scheduleDT)   = Year(nowDT) _
       And Month(scheduleDT)  = Month(nowDT) _
       And Day(scheduleDT)    = Day(nowDT) _
       And Hour(scheduleDT)   = Hour(nowDT) _
       And Minute(scheduleDT) = Minute(nowDT) _
     Then
       Dim fromPath, toPath
       fromPath = scheduleDOM.getElementsByTagName("from")(0).Text
       toPath   = scheduleDOM.getElementsByTagName("to")(0).Text
       fso.CopyFolder fromPath, toPath
       WScript.Echo NOW & " " & "CopyFolder" & " " & fromPath & " " & toPath
       scheduleDOM.setAttribute "done","True"
       hasChanged = True
    End If
  End If
Next

If hasChanged Then
  confXML.save CONF_FILE_NAME
End If
