def encoder4_golden(in_bits):
    pos = 0
    valid = 0

    if in_bits & 0b1000:
        pos = 0b11
        valid = 1
    elif in_bits & 0b0100:
        pos = 0b10
        valid = 1
    elif in_bits & 0b0010:
        pos = 0b01
        valid = 1
    elif in_bits & 0b0001:
        pos = 0b00
        valid = 1

    return {'pos': pos, 'valid': valid}