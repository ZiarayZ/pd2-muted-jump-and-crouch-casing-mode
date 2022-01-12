PlayerMaskOff = PlayerMaskOff or class(PlayerStandard)

--override these functions to remove sus hint
function PlayerMaskOff:_check_action_jump(t, input)
	
end

function PlayerMaskOff:_check_action_duck(t, input)
	
end

--hooks to add jumping and ducking, based off Dr_Newbie
Hooks:PostHook(PlayerMaskOff, "_check_action_jump", "CheckJump", function(self, t, input)
	if input.btn_jump_press then
		PlayerStandard._check_action_jump(self, t, input)
	end
end)

Hooks:PostHook(PlayerMaskOff, "_check_action_duck", "CheckDuck", function(self, t, input)
	if input.btn_duck_release or input.btn_duck_press then
		PlayerStandard._check_action_duck(self, t, input)
	end
end)

Hooks:PostHook(PlayerMaskOff, "_check_action_interact", "CheckInteract", function(self)
	return true
end)

Hooks:PostHook(PlayerMaskOff, "_upd_attention", "DetectionRisk", function(self)
	if self._state_data.ducking or self._state_data.running then
		PlayerStandard._upd_attention(self)
	end
end)