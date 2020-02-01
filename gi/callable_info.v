module gi

pub struct CallableInfo {
	c &GICallableInfo
}

pub fn (ci &CallableInfo) can_throw_gerror() bool {
	return g_callable_info_can_throw_gerror(ci.c)
}

pub fn (ci &CallableInfo) get_n_args() int {
	return g_callable_info_get_n_args(ci.c)
}

pub fn (ci &CallableInfo) get_arg(n int) &ArgInfo {
	cptr := &GIBaseInfo(g_callable_info_get_arg(ci.c, n))
	ptr := &BaseInfo{cptr}
	return &ArgInfo(ptr)
}

pub fn (ci &CallableInfo) get_caller_owns() Transfer {
	return g_callable_info_get_caller_owns(ci.c)
}

pub fn (ci &CallableInfo) get_instance_ownership_transfer() Transfer {
	return g_callable_info_get_instance_ownership_transfer(ci.c)
}

pub fn (ci &CallableInfo) get_return_attribute(name string) string {
	return tos_and_free(g_callable_info_get_return_attribute(ci.c, name.str))
}

pub fn (ci &CallableInfo) get_return_type() &TypeInfo {
	cptr := &GIBaseInfo(g_callable_info_get_return_type(ci.c))
	ptr := &BaseInfo{cptr}
	return &TypeInfo(ptr)
}

// gboolean g_callable_info_invoke(GICallableInfo *info,
//                         			gpointer function,
//                         			const GIArgument *in_args,
//                         			int n_in_args,
//                         			const GIArgument *out_args,
//                         			int n_out_args,
//                         			GIArgument *return_value,
//                         			gboolean is_method,
//                         			gboolean throws,
//                         			GError **error)

pub fn (ci &CallableInfo) is_method() bool {
	return g_callable_info_is_method(ci.c)
}

pub fn (ci &CallableInfo) iterate_return_attributes(cb fn(name, value string)) {
	iter := &GIAttributeIter(0)
	_name := ''
	_value := ''
	for g_callable_info_iterate_return_attributes(ci.c, &iter, &_name.str, &_value.str) {
		cb(_name, _value)
	}
}

pub fn (ci &CallableInfo) load_arg(n int, arg &ArgInfo) {
	g_callable_info_load_arg(ci.c, n, arg.c)
}

pub fn (ci &CallableInfo) load_return_type(type_info &TypeInfo) {
	g_callable_info_load_return_type(ci.c, type_info.c)
}

pub fn (ci &CallableInfo) may_return_nil() bool {
	return g_callable_info_may_return_null(ci.c)
}

pub fn (ci &CallableInfo) skip_return() bool {
	return g_callable_info_skip_return(ci.c)
}

pub fn (ci &CallableInfo) is_valid() bool {
	return GI_IS_CALLABLE_INFO(ci.c)
}

pub fn (ci &CallableInfo) get_cptr() voidptr {
	return ci.c
}
