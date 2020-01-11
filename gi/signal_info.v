module gi

const (
	SIGNAL_RUN_FIRST	= C.G_SIGNAL_RUN_FIRST
	SIGNAL_RUN_LAST		= C.G_SIGNAL_RUN_LAST
	SIGNAL_RUN_CLEANUP	= C.G_SIGNAL_RUN_CLEANUP
	SIGNAL_NO_RECURSE	= C.G_SIGNAL_NO_RECURSE
	SIGNAL_DETAILED		= C.G_SIGNAL_DETAILED
	SIGNAL_ACTION		= C.G_SIGNAL_ACTION
	SIGNAL_NO_HOOKS		= C.G_SIGNAL_NO_HOOKS
	SIGNAL_MUST_COLLECT = C.G_SIGNAL_MUST_COLLECT
	SIGNAL_DEPRECATED	= C.G_SIGNAL_DEPRECATED
)

pub struct SignalInfo {
	c &GISignalInfo
}

pub fn (si &SignalInfo) get_flags() int {
	return g_signal_info_get_flags(si.c)
}

pub fn (si &SignalInfo) get_class_closure() &VFuncInfo {
	clls := g_signal_info_get_class_closure(si.c)
	if clls == 0 { return 0 }
	cptr := &GIBaseInfo(clls)
	ptr := &BaseInfo{cptr}
	return &VFuncInfo(ptr)
}

pub fn (si &SignalInfo) true_stops_emit() bool {
	return g_signal_info_true_stops_emit(si.c)
}
