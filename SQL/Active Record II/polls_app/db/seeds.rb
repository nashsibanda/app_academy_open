# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{
  "username": "pcavnor0"
}, {
  "username": "lpenniall1"
}, {
  "username": "bmcgorley2"
}, {
  "username": "acovotti3"
}, {
  "username": "bseath4"
}, {
  "username": "gtemplar5"
}, {
  "username": "brichardes6"
}, {
  "username": "evanyushin7"
}, {
  "username": "adeners8"
}, {
  "username": "csmiley9"
}])

polls = Poll.create([{
		"author_id": 4,
		"title": "POLL: enim. Etiam gravida molesti."
	},
	{
		"author_id": 8,
		"title": "POLL: Donec egestas. Aliqua."
	},
	{
		"author_id": 8,
		"title": "POLL: dui. Fusce aliquam, enim ne."
	},
	{
		"author_id": 7,
		"title": "POLL: quam vel sapien imperdiet ornare. In faucibus."
	},
	{
		"author_id": 1,
		"title": "POLL: nisi a odio sempe."
	},
	{
		"author_id": 2,
		"title": "POLL: metus eu era."
	},
	{
		"author_id": 10,
		"title": "POLL: aliquet, sem ut cursus luctus, ipsum leo elementum sem, vita."
	},
	{
		"author_id": 5,
		"title": "POLL: massa lobortis ultrices. Vivamus rhoncus."
	},
	{
		"author_id": 7,
		"title": "POLL: Nunc laoreet lectus quis massa. Mauri."
	},
	{
		"author_id": 1,
		"title": "POLL: lectus sit ame."
	},
	{
		"author_id": 5,
		"title": "POLL: consequat enim diam ve."
	},
	{
		"author_id": 1,
		"title": "POLL: sociis natoque penatibus et magnis dis parturien."
	},
	{
		"author_id": 8,
		"title": "POLL: Vivamus nibh dolor."
	},
	{
		"author_id": 5,
		"title": "POLL: In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulu."
	},
	{
		"author_id": 4,
		"title": "POLL: sapien molestie orci tincidunt adipiscing. Mauris molesti."
	},
	{
		"author_id": 4,
		"title": "POLL: tristique pharetra. Quisque ac libero nec ligul."
	},
	{
		"author_id": 6,
		"title": "POLL: et magnis dis parturient montes, nascetu."
	},
	{
		"author_id": 2,
		"title": "POLL: erat neque non quam. Pellentesque habitan."
  }])

