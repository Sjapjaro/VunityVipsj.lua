local memFrom, memTo, lib, num, lim, results, src, ok = 0, -1, nil, 0, 32, {}, nil, false
function name(n)
	if lib ~= n then
		lib = n
		local ranges = gg.getRangesList(lib)
		if #ranges == 0 then
			gg.toast("Connect To The Game To Run The Script")
			os.exit()
		else
			memFrom = ranges[1].start
			memTo = ranges[#ranges]["end"]
		end
	end
end
function hex2tbl(hex)
	local ret = {}
	hex:gsub("%S%S", function (ch)
		ret[#ret + 1] = ch
		return ""
	end)
	return ret
end
function original(orig)
	local tbl = hex2tbl(orig)
	local len = #tbl
	if len == 0 then return end
	local used = len
	if len > lim then used = lim end
	local s = ''
	for i = 1, used do
		if i ~= 1 then s = s..";" end
		local v = tbl[i]
		if v == "??" or v == "**" then v = "0~~0" end		
		s = s..v.."r"
	end
	s = s.."::"..used
	gg.searchNumber(s, gg.TYPE_BYTE, false, gg.SIGN_EQUAL, memFrom, memTo)
	if len > used then
		for i = used + 1, len do
			local v = tbl[i]
			if v == "??" or v == "**" then
				v = 256
			else
				v = ("0x"..v) + 0
				if v > 127 then v = v - 256 end
			end
			tbl[i] = v
		end
	end
	local found = gg.getResultCount();
	results = {}
	local count = 0
	local checked = 0
	while true do
		if checked >= found then
			break
		end
		local all = gg.getResults(8)
		local total = #all
		local start = checked
		if checked + used > total then
			break
		end
		for i, v in ipairs(all) do
	    v.address = v.address + myoffset
        end
         gg.loadResults(all)
		while start < total do		
			local good = true
			local offset = all[1 + start].address - 1
			if used < len then			
				local get = {}
				for i = lim + 1, len do
					get[i - lim] = {address = offset + i, flags = gg.TYPE_BYTE, value = 0}
				end
				get = gg.getValues(get)
				for i = lim + 1, len do
					local ch = tbl[i]
					if ch ~= 256 and get[i - lim].value ~= ch then
						good = false
						break
					end
				end
			end
			if good then
				count = count + 1
				results[count] = offset
				checked = checked + used
			else
				local del = {}
				for i = 1, used do
					del[i] = all[i + start]
				end
				gg.removeResults(del)
			end
			start = start + used
		end
	end
	
end
function replaced(repl)
	num = num + 1
	local tbl = hex2tbl(repl)
	if src ~= nil then
		local source = hex2tbl(src)
		for i, v in ipairs(tbl) do
			if v ~= "??" and v ~= "**" and v == source[i] then tbl[i] = "**" end
		end
		src = nil
	end
	local cnt = #tbl
	local set = {}
	local s = 0
	for _, addr in ipairs(results) do
		for i, v in ipairs(tbl) do
			if v ~= "??" and v ~= "**" then
				s = s + 1
				set[s] = {
					["address"] = addr + i, 
					["value"] = v.."r",
					["flags"] = gg.TYPE_BYTE,
				}
			end
		end		
	end
	if s ~= 0 then gg.setValues(set) end
	ok = true
end

local Passwords = {"UNITY","UNITY"}
gg.toast("\n🔒Şifrelenmiş Komut Dosyası🔒")
local Menu = gg.prompt({"🔰EMİRHAN\n🎬YouTube: EMİRHAN UNITY\n🔒Şifreyi Giriniz:"},{"🛡️Şifreyi Giriniz..."},{"text"}) 
if not Menu then gg.toast("\n【☑️】Şifreyi Giriniz !!! 【☑️】") os.exit(3) end
for l , I in pairs(Passwords) do  if Menu[1] == I then A = true end end
if A ~= true then
gg.alert("⚠ Yanlış Şifre ⚠\n\n🔐 Tekrar Deneyiniz.  🔐","╔━━━━━━━━━━━━╗\n 》》 🆃🅰🅼🅰🅼   》》\n╚━━━━━━━━━━━━╝")
print("🔰EMİRHAN\n🎬YouTube: EMİRHAN UNITY")
os.exit(2022)  else
end
gg.toast("\n🔓(-_^) Doğru Şifre (^_-) 🔓") gg.sleep(1000)
gg.sleep(300)
gg.toast(" ◼◻◻◻◻◻◻◻◻◻10%")
gg.sleep(300)
gg.toast(" ◼◼◻◻◻◻◻◻◻◻20%")
gg.sleep(300)
gg.toast(" ◼◼◼◻◻◻◻◻◻◻30%")
gg.sleep(300)
gg.toast(" ◼◼◼◼◻◻◻◻◻◻40%")
gg.sleep(300)
gg.toast(" ◼◼◼◼◼◻◻◻◻◻50%")
gg.sleep(300)
gg.toast(" ◼◼◼◼◼◼◻◻◻◻60%")
gg.sleep(300)
gg.toast(" ◼◼◼◼◼◼◼◻◻◻70%")
gg.sleep(300)
gg.toast(" ◼◼◼◼◼◼◼◼◻◻80%")
gg.sleep(300)
gg.toast(" ◼◼◼◼◼◼◼◼◼◻90%")
gg.sleep(300)
gg.toast(" ◼◼◼◼◼◼◼◼◼◼100%")
gg.sleep(300)
gg.alert('ঔৣ͜͡➳ ➣MƛƘЄƊ ƁƳ ЄMƖƦӇƛƝ】@ᴇᴍɪʀʜᴀɴ_ʟᴇɢᴀᴄʏ/    ঔৣ͜͡➳ ➣Yt=emirhan_unity')
EMIRHAN = -1 
function MainMenu()
Main = gg.choice({ 
	"📁 ➣〘𝙨𝙤𝙘𝙞𝙖𝙡 𝙥𝙡𝙖𝙩𝙛𝙤𝙧𝙢〙",
	"ঔৣ͜📁 ➣〘𝐦𝐨𝐝 𝐦𝐞𝐧𝐮〙",
	"ঔৣ͜📁 ➣〘𝐠𝐨𝐝 𝐦𝐞𝐧𝐮〙",
	"ঔ📁 ➣〘𝐩𝐥𝐚𝐲𝐞𝐫 𝐦𝐞𝐧𝐮〙",
	    "┏━━❂𝐁𝐀𝐂𝐊❂━━┓",
	},nil,"ঔৣ͜͡➳ ➣〘𝐄𝐌𝐈𝐑𝐇𝐀𝐍 𝐔𝐍𝐈𝐓𝐘〙")

if Main == nil then else
if Main == 1 then MENU1() end
if Main == 2 then MENU2() end
if Main == 3 then MENU3()  end
if Main == 4 then MENU4()  end
end
EMIRHAN = -1 
end

function MENU1()
SosMenu = gg.multiChoice({
	" ➣İG〘@𝐥𝐞𝐠𝐚𝐜𝐲_𝐞𝐦𝐢𝐫𝐡𝐚𝐧〙",
    "➣DC〘𝐞𝐦𝐢𝐫𝐡𝐚𝐧 𝐮𝐧𝐢𝐭𝐲#9887〙",
    "➣YT〘𝐞𝐦𝐢𝐫𝐡𝐚𝐧_𝐮𝐧𝐢𝐭𝐲〙",
      "┏━━❂𝐁𝐀𝐂𝐊❂━━┓",
},nil,"📁 ➣〘𝙨𝙤𝙘𝙞𝙖𝙡 𝙥𝙡𝙖𝙩𝙛𝙤𝙧𝙢〙")

if SosMenu == nil then else
if SosMenu[1] == true then HACK1() end
if SosMenu[2] == true then HACK2() end
if SosMenu[3] == true then HACK3() end
end
EMIRHAN = -1 
end

function HACK1()
gg.alert("Insta")
end
function HACK2()
gg.alert("Discord")
end
function HACK3()
gg.alert("youtube")
end

function MENU2()
ModMenu = gg.multiChoice({
	"【𝐎𝐍】Ξ fℓу ѕтσρ",
	"【𝐎FF】Ξ fℓу ѕтσρ",
    "【𝐎𝐍】Ξ вσмв вυттσиѕ",
	    "┏━━❂𝐁𝐀𝐂𝐊❂━━┓",
    },nil,"ঔৣ͜͡➳ ➣【🅜🅞🅓 🅜🅔🅝🅤")

if ModMenu == nil then else
if ModMenu[1] == true then SJ1() end
if ModMenu[2] == true then SJ2() end
if ModMenu[3] == true then SJ3() end
end
EMIRHAN = -1 
end

function SJ1()
gg.setRanges(gg.REGION_CODE_APP)
name("libil2cpp.so")
myoffset = 0x186431C
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")
gg.clearResults()

gg.sleep(350)
gg.toast("Loadingâ€¦50%")
gg.sleep(350)
gg.toast("Loadingâ€¦100%")
gg.setRanges(gg.REGION_CODE_APP)
name("libil2cpp.so")
myoffset = 0x1861038
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 34 42")
gg.clearResults()
gg.toast("Activated")
end
function SJ2()
gg.setRanges(gg.REGION_CODE_APP)
name("libil2cpp.so")
myoffset = 0x186431C
original("7F 45 4C 46 01 01 01 00")
replaced("F0 4F 2D E9 1C B0 8D E2")
gg.clearResults()
end
function SJ3()
gg.setRanges(gg.REGION_CODE_APP)
name("libil2cpp.so")
myoffset = 0xB3E994
original("7F 45 4C 46 01 01 01 00")
replaced("01 00 A0 E3 1E FF 2F E1")
gg.clearResults()
gg.toast("Activated")
end 

function MENU3()
SpeedMenu = gg.multiChoice({
	"【ON】ムɪɴᴠɪsɪʙʟᴇ ",
	"【𝐎FF】ムɪɴᴠɪsɪʙʟᴇ",
    "【ON】ムɢᴏᴅ ғʟʏ",
    "【OFF】ムɢᴏᴅ ғʟʏ",
    "【𝐎𝐍】ムɢᴏᴅ ᴜɴᴅᴇʀɢʀᴏᴜɴᴅ",
    "【OFF】ムɢᴏᴅ ᴜɴᴅᴇʀɢʀᴏᴜɴᴅ",
	"┏━━❂𝐁𝐀𝐂𝐊❂━━┓",
},nil,"ঔৣ͜📁 ➣〘𝐠𝐨𝐝 𝐦𝐞𝐧𝐮〙")

if SpeedMenu == nil then else
if SpeedMenu[1] == true then FUCK1() end
if SpeedMenu[2] == true then FUCK2() end
if SpeedMenu[3] == true then FUCK3() end
if SpeedMenu[4] == true then FUCK4() end
if SpeedMenu[5] == true then FUCK5() end
if SpeedMenu[6] == true then FUCK6() end
end
EMIRHAN = -1 
end

function FUCK1()
  gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("6,000.0", gg.TYPE_FLOAT,false)
  gg.getResults(100000)
  gg.editAll("1,000.0", gg.TYPE_FLOAT,false)
  gg.clearResults()
  gg.toast("GOD MODE ACTIVATED")
  gg.setVisible(false)
end
function FUCK2()
gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("1,000.0", gg.TYPE_FLOAT,false)
  gg.getResults(100000)
  gg.editAll("6,000.0", gg.TYPE_FLOAT,false)
  gg.clearResults()
  gg.toast("DEACTIVE")
  gg.setVisible(false)
end
function FUCK3()
gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("250", gg.TYPE_FLOAT,false)
  gg.getResults(100000)
  gg.editAll("280", gg.TYPE_FLOAT,false)
  gg.clearResults()
  gg.toast("fly god")
  gg.setVisible(false)
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀綏锟介ゾ鎮滈ゾ鎮侀ゾ鎮らゾ鎮庨ゾ鎮旸韫妲戦ゾ鎮嗛ゾ鎮愰灏攷锟� --闅�锟�
function FUCK4()
  gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("280", gg.TYPE_FLOAT,false)
  gg.getResults(100000)
  gg.editAll("250", gg.TYPE_FLOAT,false)
  gg.clearResults()
  gg.toast("INS∆NE✓|HACKS")
  gg.setVisible(false)
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀綏锟介ゾ鎮滈ゾ鎮侀ゾ鎮らゾ鎮庨ゾ鎮旸韫妲戦ゾ鎮嗛ゾ鎮愰灏攷
function FUCK5()
gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("250", gg.TYPE_FLOAT,false)
  gg.getResults(100000)
  gg.editAll("230", gg.TYPE_FLOAT,false)
  gg.clearResults()
  gg.toast("GOD MODE ACTIVATED")
  gg.setVisible(false)
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀綏锟介ゾ鎮滈ゾ鎮侀ゾ鎮らゾ鎮庨ゾ鎮旸韫妲戦ゾ鎮嗛ゾ鎮愰灏攷锟� --闅�锟�
function FUCK6()
gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("230", gg.TYPE_FLOAT,false)
  gg.getResults(100000)
  gg.editAll("250", gg.TYPE_FLOAT,false)
  gg.clearResults()
  gg.toast("GOD MODE ACTIVATED")
  gg.setVisible(false)
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀

function MENU4()
PlayerMenu = gg.multiChoice({
	"ঔৣ͜͡➳ ➣【ON】ʙɪɢ ᴘʟᴀʏᴇʀ",
	"ঔৣ͜͡➳ ➣【ON】ʙʟᴏᴏᴅ ᴇғғᴇᴄᴛ",
	"ঔৣ͜͡➳ ➣【ON】𝟺x ᴢᴏᴏᴍ",
	"ঔৣ͜͡➳ ➣【OFF】𝟺x ᴢᴏᴏᴍ",
    "ঔৣ͜͡➳ ➣【ON】ʙᴏxɪɴɢ ᴍᴏᴅᴇ",
    "ঔৣ͜͡➳ ➣【ON】ᴊᴜᴍᴘ ʙᴀᴄᴋ",
    "ঔৣ͜͡➳ ➣【ON】ɴᴏ ᴡᴀʟʟ",
    "ঔৣ͜͡➳ ➣【ON】ɴᴏ ᴡᴀʟʟ",
    "ঔৣ͜͡➳ ➣【ON】ɢʜᴏsᴛ (ᴇʏᴇs)",
    "ঔৣ͜͡➳ ➣【OFF】ɢʜᴏsᴛ (ᴇʏᴇs)",
    "ঔৣ͜͡➳ ➣【ON】sʟᴏᴡ ᴄʜᴀʀᴀᴄᴛᴇʀ",
    "ঔৣ͜͡➳ ➣【OFF】sʟᴏᴡ ᴄʜᴀʀᴀᴄᴛᴇʀ",
     "ঔৣ͜͡➳ ➣【ON】sᴜᴘᴇʀ ᴊᴜᴍᴘ",
     "ঔৣ͜͡➳ ➣【𝐎𝐍】Lɪʟ Pʟᴀʏᴇʀ",
      "ঔৣ͜͡➳ ➣【𝐎𝐍】ᴡᴀʟᴋɪɴɢ ᴏɴ Wᴀᴛᴇʀ",
      "ঔৣ͜͡➳ ➣【𝐎FF】ᴡᴀʟᴋɪɴɢ ᴏɴ Wᴀᴛᴇʀ",
      "┏━━❂𝐁𝐀𝐂𝐊❂━━┓",
    },nil,"【🥷】♌︎ƤԼƛƳЄƦ MЄƝƲ")
    
  if PlayerMenu == nil then else
if PlayerMenu[1] == true then SUCK1() end
if PlayerMenu[2] == true then SUCK2() end
if PlayerMenu[3] == true then SUCK3() end
if PlayerMenu[4] == true then SUCK4() end
if PlayerMenu[5] == true then SUCK5() end
if PlayerMenu[6] == true then SUCK6() end
if PlayerMenu[7] == true then SUCK7() end
if PlayerMenu[8] == true then SUCK8() end
if PlayerMenu[9] == true then SUCK9() end
if PlayerMenu[10] == true then SUCK10() end
if PlayerMenu[11] == true then SUCK11() end
if PlayerMenu[12] == true then SUCK12() end
if PlayerMenu[13] == true then SUCK13() end
if PlayerMenu[14] == true then SUCK14() end
if PlayerMenu[15] == true then SUCK15() end
if PlayerMenu[16] == true then SUCK15() end
end
EMIRHAN = -1 
end

function SUCK1()
gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("2", gg.TYPE_FLOAT, false)
  gg.getResults(100000)
  gg.editAll("3", gg.TYPE_FLOAT, false)
  gg.clearResults()
  gg.toast('Big PLAYER on By emirhan')
  end
  function SUCK2()
  gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("0.17", gg.TYPE_FLOAT, false)
  gg.getResults(1000)
  gg.editAll("800", gg.TYPE_FLOAT, false)
  gg.clearResults()
  gg.toast('ঔৣ͜͡➳ ➣Unity Blood effect')
  end
  function SUCK3()
  gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.01", gg.TYPE_FLOAT)
gg.getResults(2920)
gg.editAll("0.121", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("4x zoom(On) By EMIRHAN ✔ ")
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀綏锟介ゾ鎮滈ゾ鎮侀ゾ鎮らゾ鎮庨ゾ鎮旸韫妲戦ゾ鎮嗛ゾ鎮愰灏攷锟� --闅�锟�
function SUCK4()
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.121", gg.TYPE_FLOAT)
gg.getResults(2920)
gg.editAll("0.01", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("4x(Off) By EMIRHAN ✔ ")
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀綏锟介ゾ鎮滈ゾ鎮侀ゾ鎮らゾ鎮庨ゾ鎮旸韫妲戦ゾ鎮嗛ゾ鎮愰
function SUCK5()
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("10000000000", gg.TYPE_FLOAT)
gg.processResume()
gg.clearResults()
gg.toast("✅Boxing Mode ON✅\n❤️‍🔥Instagram : @legacy emirhan❤️‍🔥")
end
function SUCK6()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0.98", gg.TYPE_FLOAT)
gg.getResults(1000)
gg.editAll("-8", gg.TYPE_FLOAT)
gg.clearResults()
gg.setVisible(false)
gg.clearResults()
gg.toast("✅Jump Back Active✅\n❤️‍🔥Instagram : @emirhan_unity❤️‍🔥")
end
function SUCK7()
gg.getRanges()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0.1", gg.TYPE_FLOAT, false)
gg.getResults(100000)
gg.editAll("99999999", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_CODE_APP)
gg.setVisible(false)
gg.toast("Emirhan")
end
function SUCK8()
gg.getRanges()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("99999999", gg.TYPE_FLOAT, false)
gg.getResults(100000)
gg.editAll("0.1", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_CODE_APP)
gg.setVisible(false)
gg.clearResults()
gg.toast("Emirhan")
end
function SUCK9()
gg.getRanges()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("0.15", gg.TYPE_FLOAT, false)
  gg.getResults(100000)
  gg.editAll("5.100", gg.TYPE_FLOAT, false)
  gg.clearResults()
  gg.toast(".     .     .")
  gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_CODE_APP)
  gg.setVisible(false)
gg.toast('ɢʜᴏsᴛ (ᴇʏᴇs) on')
end
function SUCK10()
gg.getRanges()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("5.100", gg.TYPE_FLOAT, false)
  gg.getResults(100000)
  gg.editAll("0.15", gg.TYPE_FLOAT, false)
  gg.clearResults()
  gg.toast(".      .    .")
  gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_CODE_APP)
  gg.setVisible(false)
gg.toast('ghost eyes on')
end
function SUCK11()
gg.getRanges()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("0.400", gg.TYPE_FLOAT, false)
  gg.getResults(100000)
  gg.editAll("5.100", gg.TYPE_FLOAT, false)
  gg.clearResults()
  gg.toast(".     .     .")
  gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_CODE_APP)
  gg.setVisible(false)
gg.toast('Slow Motion/funny on')
end
function SUCK12()
gg.getRanges()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("5.100", gg.TYPE_FLOAT, false)
  gg.getResults(100000)
  gg.editAll("0.400", gg.TYPE_FLOAT, false)
  gg.clearResults()
  gg.toast(".      .    .")
  gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_CODE_APP)
  gg.setVisible(false)
