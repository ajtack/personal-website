Feature: Blog Manager
	In order to update his blog
	the site owner (Andres)
	wants a private login page
	which allows him access to write, edit, and delete blog posts.
	
	Scenario: Writing a blog post.
		Given I am logged in
		And I am on the blog admin page
		When I follow "New Post"
		Then I should be at the new post page
		And I should see a <form> containing a textfield: Title, textarea: Body, submit: Post
		When I fill in "Title" with "This is a new blog post."
		And I fill in "Body" with "I think this is super cool."
		And I press "Post"
		Then I should be redirected to the view posts page
		And I should see a blog entry with Title "This is a new blog post."

	Scenario: Delete blog
		Given the following blogs:
			| title | body |
			| A     | 1    |
			| B     | 2    |
			| C     | 3    |
			| D     | 4    |
		When I delete the 3rd blog
		Then I should see the following blogs:
			| title | body |
			| A     | 1    |
			| B     | 2    |
			| D     | 4    |
