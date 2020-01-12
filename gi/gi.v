module gi

#flag linux `pkg-config --cflags gobject-introspection-1.0` `pkg-config --libs gobject-introspection-1.0`

#include <girepository.h>

pub interface BaseInfoLiker {
	inherit_from_base_info() &BaseInfo
	get_cptr() &GIBaseInfo
}

pub fn expect_base_info_type(bil BaseInfoLiker, types ...int) {
	bi := bil.inherit_from_base_info()
	for t in types {
		if bi.get_type() == t {
			return
		}
	}
	mut type_strings := []string
	for t in types {
		type_strings << t.str()
	}
	joined_str := type_strings.join(' or ')
	panic('Type mismatch, expected $joined_str, got: ${bi.get_type()}')
}