questions = Question.create([
  {
		"poll_id": 9,
		"text": "Q: orci. Ut sagittis?"
	},
	{
		"poll_id": 9,
		"text": "Q: eget tincidunt dui augue eu?"
	},
	{
		"poll_id": 6,
		"text": "Q: Nulla dignissim. Maecenas ornare?"
	},
	{
		"poll_id": 14,
		"text": "Q: erat. Vivamus nisi. Mauris?"
	},
	{
		"poll_id": 9,
		"text": "Q: velit. Quisque varius. Nam porttitor?"
	},
	{
		"poll_id": 1,
		"text": "Q: tincidunt orci quis lectus. Nullam?"
	},
	{
		"poll_id": 12,
		"text": "Q: sociis natoque penatibus et magnis?"
	},
	{
		"poll_id": 7,
		"text": "Q: magna, malesuada vel, convallis?"
	},
	{
		"poll_id": 4,
		"text": "Q: vitae, aliquet nec, imperdiet nec, leo.?"
	},
	{
		"poll_id": 12,
		"text": "Q: at, egestas a, scelerisque sed,?"
	},
	{
		"poll_id": 8,
		"text": "Q: ligula eu enim. Etiam imperdiet?"
	},
	{
		"poll_id": 9,
		"text": "Q: consectetuer, cursus et, magna. Praesent?"
	},
	{
		"poll_id": 2,
		"text": "Q: turpis egestas. Aliquam fringilla cursus purus.?"
	},
	{
		"poll_id": 3,
		"text": "Q: ipsum. Donec sollicitudin?"
	},
	{
		"poll_id": 17,
		"text": "Q: interdum. Sed auctor odio?"
	},
	{
		"poll_id": 1,
		"text": "Q: risus, at fringilla?"
	},
	{
		"poll_id": 18,
		"text": "Q: Mauris molestie pharetra nibh. Aliquam?"
	},
	{
		"poll_id": 10,
		"text": "Q: fringilla ornare placerat,?"
	},
	{
		"poll_id": 16,
		"text": "Q: Donec felis orci, adipiscing?"
	},
	{
		"poll_id": 17,
		"text": "Q: sed, sapien. Nunc?"
	},
	{
		"poll_id": 4,
		"text": "Q: congue, elit sed?"
	},
	{
		"poll_id": 13,
		"text": "Q: Proin vel nisl. Quisque?"
	},
	{
		"poll_id": 10,
		"text": "Q: ut nisi a odio semper cursus.?"
	},
	{
		"poll_id": 8,
		"text": "Q: sed leo. Cras?"
	},
	{
		"poll_id": 8,
		"text": "Q: faucibus ut, nulla. Cras eu tellus?"
	},
	{
		"poll_id": 4,
		"text": "Q: ultricies dignissim lacus.?"
	},
	{
		"poll_id": 4,
		"text": "Q: Phasellus ornare. Fusce?"
	},
	{
		"poll_id": 7,
		"text": "Q: senectus et netus et malesuada?"
	},
	{
		"poll_id": 15,
		"text": "Q: egestas a, scelerisque sed,?"
	},
	{
		"poll_id": 13,
		"text": "Q: lacinia mattis. Integer eu lacus.?"
	},
	{
		"poll_id": 1,
		"text": "Q: vel lectus. Cum?"
	},
	{
		"poll_id": 17,
		"text": "Q: Nunc mauris elit,?"
	},
	{
		"poll_id": 1,
		"text": "Q: diam vel arcu.?"
	},
	{
		"poll_id": 10,
		"text": "Q: nec tempus mauris erat eget ipsum.?"
	},
	{
		"poll_id": 12,
		"text": "Q: dapibus ligula. Aliquam erat?"
	},
	{
		"poll_id": 12,
		"text": "Q: consectetuer adipiscing elit. Curabitur sed?"
	},
	{
		"poll_id": 12,
		"text": "Q: Praesent eu dui. Cum sociis?"
	},
	{
		"poll_id": 16,
		"text": "Q: sed pede nec ante blandit?"
	},
	{
		"poll_id": 18,
		"text": "Q: Nunc sed orci?"
	},
	{
		"poll_id": 18,
		"text": "Q: eu, accumsan sed, facilisis vitae,?"
	},
	{
		"poll_id": 11,
		"text": "Q: Nunc pulvinar arcu et pede.?"
	},
	{
		"poll_id": 3,
		"text": "Q: et netus et malesuada?"
	},
	{
		"poll_id": 5,
		"text": "Q: pretium neque. Morbi quis urna. Nunc?"
	},
	{
		"poll_id": 8,
		"text": "Q: eu dui. Cum sociis?"
	},
	{
		"poll_id": 8,
		"text": "Q: dui. Cras pellentesque. Sed dictum.?"
	},
	{
		"poll_id": 2,
		"text": "Q: sit amet risus. Donec?"
	},
	{
		"poll_id": 9,
		"text": "Q: enim, condimentum eget, volutpat ornare, facilisis?"
	},
	{
		"poll_id": 6,
		"text": "Q: semper erat, in consectetuer ipsum nunc?"
	}])
  
