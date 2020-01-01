module gi

// C Structs
struct C.GIRepository
	struct C.GIBaseInfo
	struct C.GICallableInfo
		struct C.GIFunctionInfo
		struct C.GICallbackInfo
		struct C.GISignalInfo
		struct C.GIVFuncInfo
	struct C.GIRegisteredTypeInfo
		struct C.GIEnumInfo
		struct C.GIStructInfo
		struct C.GIUnionInfo
		struct C.GIObjectInfo
		struct C.GIInterfaceInfo
	struct C.GIArgInfo
	struct C.GIConstantInfo
	struct C.GIFieldInfo
	struct C.GIPropertyInfo
	struct C.GITypeInfo
	struct C.GIValueInfo


struct C.GITypelib
struct C.GIAttributeIter
struct C.GIArgument

struct C.GType
struct C.GOptionGroup
struct C.GError{
	message charptr
}
struct C.gchar
struct C.GSList {
	data voidptr
	next &GSList
}
struct C.GList {
	data voidptr
	next &GList
}

/* TYPELIB */
fn C.g_typelib_new_from_memory(byteptr, u32, &GError) &GITypelib
fn C.g_typelib_new_from_const_memory(byteptr, u32, &GError) &GITypelib
// fn C.g_typelib_new_from_mapped_file(&GMappedFile, &GError) &GITypelib
fn C.g_typelib_free(&GITypelib)
fn C.g_typelib_symbol(&GITypelib, charptr, voidptr) bool
fn C.g_typelib_get_namespace(&GITypelib) charptr

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
fn C.g_irepository_get_object_gtype_interfaces(&GIRepository, GType, &u32, voidptr)
fn C.g_irepository_dump(charptr, &GError) bool
// fn C.GClosure(*closure, *return_gvalue, n_param_values, *param_values, invocation_hint)

/* BASE INFO */
fn C.g_info_new(int /* GIInfoType */, &GIBaseInfo, &GITypelib, u32) &GIBaseInfo 
fn C.g_base_info_ref(&GIBaseInfo) &GIBaseInfo
fn C.g_base_info_unref(&GIBaseInfo)
fn C.g_base_info_equal(&GIBaseInfo, &GIBaseInfo) bool
fn C.g_base_info_get_type(&GIBaseInfo) int // GIInfoType
fn C.g_base_info_get_typelib(&GIBaseInfo) &GITypelib
fn C.g_base_info_get_namespace(&GIBaseInfo) charptr
fn C.g_base_info_get_name(&GIBaseInfo) charptr
fn C.g_base_info_get_attribute(&GIBaseInfo, charptr) charptr
fn C.g_base_info_iterate_attributes(&GIBaseInfo, &GIAttributeIter, charptr, charptr) bool
fn C.g_base_info_get_container(&GIBaseInfo) &GIBaseInfo
fn C.g_info_type_to_string(int /* GIInfoType */) charptr
fn C.g_base_info_is_deprecated(&GIBaseInfo) bool

/* CALLABLE INFO */
fn C.GI_IS_CALLABLE_INFO(voidptr) bool
fn C.g_callable_info_can_throw_gerror(&GICallableInfo) bool
fn C.g_callable_info_get_n_args(&GICallableInfo) int
fn C.g_callable_info_get_arg(&GICallableInfo, int) &GIArgInfo
fn C.g_callable_info_get_caller_owns(&GICallableInfo) int // GITransfer
fn C.g_callable_info_get_instance_ownership_transfer(&GICallableInfo) int // GITransfer
fn C.g_callable_info_get_return_attribute(&GICallableInfo, charptr) charptr
fn C.g_callable_info_get_return_type(&GICallableInfo) &GITypeInfo
fn C.g_callable_info_invoke(&GICallableInfo, voidptr, &GIArgument, int, &GIArgument, int, &GIArgument, bool, bool, &GError) bool
fn C.g_callable_info_is_method(&GICallableInfo) bool
fn C.g_callable_info_iterate_return_attributes(&GICallableInfo, &GIAttributeIter, charptr, charptr) bool
fn C.g_callable_info_load_arg(&GICallableInfo, int, &GIArgInfo)
fn C.g_callable_info_load_return_type(&GICallableInfo, &GITypeInfo)
fn C.g_callable_info_may_return_null(&GICallableInfo) bool
fn C.g_callable_info_skip_return(&GICallableInfo) bool

