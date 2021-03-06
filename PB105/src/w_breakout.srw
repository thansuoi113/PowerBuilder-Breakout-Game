$PBExportHeader$w_breakout.srw
forward
global type w_breakout from window
end type
type cb_2 from commandbutton within w_breakout
end type
type st_3 from statictext within w_breakout
end type
type em_difficulty from editmask within w_breakout
end type
type st_2 from statictext within w_breakout
end type
type cb_auto from commandbutton within w_breakout
end type
type st_score from statictext within w_breakout
end type
type st_1 from statictext within w_breakout
end type
type cb_1 from commandbutton within w_breakout
end type
type dw_1 from datawindow within w_breakout
end type
end forward

global type w_breakout from window
integer x = 946
integer y = 464
integer width = 2807
integer height = 2336
boolean titlebar = true
string title = "BREAKOUT"
boolean controlmenu = true
boolean resizable = true
long backcolor = 80269524
cb_2 cb_2
st_3 st_3
em_difficulty em_difficulty
st_2 st_2
cb_auto cb_auto
st_score st_score
st_1 st_1
cb_1 cb_1
dw_1 dw_1
end type
global w_breakout w_breakout

type variables
Long il_sw = 2, il_paddle[21], il_x, il_paddle_x
Boolean ib_auto = False
String is_breakout
Long il_xx


end variables
forward prototypes
public subroutine wf_close ()
end prototypes

public subroutine wf_close ();this.event post close()
end subroutine

on w_breakout.create
this.cb_2=create cb_2
this.st_3=create st_3
this.em_difficulty=create em_difficulty
this.st_2=create st_2
this.cb_auto=create cb_auto
this.st_score=create st_score
this.st_1=create st_1
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.st_3,&
this.em_difficulty,&
this.st_2,&
this.cb_auto,&
this.st_score,&
this.st_1,&
this.cb_1,&
this.dw_1}
end on

on w_breakout.destroy
destroy(this.cb_2)
destroy(this.st_3)
destroy(this.em_difficulty)
destroy(this.st_2)
destroy(this.cb_auto)
destroy(this.st_score)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event closequery;If il_sw = 1 Then
	il_sw = 3
	Return 1
Else
	Return 0
End If


end event

type cb_2 from commandbutton within w_breakout
integer x = 923
integer y = 2036
integer width = 133
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Help"
end type

event clicked;Open(w_help)

end event

type st_3 from statictext within w_breakout
integer x = 1207
integer y = 2128
integer width = 800
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 80269524
boolean enabled = false
string text = "1 - easiest / 5 - most difficult"
boolean focusrectangle = false
end type

type em_difficulty from editmask within w_breakout
integer x = 1609
integer y = 2020
integer width = 169
integer height = 96
integer taborder = 40
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "1"
borderstyle borderstyle = stylelowered!
string mask = "#"
boolean spin = true
double increment = 1
string minmax = "1~~5"
end type

type st_2 from statictext within w_breakout
integer x = 1248
integer y = 2032
integer width = 347
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Difficulty:"
boolean focusrectangle = false
end type

type cb_auto from commandbutton within w_breakout
integer x = 311
integer y = 2032
integer width = 544
integer height = 92
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Auto Play On"
end type

event clicked;

If This.Text = 'Auto Play On' Then
	This.Text = 'Auto Play Off'
	ib_auto = True
	dw_1.Event oe_auto_play()
Else
	This.Text = 'Auto Play On'
	ib_auto = False
End If



end event

type st_score from statictext within w_breakout
integer x = 2359
integer y = 2024
integer width = 347
integer height = 92
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 65280
long backcolor = 0
boolean enabled = false
string text = "0"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_breakout
integer x = 2085
integer y = 2032
integer width = 256
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Score:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_breakout
integer x = 27
integer y = 2032
integer width = 261
integer height = 92
integer taborder = 50
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Start"
boolean default = true
end type

event clicked;Long ll_row, ll_row2, ll_y_max, ll_x_max, ll_y, ll_yy, ll_row3, ll_row_1, ll_row_2, ll_row_0
Long ll_array[18,21], ll_col, ll_col_l, ll_col_r, ll_col_l1, ll_col_r1, ll_score, ll_redraw_sw, ll_row_x
Boolean lb_match
Long ll_row_t, ll_mod, ll_mod2, ll_mod3, ll_col_l2, ll_col_r2

