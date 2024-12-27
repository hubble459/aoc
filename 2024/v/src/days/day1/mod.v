module day1;

import math;

fn parse(lines []string) ([]int, []int) {
	mut a, mut b := []int{}, []int{};

	for line in lines {
		first, second := line.split_once('   ') or { panic('impossible') };
		a << first.int();
		b << second.int();
	}

	return a, b
}

pub fn part1(lines []string) int {
	mut a, mut b := parse(lines);

	a.sort();
	b.sort();

	mut sol := 0;
	for i, v1 in a {
		v2 := b[i];
		sol += math.abs(v1 - v2);
	}

	return sol
}

// group all values based on how many time they occur
// and save the occurrence amount in the map
fn group(values []int) map[int]int {
	mut m := map[int]int{};

	for v in values {
		m[v] = (m[v] or { 0 }) + 1
	}

	return m
}

pub fn part2(lines []string) int {
	mut a, mut b := parse(lines);

	a.sort();
	b.sort();

	a_map := group(a);
	b_map := group(b);

	mut sol := 0;

	for k1, v1 in a_map {
		v2 := b_map[k1] or { 0 };
		sol += k1 * v2 * v1;
	}

	return sol
}