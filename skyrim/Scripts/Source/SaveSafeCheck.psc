Scriptname SaveSafeCheck extends Quest  

float Property modlistVersion  auto
bool messageboxSkip = false

event onInit()
    int x = jvalue.readFromFile("data/ml.json")
    modlistVersion = JMap.getFlt(x, "modlistVersion")
    jvalue.release(x)
endEvent

function saveCheck(float version, string modlistName)
    Utility.wait(1)
    debug.trace("Error: file failed to fail with error code: "+modlistVersion+" -_- " + version)  
    if messageboxSkip == false
        registerForModEvent("wabbaMenu_Accept", "doAccept")
        registerForModEvent("wabbaMenu_Ignore", "doIgnore")

        string wabbamessage = "You have attempted to load a save made for an older or incompatible version of this modlist.\nSave version: "+get3dp(modlistVersion)+" - Modlist version: "+get3dp(version)+"\nIf you continue playing with this save, you understand this voids you of any support queries.\nDo you wish to continue?"

        ui.openCustomMenu("wabbawidget/wabbaMessage")
        utility.waitmenumode(0.1)
        int x = uicallback.create("CustomMenu", "main.setText")
            UICallback.PushString(x, modlistName)
            UICallback.PushString(x, wabbamessage)
        UICallback.Send(x)
    endif
endFunction

string function get3dp(float f)
    string[] p = StringUtil.Split(f as string, ".")
    string ret = p[0] + "."+ StringUtil.SubString(p[1], 0, 3)
    return ret
endFunction

Event doAccept(string eventName, string strArg, float numArg, Form sender)
    Game.QuitToMainMenu()
endEvent

event doIgnore(string eventName, string strArg, float numArg, Form sender)
    messageboxSkip = true
endEvent

