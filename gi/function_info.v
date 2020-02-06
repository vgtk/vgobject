module gi

pub struct FunctionInfo {
	c &FunctionInfo
}

pub type FunctionInfoFlags int

pub const (
	FUNCTION_IS_METHOD      = FunctionInfoFlags(C.GI_FUNCTION_IS_METHOD)
	FUNCTION_IS_CONSTRUCTOR = FunctionInfoFlags(C.GI_FUNCTION_IS_CONSTRUCTOR)
	FUNCTION_IS_GETTER      = FunctionInfoFlags(C.GI_FUNCTION_IS_GETTER)
	FUNCTION_IS_SETTER      = FunctionInfoFlags(C.GI_FUNCTION_IS_SETTER)
	FUNCTION_WRAPS_VFUNC    = FunctionInfoFlags(C.GI_FUNCTION_WRAPS_VFUNC)
	FUNCTION_THROWS         = FunctionInfoFlags(C.GI_FUNCTION_THROWS)
)

pub fn (fi &FunctionInfo) get_flags() FunctionInfoFlags {
	return g_function_info_get_flags(fi.c)
}

pub fn (fi &FunctionInfo) get_property() &PropertyInfo {
	cptr := &GIBaseInfo(g_function_info_get_property(fi.c))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &PropertyInfo(ptr)
}

pub fn (fi &FunctionInfo) get_symbol() string {
	symbol := g_function_info_get_symbol(fi.c)
	return tos3(symbol)
}

pub fn (fi &FunctionInfo) get_vfunc() &VFuncInfo {
	cptr := &GIBaseInfo(g_function_info_get_vfunc(fi.c))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &VFuncInfo(ptr)
}

//gboolean	g_function_info_invoke (GIFunctionInfo *info,
//									const GIArgument *in_args,
//									int n_in_args,
//									const GIArgument *out_args,
//									int n_out_args,
//									GIArgument *return_value,
//									GError **error)

pub fn (fi &FunctionInfo) is_valid() bool {
	return GI_IS_FUNCTION_INFO(fi.c)
}

pub fn (fi &FunctionInfo) get_cptr() voidptr {
	return fi.c
}

/* Inherits from BaseInfo */

pub fn (fi &FunctionInfo) unref() {
	g_base_info_unref(fi.c)
}
