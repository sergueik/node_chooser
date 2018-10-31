require 'optparse'
require 'pp'
require 'yaml'

opt = OptionParser.new

@options = {
  :unused    => false,
  :debug     => false,
  :dc        => 'prod', # 'bcp'
  :count     => 20,
  :color     => STDOUT.tty?
}

opt.on('--debug', 'Show debug information') do |val|
  @options[:debug] = val
end

opt.on('--unused', 'List only unused nodes') do |val|
  @options[:unused] = val
end

opt.on('--dc [DATACENTER]', 'Data center') do |val|
  @options[:dc] = val
end
opt.parse!
$UNUSED_ONLY = ENV['UNUSED_ONLY'] || @options[:unused]
$DATACENTER = ENV['DATACENTER'] || @options[:dc]
$DEBUG = ENV['DEBUG'] || @options[:debug]

if $DEBUG
@found_nodes = %w|
unused_10
unused_1
unused_5
unused_33
|
end
if $DEBUG
  $stderr.puts 'Mockup data:'	
  PP.pp( @found_nodes, STDERR)
end
node_data_center = ''
node_consul_role = ''
if $DATACENTER.eql?('') or node_data_center =~ /^#{$DATACENTER}/
  @found_node.push node_consul_role
end
if $UNUSED_ONLY
  @sorted_nodes = []
  @found_nodes.sort_by do |elem|
  index  = elem.gsub(/^[^0-9]+/,'')
  indexed = sprintf('%04d', index) + ':' + elem
  if $DEBUG
    $stderr.puts 'for sorting: '+ indexed
  end
  @sorted_nodes.push indexed

 end
 if $DEBUG
   $stderr.puts 'Prepared for sorting:'
   PP.pp( @sorted_nodes, STDERR)
 end
 $stderr.puts 'Sorted:'
 @sorted_nodes.sort!.each do |entry|
   node_data = entry.gsub(/^.*:/,'')
   if $DEBUG
     $stderr.puts node_data
   end
 end
 #NOTE: try in-place
 @found_nodes_copy = @found_nodes.dup
  @found_nodes_copy.sort_by! do |elem|
  index  = elem.gsub(/^[^0-9]+/,'')
  indexed = sprintf('%04d', index) + ':' + elem
  if $DEBUG
    $stderr.puts 'for sorting: '+ indexed
  end
  indexed
 end
 if $DEBUG
   $stderr.puts 'Presumably sorted in place:'
   PP.pp( @found_nodes_copy, STDERR)
 end
end	
