import sys

def parse_input(file_path):
    with open(file_path, 'r') as f:
        lines = [line.strip() for line in f.readlines() if line.strip()]
    return lines

def generate_lp(lines, output_file):
    n = len(lines)  # Grid size
    facts = [f"#const n={n}."]
    
    for x, row in enumerate(lines, start=0):
        for y, cell in enumerate(row, start=0):
            if cell == '0':
                facts.append(f"cell({x},{y},white).")
            elif cell == '1':
                facts.append(f"cell({x},{y},black).")
    
    with open(output_file, 'w') as f:
        f.write('\n'.join(facts) + '\n')

def main():
    if len(sys.argv) != 3:
        print("Usage: python3 encode.py <input_file> <output_file>")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    lines = parse_input(input_file)
    generate_lp(lines, output_file)
    print(f"Encoded ASP facts written to {output_file}")

if __name__ == "__main__":
    main()