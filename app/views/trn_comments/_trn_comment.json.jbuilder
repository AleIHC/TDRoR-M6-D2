json.extract! trn_comment, :id, :content, :trn_user_id, :trn_new_id, :created_at, :updated_at
json.url trn_comment_url(trn_comment, format: :json)
