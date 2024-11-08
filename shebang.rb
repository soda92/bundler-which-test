def ruby_shebang?(file)
  possibilities = [
    "#!/usr/bin/env ruby\n",
    "#!/usr/bin/env jruby\n",
    "#!/usr/bin/env truffleruby\n",
    "#!#{Gem.ruby}\n"
  ]

  if File.zero?(file)
    Bundler.ui.warn "#{file} is empty"
    return false
  end

  first_line = File.open(file, 'rb') { |f| f.read(possibilities.map(&:size).max) }
  print("first line: #{first_line}")
  possibilities.any? { |shebang| first_line.start_with?(shebang) }
end

print(ruby_shebang?('jekyll'))
