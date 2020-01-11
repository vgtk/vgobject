module gi

pub struct PropertyInfo {
	c &GIPropertyInfo
}

const (
	PARAM_READABLE 			= C.G_PARAM_READABLE
	PARAM_WRITABLE 			= C.G_PARAM_WRITABLE
	PARAM_READWRITE 		= C.G_PARAM_READWRITE
	PARAM_CONSTRUCT 		= C.G_PARAM_CONSTRUCT
	PARAM_CONSTRUCT_ONLY 	= C.G_PARAM_CONSTRUCT_ONLY
	PARAM_LAX_VALIDATION 	= C.G_PARAM_LAX_VALIDATION
	PARAM_STATIC_NAME 		= C.G_PARAM_STATIC_NAME
	PARAM_STATIC_NICK 		= C.G_PARAM_STATIC_NICK
	PARAM_STATIC_BLURB 		= C.G_PARAM_STATIC_BLURB
	PARAM_EXPLICIT_NOTIFY 	= C.G_PARAM_EXPLICIT_NOTIFY
	PARAM_DEPRECATED 		= C.G_PARAM_DEPRECATED
)

pub fn (pi &PropertyInfo) get_flags() int /* GParamFlags */ {
	return g_property_info_get_flags(pi.c)
}

pub fn (pi &PropertyInfo) get_ownership_transfer() int /* GITransfer */ {
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
