require 'pagy/extras/countless'
require 'pagy/extras/bootstrap'
# Optionally override some pagy default with your own in the pagy initializer
Pagy::DEFAULT[:limit] = 3 # items per page
Pagy::DEFAULT[:size]  = 9  # nav bar links
# Better user experience handled automatically
require 'pagy/extras/overflow'

Pagy::DEFAULT[:overflow] = :last_page