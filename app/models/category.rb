class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'イラスト' },
    { id: 3, name: '漫画' },
    { id: 4, name: 'ポスター' },
    { id: 5, name: '水彩画' },
    { id: 6, name: '油絵' },
    { id: 7, name: 'パステル画' },
    { id: 8, name: '鉛筆画' },
    { id: 9, name: '似顔絵' },
    { id: 10, name: '風景画' },
    { id: 11, name: 'その他' }
  ]
end
