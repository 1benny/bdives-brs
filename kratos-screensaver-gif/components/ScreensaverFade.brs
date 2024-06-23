Function changeBackground() as Void 'Function that changes the background image to the next image in the m.pictures array
    if (m.count=68)    ' When the iter reaches the second last img, return to the 1.jpg
        m.count = -1
    end if
    m.count += 1
    m.top.backgroundURI = m.pictures[m.count]
End Function

Function init()
    m.pictures = [] ' For loop to load images into m.pictures array
    for i = 1 to 69
        m.pictures.push("pkg:/images/" + i.toStr() +".jpg") 'Loads images 1-5 in image folder into m.pictures array
    end for 
    m.count = 0

    ' m.BackgroundArt = m.top.findNode("BackgroundArt") 'Sets pointer to BackgroundArt node
    m.top.backgroundURI = m.pictures[0] 'Sets Background art to first picture
   
    m.global.observeField("PicSwap", "changeBackground") 'field Observer that calls changeBackground() function everytime the value of PicSwap is changed
End Function