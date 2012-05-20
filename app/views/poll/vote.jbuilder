if @vote
	json.status "success"
	json.vote @vote
else
	json.status "error"
end