If This.Text = 'Stop' Then
	il_sw = 2
	This.Text = 'Start'
Else
	Start:
	st_score.Text = '0'
	ll_score = 0
	dw_1.DataObject = 'd_breakout'
	
	//Build a multidimsional array to simulate the box_vis column of the breakout datawindow
	//Its much faster to manipulate arrays then to manipulate datawindows so have the array do as
	//much as possible.  Put it here because each time you press 'Start' the game starts over.
	ll_array = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,&
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0}
	
	//Set the maximum x and y values
	ll_y_max = (84 * dw_1.RowCount()) - 84
	ll_x_max = 2633
	ll_yy = ll_y_max
	
	il_sw = 1
	
	//Set the random initial starting position of the ball
	ll_col = Randomize(0)
	il_xx = Rand(ll_x_max)
	dw_1.Object.oval_1.Visible = 1
	
	//Set the x and y intervals of the movement of the ball
	ll_y = -3
	il_x = 4
	dw_1.Object.xx[1] = il_xx
	
	//Initialize the autoplay feature
	dw_1.Event oe_auto_play()
	
	This.Text = 'Stop'
End If

//Because the actual ball object is really a rectangle you must approximate the position of the ball when it gets
//close to a blue brick.  This can be done much more elaborately and accurately using trigonometric functions.
//But since I took Calc I 3 times I decided not to persue it.  I will leave that as an exercise for one of you.