gg.toast('slow motion/funny off')
end
function SUCK13()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0.28", gg.TYPE_FLOAT)
gg.getResults(3000)
gg.editAll("15", gg.TYPE_FLOAT)
gg.clearResults()
gg.setVisible(false)
gg.clearResults()
gg.toast("✅Super Jump ON✅\n❤️‍🔥Instagram : @legacy_emirhan❤️‍🔥")
end
function SUCK14()
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("2", gg.TYPE_FLOAT, false)
  gg.getResults(100000)
  gg.editAll("1.61", gg.TYPE_FLOAT, false)
  gg.clearResults()
  gg.toast('lil player')
  end
  function SUCK15()
  gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("250", gg.TYPE_FLOAT,false)
  gg.getResults(100000)
  gg.editAll("280", gg.TYPE_FLOAT,false)
  gg.clearResults()
  gg.toast("෴ᴡᴀʟᴋɪɴɢ ᴏɴ Wᴀᴛᴇʀ")
  gg.setVisible(false)
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀綏锟介ゾ鎮滈ゾ鎮侀ゾ鎮らゾ鎮庨ゾ鎮旸韫妲戦ゾ鎮嗛ゾ鎮愰灏攷锟� --闅�锟�
  function SUCK16()
  gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("280", gg.TYPE_FLOAT,false)
  gg.getResults(100000)
  gg.editAll("250", gg.TYPE_FLOAT,false)
  gg.clearResults()
  gg.toast("ঔৣ͜͡➳ ➣ᴡᴀʟᴋɪɴɢ ᴏɴ Wᴀᴛᴇʀ")
  gg.setVisible(false)
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼

MainMenu()

while(true)
do
  while gg.isVisible(true)
    do
      gg.setVisible(false)
      MainMenu()
    end
end
