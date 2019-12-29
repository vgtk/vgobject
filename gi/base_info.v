module gi

struct BaseInfo {
	c &GIBaseInfo
}

pub const (
	INFO_TYPE_INVALID		= C.GI_INFO_TYPE_INVALID
	INFO_TYPE_FUNCTION		= C.GI_INFO_TYPE_FUNCTION
	INFO_TYPE_CALLBACK		= C.GI_INFO_TYPE_CALLBACK
	INFO_TYPE_STRUCT		= C.GI_INFO_TYPE_STRUCT
	INFO_TYPE_BOXED			= C.GI_INFO_TYPE_BOXED
	INFO_TYPE_ENUM			= C.GI_INFO_TYPE_ENUM
	INFO_TYPE_FLAGS			= C.GI_INFO_TYPE_FLAGS
	INFO_TYPE_OBJECT		= C.GI_INFO_TYPE_OBJECT
	INFO_TYPE_INTERFACE		= C.GI_INFO_TYPE_INTERFACE
	INFO_TYPE_CONSTANT		= C.GI_INFO_TYPE_CONSTANT
	INFO_TYPE_INVALID_0		= C.GI_INFO_TYPE_INVALID_0
	INFO_TYPE_UNION			= C.GI_INFO_TYPE_UNION
	INFO_TYPE_VALUE			= C.GI_INFO_TYPE_VALUE
	INFO_TYPE_SIGNAL		= C.GI_INFO_TYPE_SIGNAL
	INFO_TYPE_VFUNC			= C.GI_INFO_TYPE_VFUNC
	INFO_TYPE_PROPERTY		= C.GI_INFO_TYPE_PROPERTY
	INFO_TYPE_FIELD			= C.GI_INFO_TYPE_FIELD
	INFO_TYPE_ARG			= C.GI_INFO_TYPE_ARG
	INFO_TYPE_TYPE			= C.GI_INFO_TYPE_TYPE
	INFO_TYPE_UNRESOLVED	= C.GI_INFO_TYPE_UNRESOLVED
)

pub fn infotype_to_string(@type int /* GIInfoType */) string {
	return tos3(g_info_type_to_string(@type))
}