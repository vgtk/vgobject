module gi

struct Repository {
	c &GIRepository
}

const (
	REPOSITORY_LOAD_FLAG_LAZY = C.G_IREPOSITORY_LOAD_FLAG_LAZY
)

pub fn get_default_repository() &Repository {
	repository := g_irepository_get_default()
	if isnil(repository) { return 0 }
	return &Repository{repository}
}

// GOptionGroup *g_irepository_get_option_group (void)

pub fn prepend_repository_search_path(path string) {
	g_irepository_prepend_search_path(path.str)
} 

pub fn prepend_repository_library_path(path string) {
	g_irepository_prepend_library_path(path.str)
}

pub fn get_repository_search_path() []string {
	paths := g_irepository_get_search_path()
	return gslist_gstring_to_array_string(paths)
}

/* METHODS */

pub fn (r &Repository) get_dependencies(namespace string) []string {
	deps := g_irepository_get_dependencies(r.c, namespace.str)
	return carray_string_to_array_string(deps)
}

pub fn (r &Repository) get_immediate_dependencies(namespace string) []string {
	deps := g_irepository_get_immediate_dependencies(r.c, namespace.str)
	return carray_string_to_array_string(deps)
}

pub fn (r &Repository) get_loaded_namespaces() []string {
	namespaces := g_irepository_get_loaded_namespaces(r.c)
	return carray_string_to_array_string(namespaces)
}

pub fn (r &Repository) get_n_infos(namespace string) int {
	return g_irepository_get_n_infos(r.c, namespace.str)
}

pub fn (r &Repository) get_info(namespace string, index int) &BaseInfo {
	info := g_irepository_get_info(r.c, namespace.str, index)
	return &BaseInfo{info}
}

pub fn (r &Repository) enumerate_versions(namespace string) []string {
	versions := g_irepository_enumerate_versions(r.c, namespace.str)
	return glist_gstring_to_array_string(versions)
}

// const char * g_irepository_load_typelib (GIRepository *repository,
//                             				GITypelib *typelib,
//                             				GIRepositoryLoadFlags flags,
//                             				GError **error)

pub fn (r &Repository) get_typelib_path(namespace string) string {
	path := g_irepository_get_typelib_path(r.c, namespace.str)
	return tos_and_free(path)
}

pub fn (r &Repository) is_registered(namespace, version string) bool {
	if version == '' {
		return g_irepository_is_registered(r.c, namespace.str, 0)
	}
	return g_irepository_is_registered(r.c, namespace.str, version.str)
}

pub fn (r &Repository) require(namespace, version string, flags int) ?&Typelib {
	err := &GError(0)
	typelib := g_irepository_require(r.c, namespace.str, version.str, flags, &err)
	if !isnil(error) {
		return error(tos_and_free(err.message))
	}
	mut tlwrap := &Typelib(0)
	if !isnil(typelib) {
		tlwrap = &Typelib{typelib} 
	}
	return tlwrap
}

// TODO
// pub fn (r &Repository) require_private(path, namespace, version string, flags int) (&Typelib, error) {
	
// }

pub fn (r &Repository) get_c_prefix(namespace string) string {
	c_prefix := g_irepository_get_c_prefix(r.c, namespace.str)
	return tos_and_free(c_prefix)
}

pub fn (r &Repository) get_shared_library(namespace string) string {
	shlib := g_irepository_get_shared_library(r.c, namespace.str)
	return tos_and_free(shlib)
}

pub fn (r &Repository) get_version(namespace string) string {
	version := g_irepository_get_version(r.c, namespace.str)
	return tos_and_free(version)
}

pub fn (r &Repository) find_by_gtype(gtype int) &BaseInfo {
	base_info := g_irepository_find_by_gtype(r.c, gtype)
	return &BaseInfo{base_info}
}

// GIEnumInfo * g_irepository_find_by_error_domain 	(GIRepository *repository,
//                                     				GQuark domain)

pub fn (r &Repository) find_by_name(namespace, name string) &BaseInfo {
	base_info := g_irepository_find_by_name(r.c, namespace.str, name.str)
	return &BaseInfo{base_info}
}

// void g_irepository_get_object_gtype_interfaces	(GIRepository *repository,
//                                 					GType gtype,
//                                 					guint *n_interfaces_out,
//                                 					GIInterfaceInfo **interfaces_out)

pub fn (r &Repository) dump(arg string) bool {
	return g_irepository_dump(r.c, arg.str)
}
