#REM
	Version 0.4 - Copyright 2014 -  Jim Riecken <jimr@jimr.ca>
	Released under the MIT License - https://github.com/jriecken/sat-js
	A simple library for determining intersections of circles and
	polygons using the Separating Axis Theorem.
	@preserve SAT.js - Version 0.4 - Copyright 2014 - Jim Riecken <jimr@jimr.ca> - 
	released under the MIT License. https://github.com/jriecken/sat-js
	
	Ported to Monkey by Felipe Alfonso <contact@shin.cl> -
	https://github.com/ilovepixel/sat-monkey/
#END

Strict

Import mojo
Import sat.vec2
Import sat.base
Import sat.rectangle

Class Circle Extends Vec2
	
	Field radius:Float
	
	Method New(x:Float, y:Float, radius:Float)
		Super.New(x, y)
		Self.radius = radius
	End
	
	Method GetBounds:Rectangle ()
		Local x:Float = Self.x - radius
		Local y:Float = Self.y - radius
		Local w:Float = radius * 2
		
		Return New Rectangle(x, y, w, w)
	End
	
	Method DebugDraw:Void ()
		PushMatrix()
		Translate(Self.x, Self.y)
		DrawPoint(0, 0)
		DrawCircleStroke(0, 0, radius)
		PopMatrix()
	End
	
	Method GetPosition:Vec2 ()
		Return Self
	End
	
	Method SetPosition:Void (x:Float, y:Float)
		Self.Set(x, y)
	End
	
	Method SetPosition:Void (vec:Vec2)
		Self.Copy(vec)
	End
	
	Method GetType:Int ()
		Return ShapeType.CIRCLE
	End
	
	#REM
		Author: Danilo (http://monkeycoder.co.nz/Account/showuser.php?id=1380)
		Source: http://monkeycoder.co.nz/Community/posts.php?topic=7909&post=78275
	#END
	Function DrawCircleStroke:Void(x:Int, y:Int, radius:Int)
	    Local temp_x:Int = 0
	    Local d:Int      = 3 - 2 * radius
	    
	    While temp_x <= radius
	        DrawRect(x+temp_x, y+radius, 1, 1) ' part 1
	        DrawRect(x-temp_x, y+radius, 1, 1)
	        DrawRect(x+radius, y+temp_x, 1, 1) ' part 2
	        DrawRect(x-radius, y+temp_x, 1, 1)
	        DrawRect(x+radius, y-temp_x, 1, 1) ' part 3
	        DrawRect(x-radius, y-temp_x, 1, 1)
	        DrawRect(x-temp_x, y-radius, 1, 1) ' part 4
	        DrawRect(x+temp_x, y-radius, 1, 1)
	        
	        If d < 0
	            d += 4 * temp_x + 6
	        Else
	            d += 4 * (temp_x - radius) + 10
	            radius -= 1
	        Endif
	        temp_x += 1
	    Wend
	End
End

