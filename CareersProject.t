import GUI
View.Set("graphics:800;600, nobuttonbar")
setscreen("title: My Career as a Game Programmer")
GUI.SetBackgroundColour(3)
%Variables
colorback(255)
Text.Color(0)
const bgColor := 255

const SCREEN_WIDTH := 800
const SCREEN_HEIGHT := 600
const BUTTON_WIDTH := 80
const BUTTON_HEIGHT := 30
var Quit, Home, Career, Schools, Sources, Back: int
var Waterloo, Toronto, Seneca : int
var next1, next2: int
var HomePic, WaterlooPic, TorontoPic, SenecaPic: int %Detlaff : int
HomePic := Pic.FileNew("HomeBG.jpg")
WaterlooPic := Pic.FileNew("Detlaff.jpg")
TorontoPic := Pic.FileNew("Revenant.jpg")
SenecaPic := Pic.FileNew("Seneca.jpg")
%Procedures
procedure printPage(n : int)
var stream: int
put ""
put "" 
put ""
    case n of
	label 1: open: stream, "CareerInfo1.txt", get
	label 2: open: stream, "CareerInfo2.txt", get
	label 3: open: stream, "CareerInfo3.txt", get
	label 4: open: stream, "SchoolsInfo.txt", get
	label 5: open: stream, "SourcesInfo.txt", get
	label 6: open: stream, "WInfo.txt", get
	label 7: open: stream, "TInfo.txt", get
	label 8: open: stream, "SInfo.txt", get
    end case
    var fileContents: string
    loop
	exit when eof(stream)
	get: stream, fileContents :*
	put fileContents
    end loop
end printPage
procedure ShowHideAll(isHide: boolean)%except for universal buttons Home and Quit
    if isHide then
	GUI.Hide(Career)
	GUI.Hide(Schools)
	GUI.Hide(Career)
	GUI.Hide(Sources)
	GUI.Hide(Waterloo)
	GUI.Hide(Toronto)
	GUI.Hide(Seneca)
	GUI.Hide(Back)
	GUI.Hide(next1)
	GUI.Hide(next2)
    else
	GUI.Show(Career)
	GUI.Show(Schools)
	GUI.Show(Career)
	GUI.Show(Sources)
	GUI.Show(Waterloo)
	GUI.Show(Toronto)
	GUI.Show(Seneca)  
	GUI.Show(Back)  
	GUI.Show(next1)
	GUI.Show(next2)
    end if
end ShowHideAll
procedure ShowHome
    cls
    ShowHideAll(true)
    GUI.SetBackgroundColour(bgColor)
    Pic.Draw(HomePic, -75, 0, 0)
    setscreen("title: My Career as a Game Programmer")
    GUI.Show(Career)
    GUI.Show(Schools)
    GUI.Show(Sources)
    GUI.Show(Home)
    GUI.Show(Quit)
end ShowHome
procedure ShowCareer
    cls
    GUI.SetBackgroundColour(bgColor)
    setscreen("title: Career Information Pt.1")
    ShowHideAll(true)
    printPage(1)
    GUI.Show(Home)
    GUI.Show(Quit)
    GUI.Show(next1)
end ShowCareer
procedure Next1
    cls
    GUI.SetBackgroundColour(bgColor)
    setscreen("title: Career Information Pt.2")
    ShowHideAll(true)
    printPage(2)
    GUI.Show(Home)
    GUI.Show(Quit)
    GUI.Show(next2)
end Next1
procedure Next2
    cls
    GUI.SetBackgroundColour(bgColor)
    setscreen("title: Career Information Pt.3")
    ShowHideAll(true)
    printPage(3)
    GUI.Show(Home)
    GUI.Show(Quit)
