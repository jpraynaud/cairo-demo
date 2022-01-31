%builtins output

from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.serialize import serialize_word

func main{output_ptr : felt*}():
    alloc_locals

    let (poly1) = poly_low()
    let (poly2) = poly_high()

    serialize_word(poly1)
    serialize_word(poly2)

    return ()
end

func poly_low() -> (poly : felt):
    [ap] = 100; ap++
    [ap] = [ap - 1]; ap++  # x
    [ap] = [ap - 1] * [ap - 1]; ap++  # x^2
    [ap] = [ap - 1] * [ap - 2]; ap++  # x^3
    [ap] = [ap - 3] * 45; ap++  # 45 * x
    [ap] = [ap - 3] * 23; ap++  # 23 * x^2
    [ap] = [ap - 3] + [ap - 1]; ap++  # x^3 + 23 * x^2
    [ap] = [ap - 3] + [ap - 1]; ap++  # x^3 + 23 * x^2 + 45 * x
    [ap] = 67 + [ap - 1]; ap++  # x^3 + 23 * x^2 + 45 * x + 67
    return ([ap - 1])
end

func poly_high() -> (poly : felt):
    # x^3 + 23 * x^2 + 45 * x + 67
    tempvar x = 100
    tempvar y = 67 + 45 * x + 23 * x * x + x * x * x
    return (y)
end