Do Until il_sw > 1
	//The ball can be on two rows at the same time.  Calculate those rows for roughly the upper, middle and lower
	// part of the ball.
	ll_mod = Mod(ll_yy,84)
	ll_mod2 = Mod(ll_yy + 26,84)
	ll_mod3 = Mod(ll_yy + 38,84)
	ll_row_x = Ceiling((ll_yy - 14) / 84)
	ll_row_0 = Ceiling((ll_yy + 26) / 84)
	ll_row_1 = Ceiling((ll_yy) / 84)
	ll_row_2 = Ceiling((ll_yy + 38) / 84)
	//If the upper part is on row 0, game over
	If ll_row_1 = 0 Then
		il_sw = 2
		If ib_auto Then
			Goto Start //This isnt an example of OO programming, OK
		Else
			MessageBox('','******* YOU WIN *******')
			This.Text = 'Start'
			Exit
		End If
	End If
	//IF min x or max x is reached go the other way
	If il_xx >= ll_x_max Then
		il_x = -4
	ElseIf il_xx <= 0 Then
		il_x = 4
	End If
	lb_match = False
	
	If ib_auto Then
		//If on auto move the paddle
		If il_xx > 125 And il_xx < ll_x_max Then
			il_paddle_x = il_xx - 125
			dw_1.Object.paddle_x[23] = il_paddle_x
			dw_1.Object.paddle_vis[23] = 1
		End If
	End If
	
	If ll_row_1 <= 17 Then
		//Different surfaces of the ball will contact different bricks.  For example does the top of the ball hit the
		//underside of a brick before the right side of the ball hit the left side of the brick?
		//This is approximated by determining which 'col' or 'brick' the left, right and middle parts of the ball are
		// based on its x value.  This is very crude as the 'ball' is really defined as a rectangle in PB
		//but its a fair approximation
		ll_col = Ceiling((il_xx + 50) / 137)
		ll_col_l = Ceiling((il_xx + 35) / 137)
		ll_col_r = Ceiling((il_xx + 65) / 137)
		ll_col_l1 = Ceiling((il_xx + 12) / 137)
		ll_col_r1 = Ceiling((il_xx + 93) / 137)
		ll_col_l2 = Ceiling((il_xx + 6) / 137)
		ll_col_r2 = Ceiling((il_xx + 99) / 137)
		//Contact in the Y direction is checked first
		If ll_y < 0 Then
			If ll_mod < 72 And ll_mod > 0 Then
				//The ball will only strike the underside of a brick while its going up
				If ll_array[ll_row_1,ll_col] = 1 Then
					lb_match = True
					ll_y = 3
					Goto here
				End If
				If ll_mod < 66 Then
					If ll_array[ll_row_1,ll_col_l] = 1 Then
						ll_col = ll_col_l
						lb_match = True
						ll_y = 3
						Goto here
					End If
					If ll_array[ll_row_1,ll_col_r] = 1 Then
						ll_col = ll_col_r
						lb_match = True
						ll_y = 3
						Goto here
					End If
				End If
			End If
		ElseIf ll_row_1 < 17 Then
			//The ball will only strike the top of a brick while its going down
			If ll_mod >= 16 Then
				If ll_array[ll_row_1 + 1,ll_col] = 1 Then
					ll_row_1++
					lb_match = True
					ll_y = -3
					Goto here
				End If
				If ll_mod >= 22 Then
					If ll_array[ll_row_1 + 1,ll_col_l] = 1 Then
						ll_row_1++
						ll_col = ll_col_l
						lb_match = True
						ll_y = -3
						Goto here
					End If
					If ll_array[ll_row_1+1,ll_col_r] = 1 Then
						ll_row_1++
						ll_col = ll_col_r
						lb_match = True
						ll_y = -3
						Goto here
					End If
				End If
			End If
		End If
		
		//Now check for contact in the X direction
		If il_x < 0 Then
			If ll_mod2 <= 52 Then
				If ll_array[ll_row_0,ll_col_l1] = 1 Then
					ll_col = ll_col_l1
					ll_row_1 = ll_row_0
					lb_match = True
					il_x = 4
					Goto here
				End If
			ElseIf ll_mod2 <= 76 Then
				If ll_array[ll_row_2,ll_col_l2] = 1 Then
					ll_col = ll_col_l2
					ll_row_1 = ll_row_2
					lb_match = True
					il_x = 4
					Goto here
				End If
			End If
		Else
			If ll_mod2 <= 52 Then
				If ll_array[ll_row_0,ll_col_r1] = 1 Then
					ll_col = ll_col_r1
					ll_row_1 = ll_row_0
					lb_match = True
					il_x = -4
					Goto here
				End If
			ElseIf ll_mod2 <= 76 Then
				If ll_array[ll_row_2,ll_col_r2] = 1 Then
					ll_col = ll_col_r2
					ll_row_1 = ll_row_2
					lb_match = True
					il_x = -4
					Goto here
				End If
			End If
		End If
	ElseIf ll_row_x >= 22 And ll_y > 0 Then
		//If the ball is on the last row check for the location of the paddle
		//To make the paddle more 'forgiving' you can adjust the boundries of a 'hit'
		//In this case its the 50 in the line below.  The higher the number the greater tolerance for miss hits.
		If il_xx + 50 > il_paddle_x And il_xx + 50 < il_paddle_x + 251 Then
			//A hit.  If all the bricks from the last brick row are gone, move all bricks down a row
			//and add a row at the top
			If dw_1.Object.box_vis[17] = '00000000000000000000' Then
				dw_1.RowsDiscard(22,22,primary!)
				dw_1.RowsCopy(1,1,primary!,dw_1,1,primary!)
				dw_1.Object.yy[2] = 1
				dw_1.Object.xx[2] = 1
				dw_1.Object.Color[1] = dw_1.Object.Color[5]
				//must refresh array
				For ll_row2 = 17 To 1 Step -1
					For ll_row3 = 1 To 21
						ll_array[ll_row2+1,ll_row3] = ll_array[ll_row2,ll_row3]
					Next
				Next
			End If
			ll_y = -3
		Else
			MessageBox('','******* LOOOOSSSSEEER *******')
			il_sw = 2
			This.Text = 'Start'
			Return
		End If
	End If
	here:
	If lb_match Then
		//If there is a hit make the brick invisible and set the array value to 0
		ll_score = ll_score + 10
		st_score.Text = String(ll_score)
		ll_array[ll_row_1,ll_col] = 0
		//Mustidimensional datawindow!!!
		dw_1.Object.box_vis[ll_row_1] = ReplaceA(dw_1.Object.box_vis[ll_row_1],ll_col,1,'0')
		Beep(1)
	End If
	If KeyDown(keyrightarrow!) Then
		//Move paddle right
		If il_paddle_x < ll_x_max - 251 Then
			il_paddle_x = il_paddle_x + 10
			dw_1.Object.paddle_x[23] = il_paddle_x
			dw_1.Object.paddle_vis[23] = 1
		End If
	ElseIf KeyDown(keyleftarrow!) Then
		//Move paddle left
		If il_paddle_x > 0 Then
			il_paddle_x = il_paddle_x - 10
			dw_1.Object.paddle_x[23] = il_paddle_x
			dw_1.Object.paddle_vis[23] = 1
		End If
	End If
	//Move ball
	il_xx = il_xx + il_x
	ll_yy = ll_yy + ll_y
	dw_1.Object.yy[1] = ll_yy
	dw_1.Object.xx[1] = il_xx
	
	If Not ib_auto Then
		ll_redraw_sw++
		//Use the setredraw to control the speed of play in the manual mode.  Notice how the setredraw function
		//affect performance
		If ll_redraw_sw = Long(em_difficulty.Text) Then
			dw_1.SetRedraw(True)
			ll_redraw_sw = 0
		End If
	End If
	Yield()
