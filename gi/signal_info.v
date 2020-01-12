module gi

pub type SignalFlags int

const (
	SIGNAL_RUN_FIRST	= SignalFlags(C.G_SIGNAL_RUN_FIRST)
	SIGNAL_RUN_LAST		= SignalFlags(C.G_SIGNAL_RUN_LAST)
	SIGNAL_RUN_CLEANUP	= SignalFlags(C.G_SIGNAL_RUN_CLEANUP)
	SIGNAL_NO_RECURSE	= SignalFlags(C.G_SIGNAL_NO_RECURSE)
	SIGNAL_DETAILED		= SignalFlags(C.G_SIGNAL_DETAILED)
	SIGNAL_ACTION		= SignalFlags(C.G_SIGNAL_ACTION)
	SIGNAL_NO_HOOKS		= SignalFlags(C.G_SIGNAL_NO_HOOKS)
	SIGNAL_MUST_COLLECT = SignalFlags(C.G_SIGNAL_MUST_COLLECT)
	SIGNAL_DEPRECATED	= SignalFlags(C.G_SIGNAL_DEPRECATED)
)

pub struct SignalInfo {
	c &GISignalInfo
}

pub fn (si &SignalInfo) get_flags() SignalFlags {
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
