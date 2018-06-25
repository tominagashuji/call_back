class User < ActiveRecord::Base
  before_create :ensure_has_name, CreateAgeAtCallback.new

# ーーー call-back 2の内容  ーーー
#   before_save do
#     puts '１番目に呼ばれたコールバック'
#   end
#
#   before_save do
#     puts '２番目に呼ばれたコールバック'
#   end
# end



#   before_create do
#       self.name = 'Taro' if name.blank?
#   end
# end



# before_create :ensure_has_name

# ーーー call-back  3ので復活させた  ーーー
  after_initialize do |user|
    p user
    puts "オブジェクトを生成しました！"
    user.name = "Taro"
  end

  private
  def ensure_has_name
    puts "nameの値をTaroに設定します！"
    self.name = 'Taro' if name.blank?
  end
end
