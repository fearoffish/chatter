hide_sim_script = %{
  tell application "Finder"
    repeat while (visible of process "iOS Simulator" is false)
      delay 0.5
    end repeat
    set visible of process "iOS Simulator" to false
  end tell
}

guard :test do
  watching = [
    /^spec\/(.+)\.rb$/, 
    /^app\/(.+)\.rb$/,
    /^lib\/(.+)\.rb$/, 
    /^resources\/(.+)\.storyboard$/
  ].each do |regex|
    watch(regex) do
      fork { system("osascript -e '#{hide_sim_script}'") }
      system("bundle exec rake fearoffish:spec")
    end
  end
end