json.(@new_comments) do |new_comment|
  json.comment new_comment.comment
  json.date new_comment.created_at.strftime('%Y年%m月%d日 %H時%M分')
  json.id new_comment.id
  json.user new_comment.user.name
end

