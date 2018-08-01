class Post < ApplicationRecord
    enum category: { 
        ArtPhotography: 0, Musics: 1, Performance: 2, Product: 3, TechnicalGadget: 4,
         GameService: 5, Food: 6,Fashion: 7, Movies: 8,
          Book: 9, Anime: 10, Sports: 11, Business: 12,
           Challenge: 13, BeautyHealthCare: 14,TownDevelopment:15 }     
                            
    #入力内容による絞り込み
    scope :search, ->(word) {
      where("text like ? or title like ?", "%#{sanitize_sql_like(word)}%","%#{sanitize_sql_like(word)}%")
    }
  
    #カテゴリー選択による絞り込み
    scope :get_by_category, ->(category) {
      where(category: category)
    }  
end
