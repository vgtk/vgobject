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

pub fn new_base_info(@type int /* GIInfoType */, container &BaseInfo, typelib &Typelib, offset u32) &BaseInfo {
	base_info := g_info_new(@type, container.c, typelib.c, offset)
	return &BaseInfo{base_info}
}

pub fn (bi &BaseInfo) ref() &BaseInfo {
	base_info := g_base_info_ref(bi.c)
	return &BaseInfo{base_info}
}

pub fn (bi &BaseInfo) unref() {
	g_base_info_unref(bi.c)
}

pub fn (bi &BaseInfo) equal(base_info &BaseInfo) bool{
	return g_base_info_equal(bi.c, base_info.c)
}

pub fn (bi &BaseInfo) get_type() int /* GIInfoType */ {
	return g_base_info_get_type(bi.c)
}

pub fn (bi &BaseInfo) get_typelib() &Typelib {
	typelib := g_base_info_get_typelib(bi.c)
	return &Typelib{typelib}
}

pub fn (bi &BaseInfo) get_namespace() string {
	namespace := g_base_info_get_namespace(bi.c)
	if isnil(namespace) { return '' }
	return tos_and_free(namespace)
}

pub fn (bi &BaseInfo) get_name() string {
	name := g_base_info_get_name(bi.c)
	return tos_and_free(name)
}

pub fn (bi &BaseInfo) get_attribute(name string) string {
	attribute := g_base_info_get_attribute(bi.c, name.str)
	return tos_and_free(attribute)
}

pub fn (bi &BaseInfo) iterate_attributes(cb fn(name, value string)) {
	iter := &GIAttributeIter(0)
	_name := ''
	_value := ''
	for g_base_info_iterate_attributes(bi.c, &iter, &_name.str, &_value.str) {
		cb(_name, _value)
	}
}

pub fn (bi &BaseInfo) get_container() &BaseInfo {
	container := g_base_info_get_container(bi.c)
	return &BaseInfo{container}
}

pub fn (bi &BaseInfo) g_base_info_is_deprecated() bool {
	return g_base_info_is_deprecated(bi.c)
}

pub fn infotype_to_string(@type int /* GIInfoType */) string {
	return tos3(g_info_type_to_string(@type))
}
