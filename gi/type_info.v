module gi

pub struct TypeInfo {
	c &GITypeInfo
}

pub type ArrayType	int
pub type TypeTag	int

const (
	ARRAY_TYPE_C          = ArrayType(C.GI_ARRAY_TYPE_C)
	ARRAY_TYPE_ARRAY      = ArrayType(C.GI_ARRAY_TYPE_ARRAY)
	ARRAY_TYPE_PTR_ARRAY  = ArrayType(C.GI_ARRAY_TYPE_PTR_ARRAY)
	ARRAY_TYPE_BYTE_ARRAY = ArrayType(C.GI_ARRAY_TYPE_BYTE_ARRAY)
)

pub const (
	TYPE_TAG_VOID      = TypeTag(C.GI_TYPE_TAG_VOID)
	TYPE_TAG_BOOLEAN   = TypeTag(C.GI_TYPE_TAG_BOOLEAN)
	TYPE_TAG_INT8      = TypeTag(C.GI_TYPE_TAG_INT8)
	TYPE_TAG_UINT8     = TypeTag(C.GI_TYPE_TAG_UINT8)
	TYPE_TAG_INT16     = TypeTag(C.GI_TYPE_TAG_INT16)
	TYPE_TAG_UINT16    = TypeTag(C.GI_TYPE_TAG_UINT16)
	TYPE_TAG_INT32     = TypeTag(C.GI_TYPE_TAG_INT32)
	TYPE_TAG_UINT32    = TypeTag(C.GI_TYPE_TAG_UINT32)
	TYPE_TAG_INT64     = TypeTag(C.GI_TYPE_TAG_INT64)
	TYPE_TAG_UINT64    = TypeTag(C.GI_TYPE_TAG_UINT64)
	TYPE_TAG_FLOAT     = TypeTag(C.GI_TYPE_TAG_FLOAT)
	TYPE_TAG_DOUBLE    = TypeTag(C.GI_TYPE_TAG_DOUBLE)
	TYPE_TAG_GTYPE     = TypeTag(C.GI_TYPE_TAG_GTYPE)
	TYPE_TAG_UTF8      = TypeTag(C.GI_TYPE_TAG_UTF8)
	TYPE_TAG_FILENAME  = TypeTag(C.GI_TYPE_TAG_FILENAME)
	TYPE_TAG_ARRAY     = TypeTag(C.GI_TYPE_TAG_ARRAY)
	TYPE_TAG_INTERFACE = TypeTag(C.GI_TYPE_TAG_INTERFACE)
	TYPE_TAG_GLIST     = TypeTag(C.GI_TYPE_TAG_GLIST)
	TYPE_TAG_GSLIST    = TypeTag(C.GI_TYPE_TAG_GSLIST)
	TYPE_TAG_GHASH     = TypeTag(C.GI_TYPE_TAG_GHASH)
	TYPE_TAG_ERROR     = TypeTag(C.GI_TYPE_TAG_ERROR)
	TYPE_TAG_UNICHAR   = TypeTag(C.GI_TYPE_TAG_UNICHAR)
)

pub fn (ti &TypeInfo) is_pointer() bool {
	return g_type_info_is_pointer(ti.c)
}

pub fn (ti &TypeInfo) get_tag() TypeTag{
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

pub fn (ti &TypeInfo) get_array_type() ArrayType {
	return g_type_info_get_array_type(ti.c)
}

pub fn (ti &TypeInfo) get_cptr() voidptr {
	return ti.c
}

pub fn (tt TypeTag) str() string {
	return tos3(g_type_tag_to_string(tt))
}

/* Inherits from BaseInfo */

pub fn (tt &TypeInfo) unref() {
	g_base_info_unref(tt.c)
}
