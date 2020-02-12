function AutoScale(num, idp)
	assert(tonumber(num),'AutoScale erwartet eine Zahl.')
	local scales = {'B','kB','MB','GB','TB'}
	local places = idp or 0
	local scale = ""
	local scaled = 0
	
	for i, v in ipairs(scales) do
		if (num < (1024 ^ i)) or (i == #scales) then
			scale = v
			scaled = Round(num / 1024 ^ (i-1), places)
			break
		end
	end
	
	return scaled, scale
end

function Round(num, idp)
	assert(tonumber(num), 'Round erwartet eine Zahl.')
	local mult = 10 ^ (idp or 0)
	if num >= 0 then
		return math.floor(num * mult + 0.5) / mult
	else
		return math.ceil(num * mult - 0.5) / mult
	end
end

function Update()
	local MyMeasure = SKIN:GetMeasure('MeasureBinSize')
	local MyMeasureValue = MyMeasure:GetValue()
	
	return AutoScale(MyMeasureValue,1)
end

function nureinmal()
	print('Measure: MeasureBinSize')
end
	