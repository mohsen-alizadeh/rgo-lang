describe Rgo::Compile do
  it 'compiles samples successfully' do
    Dir['./samples/*.rgo'].each do |sample|
      statements = Rgo::Parser.new.parse(File.read(sample))
      compiled = Rgo::Compile.new(statements).compile
      expected = File.read(sample.gsub('rgo', 'go'))

      expect(compiled).to eq(expected)
    end
  end
end
