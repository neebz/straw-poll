if @con
	json.status "success"
	json.results do |json|
		json.national do |json|
			json.yes @nationalYes
			json.no @nationalNo
		end
		json.constituency do |json|
			json.yes @conYes
			json.no @conNo
		end
	end
	json.constituency @con
else
	json.status "error"
end