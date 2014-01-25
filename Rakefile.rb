task :install => [:npm]
task :default => [:runProgram]



task :npm do
    sh "npm install"
end



task :runProgram do
  sh "node index.js"
end