answer_choices = AnswerChoice.create([
  {"question_id":1,"text":"yes"},
  {"question_id":1,"text":"no"},
  {"question_id":1,"text":"maybe"},
  {"question_id":2,"text":"yes"},
  {"question_id":2,"text":"no"},
  {"question_id":2,"text":"maybe"},
  {"question_id":3,"text":"yes"},
  {"question_id":3,"text":"no"},
  {"question_id":3,"text":"maybe"},
  {"question_id":4,"text":"yes"},
  {"question_id":4,"text":"no"},
  {"question_id":4,"text":"maybe"},
  {"question_id":5,"text":"yes"},
  {"question_id":5,"text":"no"},
  {"question_id":5,"text":"maybe"},
  {"question_id":6,"text":"yes"},
  {"question_id":6,"text":"no"},
  {"question_id":6,"text":"maybe"},
  {"question_id":7,"text":"yes"},
  {"question_id":7,"text":"no"},
  {"question_id":7,"text":"maybe"},
  {"question_id":8,"text":"yes"},
  {"question_id":8,"text":"no"},
  {"question_id":8,"text":"maybe"},
  {"question_id":9,"text":"yes"},
  {"question_id":9,"text":"no"},
  {"question_id":9,"text":"maybe"},
  {"question_id":10,"text":"yes"},
  {"question_id":10,"text":"no"},
  {"question_id":10,"text":"maybe"},
  {"question_id":11,"text":"yes"},
  {"question_id":11,"text":"no"},
  {"question_id":11,"text":"maybe"},
  {"question_id":12,"text":"yes"},
  {"question_id":12,"text":"no"},
  {"question_id":12,"text":"maybe"},
  {"question_id":13,"text":"yes"},
  {"question_id":13,"text":"no"},
  {"question_id":13,"text":"maybe"},
  {"question_id":14,"text":"yes"},
  {"question_id":14,"text":"no"},
  {"question_id":14,"text":"maybe"},
  {"question_id":15,"text":"yes"},
  {"question_id":15,"text":"no"},
  {"question_id":15,"text":"maybe"},
  {"question_id":16,"text":"yes"},
  {"question_id":16,"text":"no"},
  {"question_id":16,"text":"maybe"},
  {"question_id":17,"text":"yes"},
  {"question_id":17,"text":"no"},
  {"question_id":17,"text":"maybe"},
  {"question_id":18,"text":"yes"},
  {"question_id":18,"text":"no"},
  {"question_id":18,"text":"maybe"},
  {"question_id":19,"text":"yes"},
  {"question_id":19,"text":"no"},
  {"question_id":19,"text":"maybe"},
  {"question_id":20,"text":"yes"},
  {"question_id":20,"text":"no"},
  {"question_id":20,"text":"maybe"},
  {"question_id":21,"text":"yes"},
  {"question_id":21,"text":"no"},
  {"question_id":21,"text":"maybe"},
  {"question_id":22,"text":"yes"},
  {"question_id":22,"text":"no"},
  {"question_id":22,"text":"maybe"},
  {"question_id":23,"text":"yes"},
  {"question_id":23,"text":"no"},
  {"question_id":23,"text":"maybe"},
  {"question_id":24,"text":"yes"},
  {"question_id":24,"text":"no"},
  {"question_id":24,"text":"maybe"},
  {"question_id":25,"text":"yes"},
  {"question_id":25,"text":"no"},
  {"question_id":25,"text":"maybe"},
  {"question_id":26,"text":"yes"},
  {"question_id":26,"text":"no"},
  {"question_id":26,"text":"maybe"},
  {"question_id":27,"text":"yes"},
  {"question_id":27,"text":"no"},
  {"question_id":27,"text":"maybe"},
  {"question_id":28,"text":"yes"},
  {"question_id":28,"text":"no"},
  {"question_id":28,"text":"maybe"},
  {"question_id":29,"text":"yes"},
  {"question_id":29,"text":"no"},
  {"question_id":29,"text":"maybe"},
  {"question_id":30,"text":"yes"},
  {"question_id":30,"text":"no"},
  {"question_id":30,"text":"maybe"},
  {"question_id":31,"text":"yes"},
  {"question_id":31,"text":"no"},
  {"question_id":31,"text":"maybe"},
  {"question_id":32,"text":"yes"},
  {"question_id":32,"text":"no"},
  {"question_id":32,"text":"maybe"},
  {"question_id":33,"text":"yes"},
  {"question_id":33,"text":"no"},
  {"question_id":33,"text":"maybe"},
  {"question_id":34,"text":"yes"},
  {"question_id":34,"text":"no"},
  {"question_id":34,"text":"maybe"},
  {"question_id":35,"text":"yes"},
  {"question_id":35,"text":"no"},
  {"question_id":35,"text":"maybe"},
  {"question_id":36,"text":"yes"},
  {"question_id":36,"text":"no"},
  {"question_id":36,"text":"maybe"},
  {"question_id":37,"text":"yes"},
  {"question_id":37,"text":"no"},
  {"question_id":37,"text":"maybe"},
  {"question_id":38,"text":"yes"},
  {"question_id":38,"text":"no"},
  {"question_id":38,"text":"maybe"},
  {"question_id":39,"text":"yes"},
  {"question_id":39,"text":"no"},
  {"question_id":39,"text":"maybe"},
  {"question_id":40,"text":"yes"},
  {"question_id":40,"text":"no"},
  {"question_id":40,"text":"maybe"},
  {"question_id":41,"text":"yes"},
  {"question_id":41,"text":"no"},
  {"question_id":41,"text":"maybe"},
  {"question_id":42,"text":"yes"},
  {"question_id":42,"text":"no"},
  {"question_id":42,"text":"maybe"},
  {"question_id":43,"text":"yes"},
  {"question_id":43,"text":"no"},
  {"question_id":43,"text":"maybe"},
  {"question_id":44,"text":"yes"},
  {"question_id":44,"text":"no"},
  {"question_id":44,"text":"maybe"},
  {"question_id":45,"text":"yes"},
  {"question_id":45,"text":"no"},
  {"question_id":45,"text":"maybe"},
  {"question_id":46,"text":"yes"},
  {"question_id":46,"text":"no"},
  {"question_id":46,"text":"maybe"},
  {"question_id":47,"text":"yes"},
  {"question_id":47,"text":"no"},
  {"question_id":47,"text":"maybe"},
  {"question_id":48,"text":"yes"},
  {"question_id":48,"text":"no"},
  {"question_id":48,"text":"maybe"}
])