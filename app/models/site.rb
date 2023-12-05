class Site < ApplicationRecord

    before_create :create_lit_url
    
    BASE_NUMBER = 128063081718016

    INT_TO_SYMBOL_MAPPING = {0=>"a", 1=>"b", 2=>"c", 3=>"d", 4=>"e", 5=>"f", 6=>"g", 7=>"h", 8=>"i", 9=>"j", 10=>"k", 11=>"l", 12=>"m", 13=>"n", 14=>"o", 15=>"p", 16=>"q",
    17=>"r", 18=>"s", 19=>"t", 20=>"u", 21=>"v", 22=>"w", 23=>"x", 24=>"y", 25=>"z", 26=>"1", 27=>"2", 28=>"3", 29=>"4", 30=>"5", 31=>"6", 32=>"7",
    33=>"8", 34=>"9", 35=>"A", 36=>"B", 37=>"C", 38=>"D", 39=>"E", 40=>"F", 41=>"G", 42=>"H", 43=>"J", 44=>"K", 45=>"M", 46=>"N", 47=>"P", 48=>"Q",
    49=>"R", 50=>"S", 51=>"T", 52=>"U", 53=>"V", 54=>"W", 55=>"X", 56=>"Y", 57=>"Z"}

    def generate_lit_url
        random_number = rand(BASE_NUMBER)
        random_array = []
        until random_array.length == 8
            next_number = random_number / 60
            random_array.unshift( random_number - (next_number * 60) )
            random_number = next_number
        end
        random_array.map{ |i| INT_TO_SYMBOL_MAPPING[i] }.join("")
    end

    def create_lit_url
        lit_url = generate_lit_url
        puts lit_url
        while Site.exists?(little_url: lit_url)
            lit_url = generate_lit_url
        end
        self.little_url = lit_url
    end

end
