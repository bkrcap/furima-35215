FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'} # {Faker::Internet.free_email}
    password              {'00000a'}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太朗"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthday              {"1994-01-01"}
  end
end

# 一意性が問われるときにfakerを使ってあげる（emailのみ）
# エラー解決：FactoryBotの中身またはバリデーションの定義を確認(今回はパスワード)
