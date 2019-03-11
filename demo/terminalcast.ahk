; --------------------------------------------------
; This script generates the demo gif
; --------------------------------------------------
#SingleInstance Force
SetkeyDelay 0, 50

Commands := []
Index := 1

Commands.Push("ttystudio terminal.gif")
Commands.Push("cd /vagrant/gems/jobly/demo")
Commands.Push("jobly send Deploy")
Commands.Push("jobly send Deploy version:1.0")
Commands.Push("curl http://localhost:3000/do/Greet?name=Jimmy")
Commands.Push("exit")

F12::
  Send % Commands[Index]
  Index := Index + 1
return

^F12::
  Reload
return

^x::
  ExitApp
return
