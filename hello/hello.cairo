%builtins output

from starkware.cairo.common.serialize import serialize_word

func main{output_ptr : felt*}():
    [ap] = 100; ap++
    [ap] = 20; ap++
    [ap] = 3; ap++
    [ap] = [ap - 3] + [ap - 2]; ap++  # 100 + 20
    [ap] = [ap - 2] + [ap - 1]; ap++  # 120 + 3

    serialize_word([ap - 1])

    ret
end
