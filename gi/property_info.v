module gi

pub struct PropertyInfo {
	c &GIPropertyInfo
}

pub type ParamFlags int

const (
	PARAM_READABLE 			= ParamFlags(C.G_PARAM_READABLE)
	PARAM_WRITABLE 			= ParamFlags(C.G_PARAM_WRITABLE)
	PARAM_READWRITE 		= ParamFlags(C.G_PARAM_READWRITE)
	PARAM_CONSTRUCT 		= ParamFlags(C.G_PARAM_CONSTRUCT)
	PARAM_CONSTRUCT_ONLY 	= ParamFlags(C.G_PARAM_CONSTRUCT_ONLY)
	PARAM_LAX_VALIDATION 	= ParamFlags(C.G_PARAM_LAX_VALIDATION)
	PARAM_STATIC_NAME 		= ParamFlags(C.G_PARAM_STATIC_NAME)
	PARAM_STATIC_NICK 		= ParamFlags(C.G_PARAM_STATIC_NICK)
	PARAM_STATIC_BLURB 		= ParamFlags(C.G_PARAM_STATIC_BLURB)
	PARAM_EXPLICIT_NOTIFY 	= ParamFlags(C.G_PARAM_EXPLICIT_NOTIFY)
	PARAM_DEPRECATED 		= ParamFlags(C.G_PARAM_DEPRECATED)
)

pub fn (pi &PropertyInfo) get_flags() ParamFlags {
	return g_property_info_get_flags(pi.c)
}

pub fn (pi &PropertyInfo) get_ownership_transfer() Transfer {
	return g_property_info_get_ownership_transfer(pi.c)
}

pub fn (pi &PropertyInfo) get_type() &TypeInfo {
	cptr := &GIBaseInfo(g_property_info_get_type(pi.c))
	ptr := &BaseInfo{cptr}
	return &TypeInfo(ptr)
}

pub fn (pi &PropertyInfo) unref() {
	g_base_info_unref(pi.c)
}
