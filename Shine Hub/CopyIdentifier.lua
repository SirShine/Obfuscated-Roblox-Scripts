local request = syn.request({Url = "http://45.82.120.134/SynUserIdentifier", Method = "POST",})
setclipboard(request.Body)