module gi

pub struct RegisteredTypeInfo {
	c &GIRegisteredTypeInfo
}

pub fn (rti &RegisteredTypeInfo) get_type_name() string {
	type_name := g_registered_type_info_get_type_name(rti.c)
	return tos3(type_name)
}

pub fn (rti &RegisteredTypeInfo) get_type_init() string {
	type_init := g_registered_type_info_get_type_init(rti.c)
	return tos3(type_init)
}

pub fn (rti &RegisteredTypeInfo) get_g_type() GType {
	return g_registered_type_info_get_g_type(rti.c)
}

pub fn (rti &RegisteredTypeInfo) get_cptr() voidptr {
	return rti.c
}
