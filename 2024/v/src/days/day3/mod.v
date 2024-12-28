module day3;

import regex;

fn parse(lines []string) string {
	return lines.join('')
}

pub fn part1(lines []string) int {
	program := parse(lines);

	mut re := regex.regex_opt(r'mul\((\d+),(\d+)\)') or { panic(err) };
	matches := re.find_all_str(program);
	numbers := matches.map((it.substr(4, it.len - 1).split(',').map(it.int())));

	mut result := 0;

	for ns in numbers {
		result += ns[0] * ns[1];
	}

	return result
}

pub fn part2(lines []string) int {
	// program := parse(lines);

	return 0
}
