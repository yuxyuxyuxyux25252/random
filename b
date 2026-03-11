local httpService = game:GetService('HttpService')
local ThemeManager = {} do
	ThemeManager.Folder = 'LinoriaLibSettings'
	-- if not isfolder(ThemeManager.Folder) then makefolder(ThemeManager.Folder) end

	ThemeManager.Library = nil
	ThemeManager.BuiltInThemes = {
		['Default'] 		= { 1, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1c1c1c","AccentColor":"0055ff","BackgroundColor":"141414","OutlineColor":"323232"}') },
		['BBot'] 			= { 2, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1e1e1e","AccentColor":"7e48a3","BackgroundColor":"232323","OutlineColor":"141414"}') },
		['Fatality']		= { 3, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1e1842","AccentColor":"c50754","BackgroundColor":"191335","OutlineColor":"3c355d"}') },
		['Jester'] 			= { 4, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"242424","AccentColor":"db4467","BackgroundColor":"1c1c1c","OutlineColor":"373737"}') },
		['Mint'] 			= { 5, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"242424","AccentColor":"3db488","BackgroundColor":"1c1c1c","OutlineColor":"373737"}') },
		['Tokyo Night'] 	= { 6, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"191925","AccentColor":"6759b3","BackgroundColor":"16161f","OutlineColor":"323232"}') },
		['Ubuntu'] 			= { 7, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"3e3e3e","AccentColor":"e2581e","BackgroundColor":"323232","OutlineColor":"191919"}') },
		['Quartz'] 			= { 8, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"232330","AccentColor":"426e87","BackgroundColor":"1d1b26","OutlineColor":"27232f"}') },
		['Neverlose'] 		= { 9, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"191919","AccentColor":"ff3b30","BackgroundColor":"141414","OutlineColor":"252525"}') },
		['Gamesense'] 		= { 10, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"141414","AccentColor":"00ff8c","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['Starlight'] 		= { 11, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"0a0514","AccentColor":"64dcff","BackgroundColor":"05020a","OutlineColor":"1e0f28"}') },
		['Synapse X'] 		= { 12, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"141414","AccentColor":"00ff8c","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['Krnl'] 			= { 13, httpService:JSONDecode('{"FontColor":"ffffe6","MainColor":"1e0f05","AccentColor":"ffa500","BackgroundColor":"140a03","OutlineColor":"3c1e0a"}') },
		['Fluxus'] 			= { 14, httpService:JSONDecode('{"FontColor":"e6f7ff","MainColor":"0a1423","AccentColor":"00c8ff","BackgroundColor":"050a14","OutlineColor":"141e32"}') },
		['Dark Purple'] 	= { 15, httpService:JSONDecode('{"FontColor":"f0e6ff","MainColor":"190a23","AccentColor":"b450ff","BackgroundColor":"0f0519","OutlineColor":"2d143c"}') },
		['Ocean'] 			= { 16, httpService:JSONDecode('{"FontColor":"e6f7ff","MainColor":"050f1e","AccentColor":"00c8ff","BackgroundColor":"030a14","OutlineColor":"0a1e32"}') },
		['Forest'] 			= { 17, httpService:JSONDecode('{"FontColor":"f0fff0","MainColor":"0a1e0f","AccentColor":"50c878","BackgroundColor":"05140a","OutlineColor":"14321e"}') },
		['Crimson'] 		= { 18, httpService:JSONDecode('{"FontColor":"ffe6e6","MainColor":"1e0505","AccentColor":"ff3232","BackgroundColor":"140303","OutlineColor":"320a0a"}') },
		['Gold'] 			= { 19, httpService:JSONDecode('{"FontColor":"fffae6","MainColor":"191405","AccentColor":"ffd700","BackgroundColor":"0f0a03","OutlineColor":"321e0a"}') },
		['Matrix'] 			= { 20, httpService:JSONDecode('{"FontColor":"c8ffc8","MainColor":"000f00","AccentColor":"00ff00","BackgroundColor":"000a00","OutlineColor":"001e00"}') },
		['Pink'] 			= { 21, httpService:JSONDecode('{"FontColor":"ffe6f0","MainColor":"230a19","AccentColor":"ff69b4","BackgroundColor":"19050f","OutlineColor":"3c142d"}') },
		['Ice'] 			= { 22, httpService:JSONDecode('{"FontColor":"f0f5ff","MainColor":"141923","AccentColor":"96dcff","BackgroundColor":"0a0f14","OutlineColor":"1e2832"}') },
		['Volcano'] 		= { 23, httpService:JSONDecode('{"FontColor":"ffe6dc","MainColor":"230a05","AccentColor":"ff5000","BackgroundColor":"190503","OutlineColor":"3c140a"}') },
		['Solar'] 			= { 24, httpService:JSONDecode('{"FontColor":"fffae6","MainColor":"231405","AccentColor":"ffc832","BackgroundColor":"190f03","OutlineColor":"3c280a"}') },
		['Galaxy'] 			= { 25, httpService:JSONDecode('{"FontColor":"e6e6ff","MainColor":"050514","AccentColor":"9664ff","BackgroundColor":"03030a","OutlineColor":"0a0a1e"}') },
		['Neon'] 			= { 26, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"05050a","AccentColor":"00ffff","BackgroundColor":"030305","OutlineColor":"0a0a14"}') },
		['Cyberpunk'] 		= { 27, httpService:JSONDecode('{"FontColor":"e6e6ff","MainColor":"14051e","AccentColor":"ff00c8","BackgroundColor":"0a0314","OutlineColor":"1e0a32"}') },
		['Midnight'] 		= { 28, httpService:JSONDecode('{"FontColor":"e6e6f0","MainColor":"0a1423","AccentColor":"4682ff","BackgroundColor":"050a14","OutlineColor":"141e32"}') },
		['Xeno'] 			= { 29, httpService:JSONDecode('{"FontColor":"f0e6ff","MainColor":"140a1e","AccentColor":"b450ff","BackgroundColor":"0a0514","OutlineColor":"1e0a32"}') },
		['Comet'] 			= { 30, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"0f0a1e","AccentColor":"64aaff","BackgroundColor":"0a0514","OutlineColor":"191432"}') },
		['Hydrogen'] 		= { 31, httpService:JSONDecode('{"FontColor":"e6ffe6","MainColor":"05140a","AccentColor":"32ff32","BackgroundColor":"030a05","OutlineColor":"0a1e0a"}') },
		['Elysian'] 		= { 32, httpService:JSONDecode('{"FontColor":"ffe6ff","MainColor":"1e0514","AccentColor":"ff64ff","BackgroundColor":"14030a","OutlineColor":"320a1e"}') },
		['Redline'] 		= { 33, httpService:JSONDecode('{"FontColor":"ffe6e6","MainColor":"1e0a0a","AccentColor":"ff3232","BackgroundColor":"140505","OutlineColor":"320a0a"}') },
		['Sentinel'] 		= { 34, httpService:JSONDecode('{"FontColor":"f0f0f0","MainColor":"141414","AccentColor":"ffaa00","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['Vape'] 			= { 35, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"0a0a14","AccentColor":"aa55ff","BackgroundColor":"05050a","OutlineColor":"14141e"}') },
		['Temple'] 			= { 36, httpService:JSONDecode('{"FontColor":"ffffe6","MainColor":"19190a","AccentColor":"ffd700","BackgroundColor":"0f0f05","OutlineColor":"32320a"}') },
		['Trigon'] 			= { 37, httpService:JSONDecode('{"FontColor":"e6ffe6","MainColor":"0a190a","AccentColor":"32ff32","BackgroundColor":"050f05","OutlineColor":"0a320a"}') },
		['Rune'] 			= { 38, httpService:JSONDecode('{"FontColor":"ffe6f0","MainColor":"190a14","AccentColor":"ff64aa","BackgroundColor":"0f050a","OutlineColor":"320a1e"}') },
		['Phantom'] 		= { 39, httpService:JSONDecode('{"FontColor":"f0f0ff","MainColor":"0a0a19","AccentColor":"6464ff","BackgroundColor":"05050f","OutlineColor":"141432"}') },
		['Solaris'] 		= { 40, httpService:JSONDecode('{"FontColor":"ffffe6","MainColor":"19140a","AccentColor":"ffaa00","BackgroundColor":"0f0a05","OutlineColor":"321e0a"}') },
		['Nova'] 			= { 41, httpService:JSONDecode('{"FontColor":"e6f7ff","MainColor":"0a1419","AccentColor":"00aaff","BackgroundColor":"050a0f","OutlineColor":"141e32"}') },
		['Eternal'] 		= { 42, httpService:JSONDecode('{"FontColor":"f0ffe6","MainColor":"14190a","AccentColor":"aaff00","BackgroundColor":"0a0f05","OutlineColor":"1e320a"}') },
		['Infinity'] 		= { 43, httpService:JSONDecode('{"FontColor":"ffe6ff","MainColor":"190a19","AccentColor":"ff64ff","BackgroundColor":"0f050f","OutlineColor":"320a32"}') },
		['Quantum'] 		= { 44, httpService:JSONDecode('{"FontColor":"e6ffff","MainColor":"0a1919","AccentColor":"00ffff","BackgroundColor":"050f0f","OutlineColor":"0a3232"}') },
		['Neptune'] 		= { 45, httpService:JSONDecode('{"FontColor":"e6f0ff","MainColor":"0a1419","AccentColor":"3296ff","BackgroundColor":"050a0f","OutlineColor":"141e32"}') },
		['Orion'] 			= { 46, httpService:JSONDecode('{"FontColor":"e6e6ff","MainColor":"0a0a19","AccentColor":"6464ff","BackgroundColor":"05050f","OutlineColor":"141432"}') },
		['Apollo'] 			= { 47, httpService:JSONDecode('{"FontColor":"ffffe6","MainColor":"19190a","AccentColor":"ffd700","BackgroundColor":"0f0f05","OutlineColor":"32320a"}') },
		['Atlas'] 			= { 48, httpService:JSONDecode('{"FontColor":"f0e6ff","MainColor":"190a23","AccentColor":"aa64ff","BackgroundColor":"0f0519","OutlineColor":"320a3c"}') },
		['Zeus'] 			= { 49, httpService:JSONDecode('{"FontColor":"ffffe6","MainColor":"191914","AccentColor":"ffd700","BackgroundColor":"0f0f0a","OutlineColor":"323228"}') },
		['Ares'] 			= { 50, httpService:JSONDecode('{"FontColor":"ffe6e6","MainColor":"190a0a","AccentColor":"ff3232","BackgroundColor":"0f0505","OutlineColor":"320a0a"}') },
		['Poseidon'] 		= { 51, httpService:JSONDecode('{"FontColor":"e6ffff","MainColor":"0a1919","AccentColor":"00ffff","BackgroundColor":"050f0f","OutlineColor":"0a3232"}') },
		['Hades'] 			= { 52, httpService:JSONDecode('{"FontColor":"f0e6e6","MainColor":"190a0a","AccentColor":"8c3232","BackgroundColor":"0f0505","OutlineColor":"320a0a"}') },
		['Hermes'] 			= { 53, httpService:JSONDecode('{"FontColor":"ffffe6","MainColor":"191914","AccentColor":"ffd700","BackgroundColor":"0f0f0a","OutlineColor":"323228"}') },
		['Chronos'] 		= { 54, httpService:JSONDecode('{"FontColor":"e6ffe6","MainColor":"0a190a","AccentColor":"32ff32","BackgroundColor":"050f05","OutlineColor":"0a320a"}') },
		['Nyx'] 			= { 55, httpService:JSONDecode('{"FontColor":"e6e6ff","MainColor":"0a0a14","AccentColor":"6464aa","BackgroundColor":"05050a","OutlineColor":"14141e"}') },
		['Elysium'] 		= { 56, httpService:JSONDecode('{"FontColor":"ffffe6","MainColor":"191914","AccentColor":"ffd700","BackgroundColor":"0f0f0a","OutlineColor":"323228"}') },
		['Valhalla'] 		= { 57, httpService:JSONDecode('{"FontColor":"ffe6e6","MainColor":"190a0a","AccentColor":"ff3232","BackgroundColor":"0f0505","OutlineColor":"320a0a"}') },
		['Asgard'] 			= { 58, httpService:JSONDecode('{"FontColor":"e6f0ff","MainColor":"0a141e","AccentColor":"3296ff","BackgroundColor":"050a14","OutlineColor":"141e32"}') },
		['Olympus'] 		= { 59, httpService:JSONDecode('{"FontColor":"ffffe6","MainColor":"191914","AccentColor":"ffd700","BackgroundColor":"0f0f0a","OutlineColor":"323228"}') },
		['Crystal'] 		= { 60, httpService:JSONDecode('{"FontColor":"e6ffff","MainColor":"0a1919","AccentColor":"00ffff","BackgroundColor":"050f0f","OutlineColor":"0a3232"}') },
		['Obsidian'] 		= { 61, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"0a0a0a","AccentColor":"646464","BackgroundColor":"050505","OutlineColor":"141414"}') },
		['Emerald'] 		= { 62, httpService:JSONDecode('{"FontColor":"e6ffe6","MainColor":"0a140a","AccentColor":"00ff00","BackgroundColor":"050a05","OutlineColor":"0a1e0a"}') },
		['Ruby'] 			= { 63, httpService:JSONDecode('{"FontColor":"ffe6e6","MainColor":"140a0a","AccentColor":"ff0000","BackgroundColor":"0a0505","OutlineColor":"1e0a0a"}') },
		['Sapphire'] 		= { 64, httpService:JSONDecode('{"FontColor":"e6e6ff","MainColor":"0a0a14","AccentColor":"0000ff","BackgroundColor":"05050a","OutlineColor":"14141e"}') },
		['Amethyst'] 		= { 65, httpService:JSONDecode('{"FontColor":"f0e6ff","MainColor":"140a1e","AccentColor":"aa00ff","BackgroundColor":"0a0514","OutlineColor":"1e0a32"}') },
		['Topaz'] 			= { 66, httpService:JSONDecode('{"FontColor":"ffffe6","MainColor":"19140a","AccentColor":"ffaa00","BackgroundColor":"0f0a05","OutlineColor":"321e0a"}') },
		['Diamond'] 		= { 67, httpService:JSONDecode('{"FontColor":"e6ffff","MainColor":"0a1919","AccentColor":"ffffff","BackgroundColor":"050f0f","OutlineColor":"0a3232"}') },
		['Pearl'] 			= { 68, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ffffff","AccentColor":"ff69b4","BackgroundColor":"f0f0f0","OutlineColor":"dcdcdc"}') },
		['Onyx'] 			= { 69, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000000","AccentColor":"ffffff","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['Jade'] 			= { 70, httpService:JSONDecode('{"FontColor":"e6ffe6","MainColor":"0a1e0a","AccentColor":"00ff7f","BackgroundColor":"051405","OutlineColor":"0a320a"}') },
		['Opal'] 			= { 71, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1e0a1e","AccentColor":"ff64ff","BackgroundColor":"140514","OutlineColor":"320a32"}') },
		['Garnet'] 			= { 72, httpService:JSONDecode('{"FontColor":"ffe6e6","MainColor":"1e0a0a","AccentColor":"ff3232","BackgroundColor":"140505","OutlineColor":"320a0a"}') },
		['Aquamarine'] 		= { 73, httpService:JSONDecode('{"FontColor":"e6ffff","MainColor":"0a1e1e","AccentColor":"7fffd4","BackgroundColor":"051414","OutlineColor":"0a3232"}') },
		['Citrine'] 		= { 74, httpService:JSONDecode('{"FontColor":"ffffe6","MainColor":"1e1e0a","AccentColor":"ffff00","BackgroundColor":"141405","OutlineColor":"32320a"}') },
		['Peridot'] 		= { 75, httpService:JSONDecode('{"FontColor":"e6ffe6","MainColor":"0a1e0a","AccentColor":"b0ff00","BackgroundColor":"051405","OutlineColor":"0a320a"}') },
		['Tanzanite'] 		= { 76, httpService:JSONDecode('{"FontColor":"f0e6ff","MainColor":"0a0a1e","AccentColor":"8a2be2","BackgroundColor":"050514","OutlineColor":"141432"}') },
		['Moonstone'] 		= { 77, httpService:JSONDecode('{"FontColor":"e6e6ff","MainColor":"0a0a14","AccentColor":"b0c4de","BackgroundColor":"05050a","OutlineColor":"14141e"}') },
		['Sunstone'] 		= { 78, httpService:JSONDecode('{"FontColor":"ffffe6","MainColor":"1e1e0a","AccentColor":"ffd700","BackgroundColor":"141405","OutlineColor":"32320a"}') },
		['Bloodstone'] 		= { 79, httpService:JSONDecode('{"FontColor":"ffe6e6","MainColor":"1e0a0a","AccentColor":"8b0000","BackgroundColor":"140505","OutlineColor":"320a0a"}') },
		['Firestone'] 		= { 80, httpService:JSONDecode('{"FontColor":"ffffe6","MainColor":"1e0a0a","AccentColor":"ff4500","BackgroundColor":"140505","OutlineColor":"320a0a"}') },
		['Earthstone'] 		= { 81, httpService:JSONDecode('{"FontColor":"ffe6dc","MainColor":"1e140a","AccentColor":"8b4513","BackgroundColor":"140f05","OutlineColor":"32280a"}') },
		['Waterstone'] 		= { 82, httpService:JSONDecode('{"FontColor":"e6f7ff","MainColor":"0a141e","AccentColor":"1e90ff","BackgroundColor":"050a14","OutlineColor":"141e32"}') },
		['Airstone'] 		= { 83, httpService:JSONDecode('{"FontColor":"f0f0ff","MainColor":"0a0a1e","AccentColor":"87ceeb","BackgroundColor":"050514","OutlineColor":"141432"}') },
		['Spiritstone'] 	= { 84, httpService:JSONDecode('{"FontColor":"ffe6ff","MainColor":"1e0a1e","AccentColor":"ff69b4","BackgroundColor":"140514","OutlineColor":"320a32"}') },
		['Mindstone'] 		= { 85, httpService:JSONDecode('{"FontColor":"e6e6ff","MainColor":"0a0a1e","AccentColor":"9370db","BackgroundColor":"050514","OutlineColor":"141432"}') },
		['Soulstone'] 		= { 86, httpService:JSONDecode('{"FontColor":"ffe6e6","MainColor":"1e0a0a","AccentColor":"dc143c","BackgroundColor":"140505","OutlineColor":"320a0a"}') },
		['Timestone'] 		= { 87, httpService:JSONDecode('{"FontColor":"e6ffe6","MainColor":"0a1e0a","AccentColor":"32cd32","BackgroundColor":"051405","OutlineColor":"0a320a"}') },
		['Spacestone'] 		= { 88, httpService:JSONDecode('{"FontColor":"e6e6ff","MainColor":"0a0a1e","AccentColor":"4b0082","BackgroundColor":"050514","OutlineColor":"141432"}') },
		['Realitystone'] 	= { 89, httpService:JSONDecode('{"FontColor":"ffe6e6","MainColor":"1e0a0a","AccentColor":"b22222","BackgroundColor":"140505","OutlineColor":"320a0a"}') },
		['Powerstone'] 		= { 90, httpService:JSONDecode('{"FontColor":"ffffe6","MainColor":"1e1e0a","AccentColor":"ffd700","BackgroundColor":"141405","OutlineColor":"32320a"}') },
		['Ultimate'] 		= { 91, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000000","AccentColor":"ff00ff","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['Chaos'] 			= { 92, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1e001e","AccentColor":"ff00ff","BackgroundColor":"140014","OutlineColor":"320032"}') },
		['Order'] 			= { 93, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"001e00","AccentColor":"00ff00","BackgroundColor":"001400","OutlineColor":"003200"}') },
		['Balance'] 		= { 94, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1e1e00","AccentColor":"ffff00","BackgroundColor":"141400","OutlineColor":"323200"}') },
		['Light'] 			= { 95, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ffffff","AccentColor":"ffaa00","BackgroundColor":"f0f0f0","OutlineColor":"dcdcdc"}') },
		['Dark'] 			= { 96, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000000","AccentColor":"0055ff","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['Shadow'] 			= { 97, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"0a0a0a","AccentColor":"323232","BackgroundColor":"050505","OutlineColor":"141414"}') },
		['Ghost'] 			= { 98, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1e1e1e","AccentColor":"dcdcdc","BackgroundColor":"141414","OutlineColor":"323232"}') },
		['Phantom V2'] 		= { 99, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"140a1e","AccentColor":"aa64ff","BackgroundColor":"0a0514","OutlineColor":"1e0a32"}') },
		['Starlight Pro'] 	= { 100, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"050214","AccentColor":"96dcff","BackgroundColor":"03010a","OutlineColor":"0a0528"}') },
		['Nebula']           = { 101, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"0a051e","AccentColor":"c8a2c8","BackgroundColor":"050214","OutlineColor":"1e0f3c"}') },
		['Cyber Neon']       = { 102, httpService:JSONDecode('{"FontColor":"00ffff","MainColor":"000514","AccentColor":"ff00ff","BackgroundColor":"00030a","OutlineColor":"0a1e3c"}') },
		['Midnight Purple']  = { 103, httpService:JSONDecode('{"FontColor":"e6e6ff","MainColor":"0a0a1e","AccentColor":"9370db","BackgroundColor":"050514","OutlineColor":"1e1e3c"}') },
		['Emerald Pro']      = { 104, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"0a1e0a","AccentColor":"00ffaa","BackgroundColor":"051405","OutlineColor":"0a320a"}') },
		['Crimson Pro']      = { 105, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1e0505","AccentColor":"ff3333","BackgroundColor":"140303","OutlineColor":"3c0a0a"}') },
		['Arctic']           = { 106, httpService:JSONDecode('{"FontColor":"000000","MainColor":"e6f7ff","AccentColor":"0099cc","BackgroundColor":"ccf2ff","OutlineColor":"99e6ff"}') },
		['Molten']           = { 107, httpService:JSONDecode('{"FontColor":"ffffe6","MainColor":"331a00","AccentColor":"ff6600","BackgroundColor":"1a0d00","OutlineColor":"663300"}') },
		['Aurora']           = { 108, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"001a33","AccentColor":"00ffcc","BackgroundColor":"000d1a","OutlineColor":"003366"}') },
		['Royal']            = { 109, httpService:JSONDecode('{"FontColor":"ffffe6","MainColor":"1a0033","AccentColor":"9966ff","BackgroundColor":"0d001a","OutlineColor":"330066"}') },
		['Steel']            = { 110, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"333333","AccentColor":"cccccc","BackgroundColor":"1a1a1a","OutlineColor":"4d4d4d"}') },
		['Cobalt']           = { 111, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"001f4d","AccentColor":"0077ff","BackgroundColor":"000f26","OutlineColor":"003d99"}') },
		['Lime']             = { 112, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ccffcc","AccentColor":"99ff33","BackgroundColor":"aaffaa","OutlineColor":"77dd77"}') },
		['Rose']             = { 113, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ffccdd","AccentColor":"ff6699","BackgroundColor":"ffaabb","OutlineColor":"ff88aa"}') },
		['Violet']           = { 114, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"330066","AccentColor":"cc99ff","BackgroundColor":"1a0033","OutlineColor":"6600cc"}') },
		['Sakura']           = { 115, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ffd6e5","AccentColor":"ff69b4","BackgroundColor":"ffb3d9","OutlineColor":"ff8fc9"}') },
		['Dragon']           = { 116, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"4d0000","AccentColor":"ff3333","BackgroundColor":"260000","OutlineColor":"990000"}') },
		['Phoenix']          = { 117, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ffcc00","AccentColor":"ff6600","BackgroundColor":"ff9900","OutlineColor":"ff3300"}') },
		['Turtle']           = { 118, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ccffcc","AccentColor":"66cc66","BackgroundColor":"aaffaa","OutlineColor":"88dd88"}') },
		['Wolf']             = { 119, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"333333","AccentColor":"999999","BackgroundColor":"1a1a1a","OutlineColor":"666666"}') },
		['Fox']              = { 120, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ffcc99","AccentColor":"ff9966","BackgroundColor":"ffbb88","OutlineColor":"ffaa77"}') },
		['Rainbow']          = { 121, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ffccff","AccentColor":"ff00ff","BackgroundColor":"ff99ff","OutlineColor":"ff66ff"}') },
		['Pastel']           = { 122, httpService:JSONDecode('{"FontColor":"000000","MainColor":"e6f7ff","AccentColor":"ffb3e6","BackgroundColor":"f0f8ff","OutlineColor":"d9f2ff"}') },
		['Retro']            = { 123, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ffcc00","AccentColor":"ff0066","BackgroundColor":"ffff99","OutlineColor":"ff9900"}') },
		['Gothic']           = { 124, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000000","AccentColor":"990000","BackgroundColor":"1a1a1a","OutlineColor":"333333"}') },
		['Vaporwave']        = { 125, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ff66cc","AccentColor":"00ffff","BackgroundColor":"ff99ff","OutlineColor":"ff33cc"}') },
		['Synthwave']        = { 126, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000066","AccentColor":"ff00ff","BackgroundColor":"000033","OutlineColor":"000099"}') },
		['Outrun']           = { 127, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000033","AccentColor":"ff00ff","BackgroundColor":"000019","OutlineColor":"000066"}') },
		['Glitch']           = { 128, httpService:JSONDecode('{"FontColor":"00ff00","MainColor":"000000","AccentColor":"ff00ff","BackgroundColor":"0a0a0a","OutlineColor":"00ffff"}') },
		['Matrix Pro']       = { 129, httpService:JSONDecode('{"FontColor":"00ff00","MainColor":"000a00","AccentColor":"00ff00","BackgroundColor":"000500","OutlineColor":"001e00"}') },
		['Terminal']         = { 130, httpService:JSONDecode('{"FontColor":"00ff00","MainColor":"000a0a","AccentColor":"00ffff","BackgroundColor":"000505","OutlineColor":"001e1e"}') },
		['Hacker']           = { 131, httpService:JSONDecode('{"FontColor":"00ff00","MainColor":"000a00","AccentColor":"00ff00","BackgroundColor":"000500","OutlineColor":"001e00"}') },
		['AI']               = { 132, httpService:JSONDecode('{"FontColor":"00ffff","MainColor":"000a1e","AccentColor":"00ffff","BackgroundColor":"000514","OutlineColor":"001e3c"}') },
		['Robot']            = { 133, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"333333","AccentColor":"00ccff","BackgroundColor":"1a1a1a","OutlineColor":"666666"}') },
		['Android']          = { 134, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"003300","AccentColor":"00cc00","BackgroundColor":"001a00","OutlineColor":"006600"}') },
		['iOS']              = { 135, httpService:JSONDecode('{"FontColor":"000000","MainColor":"f2f2f2","AccentColor":"007aff","BackgroundColor":"e6e6e6","OutlineColor":"cccccc"}') },
		['Windows']          = { 136, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"0078d7","AccentColor":"00bcf2","BackgroundColor":"005a9e","OutlineColor":"1c97ea"}') },
		['Linux']            = { 137, httpService:JSONDecode('{"FontColor":"000000","MainColor":"f2f2f2","AccentColor":"ff6600","BackgroundColor":"e6e6e6","OutlineColor":"cccccc"}') },
		['MacOS']            = { 138, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"323232","AccentColor":"007aff","BackgroundColor":"1e1e1e","OutlineColor":"4b4b4b"}') },
		['Chrome']           = { 139, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ffffff","AccentColor":"4285f4","BackgroundColor":"f2f2f2","OutlineColor":"e6e6e6"}') },
		['Firefox']          = { 140, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ffffff","AccentColor":"ff9500","BackgroundColor":"f2f2f2","OutlineColor":"e6e6e6"}') },
		['Opera']            = { 141, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"cc0000","AccentColor":"ffffff","BackgroundColor":"990000","OutlineColor":"ff3333"}') },
		['Edge']             = { 142, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ffffff","AccentColor":"0078d7","BackgroundColor":"f2f2f2","OutlineColor":"e6e6e6"}') },
		['Safari']           = { 143, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ffffff","AccentColor":"0066cc","BackgroundColor":"f2f2f2","OutlineColor":"e6e6e6"}') },
		['Brave']            = { 144, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ffffff","AccentColor":"fb542b","BackgroundColor":"f2f2f2","OutlineColor":"e6e6e6"}') },
		['Discord']          = { 145, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"36393f","AccentColor":"5865f2","BackgroundColor":"2f3136","OutlineColor":"40444b"}') },
		['Telegram']         = { 146, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"17212b","AccentColor":"0088cc","BackgroundColor":"0e1621","OutlineColor":"242f3d"}') },
		['WhatsApp']         = { 147, httpService:JSONDecode('{"FontColor":"000000","MainColor":"dcf8c6","AccentColor":"25d366","BackgroundColor":"ece5dd","OutlineColor":"ffffff"}') },
		['Twitter']          = { 148, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"15202b","AccentColor":"1da1f2","BackgroundColor":"0d151f","OutlineColor":"1c2938"}') },
		['Instagram']        = { 149, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000000","AccentColor":"e1306c","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['Facebook']         = { 150, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1877f2","AccentColor":"ffffff","BackgroundColor":"0f5bbd","OutlineColor":"3b5998"}') },
		['YouTube']          = { 151, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"282828","AccentColor":"ff0000","BackgroundColor":"1a1a1a","OutlineColor":"3c3c3c"}') },
		['Twitch']           = { 152, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"0f0f23","AccentColor":"9146ff","BackgroundColor":"0a0a19","OutlineColor":"1e1e3c"}') },
		['Reddit']           = { 153, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ffffff","AccentColor":"ff4500","BackgroundColor":"f2f2f2","OutlineColor":"e6e6e6"}') },
		['Spotify']          = { 154, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000000","AccentColor":"1db954","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['Netflix']          = { 155, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000000","AccentColor":"e50914","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['Amazon']           = { 156, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"131921","AccentColor":"ff9900","BackgroundColor":"0a0c10","OutlineColor":"232f3e"}') },
		['Google']           = { 157, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ffffff","AccentColor":"4285f4","BackgroundColor":"f2f2f2","OutlineColor":"e6e6e6"}') },
		['Microsoft']        = { 158, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"00a4ef","AccentColor":"ffb900","BackgroundColor":"0078d7","OutlineColor":"107c10"}') },
		['Apple']            = { 159, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000000","AccentColor":"a6b1b7","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['Samsung']          = { 160, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1428a0","AccentColor":"00b5e2","BackgroundColor":"0d1c6b","OutlineColor":"1e3cc8"}') },
		['Sony']             = { 161, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000000","AccentColor":"0066cc","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['PlayStation']      = { 162, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"003087","AccentColor":"ffffff","BackgroundColor":"001f4d","OutlineColor":"0055a4"}') },
		['Xbox']             = { 163, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"107c10","AccentColor":"ffffff","BackgroundColor":"0a4d0a","OutlineColor":"15a015"}') },
		['Nintendo']         = { 164, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"e60012","AccentColor":"ffffff","BackgroundColor":"99000c","OutlineColor":"ff3333"}') },
		['Steam']            = { 165, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"171a21","AccentColor":"1b9eee","BackgroundColor":"0d0f14","OutlineColor":"2a475e"}') },
		['Epic']             = { 166, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"121212","AccentColor":"2a2a2a","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['Ubisoft']          = { 167, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000000","AccentColor":"0078f2","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['EA']               = { 168, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000000","AccentColor":"ff0000","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['Blizzard']         = { 169, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"0a1e3c","AccentColor":"00aeff","BackgroundColor":"05142a","OutlineColor":"0f3264"}') },
		['Riot']             = { 170, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000000","AccentColor":"d13639","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['Valorant']         = { 171, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"0f1923","AccentColor":"ff4655","BackgroundColor":"0a1019","OutlineColor":"1e2a3c"}') },
		['CSGO']             = { 172, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a3c5f","AccentColor":"f2a51a","BackgroundColor":"0f2842","OutlineColor":"2d5a8c"}') },
		['Dota']             = { 173, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a1a2e","AccentColor":"e6a92a","BackgroundColor":"0f0f1e","OutlineColor":"2d2d4a"}') },
		['LoL']              = { 174, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"091428","AccentColor":"c89b3c","BackgroundColor":"050a14","OutlineColor":"0d1f3c"}') },
		['Fortnite']         = { 175, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a2c42","AccentColor":"5dadec","BackgroundColor":"0f1e32","OutlineColor":"2d4a7a"}') },
		['Minecraft']        = { 176, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"3b8520","AccentColor":"ffaa00","BackgroundColor":"2a6416","OutlineColor":"5aa32c"}') },
		['Roblox']           = { 177, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ffffff","AccentColor":"ff0000","BackgroundColor":"f2f2f2","OutlineColor":"e6e6e6"}') },
		['Among Us']         = { 178, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a1a2e","AccentColor":"ff4655","BackgroundColor":"0f0f1e","OutlineColor":"2d2d4a"}') },
		['Fall Guys']        = { 179, httpService:JSONDecode('{"FontColor":"000000","MainColor":"ffcc00","AccentColor":"ff0066","BackgroundColor":"ff9900","OutlineColor":"ff6600"}') },
		['Apex']             = { 180, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a1a2e","AccentColor":"ff4655","BackgroundColor":"0f0f1e","OutlineColor":"2d2d4a"}') },
		['Overwatch']        = { 181, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a2c42","AccentColor":"f99e1a","BackgroundColor":"0f1e32","OutlineColor":"2d4a7a"}') },
		['Warzone']          = { 182, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a1a2e","AccentColor":"ff4655","BackgroundColor":"0f0f1e","OutlineColor":"2d2d4a"}') },
		['Rocket League']    = { 183, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a2c42","AccentColor":"ff8c00","BackgroundColor":"0f1e32","OutlineColor":"2d4a7a"}') },
		['GTA']              = { 184, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a2c42","AccentColor":"ff8c00","BackgroundColor":"0f1e32","OutlineColor":"2d4a7a"}') },
		['Cyberpunk 2077']   = { 185, httpService:JSONDecode('{"FontColor":"00ffff","MainColor":"000a1e","AccentColor":"ff00ff","BackgroundColor":"000514","OutlineColor":"001e3c"}') },
		['Witcher']          = { 186, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a0a0a","AccentColor":"cc0000","BackgroundColor":"0f0505","OutlineColor":"330a0a"}') },
		['Skyrim']           = { 187, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a2c42","AccentColor":"cc9900","BackgroundColor":"0f1e32","OutlineColor":"2d4a7a"}') },
		['Dark Souls']       = { 188, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000000","AccentColor":"8b0000","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['Elden Ring']       = { 189, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a0a0a","AccentColor":"ffd700","BackgroundColor":"0f0505","OutlineColor":"330a0a"}') },
		['Halo']             = { 190, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a2c42","AccentColor":"00aeff","BackgroundColor":"0f1e32","OutlineColor":"2d4a7a"}') },
		['Destiny']          = { 191, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a2c42","AccentColor":"00aeff","BackgroundColor":"0f1e32","OutlineColor":"2d4a7a"}') },
		['Borderlands']      = { 192, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a2c42","AccentColor":"ff8c00","BackgroundColor":"0f1e32","OutlineColor":"2d4a7a"}') },
		['Mass Effect']      = { 193, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a2c42","AccentColor":"00aeff","BackgroundColor":"0f1e32","OutlineColor":"2d4a7a"}') },
		['Star Wars']        = { 194, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000000","AccentColor":"ffd700","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['Star Trek']        = { 195, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000033","AccentColor":"cc9900","BackgroundColor":"000019","OutlineColor":"000066"}') },
		['Marvel']           = { 196, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000000","AccentColor":"ed1d24","BackgroundColor":"0a0a0a","OutlineColor":"1e1e1e"}') },
		['DC']               = { 197, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"000033","AccentColor":"0066cc","BackgroundColor":"000019","OutlineColor":"000066"}') },
		['Harry Potter']     = { 198, httpService:JSONDecode('{"FontColor":"ffffe6","MainColor":"1a0a0a","AccentColor":"cc9900","BackgroundColor":"0f0505","OutlineColor":"330a0a"}') },
		['Lord of the Rings']= { 199, httpService:JSONDecode('{"FontColor":"ffffe6","MainColor":"1a0a0a","AccentColor":"cc9900","BackgroundColor":"0f0505","OutlineColor":"330a0a"}') },
		['Game of Thrones']  = { 200, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a0a0a","AccentColor":"8b0000","BackgroundColor":"0f0505","OutlineColor":"330a0a"}') },
	}

	function ThemeManager:ApplyTheme(theme)
		local customThemeData = self:GetCustomTheme(theme)
		local data = customThemeData or self.BuiltInThemes[theme]

		if not data then return end

		-- custom themes are just regular dictionaries instead of an array with { index, dictionary }

		local scheme = data[2]
		for idx, col in next, customThemeData or scheme do
			self.Library[idx] = Color3.fromHex(col)
			
			if Options[idx] then
				Options[idx]:SetValueRGB(Color3.fromHex(col))
			end
		end

		self:ThemeUpdate()
	end

	function ThemeManager:ThemeUpdate()
		-- This allows us to force apply themes without loading the themes tab :)
		local options = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }
		for i, field in next, options do
			if Options and Options[field] then
				self.Library[field] = Options[field].Value
			end
		end

		self.Library.AccentColorDark = self.Library:GetDarkerColor(self.Library.AccentColor);
		self.Library:UpdateColorsUsingRegistry()
	end

	function ThemeManager:LoadDefault()		
		local theme = 'Default'
		local content = isfile(self.Folder .. '/themes/default.txt') and readfile(self.Folder .. '/themes/default.txt')

		local isDefault = true
		if content then
			if self.BuiltInThemes[content] then
				theme = content
			elseif self:GetCustomTheme(content) then
				theme = content
				isDefault = false;
			end
		elseif self.BuiltInThemes[self.DefaultTheme] then
		 	theme = self.DefaultTheme
		end

		if isDefault then
			Options.ThemeManager_ThemeList:SetValue(theme)
		else
			self:ApplyTheme(theme)
		end
	end

	function ThemeManager:SaveDefault(theme)
		writefile(self.Folder .. '/themes/default.txt', theme)
	end

	function ThemeManager:CreateThemeManager(groupbox)
		groupbox:AddLabel('Background color'):AddColorPicker('BackgroundColor', { Default = self.Library.BackgroundColor });
		groupbox:AddLabel('Main color')	:AddColorPicker('MainColor', { Default = self.Library.MainColor });
		groupbox:AddLabel('Accent color'):AddColorPicker('AccentColor', { Default = self.Library.AccentColor });
		groupbox:AddLabel('Outline color'):AddColorPicker('OutlineColor', { Default = self.Library.OutlineColor });
		groupbox:AddLabel('Font color')	:AddColorPicker('FontColor', { Default = self.Library.FontColor });

		local ThemesArray = {}
		for Name, Theme in next, self.BuiltInThemes do
			table.insert(ThemesArray, Name)
		end

		table.sort(ThemesArray, function(a, b) return self.BuiltInThemes[a][1] < self.BuiltInThemes[b][1] end)

		groupbox:AddDivider()
		groupbox:AddDropdown('ThemeManager_ThemeList', { 
			Text = 'Theme list', 
			Values = ThemesArray, 
			Default = 1,
			Multi = false,
			AllowNull = false,
			Callback = function(value)
				self:ApplyTheme(value)
			end
		})

		groupbox:AddButton('Set as default', function()
			self:SaveDefault(Options.ThemeManager_ThemeList.Value)
			self.Library:Notify(string.format('Set default theme to %q', Options.ThemeManager_ThemeList.Value))
		end)

		groupbox:AddDivider()
		groupbox:AddInput('ThemeManager_CustomThemeName', { Text = 'Custom theme name' })
		groupbox:AddDropdown('ThemeManager_CustomThemeList', { Text = 'Custom themes', Values = self:ReloadCustomThemes(), AllowNull = true, Default = 1 })
		groupbox:AddDivider()
		
		groupbox:AddButton('Save theme', function() 
			self:SaveCustomTheme(Options.ThemeManager_CustomThemeName.Value)

			Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
			Options.ThemeManager_CustomThemeList:SetValue(nil)
		end):AddButton('Load theme', function() 
			self:ApplyTheme(Options.ThemeManager_CustomThemeList.Value) 
		end)

		groupbox:AddButton('Refresh list', function()
			Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
			Options.ThemeManager_CustomThemeList:SetValue(nil)
		end)

		groupbox:AddButton('Set as default', function()
			if Options.ThemeManager_CustomThemeList.Value ~= nil and Options.ThemeManager_CustomThemeList.Value ~= '' then
				self:SaveDefault(Options.ThemeManager_CustomThemeList.Value)
				self.Library:Notify(string.format('Set default theme to %q', Options.ThemeManager_CustomThemeList.Value))
			end
		end)

		ThemeManager:LoadDefault()

		local function UpdateTheme()
			self:ThemeUpdate()
		end

		Options.BackgroundColor:OnChanged(UpdateTheme)
		Options.MainColor:OnChanged(UpdateTheme)
		Options.AccentColor:OnChanged(UpdateTheme)
		Options.OutlineColor:OnChanged(UpdateTheme)
		Options.FontColor:OnChanged(UpdateTheme)
	end

	function ThemeManager:GetCustomTheme(file)
		local path = self.Folder .. '/themes/' .. file
		if not isfile(path) then
			return nil
		end

		local data = readfile(path)
		local success, decoded = pcall(httpService.JSONDecode, httpService, data)
		
		if not success then
			return nil
		end

		return decoded
	end

	function ThemeManager:SaveCustomTheme(file)
		if file:gsub(' ', '') == '' then
			return self.Library:Notify('Invalid file name for theme (empty)', 3)
		end

		local theme = {}
		local fields = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }

		for _, field in next, fields do
			theme[field] = Options[field].Value:ToHex()
		end

		writefile(self.Folder .. '/themes/' .. file .. '.json', httpService:JSONEncode(theme))
	end

	function ThemeManager:ReloadCustomThemes()
		local list = listfiles(self.Folder .. '/themes')

		local out = {}
		for i = 1, #list do
			local file = list[i]
			if file:sub(-5) == '.json' then
				-- i hate this but it has to be done ...

				local pos = file:find('.json', 1, true)
				local char = file:sub(pos, pos)

				while char ~= '/' and char ~= '\\' and char ~= '' do
					pos = pos - 1
					char = file:sub(pos, pos)
				end

				if char == '/' or char == '\\' then
					table.insert(out, file:sub(pos + 1))
				end
			end
		end

		return out
	end

	function ThemeManager:SetLibrary(lib)
		self.Library = lib
	end

	function ThemeManager:BuildFolderTree()
		local paths = {}

		-- build the entire tree if a path is like some-hub/phantom-forces
		-- makefolder builds the entire tree on Synapse X but not other exploits

		local parts = self.Folder:split('/')
		for idx = 1, #parts do
			paths[#paths + 1] = table.concat(parts, '/', 1, idx)
		end

		table.insert(paths, self.Folder .. '/themes')
		table.insert(paths, self.Folder .. '/settings')

		for i = 1, #paths do
			local str = paths[i]
			if not isfolder(str) then
				makefolder(str)
			end
		end
	end

	function ThemeManager:SetFolder(folder)
		self.Folder = folder
		self:BuildFolderTree()
	end

	function ThemeManager:CreateGroupBox(tab)
		assert(self.Library, 'Must set ThemeManager.Library first!')
		return tab:AddLeftGroupbox('Themes')
	end

	function ThemeManager:ApplyToTab(tab)
		assert(self.Library, 'Must set ThemeManager.Library first!')
		local groupbox = self:CreateGroupBox(tab)
		self:CreateThemeManager(groupbox)
	end

	function ThemeManager:ApplyToGroupbox(groupbox)
		assert(self.Library, 'Must set ThemeManager.Library first!')
		self:CreateThemeManager(groupbox)
	end

	ThemeManager:BuildFolderTree()
end

return ThemeManager
