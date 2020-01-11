module gi

type u8		C.uint8_t
type i32	C.int32_t

pub struct ConstantInfo {
	c &GIConstantInfo
}

fn (ci &ConstantInfo) get_type() &TypeInfo {
	cptr := &GIBaseInfo(g_constant_info_get_type(ci.c))
	ptr := &BaseInfo{cptr}
	return &TypeInfo(ptr)
}

fn (ci &ConstantInfo) get_value() voidptr {
	arg := GIArgument(0)
	g_constant_info_get_value(ci.c, &arg)

	ti := ci.get_type()
	tag := ti.get_tag()
	match tag {
		TYPE_TAG_BOOLEAN	{ return &bool(&arg) }
		TYPE_TAG_INT8		{ return &i8(&arg) }
		TYPE_TAG_UINT8		{ return &u8(&arg) }
		TYPE_TAG_INT16		{ return &i16(&arg) }
		TYPE_TAG_UINT16		{ return &u16(&arg) }
		TYPE_TAG_INT32		{ return &i32(&arg) }
		TYPE_TAG_UINT32		{ return &u32(&arg) }
		TYPE_TAG_INT64		{ return &i64(&arg) }
		TYPE_TAG_UINT64		{ return &u64(&arg) }
		TYPE_TAG_FLOAT		{ return &f32(&arg) }
		TYPE_TAG_DOUBLE		{ return &f64(&arg) }
		TYPE_TAG_UTF8, TYPE_TAG_FILENAME {
			return &charptr(&arg)
		}
		else {
			eprintln('unsupported constant value')
			return voidptr(0) 
		}
	}

} 