/* ARG INFO */
fn C.g_arg_info_get_closure(&GIArgInfo) int
fn C.g_arg_info_get_destroy(&GIArgInfo) int
fn C.g_arg_info_get_direction(&GIArgInfo) int /* GIDirection */
fn C.g_arg_info_get_ownership_transfer(&GIArgInfo) int /* GITransfer */
fn C.g_arg_info_get_scope(&GIArgInfo) int /* GIScopeType */
fn C.g_arg_info_get_type(&GIArgInfo) &GITypeInfo
fn C.g_arg_info_load_type(&GIArgInfo, &GITypeInfo)
fn C.g_arg_info_may_be_null(&GIArgInfo) bool
fn C.g_arg_info_is_caller_allocates(&GIArgInfo) bool
fn C.g_arg_info_is_optional(&GIArgInfo) bool
fn C.g_arg_info_is_return_value(&GIArgInfo) bool
fn C.g_arg_info_is_skip(&GIArgInfo) bool

/* FUNCTION INFO */
fn C.g_function_info_get_flags(&GIFunctionInfo) int /* GIFunctionInfoFlags */
fn C.g_function_info_get_property(&GIFunctionInfo) &GIPropertyInfo
fn C.g_function_info_get_symbol(&GIFunctionInfo) charptr
fn C.g_function_info_get_vfunc(&GIFunctionInfo) &GIVFuncInfo
fn C.g_function_info_invoke(&GIFunctionInfo, &GIArgument, int, &GIArgument, int, &GIArgument, &GError) bool

/* VFUNC INFO */
fn C.g_vfunc_info_get_flags(&GIVFuncInfo) int /* GIVFuncInfoFlags */
fn C.g_vfunc_info_get_offset(&GIVFuncInfo) int
fn C.g_vfunc_info_get_signal(&GIVFuncInfo) &GISignalInfo
fn C.g_vfunc_info_get_invoker(&GIVFuncInfo) &GIFunctionInfo
fn C.g_vfunc_info_get_address(&GIVFuncInfo, GType, &GError) voidptr
fn C.g_vfunc_info_invoke(&GIVFuncInfo, GType, &GIArgument, int, &GIArgument, int, &GIArgument, &GError) bool

/* PROPERTY INFO */
fn C.g_property_info_get_flags(&GIPropertyInfo) int /* GParamFlags */
fn C.g_property_info_get_ownership_transfer(&GIPropertyInfo) int /* GITransfer */
fn C.g_property_info_get_type(&GIPropertyInfo) &GITypeInfo

/* TYPE INFO */
fn C.g_type_info_is_pointer(&GITypeInfo) bool
fn C.g_type_info_get_tag(&GITypeInfo) int /* GITypeTag */
fn C.g_type_info_get_param_type(&GITypeInfo, int) &GITypeInfo
fn C.g_type_info_get_interface(&GITypeInfo) &GIBaseInfo
fn C.g_type_info_get_array_length(&GITypeInfo) int
fn C.g_type_info_get_array_fixed_size(&GITypeInfo) int
fn C.g_type_info_is_zero_terminated(&GITypeInfo) bool
fn C.g_type_info_get_array_type(&GITypeInfo) int /* GIArrayType */

/* CONSTANT INFO */
fn C.g_constant_info_free_value(&GIConstantInfo, &GIArgument)
fn C.g_constant_info_get_type(&GIConstantInfo) &GITypeInfo
fn C.g_constant_info_get_value(&GIConstantInfo, &GIArgument) int

/* SIGNAL INFO */
fn C.g_signal_info_get_flags(&GISignalInfo) int /* GSignalFlags */
fn C.g_signal_info_get_class_closure(&GISignalInfo) &GIVFuncInfo
fn C.g_signal_info_true_stops_emit(&GISignalInfo) bool

/* ENUM INFO */


/* INTERFACE INFO */


// UTILS
fn C.g_slist_length(&GSList) int
fn C.g_slist_free(&GSList)
fn C.g_list_free(&GList)
fn C.g_free(voidptr)
fn C.g_strfreev(&gchar)
