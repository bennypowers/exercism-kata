// RegEx r, String as, Bool b :: r -> as -> b
export const match = r => as => as.match(r);

// Str -> Bool
export const letter = match(/[a-z]/i);

// x -> Bool
export const notNull = x => x != null;