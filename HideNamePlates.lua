local function IsNamePlateFrame(frame)
	local overlayRegion = frame:GetRegions()
	if not overlayRegion or overlayRegion:GetObjectType() ~= "Texture" or overlayRegion:GetTexture() ~= "Interface\\Tooltips\\Nameplate-Border" then
		return false
	end
	return true
end

local function hideUnit(name)
	for _, unitName in pairs(HiddenUnits) do
		if name == unitName then
			return true;
		end
	end
	return false;
end

function HideNamePlates_OnUpdate()
	local frames = { WorldFrame:GetChildren() };
	for _, namePlate in ipairs(frames) do
		if IsNamePlateFrame(namePlate) then
			local _, _, Name = namePlate:GetRegions();
			if hideUnit(Name:GetText()) then
				namePlate:SetWidth(0);
				namePlate:SetHeight(0);
				namePlate:Hide();
			end
		end
	end
end
local f = CreateFrame("Frame", nil, UIParent)
f:SetScript("OnUpdate",HideNamePlates_OnUpdate)
