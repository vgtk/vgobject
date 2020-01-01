module gi

struct FunctionInfo {
	cai &CallableInfo
}

const (
	FUNCTION_IS_METHOD      = C.GI_FUNCTION_IS_METHOD
	FUNCTION_IS_CONSTRUCTOR = C.GI_FUNCTION_IS_CONSTRUCTOR
	FUNCTION_IS_GETTER      = C.GI_FUNCTION_IS_GETTER
	FUNCTION_IS_SETTER      = C.GI_FUNCTION_IS_SETTER
	FUNCTION_WRAPS_VFUNC    = C.GI_FUNCTION_WRAPS_VFUNC
	FUNCTION_THROWS         = C.GI_FUNCTION_THROWS
)

fn (fi &FunctionInfo) get_flags() int /* GIFunctionInfoFlags */ {
	return g_function_info_get_flags(fi.cai.c)
}

fn (fi &FunctionInfo) get_property() &PropertyInfo {
	cptr := &GIBaseInfo(g_function_info_get_property(fi.cai.c))
	if isnil(cptr) { return 0 }
	ptr := &BaseInfo{cptr}
	return &PropertyInfo(ptr)
}

fn (fi &FunctionInfo) get_symbol() string {
	symbol := g_function_info_get_symbol(fi.cai.c)
	return tos_and_free(symbol)
}

fn (fi &FunctionInfo) get_vfunc() &VFuncInfo {
	cptr := &GIBaseInfo(g_function_info_get_vfunc(fi.cai.c))
	if isnil(cptr) { return 0 }
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



// 