Loop

//Close if you press close
If il_sw = 3 Then
	Close(Parent)
End If

end event

event constructor;is_breakout = '1,1,84,65535,"11111111111111111111",0,0'+&
	'1,1,84,255,"11111111111111111111",0,0'+&
	'1,1,84,16776960,"11111111111111111111",0,0'+&
	'1,1,84,16711680,"11111111111111111111",0,0'+&
	'1,1,84,65535,"11111111111111111111",0,0'+&
	'1,1,84,255,"11111111111111111111",0,0'+&
	'1,1,84,16776960,"11111111111111111111",0,0'+&
	'1,1,84,16711680,"11111111111111111111",0,0'+&
	'1,1,84,65535,"11111111111111111111",0,0'+&
	'1,1,84,255,"11111111111111111111",0,0'+&
	'1,1,84,16776960,"11111111111111111111",0,0'+&
	'1,1,84,16711680,"11111111111111111111",0,0'+&
	'1,1,84,65535,"11111111111111111111",0,0'+&
	'1,1,84,255,"11111111111111111111",0,0'+&
	'1,1,84,16776960,"11111111111111111111",0,0'+&
	'1,1,84,16711680,"11111111111111111111",0,0'+&
	'1,1,84,65535,"11111111111111111111",0,0'+&
	'1,1,84,255,"11111111111111111111",0,0'+&
	'1,1,84,16776960,"11111111111111111111",0,0'+&
	'1,1,84,16711680,"00000000000000000000",0,0'+&
	'1,1,84,65535,"00000000000000000000",0,0'+&
	'1,1,84,255,"00000000000000000000",0,0'+&
	'1,1,84,16776960,"00000000000000000000",1,10'

end event

type dw_1 from datawindow within w_breakout
event oe_auto_play ( )
event oe_mm pbm_mousemove
event key pbm_dwnkey
event hscroll pbm_hscroll
integer y = 8
integer width = 2766
integer height = 1956
integer taborder = 10
string dataobject = "d_breakout"
borderstyle borderstyle = stylelowered!
end type

event oe_auto_play;il_paddle_x = il_xx - 125
dw_1.object.paddle_x[23] = il_paddle_x


//long ll_row, ll_xx, ll_col, ll_paddle[]
//IF dw_1.rowcount() > 0 THEN
//	ll_paddle = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
//	ll_xx = il_x
//	ll_row = CEILING(ll_yy / 84)
//	ll_col = dw_1.object.array_col[ll_row]
//
////	il_paddle_x = xpos - 125
////	this.object.paddle_x[23] = xpos - 125
//
//
//	IF ll_col > 1 THEN
//		IF il_x > 0 THEN
//			ll_paddle[ll_col - 1] = 1
//			ll_paddle[ll_col] = 1
//		ELSE
//			ll_paddle[ll_col] = 1
//			ll_paddle[ll_col+1] = 1
//		END IF
//	ELSE
//		ll_paddle[ll_col] = 1
//		ll_paddle[ll_col+1] = 1
//	END IF
//	il_paddle = ll_paddle
//	dw_1.object.paddle_x[23] = ll_col
//END IF
end event

event oe_mm;Long ll_x

If flags = 1 Then
	il_paddle_x = xpos - 125
	This.Object.paddle_x[23] = il_paddle_x
End If


end event

event key;Long ll_x, ll_difficulty

If Key = keyuparrow! Then
	ll_difficulty = Long(em_difficulty.Text)
	If ll_difficulty < 5 Then
		em_difficulty.Text = String(ll_difficulty + 1)
	End If
ElseIf Key = keydownarrow! Then
	ll_difficulty = Long(em_difficulty.Text)
	If ll_difficulty > 1 Then
		em_difficulty.Text = String(ll_difficulty - 1)
	End If
End If

dw_1.SetRedraw(True)

end event

event hscroll;Return 1

end event

