module gi

pub struct ArgInfo {
	c &GIArgInfo
}

pub const (
	GI_DIRECTION_IN		= C.GI_DIRECTION_IN
	GI_DIRECTION_OUT	= C.GI_DIRECTION_OUT
	GI_DIRECTION_INOUT	= C.GI_DIRECTION_INOUT
)

pub const (
	SCOPE_TYPE_INVALID	= C.GI_SCOPE_TYPE_INVALID
	SCOPE_TYPE_CALL		= C.GI_SCOPE_TYPE_CALL
	SCOPE_TYPE_ASYNC	= C.GI_SCOPE_TYPE_ASYNC
	SCOPE_TYPE_NOTIFIED	= C.GI_SCOPE_TYPE_NOTIFIED
)

pub const (
	TRANSFER_NOTHING	= C.GI_TRANSFER_NOTHING
	TRANSFER_CONTAINER	= C.GI_TRANSFER_CONTAINER
	TRANSFER_EVERYTHING	= C.GI_TRANSFER_EVERYTHING
)

pub fn (ai &ArgInfo) get_closure() int {
	return g_arg_info_get_closure(ai.c)
}

pub fn (ai &ArgInfo) get_destroy() int {
	return g_arg_info_get_destroy(ai.c)
}

pub fn (ai &ArgInfo) get_direction() int /* Direction */ {
	return g_arg_info_get_direction(ai.c)
}

pub fn (ai &ArgInfo) get_ownership_transfer() int /* GITransfer */ {
	return g_arg_info_get_ownership_transfer(ai.c)
}

pub fn (ai &ArgInfo) get_scope() int /* GIScopeType */ {
	return g_arg_info_get_scope(ai.c)
}

pub fn (ai &ArgInfo) get_type() &TypeInfo {
	cptr := &GIBaseInfo(g_arg_info_get_type(ai.c))
	ptr := &BaseInfo{cptr}
	return &TypeInfo(ptr)
}

pub fn (ai &ArgInfo) load_type(type_info &TypeInfo) {
	g_arg_info_load_type(ai.c, type_info.c)
}

pub fn (ai &ArgInfo) may_be_null() bool {
	return g_arg_info_may_be_null(ai.c)
}

pub fn (ai &ArgInfo) is_caller_allocates() bool {
	return g_arg_info_is_caller_allocates(ai.c)
}

pub fn (ai &ArgInfo) is_optional() bool {
	return g_arg_info_is_optional(ai.c)
}

pub fn (ai &ArgInfo) is_return_value() bool {
	return g_arg_info_is_return_value(ai.c)
}

pub fn (ai &ArgInfo) is_skip() bool {
	return g_arg_info_is_skip(ai.c)
}
