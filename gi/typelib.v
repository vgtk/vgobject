module gi

struct Typelib {
	c &GITypelib
}

pub fn new_typelib_from_memory(mem byteptr, size u32) ?&Typelib {
	error := &GError(0)
	typelib := g_typelib_new_from_memory(&mem, size, &error)
	if isnil(typelib) {
		panic(tos3(error.message))
	}
	return &Typelib{typelib}
}

// pub fn new_typelib_from_const_memory(mem byteptr, size u32) ?&Typelib {
// 	error := &GError(0)
// 	typelib := g_typelib_new_from_const_memory(&mem, size, &error)
// 	if isnil(typelib) {
// 		panic(tos3(error.message))
// 	}
// 	return &Typelib{typelib}
// }

// GITypelib * g_typelib_new_from_mapped_file (GMappedFile *mfile,
//                                 				GError **error)

pub fn (tl &Typelib) free() {
	g_typelib_free(tl.c)
}

pub fn (tl &Typelib) get_symbol(symbol_name string) string {
	_symbol := voidptr(0)
	loaded := g_typelib_symbol(tl.c, symbol_name.str, &_symbol)
	if !loaded { return '' }
	symbol := charptr(_symbol)
	return tos_and_free(symbol)
}

pub fn (tl &Typelib) get_namespace() string {
	namespace := g_typelib_get_namespace(tl)
	return tos_and_free(namespace)
}
