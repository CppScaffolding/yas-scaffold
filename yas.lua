-- scaffold geniefile for yas

yas_script = path.getabsolute(path.getdirectory(_SCRIPT))
yas_root = path.join(yas_script, "yas")

yas_includedirs = {
	path.join(yas_script, "config"),
	yas_root,
}

yas_libdirs = {}
yas_links = {}
yas_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { yas_includedirs }
	end,

	_add_defines = function()
		defines { yas_defines }
	end,

	_add_libdirs = function()
		libdirs { yas_libdirs }
	end,

	_add_external_links = function()
		links { yas_links }
	end,

	_add_self_links = function()
		links { "yas" }
	end,

	_create_projects = function()

project "yas"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		yas_includedirs,
	}

	defines {}

	files {
		path.join(yas_script, "config", "**.h"),
		path.join(yas_root, "**.h"),
		path.join(yas_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
