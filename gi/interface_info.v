module gi

pub struct InterfaceInfo {
	c &GIInterfaceInfo
}

pub fn (ii &InterfaceInfo) get_n_prerequisites() int {
	return g_interface_info_get_n_prerequisites(ii.c)
}

pub fn (ii &InterfaceInfo) get_prerequisite(n int) &BaseInfo {
	cptr := g_interface_info_get_prerequisite(ii.c, n)
	return &BaseInfo{cptr}
}

pub fn (ii &InterfaceInfo) get_n_properties() int {
	return g_interface_info_get_n_properties(ii.c)
}

pub fn (ii &InterfaceInfo) get_property(n int) &PropertyInfo {
	cptr := &GIBaseInfo(g_interface_info_get_property(ii.c, n))
	ptr := &BaseInfo{cptr}
	return &PropertyInfo(ptr)
}

pub fn (ii &InterfaceInfo) get_n_methods() int {
	return g_interface_info_get_n_methods(ii.c)
}

pub fn (ii &InterfaceInfo) get_method(n int) &FunctionInfo {
	cptr := &GIBaseInfo(g_interface_info_get_method(ii.c, n))
	ptr := &BaseInfo{cptr}
	return &FunctionInfo(ptr)
}

pub fn (ii &InterfaceInfo) find_method(name string) &FunctionInfo {
	cptr := &GIBaseInfo(g_interface_info_find_method(ii.c, name.str))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &FunctionInfo(ptr)
}

pub fn (ii &InterfaceInfo) get_n_signals() int {
	return g_interface_info_get_n_signals(ii.c)
}

pub fn (ii &InterfaceInfo) get_signal(n int) &SignalInfo {
	cptr := &GIBaseInfo(g_interface_info_get_signal(ii.c, n))
	ptr := &BaseInfo{cptr}
	return &SignalInfo(ptr)
}

pub fn (ii &InterfaceInfo) find_signal(name string) &SignalInfo {
	cptr := &GIBaseInfo(g_interface_info_find_signal(ii.c, name.str))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &SignalInfo(ptr)
}

pub fn (ii &InterfaceInfo) get_n_vfuncs() int {
	return g_interface_info_get_n_vfuncs(ii.c)
}

pub fn (ii &InterfaceInfo) get_vfunc(n int) &VFuncInfo {
	cptr := &GIBaseInfo(g_interface_info_get_vfunc(ii.c, n))
	ptr := &BaseInfo{cptr}
	return &VFuncInfo(ptr)
}

pub fn (ii &InterfaceInfo) find_vfunc(name string) &VFuncInfo {
	cptr := &GIBaseInfo(g_interface_info_find_vfunc(ii.c, name.str))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &VFuncInfo(ptr)
}

pub fn (ii &InterfaceInfo) get_n_constants() int {
	return g_interface_info_get_n_constants(ii.c)
}

pub fn (ii &InterfaceInfo) get_constant(n int) &ConstantInfo {
	cptr := &GIBaseInfo(g_interface_info_get_constant(ii.c, n))
	ptr := &BaseInfo{cptr}
	return &ConstantInfo(ptr)
}

pub fn (ii &InterfaceInfo) get_iface_struct() &StructInfo {
	cptr := &GIBaseInfo(g_interface_info_get_iface_struct(ii.c))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &StructInfo(ptr)
}






// 
