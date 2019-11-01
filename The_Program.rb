"sieuhcsiuchiuhrvfieshifesf
doawdiweodjaowdjaowijwaodjoawd
edioawjdawijedofhorwajfowajrfwa
rfahuwifwahrifhwihwufhiwaawurhr
rfuwairhafurhfoawriaworiafrjforf"
filename = File.basename(__FILE__)



File.open(filename) do |file|
    # use row here...
    file.readlines.each do |line|
        puts line
    end
end