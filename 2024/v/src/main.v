module main;

import os;
import flag;
import time;
import days.day1;
import days.day2;
import days.day3;

fn main() {
	mut fp := flag.new_flag_parser(os.args);

	fp.application(name);
	fp.version(version);
	fp.description(description);
	fp.skip_executable();

	day := fp.int('day', `d`, 1, 'The day to run');
	part := fp.int('part', `p`, 1, 'The part to run');

	additional_args := fp.finalize()!;

	if additional_args.len > 0 {
		println('Unprocessed arguments:\n$additional_args.join_lines()');
	}

	if day <= 0 || day > 25 {
		println('Day parameter must be between zero and twenty-five.');
		exit(1);
	}

	if part != 1 && part != 2 {
		println('Part parameter must be either one or two.');
		exit(1);
	}
	
	run(day, part)!
}

fn run(day int, part int) ! {
	lines := os.read_lines('./src/input/day${day}')!;

	sw := time.new_stopwatch();

	solution := match day {
		1 { match part { 1 { day1.part1(lines) } 2 { day1.part2(lines) } else { panic('owo') } }}
		2 { match part { 1 { day2.part1(lines) } 2 { day2.part2(lines) } else { panic('owo') } }}
		3 { match part { 1 { day3.part1(lines) } 2 { day3.part2(lines) } else { panic('owo') } }}
		else { exit(0) }
	};

	println('Solution for day ${day} part ${part} is: ${solution}');
	println('took: ${sw.elapsed().microseconds()} μs');
}
