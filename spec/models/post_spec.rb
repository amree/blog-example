describe Post, type: :model do
  it "can be created successfully" do
    post = Post.new

    post.save

    expect(post.persisted?).to eql(true)
  end
end
