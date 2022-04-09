require 'rails_helper'

describe Item do
  describe '#create' do
    # 1.写真や名前他全ての項目が存在すれば登録できること
    it "is valid with a name, description, category_id, status_id, shopping_cost_id, prefecture_id, shopping_day_id, price" do
      item = build(:item)
      expect(item).to be_valid
    end

    # 2.nameが空だと登録できないこと
    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("が入力されていません。")
    end

    # 3.descriptionが空だと登録できないこと
    it "is invalid without a description" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("が入力されていません。")
    end

    # 4.categoryが空だと登録できないこと
    it "is invalid without a category" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("が入力されていません。")
    end

    # 5.status_idが空だと登録できないこと
    it "is invalid without a item_condition_id" do
      item = build(:item, status_id: "")
      item.valid?
      expect(item.errors[:status_id]).to include("が入力されていません。")
    end

    # 6.shopping_cost_idが空だと登録できないこと
    it "is invalid without a shopping_cost_id" do
      item = build(:item, shopping_cost_id: "")
      item.valid?
      expect(item.errors[:shopping_cost_id]).to include("が入力されていません。")
    end

    # 7.prefecture_idが空だと登録できないこと
    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("が入力されていません。")
    end

    # 8.shopping_day_idが空だと登録できないこと
    it "is invalid without a shopping_day_id" do
      item = build(:item, shopping_day_id: nil)
      item.valid?
      expect(item.errors[:shopping_day_id]).to include("が入力されていません。")
    end

    # 9.priceが空だと登録できないこと
    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("が入力されていません。")
    end
  end

  describe '#update' do
    # 1.変更可能な項目が存在すれば登録できること
    it "is valid with a name, description, category_id, status_id, shopping_cost_id, prefecture_id, shopping_day_id, price" do
      item = build(:item)
      expect(item).to be_valid
    end

    # 2.nameが空だと登録できないこと
    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("が入力されていません。")
    end

    # 3.descriptionが空だと登録できないこと
    it "is invalid without a item_description" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("が入力されていません。")
    end

    # 4.priceが空だと登録できないこと
    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("が入力されていません。")
    end
  end
end

describe ItemImage do
  describe '#create' do
    # 1.imageが空だと登録できないこと
    it "is invalid without a image" do
      item_image = build(:item_image, image: nil)
      item_image.valid?
      expect(item_image.errors[:image]).to include("が入力されていません。")
    end
  end

  describe '#update' do
    # 1.imageが空だと登録できないこと
    it "is invalid without a image" do
      item_image = build(:item_image, image: nil)
      item_image.valid?
      expect(item_image.errors[:image]).to include("が入力されていません。")
    end
  end
end