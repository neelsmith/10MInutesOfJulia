### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 7deebfca-c352-488c-a9fa-3c40e583126c
md"""

- *Notebook version*: **0.3.0**
- *Prerequisites*:  none
"""

# ╔═╡ 33b1d6be-5371-11ec-306b-9360e2f906ec
md"# Objects, variables and types"

# ╔═╡ 9abeaae6-60f5-4fc4-88f8-83b8ec4e57ee
md"""

> ☞ *Objects* are the nouns of the Julia language;  *functions* are the its verbs. (We'll introduce *functions* in [this 10-minute notebook](https://neelsmith.github.io/10MinutesOfJulia/fundamentals/functions.html).)

You can create an object by simply entering its value (e.g., typing it into a Julia REPL, or entering it in the cell of a Pluto notebook.) 

When you enter an object in a Pluto notebook cell, Pluto displays its value immediately above it.  Let's look at a couple of examples.

"""

# ╔═╡ ac684d89-0cc8-42c0-a3cd-b8132b287ae3
"Four score and seven years ago"

# ╔═╡ 00117930-d7b2-416b-8fdd-86681c37a75c
87

# ╔═╡ 4e08346b-4696-4c60-acc5-94294fea1a33
md"""
> ☞  Every object has a *type*.  You can use the `typeof` function to find out what type  an object belongs to.
"""

# ╔═╡ 908f72a3-15e2-42c0-806a-8ad213d0e6ee
typeof("Four score and seven years ago")

# ╔═╡ 616ed394-4776-447f-bfe0-36138482c258
typeof("87")

# ╔═╡ cc8f4f4b-33f9-457d-bd0c-f712c7a6045c
typeof(87)

# ╔═╡ f926c28b-6f11-400d-b7c9-6c03375d6ad6
typeof(87.5)

# ╔═╡ 027442f9-7fc3-453b-ad7d-a4660a529eac
md"""
Notice that when we entered a series of characters between quotation marks, Julia created an object of type `String`; when we entered digits, it created an `Int64`. When we entered digits with a decimal component, it created a `Float64`.  
"""

# ╔═╡ c4c6ed6b-3e8a-41e6-bf6e-12e264bfdc08
md"""

> ☞ *Variables* are names of objects.  You can create a variable using *assignment operator*, `=`.
"""

# ╔═╡ 8164a905-e753-4f26-9724-dd30f88dba34
phrase = "Four score and seven years ago"

# ╔═╡ f2207a95-586b-4cfa-85c4-c184160e530d
md"""
Now you can use the variable `phrase` (the left side of the assignment) to refer to the `String` object you created between quotation marks (the right side of the assignment).  Read this in English as, "The variable `phrase` is assigned the value \"Four score and seven years ago\"".

"""

# ╔═╡ a9fd2bdf-7415-41af-830e-a6d56a33fbff
typeof(phrase)

# ╔═╡ c655414f-b8a0-46e9-931c-ec0f9c907a63
md"""## Why do we need types? 

Julia looks at the type of an object to determine what functions you can use it with.  Consider an example from English.  You could refer to different types of object with the phrase "this number";  the type of the object would determine what verbs it makes sense with.

If "this number" is your cell phone, you could use it with the verb *call*:  "Call this number".  If "this number" is the number of earned runs a pitcher allowed in a season, you could use it with the verb *divide* : "Divide this number by the number of nine-inning units pitched to compute the pitcher's earned run average (ERA)".
"""

# ╔═╡ a0ecd5b8-8f3e-47e5-ae89-38290aade176
md"""### A brief example"""

# ╔═╡ 1f51ee7b-4e33-48c5-8bf3-d18257e3276a
md""" Here's a brief illustration using `/`, the Julia function meaning "divide".

In 2000, Pedro Martinez pitched 217 innings.  Divide that by nine to find the number of "nine-inning units" he pitched.
"""

# ╔═╡ 6e6c76ff-088c-4b4d-90f6-30644b07a079
nineinning_units = 217 / 9 

# ╔═╡ cc9bf257-f76a-4da9-bf64-c73562551ee5
md"""He gave up 42 earned runs that year, so if we divide 42 by the number of nine-inning units, we get his ERA.
"""

# ╔═╡ 90e24eca-7e24-4604-b68b-c42720dd1a88
earned_runs = 42

# ╔═╡ 994d4522-2d94-467f-9680-c992f73c54ca
typeof(earned_runs)

# ╔═╡ 5cb213da-ce99-490f-8fcf-71353a34d688
md"It's OK to use the function (verb) `/` with an `Int64` object."

# ╔═╡ f0243c29-07ba-486f-ade2-e9abc75aab8e
ERA = earned_runs / nineinning_units

# ╔═╡ d13e0b79-a9ef-4552-868d-43a10f78cc08
md"Pedro's ERA for 2000 was an astonishing 1.74."


