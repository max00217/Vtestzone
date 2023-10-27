fn v_and(q int, w int) int {
    if q == 1 && w == 1 {
        return 1  
    } else {
        return 0
    }
}

fn v_or(q int, w int) int {
    if q == 1 || w == 1 {
        return 1
    } else {
        return 0
    }
}

fn v_not(q int) int {
    if q == 1 {
        return 0
    } else {
        return 1
    } 
}

fn v_nand(q int, w int) int {
    if q == 0 && w == 0 {
        return 1       
    } else {
        return 0
    }
}

fn v_xor(q int, w int) int {
    if q != w {
        return 1       
    } else {
        return 0
    }
}

fn v_xnor(q int, w int) int {
    if q == w {
        return 1       
    } else {
        return 0
    }
}

fn v_buf(q int) int {
    return q
}''