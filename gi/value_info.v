module gi

pub struct ValueInfo {
	c &GIValueInfo
}

pub fn (vi &ValueInfo) get_value() i64 {
	return g_value_info_get_value(vi.c)
}

pub fn (vi &ValueInfo) is_valid() bool {
	return GI_IS_ENUM_INFO(vi.c)
}