# ╔═╡ 7b6b59d9-f375-484d-adb1-a658a6645396
md"""We might represent a 10-digit cell-phone nuber like this:

"""

# ╔═╡ c68cb644-29bb-4b98-b955-d6a0e3533681
this_number = "123-456-7890"

# ╔═╡ 51eabc56-897f-4ba8-baad-95e7e67e5822
md"""
What happens if we try to divide that number using the Julia function `/` ?
"""

# ╔═╡ 8d83f8bc-5727-4ccc-9494-cdc7bd5580a1
this_number / nineinning_units

# ╔═╡ d52f0d5a-ec61-4dae-b8f1-cb9ffd41d49b
md"""> (In this 10-minute noteobook on [custom types](https://neelsmith.github.io/10MinutesOfJulia/fundamentals/customtypes.html), we'll look at how you could create your own type for a cell phone number.)
"""

# ╔═╡ 8f37eb01-183e-49f4-9c09-f602242ad97a
md"""## Inheritance"""

# ╔═╡ 773623a1-1fa3-4343-ab16-0f95dc3cd855
md"""Three verbs

- supertype
- isa
- <:
"""

# ╔═╡ 8000f13b-d206-4ce7-b297-c6002e838b87
md"""## Two other types

"""

# ╔═╡ 5d768422-ad89-4a0b-bd2d-b4d80fc6bf62
md"""In addition to numeric types and string types, you should be aware of two other fundamental (or *primitive*) types.


#### `Bool`

The `Bool` type has one of only two possible values:  `true` or `false`. (`Bool` is short for Boolean, named in honor of the British logician [George Boole](https://en.wikipedia.org/wiki/George_Boole).)  Many functions create Boolean values, and we will use them often in later notebooks to organize the logic of our code.
"""

# ╔═╡ c3000709-50a1-49ec-bceb-ddd015263d9a
checkphrase = isa(phrase, String)

# ╔═╡ 60592bd9-dc21-4680-80ca-dea3c6335286
typeof(checkphrase)

# ╔═╡ 67250bf2-c7f6-401e-b2f1-b903ca85a6bf
md"""#### `Char`

Julia has a type for an individual character.  
You
"""

# ╔═╡ bf5bf7a2-7e1a-4c93-9629-70a0eb7c2d7a
'a'

# ╔═╡ 3f2c69bb-0cad-4f7c-9c15-2b8e01c0bd66
alpha = 'α'

# ╔═╡ d4b1b731-99fe-4645-94a9-2269b69dd4ba
typeof(alpha)

# ╔═╡ f7f907b7-c102-4208-98d8-1c8e1445957d
typeof("a")

# ╔═╡ 5751e105-2bbb-4b66-9048-a0dd173f386b
typeof('a')

# ╔═╡ 63142e37-1bcd-4b6a-b07f-6044af2d1813
'𐊀'

# ╔═╡ 69e10312-c8da-4106-830f-e1a84aa24e78
'\U10280'

# ╔═╡ 3bf027b1-9a90-4f28-8a3d-d9b124b3e1a3
Char <: String

# ╔═╡ fa719f3f-1bcc-40fa-ba2f-b8edb6acb64e
html"""

<br/><br/><br/><br/><br/><br/>
<hr/><hr/>
<b>Stuff to quarry</b>
"""

# ╔═╡ 63847950-1a62-490c-9c5d-cd7ab82e937e
md"Show and tell:"

# ╔═╡ fade998f-152a-4cb0-8aec-fddd75dc0b3f
title = "Iliad"

# ╔═╡ f74cddba-0b7a-4039-8c4e-706b41c0c249
typeof(title) |> supertype

# ╔═╡ 8c7d0ae6-f83c-4dd1-8cec-b44f575fc3b8
24

# ╔═╡ 6efec1a6-71c7-4cdd-99b7-da5379b20390
books = 24

# ╔═╡ a309ea2f-e7ff-491c-8bd7-9b1f236ef30d
typeof(books)

# ╔═╡ bec93a17-5416-484f-9ec1-7ed070eca037
typeof(24) |> supertype |> supertype

# ╔═╡ d4d1c7ab-83a2-4927-a94f-ed08779c860d
typeof(24) <: Integer

# ╔═╡ e190c422-6fe7-407d-89f9-b9c7ec5852ab
"Iliad"

# ╔═╡ e5a306c4-f3c1-48c1-83fa-b3b852c28246
'I'

# ╔═╡ 9581f15a-e0ff-4d66-9e4f-bedc850a709a


# ╔═╡ b471850e-5907-4943-9c3c-a34e93cf7532
books == 24

# ╔═╡ 3dbaf3ab-be11-4cea-95c0-af4b951533a3
checkcount = books == 24

# ╔═╡ eaaf6abb-1488-46da-af65-d448365d910c
typeof(checkcount)

