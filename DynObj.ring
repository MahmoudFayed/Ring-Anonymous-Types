_Dynamic_Class_id = 1


func defObj(lstAttrs)
    _class = "o = new DynamicClass_" + _Dynamic_Class_id + nl + 
				  "Class DynamicClass_" + _Dynamic_Class_id + nl + "end" 
 
    eval(_class)
	 for attr in lstAttrs
      if isList(attr)   
        if isstring(attr[2]) and substr(attr[2], "_ring_anonymous_func_") = 1
           AddMethod(o, attr[1], attr[2])
        else
		     AddAttribute(o, attr[1])
           SetAttribute(o, attr[1], attr[2])
        end
      else
		  AddAttribute(o, attr)
      end
    next
    _Dynamic_Class_id += 1
    return o
end


func NewObj(obj)
    if not IsObject(obj) return Null end

    eval("o = new " + className(obj))

	 for attr in Attributes(obj)        
		  AddAttribute(o, attr)
    next

	 for m in Methods(obj)        
		  AddAttribute(o, m)
    next

    return o
end
