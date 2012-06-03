task :default do
    files = FileList['**/*.css'].exclude(/.min.css/)

    files.each do | file |
        output = file.ext("min.css")
        input = file.ext("css")
        minifycss(output, input)
    end
end

def minifycss(output, input)
    if File.exists?(output)
        updatecss(output, input)
    else
        File.new(output, "w")
        puts "create #{output}, because it not exists before"
        compile(output, input)
    end
end

def updatecss(output, input)
    unless FileUtils.uptodate?(output, input)
        compile(output, input)
    end
end

def compile(output, input)
    puts "minifying #{input} to #{output}"
    system("cleancss -o #{output} #{input}")
end