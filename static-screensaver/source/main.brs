sub RunScreenSaver()
    screen = CreateObject("roSGScreen")
    port = CreateObject("roMessagePort")
    screen.setMessagePort(port)

    scene = screen.createScene("ScreensaverSet")
    scene.backgroundColor = "&h00000000"
    screen.show()

    while(true)
        msg = wait(0, port)
        if type(msg) = "roUniversalControlEvent"
            exit while
        end if
    end while

end sub