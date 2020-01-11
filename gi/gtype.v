module gi

pub fn (gt GType) is_abstract() bool {
	return G_TYPE_IS_ABSTRACT(gt)
}

pub fn (gt GType) is_derived() bool {
	return G_TYPE_IS_DERIVED(gt)
}

pub fn (gt GType) is_fundamental() bool {
	return G_TYPE_IS_FUNDAMENTAL(gt)
}

pub fn (gt GType) is_value_type() bool {
	return G_TYPE_IS_VALUE_TYPE(gt)
}

pub fn (gt GType) has_value_table() bool {
	return G_TYPE_HAS_VALUE_TABLE(gt)
}

pub fn (gt GType) is_classed() bool {
	return G_TYPE_IS_CLASSED(gt)
}

pub fn (gt GType) is_instantiatable() bool {
	return G_TYPE_IS_INSTANTIATABLE(gt)
}

pub fn (gt GType) is_derivable() bool {
	return G_TYPE_IS_DERIVABLE(gt)
}

pub fn (gt GType) is_deep_derivable() bool {
	return G_TYPE_IS_DEEP_DERIVABLE(gt)
}

pub fn (gt GType) is_interface() bool {
	return G_TYPE_IS_INTERFACE(gt)
}
