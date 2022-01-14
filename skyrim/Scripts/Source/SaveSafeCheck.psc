Scriptname SaveSafeCheck extends Quest  

float Property modlistVersion  auto
bool messageboxSkip = false

event onInit()
    int x = jvalue.readFromFile("data/ml.json")
    modlistVersion = JMap.getFlt(x, "modlistVersion")
    jvalue.release(x)
endEvent

function saveCheck(float version, string modlistName)
    debug.trace("Error: Modlist save version incompatibility: "+modlistVersion+" -_- " + version)  
endFunction
