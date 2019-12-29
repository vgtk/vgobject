module gi

// C Structs
struct C.GIRepository
struct C.GIBaseInfo
struct C.GIAttributeIter
struct C.GIInterfaceInfo
struct C.GIEnumInfo
struct C.GITypelib
struct C.GType
struct C.GOptionGroup
struct C.GError
struct C.gchar
struct C.GSList {
data voidptr
next &GSList
}
struct C.GList {
data voidptr
next &GList
}

/* REPOSITORY */
fn C.g_irepository_get_default() &GIRepository
fn C.g_irepository_get_dependencies(&GIRepository, charptr) &charptr
fn C.g_irepository_get_immediate_dependencies(&GIRepository, charptr) &charptr
fn C.g_irepository_get_loaded_namespaces(&GIRepository) &charptr
fn C.g_irepository_get_n_infos(&GIRepository, charptr) int
fn C.g_irepository_get_info(&GIRepository, charptr, int) &GIBaseInfo
fn C.g_irepository_get_option_group() &GOptionGroup
fn C.g_irepository_enumerate_versions(&GIRepository, charptr) &GList
fn C.g_irepository_prepend_library_path(charptr)
fn C.g_irepository_prepend_search_path(charptr)
fn C.g_irepository_get_search_path() &C.GSList
fn C.g_irepository_load_typelib(&GIRepository, &GITypelib, int /* GIRepositoryLoadFlags */, &GError) charptr
fn C.g_irepository_get_typelib_path(&GIRepository, charptr) charptr
fn C.g_irepository_is_registered(&GIRepository, charptr, charptr) bool
fn C.g_irepository_require(&GIRepository, charptr, charptr, int /* GIRepositoryLoadFlags */, &GError) &GITypelib
fn C.g_irepository_require_private(&GIRepository, charptr, charptr, charptr, int /* GIRepositoryLoadFlags */, &GError) &GITypelib
fn C.g_irepository_get_c_prefix(&GIRepository, charptr) charptr
fn C.g_irepository_get_shared_library(&GIRepository, charptr) charptr
fn C.g_irepository_get_version(&GIRepository, charptr) charptr
fn C.g_irepository_find_by_gtype(&GIRepository, GType) &GIBaseInfo
fn C.g_irepository_find_by_error_domain(&GIRepository, u32 /* GQuark */) &GIEnumInfo
fn C.g_irepository_find_by_name(&GIRepository, charptr, charptr) &GIBaseInfo
fn C.g_irepository_get_object_gtype_interfaces(&GIRepository, GType, &u32, &GIInterfaceInfo)
fn C.g_irepository_dump(charptr, &GError) bool
// fn C.GClosure(*closure, *return_gvalue, n_param_values, *param_values, invocation_hint)

/* BASE INFO */
fn C.g_info_new(int /* GIInfoType */, &GIBaseInfo, &GITypelib, u32)
fn C.g_base_info_ref(&GIBaseInfo) &GIBaseInfo
fn C.g_base_info_unref(&GIBaseInfo)
fn C.g_base_info_equal(&GIBaseInfo, &GIBaseInfo) bool
fn C.g_base_info_get_type(&GIBaseInfo) int // GIInfoType
fn C.g_base_info_get_typelib(&GIBaseInfo) &GITypelib
fn C.g_base_info_get_namespace(&GIBaseInfo)
fn C.g_base_info_get_name(&GIBaseInfo)
fn C.g_base_info_get_attribute(&GIBaseInfo, charptr)
fn C.g_base_info_iterate_attributes(&GIBaseInfo, &GIAttributeIter, charptr, charptr) bool
fn C.g_base_info_get_container(&GIBaseInfo) &GIBaseInfo
fn C.g_info_type_to_string(int /* GIInfoType */) charptr
fn C.g_base_info_is_deprecated(&GIBaseInfo) bool

/* ENUM INFO */


/* INTERFACE INFO */


// UTILS
fn C.g_slist_length(&GSList) int
fn C.g_slist_free(&GSList)
fn C.g_list_free(&GList)
fn C.g_free(voidptr)
fn C.g_strfreev(&gchar)
// fn C.g_error_free(GError)