end Next2
procedure ShowSchools
    cls
    GUI.SetBackgroundColour(bgColor)
    setscreen("title: Schools")
    ShowHideAll(true)
    %images
    Pic.Draw(WaterlooPic, 75, 100, 0)
    Pic.Draw(TorontoPic, 300, 100, 0)
    Pic.Draw(SenecaPic, 530, 100, 0)
    printPage(4)
	GUI.Show(Waterloo)
    GUI.Show(Toronto)
    GUI.Show(Seneca)
    GUI.Show(Home)
    GUI.Show(Quit)
end ShowSchools
procedure ShowSources
    cls
    GUI.SetBackgroundColour(bgColor)
    setscreen("title: Sources")
    ShowHideAll(true)
    printPage(5)
    GUI.Show(Home)
    GUI.Show(Quit)
end ShowSources
procedure ShowWaterloo
    cls
    GUI.SetBackgroundColour(bgColor)
    setscreen("title: Waterloo")
    ShowHideAll(true)
    Pic.Draw(WaterlooPic, 75, 100, 0)
    printPage(6)
     GUI.Show(Home)
    GUI.Show(Quit)
    GUI.Show(Back)
end ShowWaterloo
procedure ShowToronto
    cls
    GUI.SetBackgroundColour(bgColor)
    setscreen("title: Toronto")
    ShowHideAll(true)
    Pic.Draw(TorontoPic, 300, 100, 0)
    printPage(7)
    GUI.Show(Back)
     GUI.Show(Home)
    GUI.Show(Quit)
end ShowToronto
procedure ShowSeneca
    cls
    GUI.SetBackgroundColour(bgColor)
    setscreen("title: Seneca")
    ShowHideAll(true)
    Pic.Draw(SenecaPic, 530, 100, 0)
    printPage(8)
     GUI.Show(Home)
    GUI.Show(Quit)
    GUI.Show(Back)
end ShowSeneca
%Widget declarations
Quit := GUI.CreateButtonFull(0, 600 - BUTTON_HEIGHT, BUTTON_WIDTH, "Quit", GUI.Quit, BUTTON_HEIGHT, "q", false)
Home := GUI.CreateButtonFull(BUTTON_WIDTH, 600 - BUTTON_HEIGHT, BUTTON_WIDTH, "Home", ShowHome, BUTTON_HEIGHT, "h", false)
Career := GUI.CreateButtonFull(60, 50, BUTTON_WIDTH, "Career", ShowCareer, BUTTON_HEIGHT,  "c", false)
Schools := GUI.CreateButtonFull(260, 50, BUTTON_WIDTH, "Schools", ShowSchools, BUTTON_HEIGHT,  "s", false)
Sources := GUI.CreateButtonFull(460, 50, BUTTON_WIDTH, "Sources", ShowSources, BUTTON_HEIGHT,  "d", false)
Waterloo := GUI.CreateButtonFull(140, 50, BUTTON_WIDTH, "Waterloo", ShowWaterloo, BUTTON_HEIGHT, "w", false)
Toronto := GUI.CreateButtonFull(360, 50, BUTTON_WIDTH, "Toronto", ShowToronto, BUTTON_HEIGHT, "t", false)
Seneca := GUI.CreateButtonFull(580, 50, BUTTON_WIDTH, "Seneca", ShowSeneca, BUTTON_HEIGHT, "l", false)
Back := GUI.CreateButtonFull(2 * BUTTON_WIDTH, 600 - BUTTON_HEIGHT, BUTTON_WIDTH, "Back", ShowSchools, BUTTON_HEIGHT, "b", false)
next1 := GUI.CreateButtonFull(SCREEN_WIDTH - BUTTON_WIDTH, 0, BUTTON_WIDTH, "Next", Next1, BUTTON_HEIGHT, "n", false)
next2 := GUI.CreateButtonFull(SCREEN_WIDTH - BUTTON_WIDTH, 0, BUTTON_WIDTH, "Next", Next2, BUTTON_HEIGHT, "n", false)
ShowHome
loop
    exit when GUI.ProcessEvent
end loop
