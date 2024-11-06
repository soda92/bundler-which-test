def which(executable)
  if File.file?(executable) && File.executable?(executable)
    executable
  elsif paths = ENV['PATH']
    quote = '"'
    paths.split(File::PATH_SEPARATOR).find do |path|
      path = path[1..-2] if path.start_with?(quote) && path.end_with?(quote)
      executable_path = File.expand_path(executable, path)
      return executable_path if File.file?(executable_path) && File.executable?(executable_path)
    end
  end
end

print which('cmd')

print which('bash')
