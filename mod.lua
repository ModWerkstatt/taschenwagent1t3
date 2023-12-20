function data()
return {
	info = {
		minorVersion = 0,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
			{
		        name = "jay_",
		        role = "CREATOR",
		    },
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },

		},
		tags = { "europe", "container", "Intermodal", "taschenwagen", "wagon", },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },
	  
		params = {
			{
				key = "taschwagenT1T3fake",
				name = _("Fake_taschwagenT1T3_wagen"),
				values = { "No", "Yes", },
				defaultIndex = 0,
			},	
        },
	},
	options = {
	},
	
	runFn = function (settings, modParams)
	local params = modParams[getCurrentModId()]

        local hidden = {
			["db06_fake.mdl"] = true,
			["db73_fake.mdl"] = true,
			["db80_fake.mdl"] = true,
			["db80_pritsche_fake.mdl"] = true,
			["db94_fake.mdl"] = true,
			["db94_pritsche_fake.mdl"] = true,
			["fs_fake.mdl"] = true,
			["hupac06_fake.mdl"] = true,
			["hupac73_fake.mdl"] = true,
			["hupac90_fake.mdl"] = true,
			["hupac90_pritsche_fake.mdl"] = true,
			["novatrans_fake.mdl"] = true,
			["novatrans2_fake.mdl"] = true,
			["novatrans06_fake.mdl"] = true,
			["novatrans80_fake.mdl"] = true,
			["oebb_fake.mdl"] = true,
			["oebb_pritsche_fake.mdl"] = true,
			["oebb2_fake.mdl"] = true,
			["sati_fake.mdl"] = true,
			["segi_fake.mdl"] = true,
			["db80_wohlfahrt_fake.mdl"] = true,
			["db94_lauritzen_fake.mdl"] = true,
			["fs_sae_fake.mdl"] = true,
			["hupac73_wetram_fake.mdl"] = true,
			["hupac90_hangartner_fake.mdl"] = true,
			["oebb_lkwWalter_fake.mdl"] = true,
			["segi_danzas_fake.mdl"] = true,
			
			["aae_fake.mdl"] = true,
			["aae_danzas_fake.mdl"] = true,
			["db_fake.mdl"] = true,
			["db2_fake.mdl"] = true,
			["dsb_fake.mdl"] = true,
			["dsb_sattel_fake.mdl"] = true,
			["dsb_dsbGods_fake.mdl"] = true,
			["dsb_norsk_fake.mdl"] = true,
			["hupac_fake.mdl"] = true,
			["hupac_pritsche_fake.mdl"] = true,
			["hupac_hangartner_fake.mdl"] = true,
			["hupac06_fake.mdl"] = true,
			["kombiwaggon_fake.mdl"] = true,
			["kombiwaggon_pritsche_fake.mdl"] = true,
			["oebb_fake.mdl"] = true,
			["oebb06_fake.mdl"] = true,
			["oebb_pritsche_fake.mdl"] = true,
			["oebb_walter_fake.mdl"] = true,
			["sj_fake.mdl"] = true,
			["sj_sattel_fake.mdl"] = true,
        }

		local modelFilter = function(fileName, data)
			local modelName = fileName:match('/t1_([^/]*.mdl)')			
						or fileName:match('/t3_([^/]*.mdl)')
			return (modelName==nil or hidden[modelName]~=true)
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["taschwagenT1T3fake"] == 0 then
				addFileFilter("model/vehicle", modelFilter)
			end
		else
			addFileFilter("model/vehicle", modelFilter)
		end
		
		addModifier( "loadModel", metadataHandler )
	end
	}
end
