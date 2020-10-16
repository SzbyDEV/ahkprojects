#SingleInstance Force
#NoEnv
#Warn, LocalSameAsGlobal, Off
SetWorkingDir %A_ScriptDir% 
#Include <DBA>
global currentDB := null ; current db connection
connectionStrings := "Server=localhost;Port=3306;Database=root;Uid=root;Pwd=root;"
databaseType := "mySQL"
connectionString := connectionStrings
currentDB := DBA.DataBaseFactory.OpenDataBase(databaseType, connectionString)

Gui, Add, Text, x155 y4, Ahk sql executor
Gui, Add, Text, x10 y20, Description
Gui, Add, Edit, x10 y40 w250 vdescription,
Gui, Add, Text, x270 y20, User
Gui, Add, Edit, x270 y40 w70 vusername,
Gui, Add, Button, x350 y39 gexecute, .run
Gui, Show, w400 h100, Executor
return

execute:
    
    GuiControlGet, username
    GuiControlGet, description
    record := {}
    record.description := description
    record.user := username
    currentDB.Insert(record, "root")
return
