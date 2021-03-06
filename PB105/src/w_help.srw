$PBExportHeader$w_help.srw
forward
global type w_help from Window
end type
type mle_1 from multilineedit within w_help
end type
type cb_1 from commandbutton within w_help
end type
type st_5 from statictext within w_help
end type
type st_4 from statictext within w_help
end type
type st_3 from statictext within w_help
end type
type st_2 from statictext within w_help
end type
type st_1 from statictext within w_help
end type
end forward

global type w_help from Window
int X=1056
int Y=836
int Width=2569
int Height=1396
boolean TitleBar=true
string Title="HELP"
long BackColor=80269524
boolean ControlMenu=true
WindowType WindowType=response!
mle_1 mle_1
cb_1 cb_1
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
end type
global w_help w_help

on w_help.create
this.mle_1=create mle_1
this.cb_1=create cb_1
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.mle_1,&
this.cb_1,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1}
end on

on w_help.destroy
destroy(this.mle_1)
destroy(this.cb_1)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
end on

type mle_1 from multilineedit within w_help
int X=18
int Y=784
int Width=2368
int Height=280
boolean Border=false
string Text="The paddle is controlled when auto play is off by using the left arrow to move the paddle left and the right arrow to move the paddle right.   You may also use your mouse by holding down the left mouse button while moving the mouse."
long BackColor=80269524
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_1 from commandbutton within w_help
int X=1147
int Y=1144
int Width=247
int Height=108
int TabOrder=20
string Text="OK"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;close(parent)
end event

type st_5 from statictext within w_help
int X=27
int Y=488
int Width=2336
int Height=276
boolean Enabled=false
string Text="Difficulty controls the speed of play when auto play is off with 1 being the least difficult and 5 being the most difficult.  Points are higher with the higher difficulty setting.  During play you can increase the difficulty by pressing the up arrow and decrease the difficulty by pressing the down arrow."
boolean FocusRectangle=false
long BackColor=80269524
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_4 from statictext within w_help
int X=27
int Y=388
int Width=2139
int Height=84
boolean Enabled=false
string Text="Auto Play Off takes the game off auto play and the user must operate the paddle"
boolean FocusRectangle=false
long BackColor=80269524
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_help
int X=32
int Y=228
int Width=2126
int Height=144
boolean Enabled=false
string Text="Auto Play On makes the game go into auto play which will begin an endless loop where the game plays on its own and replays continuously."
boolean FocusRectangle=false
long BackColor=80269524
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_help
int X=32
int Y=144
int Width=768
int Height=76
boolean Enabled=false
string Text="Stop Button ends the game"
boolean FocusRectangle=false
long BackColor=80269524
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_help
int X=32
int Y=52
int Width=768
int Height=76
boolean Enabled=false
string Text="Start Button starts the game"
boolean FocusRectangle=false
long BackColor=80269524
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

