sub RunScreenSaver()
    screen = createObject("roSGScreen")
    port = createObject("roMessagePort")
    ' port2 =  createObject("roMessagePort")
    screen.setMessagePort(port)

    m.global = screen.getGlobalNode() 'Creates (Global) variable MyField
    ' m.global.AddField("MyField", "int", true)
    ' m.global.MyField = 0
    m.global.AddField("PicSwap", "int", true) 'Creates (Global) variable PicSwap
    m.global.PicSwap = 0

    scene = screen.createScene("ScreensaverFade") 'Creates scene ScreensaverFade
    screen.show()

    while(true) 'Message Port that fires every 7 seconds to change value of MyField if the screen isn't closed
        msg = wait(0060, port)
        if (msg <> invalid)
            msgType = type(msg)
            if msgType = "roSGScreenEvent"
                if msg.isScreenClosed() then return
            end if
        else
            ' msg = wait(2000, port2) 'Message port that fires 4 seconds after MyField is changed.
            m.global.PicSwap += 10
        end if
    end while
end sub
