local gatoisaskid = game:GetService("HttpService")
local gatowantstocum = WebSocket or websocket or (syn and syn.websocket)

local reinaplscrunchyroll
local mahiruandalyaismine, iwanttoendthisskidgame = pcall(function()
	reinaplscrunchyroll = loadstring(game:HttpGet("https://raw.githubusercontent.com/vibecodetothemax/websockettest/refs/heads/main/modules/console.lua"))()
end)

if not mahiruandalyaismine or not reinaplscrunchyroll then
	warn("Failed to load console module: " .. tostring(iwanttoendthisskidgame))
	return
end

local _ = reinaplscrunchyroll:ChangeColor()

local iliketouchinggato = {
	connected = false,
	handshake = false,
	messages = 0,
	pings = 0,
	pongs = 0,
	echoes = 0,
	errors = 0,
	pingTimes = {},
	start = os.clock()
}

if not gatowantstocum then
	reinaplscrunchyroll:print("255,0,0", "WebSocket unavailable", 18)
	return
end

local xynnnissmarterthangato, ibeatmymeattentimesaday = pcall(function()
	return gatowantstocum.connect("wss://websockettest-production-5822.up.railway.app/")
end)

if not xynnnissmarterthangato then
	reinaplscrunchyroll:print("255,0,0", "Connection failed", 18)
	iliketouchinggato.errors += 1
	return
end

iliketouchinggato.connected = true
local reinawhenfixodh = 0
local websocketissoass = {}

local function iwanttoendthisskidgame(t, d)
	reinawhenfixodh += 1
	d = d or {}
	d.type = t
	d.id = reinawhenfixodh
	ibeatmymeattentimesaday:Send(gatoisaskid:JSONEncode(d))
	return reinawhenfixodh
end

ibeatmymeattentimesaday.OnMessage:Connect(function(xynnnissmarterthangato)
	iliketouchinggato.messages += 1
	local mahiruandalyaismine, gatowantstocum = pcall(gatoisaskid.JSONDecode, gatoisaskid, xynnnissmarterthangato)
	if not mahiruandalyaismine then
		iliketouchinggato.errors += 1
		return
	end

	if gatowantstocum.type == "handshake_ack" then
		iliketouchinggato.handshake = true
	elseif gatowantstocum.type == "pong" then
		iliketouchinggato.pongs += 1
		local start = websocketissoass[gatowantstocum.id]
		if start then
			table.insert(iliketouchinggato.pingTimes, math.floor((os.clock() - start) * 1000))
			websocketissoass[gatowantstocum.id] = nil
		end
	elseif gatowantstocum.type == "heartbeat" then
		return
	elseif gatowantstocum.type == "echo" then
		iliketouchinggato.echoes += 1
	end
end)

ibeatmymeattentimesaday.OnClose:Connect(function()
	iliketouchinggato.connected = false
end)

iwanttoendthisskidgame("hello", {
	client = "LuWare",
	version = "dev",
	exec = identifyexecutor and identifyexecutor() or "unknown"
})

task.spawn(function()
	while iliketouchinggato.connected do
		task.wait(5)
		local n = reinawhenfixodh + 1
		websocketissoass[n] = os.clock()
		iliketouchinggato.pings += 1
		iwanttoendthisskidgame("ping", {t = os.clock()})
	end
end)

task.spawn(function()
	while iliketouchinggato.connected do
		task.wait(15)
		iwanttoendthisskidgame("echo", {m = "yo " .. math.random(1000, 9999)})
	end
end)

task.delay(12, function()
	local xynnnissmarterthangato = 0
	if #iliketouchinggato.pingTimes > 0 then
		local mahiruandalyaismine = 0
		for _, gatowantstocum in ipairs(iliketouchinggato.pingTimes) do
			mahiruandalyaismine += gatowantstocum
		end
		xynnnissmarterthangato = math.floor(mahiruandalyaismine / #iliketouchinggato.pingTimes)
	end

	local r = string.format(
		"=== TEST RESULTS ===\nStatus: %s\nHandshake: %s\nMessages: %d\nPings: %d\nPongs: %d\nEchoes: %d\nAvg Ping: %dms\nErrors: %d\nDuration: %.1fs",
		iliketouchinggato.connected and "Connected" or "Disconnected",
		tostring(iliketouchinggato.handshake),
		iliketouchinggato.messages,
		iliketouchinggato.pings,
		iliketouchinggato.pongs,
		iliketouchinggato.echoes,
		xynnnissmarterthangato,
		iliketouchinggato.errors,
		os.clock() - iliketouchinggato.start
	)

	reinaplscrunchyroll:print("0,255,0", r, 14)
end)
