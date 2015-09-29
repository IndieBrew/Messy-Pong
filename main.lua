function love.load()
	lg = love.graphics
	lk = love.keyboard

	lg.setNewFont(50)

	x = 10 
	y = 200
	width = 10
	height = 500

	x2 = 780 
	y2 = 200
	width2 = 10
	height2 = 100

	ballx = 300
	bally = 400
	balldiameter = 10

	ballhv = 5
	ballvv = 5

	p1score = 0
	p2score = 0

end


function love.update()


	if lk.isDown("w") then
		y = y - 2
	elseif lk.isDown("s") then
		y = y + 2
	end


	if lk.isDown("up") then
		y2 = y2 - 12
	elseif lk.isDown("down") then
		y2 = y2 + 12
	end

	if bally > 600 or bally < 0 then
		ballvv = -ballvv
	end

	if ballx > 800 then 
		p1score = p1score + 1
		ballx = 400
		bally = 300
	end


	if ballx < 0 then 
		p2score = p2score + 1
		ballx = 400
		bally = 300
	end

	ballx = ballx + ballhv
	bally = bally + ballvv

	if (ballx < x and bally > y and bally < y+height)
		or
		(ballx > x2 and bally > y2 and bally < y2+height2)
	 then
		ballhv = -ballhv
	end

end


function love.draw()
	lg.print(p1score, 10, 300)
	lg.print(p2score, 750, 300)
	lg.rectangle("fill", x, y, width, height)
	lg.rectangle("fill", x2, y2, width2, height2)
	lg.rectangle("fill", ballx, bally, balldiameter, balldiameter)
end