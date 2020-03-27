describe Rgo::Compile do
  it 'compiles samples successfully' do
    Dir['./samples/*.rgo'].each do |sample|
      puts "list of samples "
      statements = Rgo::Parser.new.parse(File.read(sample))
      compiled = Rgo::Compile.new(statements).compile

      expected = File.read(sample.gsub('rgo', 'go')).gsub("\n", "")

      puts "expected : #{expected}"

      expect(compiled.gsub("\n", "")).to eq(expected)
    end
  end
end
