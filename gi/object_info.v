module gi

pub struct ObjectInfo {
	c &GIObjectInfo
}

pub fn (oi &ObjectInfo) get_abstract() bool {
	return g_object_info_get_abstract(oi.c)
}

pub fn (oi &ObjectInfo) get_fundamental() bool {
	return g_object_info_get_fundamental(oi.c)
}

pub fn (oi &ObjectInfo) get_parent() &ObjectInfo {
	cptr := &GIBaseInfo(g_object_info_get_parent(oi.c))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &ObjectInfo(ptr)
}

pub fn (oi &ObjectInfo) get_type_name() string {
	type_name := g_object_info_get_type_name(oi.c)
	if type_name == 0 { return '' }
	return tos3(type_name)
}

pub fn (oi &ObjectInfo) get_type_init() string {
	return tos3(g_object_info_get_type_init(oi.c))
}

pub fn (oi &ObjectInfo) get_n_constants() int {
	return g_object_info_get_n_constants(oi.c)
}

pub fn (oi &ObjectInfo) get_constant(n int) &ConstantInfo {
	cptr := &GIBaseInfo(g_object_info_get_constant(oi.c, n))
	ptr := &BaseInfo{cptr}
	return &ConstantInfo(ptr)
}

pub fn (oi &ObjectInfo) get_n_fields() int {
	return g_object_info_get_n_fields(oi.c)
}

pub fn (oi &ObjectInfo) get_field(n int) &FieldInfo {
	cptr := &GIBaseInfo(g_object_info_get_field(oi.c, n))
	ptr := &BaseInfo{cptr}
	return &FieldInfo(ptr)
}

pub fn (oi &ObjectInfo) get_n_interfaces() int {
	return g_object_info_get_n_interfaces(oi.c)
}

pub fn (oi &ObjectInfo) get_interface(n int) &InterfaceInfo {
	cptr := &GIBaseInfo(g_object_info_get_interface(oi.c, n))
	ptr := &BaseInfo{cptr}
	return &InterfaceInfo(ptr)
}

pub fn (oi &ObjectInfo) get_n_methods() int {
	return g_object_info_get_n_methods(oi.c)
}

pub fn (oi &ObjectInfo) get_method(n int) &FunctionInfo {
	cptr := &GIBaseInfo(g_object_info_get_method(oi.c, n))
	ptr := &BaseInfo{cptr}
	return &FunctionInfo(ptr)
}

pub fn (oi &ObjectInfo) find_method(name string) &FunctionInfo {
	cptr := &GIBaseInfo(g_object_info_find_method(oi.c, name.str))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &FunctionInfo(ptr)
}


pub fn (oi &ObjectInfo) find_method_using_interfaces(name string, implementor &ObjectInfo) &FunctionInfo {
	cptr := &GIBaseInfo(g_object_info_find_method_using_interfaces(oi.c, name.str, implementor))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &FunctionInfo(ptr)
}

pub fn (oi &ObjectInfo) get_n_properties() int {
	return g_object_info_get_n_properties(oi.c)
}

pub fn (oi &ObjectInfo) get_property(n int) &PropertyInfo {
	cptr := &GIBaseInfo(g_object_info_get_property(oi.c, n))
	ptr := &BaseInfo{cptr}
	return &PropertyInfo(ptr)
}

pub fn (oi &ObjectInfo) get_n_signals() int {
	return g_object_info_get_n_signals(oi.c)
}

pub fn (oi &ObjectInfo) get_signal(n int) &SignalInfo {
	cptr := &GIBaseInfo(g_object_info_get_signal(oi.c, n))
	ptr := &BaseInfo{cptr}
	return &SignalInfo(ptr)
}

pub fn (oi &ObjectInfo) find_signal(name string) &SignalInfo {
	cptr := &GIBaseInfo(g_object_info_find_signal(oi.c, name.str))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &SignalInfo(ptr)
}

pub fn (oi &ObjectInfo) get_n_vfuncs() int {
	return g_object_info_get_n_vfuncs(oi.c)
}

pub fn (oi &ObjectInfo) get_vfunc(n int) &VFuncInfo {
	cptr := &GIBaseInfo(g_object_info_get_vfunc(oi.c, n))
	ptr := &BaseInfo{cptr}
	return &VFuncInfo(ptr)
}

pub fn (oi &ObjectInfo) find_vfunc(name string) &VFuncInfo {
	cptr := &GIBaseInfo(g_object_info_find_vfunc(oi.c, name.str))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &VFuncInfo(ptr)
}

pub fn (oi &ObjectInfo) find_vfunc_using_interfaces(name string, implementor &ObjectInfo) &VFuncInfo {
	cptr := &GIBaseInfo(g_object_info_find_vfunc_using_interfaces(oi.c, name.str, implementor))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &VFuncInfo(ptr)
}

pub fn (oi &ObjectInfo) get_class_struct() &StructInfo {
	cptr := &GIBaseInfo(g_object_info_get_class_struct(oi.c))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &StructInfo(ptr)
}

pub fn (oi &ObjectInfo) get_ref_function() string {
	ref_function := g_object_info_get_ref_function(oi.c)
	return tos3(ref_function)
}

pub fn (oi &ObjectInfo) get_unref_function() string {
	unref_function := g_object_info_get_unref_function(oi.c)
	return tos3(unref_function)
}

// pub fn (oi &ObjectInfo) get_set_value_function() string {

// }

// TODO!!!!!!!!!!!!

// 
