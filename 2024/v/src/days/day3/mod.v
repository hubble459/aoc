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
	program := parse(lines);

	mut re := regex.regex_opt(r"(mul\((\d+),(\d+)\))|(don't\(\))|(do\(\))") or { panic(err) };
	matches := re.find_all_str(program);

	mut result := 0;
	mut yippee := true;

	for m in matches {
		if m.starts_with('don\'t') {
			yippee = false;
		} else if m.starts_with('do') {
			yippee = true;
		} else if yippee {
			numbers := m.substr(4, m.len - 1).split(',');
			result += numbers[0].int() * numbers[1].int();
		}
	}

	return result
}
