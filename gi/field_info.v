module gi

pub struct FieldInfo {
	c &GIFieldInfo
}

pub const (
	FIELD_IS_READABLE = C.GI_FIELD_IS_READABLE
	FIELD_IS_WRITABLE = C.GI_FIELD_IS_WRITABLE
)

pub fn (fi &FieldInfo) get_field(mem voidptr, arg &GIArgument) bool {
	return g_field_info_get_field(fi.c, mem, arg)
}

pub fn (fi &FieldInfo) set_field(mem voidptr, arg &GIArgument) bool {
	return g_field_info_set_field(fi.c, mem, arg)
}

pub fn (fi &FieldInfo) get_flags() int /* GIFieldInfoFlags */ {
	return g_field_info_get_flags(fi.c)
}

pub fn (fi &FieldInfo) get_offset() int {
	return g_field_info_get_offset(fi.c)
}

pub fn (fi &FieldInfo) get_size() int {
	return g_field_info_get_size(fi.c)
}

pub fn (fi &FieldInfo) get_type() &TypeInfo {
	cptr := &GIBaseInfo(g_field_info_get_type(fi.c))
	ptr := &BaseInfo{cptr}
	return &TypeInfo(ptr)
}
