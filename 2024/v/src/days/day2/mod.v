module day2;

import math;
import arrays;

fn parse(lines []string) [][]int {
	return lines.map(it.split(' ').map(it.int()))
}

pub fn part1(lines []string) int {
	mut reports := parse(lines);

	return reports.filter(check_1).len
}

fn check_1(report []int) bool {
	if !is_sorted(report) {
		return false
	}

	if arrays.uniq(report) != report {
		return false
	}

	if arrays.chunk_while(report, fn (b int, a int) bool { return is_good(b, a) })[0] != report {
		return false
	}

	return true
}

pub fn part2(lines []string) int {
	mut reports := parse(lines);

	safe := reports.filter(check_1(it) || check_2(it));

	for s in safe {
		println(s.map(it.str()).join(' '));
	}

	return safe.len
}

fn check_2(report []int) bool {
	for i, _ in report {
		mut clone := report.clone();
		clone.delete(i);

		if check_1(clone) {
			return true
		}
	}

	return false
}

fn is_sorted(array []int) bool {
	x := array.sorted(a > b);
	y := array.sorted(a < b);

	return array == x || array == y
}

fn is_good(v1 int, v2 int) bool {
	diff := math.abs(v1 - v2);

    return diff >= 1 && diff <= 3
}