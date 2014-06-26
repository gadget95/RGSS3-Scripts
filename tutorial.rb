#===========================================================
# Playing Audio
#===========================================================

# Audio.bgm.play("Root Folder/sound", volume, pitch)
Audio.bgm.play("Audio/BGM/Battle1.ogg", 100, 100)
Audio.bgs.play("Audio/BGS/Fire.ogg", 100, 100)
Audio.me.play("Audio/ME/Viotory1.ogg", 100, 100)
Audio.se.play("Audio/SE/Absorb1.ogg", 100, 100)
#-----------------------------------------------------------
class My_Class
	def initialize()
		p("Class Initialized")
	end
	
	def method_one()
		msgbox_p("Method One Called")
	end
	
	def dispose()
		p("Class Disposed")
	end
end

test = My_Class.new()
test.method_one()
test.dispose()
#-----------------------------------------------------------

class Parent
	def initialize()
		p("Super from Child calls Parent")
		p("Parent Initialized")
	end
	
	def dispose()
		p("Super from Child calls Parent")
		p("Parent Disposed")
	end
end

class Child < Parent
	def initialize()
		super
		p("Child Initialized")
	end
	
	def dispose()
		super
		p("Child Disposed")
	end
end

child = Child.new()
child.dispose()
