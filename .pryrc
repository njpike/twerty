CodeRay.scan("example", :ruby).term # just to load necessary files

TERM_TOKEN_COLORS = {
    :symbol => '1;31' # will make symbols bolded and light red on my terminal
}

module CodeRay
    module Encoders
        class Term < Encoder
            # override old colors
            TERM_TOKEN_COLORS.each_pair do |key, value|
                TOKEN_COLORS[key] = value
            end
        end
    end
end
