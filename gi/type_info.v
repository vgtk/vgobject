module gi

pub struct TypeInfo {
	c &GITypeInfo
}

const (
	ARRAY_TYPE_C          = C.GI_ARRAY_TYPE_C
	ARRAY_TYPE_ARRAY      = C.GI_ARRAY_TYPE_ARRAY
	ARRAY_TYPE_PTR_ARRAY  = C.GI_ARRAY_TYPE_PTR_ARRAY
	ARRAY_TYPE_BYTE_ARRAY = C.GI_ARRAY_TYPE_BYTE_ARRAY
)

const (
	TYPE_TAG_VOID      = C.GI_TYPE_TAG_VOID
	TYPE_TAG_BOOLEAN   = C.GI_TYPE_TAG_BOOLEAN
	TYPE_TAG_INT8      = C.GI_TYPE_TAG_INT8
	TYPE_TAG_UINT8     = C.GI_TYPE_TAG_UINT8
	TYPE_TAG_INT16     = C.GI_TYPE_TAG_INT16
	TYPE_TAG_UINT16    = C.GI_TYPE_TAG_UINT16
	TYPE_TAG_INT32     = C.GI_TYPE_TAG_INT32
	TYPE_TAG_UINT32    = C.GI_TYPE_TAG_UINT32
	TYPE_TAG_INT64     = C.GI_TYPE_TAG_INT64
	TYPE_TAG_UINT64    = C.GI_TYPE_TAG_UINT64
	TYPE_TAG_FLOAT     = C.GI_TYPE_TAG_FLOAT
	TYPE_TAG_DOUBLE    = C.GI_TYPE_TAG_DOUBLE
	TYPE_TAG_GTYPE     = C.GI_TYPE_TAG_GTYPE
	TYPE_TAG_UTF8      = C.GI_TYPE_TAG_UTF8
	TYPE_TAG_FILENAME  = C.GI_TYPE_TAG_FILENAME
	TYPE_TAG_ARRAY     = C.GI_TYPE_TAG_ARRAY
	TYPE_TAG_INTERFACE = C.GI_TYPE_TAG_INTERFACE
	TYPE_TAG_GLIST     = C.GI_TYPE_TAG_GLIST
	TYPE_TAG_GSLIST    = C.GI_TYPE_TAG_GSLIST
	TYPE_TAG_GHASH     = C.GI_TYPE_TAG_GHASH
	TYPE_TAG_ERROR     = C.GI_TYPE_TAG_ERROR
	TYPE_TAG_UNICHAR   = C.GI_TYPE_TAG_UNICHAR
)

pub fn (ti &TypeInfo) is_pointer() bool {
	return g_type_info_is_pointer(ti.c)
}

pub fn (ti &TypeInfo) get_tag() int /* GITypeTag */{
	return g_type_info_get_tag(ti.c)
}

pub fn (ti &TypeInfo) get_param_type(n int) &TypeInfo {
	cptr := &GIBaseInfo(g_type_info_get_param_type(ti.c, n))
	ptr := &BaseInfo{cptr}
	return &TypeInfo(ptr)
}

pub fn (ti &TypeInfo) get_interface() &BaseInfo {
	cptr := g_type_info_get_interface(ti.c)
	return &BaseInfo{cptr}
}

pub fn (ti &TypeInfo) get_array_length() int {
	return g_type_info_get_array_length(ti.c)
}

pub fn (ti &TypeInfo) get_array_fixed_size() int {
	return g_type_info_get_array_fixed_size(ti.c)
}

pub fn (ti &TypeInfo) is_zero_terminated() bool {
	return g_type_info_is_zero_terminated(ti.c)
}

pub fn (ti &TypeInfo) get_array_type() int /* GIArrayType */ {
	return g_type_info_get_array_type(ti.c)
}
