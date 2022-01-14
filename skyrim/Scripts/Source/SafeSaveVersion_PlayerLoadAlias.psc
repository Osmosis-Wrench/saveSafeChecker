Scriptname SafeSaveVersion_PlayerLoadAlias extends ReferenceAlias  

Quest Property SaveCheckQuest Auto

event onPlayerLoadGame()
    onLoad()
endEvent

function onLoad()
    int x = jvalue.readFromFile("data/ml.json")
    if (SaveCheckQuest as SaveSafeCheck).modlistVersion != JMap.getFlt(x, "modlistVersion")
        (SaveCheckQuest as SaveSafeCheck).saveCheck(JMap.getFlt(x, "modlistVersion"), JMap.getStr(x, "modlistName"))
    endif
    jvalue.release(x)
endFunction