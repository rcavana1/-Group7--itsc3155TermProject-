require 'rails_helper'

describe User, type: :model do
    it "creates or updates itself from an oauth hash" do
        auth = {
            provider: "google",
            uid: "12345678910",
            info: {
                email: "drewcav96@gmail.com",
                first_name: "Drew",
                last_name: "Cavanaugh"
            },
            credentials: {
                token: "abcdefg12345",
                refresh_token: "12345abcdefg",
                expires_at: DateTime.now
            }
        }
        User.from_omniauth(auth)
        new_user = User.first
        
        expect(new_user.provider).to eq("google")
        expect(new_user.uid).to eq("12345678910")
        expect(new_user.email).to eq("drewcav96@gmail.com")
        expect(new_user.first_name).to eq("Drew")
        expect(new_user.last_name).to eq("Cavanaugh")
        expect(new_user.token).to eq("abcdefg12345")
        expect(new_user.refresh_token).to eq("12345abcdefg")
        expect(new_user.oauth_expires_at).to eq(auth[:credentials][:expires_at])
    end
end