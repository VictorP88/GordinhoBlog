require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  # Criar dados de teste
  let!(:published_post) { BlogPost.create(title: 'Published Post', content: 'This post is published.', published_at: Time.current - 1.day) }
  let!(:draft_post) { BlogPost.create(title: 'Draft Post', content: 'This post is a draft.', published_at: nil) }
  let!(:scheduled_post) { BlogPost.create(title: 'Scheduled Post', content: 'This post is scheduled.', published_at: Time.current + 1.day) }

  # Testes para a validade do modelo
  it 'is valid with valid attributes' do
    blog_post = BlogPost.new(title: 'Sample Title', content: 'This is a sample blog post content.')
    expect(blog_post).to be_valid
  end

  it 'is not valid without a title' do
    blog_post = BlogPost.new(content: 'This is a sample blog post content.')
    expect(blog_post).not_to be_valid
  end

  it 'is not valid without content' do
    blog_post = BlogPost.new(title: 'Sample Title')
    expect(blog_post).not_to be_valid
  end

  # Testes para os métodos de instância
  describe '#draft?' do
    it 'returns true if the post is a draft' do
      expect(draft_post.draft?).to be_truthy
    end

    it 'returns false if the post is published' do
      expect(published_post.draft?).to be_falsey
    end
  end

  describe '#published?' do
    it 'returns true if the post is published' do
      expect(published_post.published?).to be_truthy
    end

    it 'returns false if the post is a draft' do
      expect(draft_post.published?).to be_falsey
    end
  end

  describe '#scheduled?' do
    it 'returns true if the post is scheduled' do
      expect(scheduled_post.scheduled?).to be_truthy
    end

    it 'returns false if the post is published' do
      expect(published_post.scheduled?).to be_falsey
    end

    it 'returns false if the post is a draft' do
      expect(draft_post.scheduled?).to be_falsey
    end
  end

  # Testes para as scopes
  describe 'scopes' do
    describe '.draft' do
      it 'returns only draft posts' do
        expect(BlogPost.draft).to include(draft_post)
        expect(BlogPost.draft).not_to include(published_post, scheduled_post)
      end
    end

    describe '.published' do
      it 'returns only published posts' do
        expect(BlogPost.published).to include(published_post)
        expect(BlogPost.published).not_to include(draft_post, scheduled_post)
      end
    end

    describe '.scheduled' do
      it 'returns only scheduled posts' do
        expect(BlogPost.scheduled).to include(scheduled_post)
        expect(BlogPost.scheduled).not_to include(draft_post, published_post)
      end
    end
  end

  # Testes TDD
  describe 'validations' do
    it 'is not valid with a short title' do
      blog_post = BlogPost.new(title: 'AB', content: 'This is a sample blog post content.')
      expect(blog_post).not_to be_valid
      expect(blog_post.errors[:title]).to include("is too short (minimum is 5 characters)")
    end
  end
end







