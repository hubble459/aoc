use itertools::Itertools;

pub fn read() -> Vec<(u32, u32)> {
    let lines = include_str!("../input/day1/input").lines();

    return lines
        .map(|line| line.split_once("   ").unwrap())
        .map(|(s1, s2)| (s1.parse().unwrap(), s2.parse().unwrap()))
        .collect();
}

pub fn solve_1() -> u32 {
    let lines = read();

    let row1 = lines.iter().map(|(u1, _)| *u1).sorted();
    let row2 = lines.iter().map(|(_, u2)| *u2).sorted();

    return row1
        .zip(row2)
        .fold(0, |acc, (u1, u2)| acc + u1.abs_diff(u2));
}

pub fn solve_2() -> u32 {
    let lines = read();

    let row1 = lines.iter().map(|(u1, _)| *u1).sorted();
    let row2 = lines.iter().map(|(_, u2)| *u2).sorted();

    return row1.fold(0, |acc, u1| {
        acc + u1 * row2.clone().filter(|u2| u2 == &u1).count() as u32
    });
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn puzzle_1() {
        let result = solve_1();
        assert_eq!(result, 1765812);
    }

    #[test]
    fn puzzle_2() {
        let result = solve_2();
        assert_eq!(result, 20520794);
    }
}