# ╔═╡ Cell order:
# ╟─7deebfca-c352-488c-a9fa-3c40e583126c
# ╟─33b1d6be-5371-11ec-306b-9360e2f906ec
# ╟─9abeaae6-60f5-4fc4-88f8-83b8ec4e57ee
# ╠═ac684d89-0cc8-42c0-a3cd-b8132b287ae3
# ╠═00117930-d7b2-416b-8fdd-86681c37a75c
# ╟─4e08346b-4696-4c60-acc5-94294fea1a33
# ╠═908f72a3-15e2-42c0-806a-8ad213d0e6ee
# ╠═616ed394-4776-447f-bfe0-36138482c258
# ╠═cc8f4f4b-33f9-457d-bd0c-f712c7a6045c
# ╠═f926c28b-6f11-400d-b7c9-6c03375d6ad6
# ╟─027442f9-7fc3-453b-ad7d-a4660a529eac
# ╟─c4c6ed6b-3e8a-41e6-bf6e-12e264bfdc08
# ╠═8164a905-e753-4f26-9724-dd30f88dba34
# ╟─f2207a95-586b-4cfa-85c4-c184160e530d
# ╠═a9fd2bdf-7415-41af-830e-a6d56a33fbff
# ╟─c655414f-b8a0-46e9-931c-ec0f9c907a63
# ╟─a0ecd5b8-8f3e-47e5-ae89-38290aade176
# ╟─1f51ee7b-4e33-48c5-8bf3-d18257e3276a
# ╠═6e6c76ff-088c-4b4d-90f6-30644b07a079
# ╠═cc9bf257-f76a-4da9-bf64-c73562551ee5
# ╠═90e24eca-7e24-4604-b68b-c42720dd1a88
# ╠═994d4522-2d94-467f-9680-c992f73c54ca
# ╠═5cb213da-ce99-490f-8fcf-71353a34d688
# ╠═f0243c29-07ba-486f-ade2-e9abc75aab8e
# ╟─d13e0b79-a9ef-4552-868d-43a10f78cc08
# ╟─7b6b59d9-f375-484d-adb1-a658a6645396
# ╠═c68cb644-29bb-4b98-b955-d6a0e3533681
# ╟─51eabc56-897f-4ba8-baad-95e7e67e5822
# ╠═8d83f8bc-5727-4ccc-9494-cdc7bd5580a1
# ╟─d52f0d5a-ec61-4dae-b8f1-cb9ffd41d49b
# ╟─8f37eb01-183e-49f4-9c09-f602242ad97a
# ╠═773623a1-1fa3-4343-ab16-0f95dc3cd855
# ╠═8000f13b-d206-4ce7-b297-c6002e838b87
# ╟─5d768422-ad89-4a0b-bd2d-b4d80fc6bf62
# ╠═c3000709-50a1-49ec-bceb-ddd015263d9a
# ╠═60592bd9-dc21-4680-80ca-dea3c6335286
# ╠═67250bf2-c7f6-401e-b2f1-b903ca85a6bf
# ╠═bf5bf7a2-7e1a-4c93-9629-70a0eb7c2d7a
# ╠═3f2c69bb-0cad-4f7c-9c15-2b8e01c0bd66
# ╠═d4b1b731-99fe-4645-94a9-2269b69dd4ba
# ╠═f7f907b7-c102-4208-98d8-1c8e1445957d
# ╠═5751e105-2bbb-4b66-9048-a0dd173f386b
# ╠═63142e37-1bcd-4b6a-b07f-6044af2d1813
# ╠═69e10312-c8da-4106-830f-e1a84aa24e78
# ╠═3bf027b1-9a90-4f28-8a3d-d9b124b3e1a3
# ╟─fa719f3f-1bcc-40fa-ba2f-b8edb6acb64e
# ╟─63847950-1a62-490c-9c5d-cd7ab82e937e
# ╟─fade998f-152a-4cb0-8aec-fddd75dc0b3f
# ╠═f74cddba-0b7a-4039-8c4e-706b41c0c249
# ╠═8c7d0ae6-f83c-4dd1-8cec-b44f575fc3b8
# ╠═6efec1a6-71c7-4cdd-99b7-da5379b20390
# ╠═a309ea2f-e7ff-491c-8bd7-9b1f236ef30d
# ╠═bec93a17-5416-484f-9ec1-7ed070eca037
# ╠═d4d1c7ab-83a2-4927-a94f-ed08779c860d
# ╠═e190c422-6fe7-407d-89f9-b9c7ec5852ab
# ╠═e5a306c4-f3c1-48c1-83fa-b3b852c28246
# ╠═9581f15a-e0ff-4d66-9e4f-bedc850a709a
# ╠═b471850e-5907-4943-9c3c-a34e93cf7532
# ╠═3dbaf3ab-be11-4cea-95c0-af4b951533a3
# ╠═eaaf6abb-1488-46da-af65-d448365d910c
