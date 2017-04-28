json.comment @comment.comment
json.date @comment.created_at.strftime('%Y年%m月%d日 %H時%M分')
json.image @comment.image
json.user current_user.name
json.id @comment.id
