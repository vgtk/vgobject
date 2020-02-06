module gi

pub struct CallbackInfo {
	c &GICallbackInfo
}

/* Inherits from BaseInfo */

pub fn (ci &CallbackInfo) unref() {
	g_base_info_unref(ci.c)
}
