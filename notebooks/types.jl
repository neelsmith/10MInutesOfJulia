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

You can create an object by simply entering its value (e.g., typing it into a Julia REPL, or entering in the cell of a Pluto notebook.) 

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

# ╔═╡ fa719f3f-1bcc-40fa-ba2f-b8edb6acb64e
html"""

<br/><br/><br/><br/><br/><br/>
<hr/><hr/>
<b>Stuff to quarry</b>
"""

# ╔═╡ 63847950-1a62-490c-9c5d-cd7ab82e937e
md"Show and tell:"

# ╔═╡ 89e923c5-e68a-47ac-bbc0-e4249e2fdb82
"Iliad"

# ╔═╡ fade998f-152a-4cb0-8aec-fddd75dc0b3f
title = "Iliad"

# ╔═╡ 8e726110-5a49-4ead-a6d6-b1bd15929cf2
typeof(title)

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

# ╔═╡ e190c422-6fe7-407d-89f9-b9c7ec5852ab
"Iliad"

# ╔═╡ e5a306c4-f3c1-48c1-83fa-b3b852c28246
'I'

# ╔═╡ 9581f15a-e0ff-4d66-9e4f-bedc850a709a
'α'

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
# ╟─fa719f3f-1bcc-40fa-ba2f-b8edb6acb64e
# ╟─63847950-1a62-490c-9c5d-cd7ab82e937e
# ╠═89e923c5-e68a-47ac-bbc0-e4249e2fdb82
# ╟─fade998f-152a-4cb0-8aec-fddd75dc0b3f
# ╠═8e726110-5a49-4ead-a6d6-b1bd15929cf2
# ╠═f74cddba-0b7a-4039-8c4e-706b41c0c249
# ╠═8c7d0ae6-f83c-4dd1-8cec-b44f575fc3b8
# ╠═6efec1a6-71c7-4cdd-99b7-da5379b20390
# ╠═a309ea2f-e7ff-491c-8bd7-9b1f236ef30d
# ╠═bec93a17-5416-484f-9ec1-7ed070eca037
# ╠═e190c422-6fe7-407d-89f9-b9c7ec5852ab
# ╠═e5a306c4-f3c1-48c1-83fa-b3b852c28246
# ╠═9581f15a-e0ff-4d66-9e4f-bedc850a709a
# ╠═b471850e-5907-4943-9c3c-a34e93cf7532
# ╠═3dbaf3ab-be11-4cea-95c0-af4b951533a3
# ╠═eaaf6abb-1488-46da-af65-d448365d910c
