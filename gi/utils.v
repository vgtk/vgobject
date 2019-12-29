module gi

fn gslist_gstring_to_array_string(_list &GSList) []string {
    mut ret := []string
    mut list := _list
    for !isnil(list)  {
        str := tos_clone(list.data)
        ret << str
        list = list.next
    }
    g_slist_free(_list)
    return ret
}

fn glist_gstring_to_array_string(_list &C.GList) []string {
    mut ret := []string
    mut list := _list
    for !isnil(list) {
        str := tos_clone(list.data)
        ret << str
        list = list.next
    }
    g_list_free(_list)
    return ret
}

// fn carray_string_to_array_string(arr &charptr) []string {
//     mut arr_str := []string
//     if isnil(arr) { return arr_str }
//     mut iter := arr
//     for !isnil(iter) {
//         a := byte(iter)
//         arr_str << tos_clone(a)
//         iter = next_charptr(iter)
//     }
//     g_strfreev(arr)
//     return arr_str
// }

fn carray_string_to_array_string(arr &charptr) []string {
    mut arr_str := []string
    if isnil(arr) { return arr_str }
    mut i := 0
    for {
        elem := byteptr(arr[i])
        if elem == 0 { break }
        arr_str << tos_clone(elem)
        i++
    }
    g_strfreev(arr)
    return arr_str
}

fn next_charptr(_s &charptr) &charptr {
    mut s := _s
    return s++
}

fn tos_and_free(ptr charptr) string {
    _ptr := byteptr(ptr)
    ret := tos_clone(_ptr)
    g_free(ptr)
    return ret
}
