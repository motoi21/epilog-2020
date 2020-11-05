class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'デジタル' },
    { id: 3, name: 'アナログ' },
    { id: 4, name: 'デジタル・アナログ両方' }
  ]
end
