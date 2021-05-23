FactoryBot.define do
  factory :credit do
    undergraduate {'経営学部'}
    department {'経営学科'}
    class_name {'example'}
    teacher_name {'example'}
    fulfillment {'5'}
    ease {'5'}
    attendance {'毎回取る'}
    mid_test_format {'テストのみ'}
    final_test_format {'テストのみ'}
    item {'持ち込み可能'}
    textbook {'教科書必要'}
    comment {'example'}
  end
end