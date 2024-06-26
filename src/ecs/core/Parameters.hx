package ecs.core;

class Parameters {
#if ecs_max_entities
static macro function getMaxEntitiesExpr() {
    var x= Std.parseInt(haxe.macro.Context.definedValue("ecs_max_entities"));

    return macro $v{x};
}


static inline function getMaxEntities() : Int {
    #if macro
    return 0;
    #else
    return getMaxEntitiesExpr();
    #end
}


public static inline final MAX_ENTITIES = getMaxEntities();
#end


#if ecs_max_flags
static macro function getMaxFlagsExpr() {
    var x= Std.parseInt(haxe.macro.Context.definedValue("ecs_max_flags"));

    return macro $v{x};
}
#end

static inline function getMaxFlags() {
    #if ecs_max_flags
    return getMaxFlagsExpr();
    #else
    return 32;
    #end
}

public static inline final MAX_TAGS = getMaxFlags();

}