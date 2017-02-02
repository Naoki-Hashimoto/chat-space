require 'rails_helper'

describe Message do
  describe '#create' do

    # バリデーションに引っかからずに保存できる場合のテスト
    it "is valid if body has more than 1 character" do
      message = build(:message)
      message.valid?
      expect(message).to be_valid
    end

    # バリデーションに引っかかり、保存できない場合のテスト
    it "is invalid without body" do
      message = build(:message, body: nil)
      message.valid?
      expect(message.errors[:body]).to include('フォームが入力されていません。')
    end

  end
end
